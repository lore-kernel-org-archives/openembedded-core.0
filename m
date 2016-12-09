Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 982D371C82
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 00:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 4245131C252C;
	Fri,  9 Dec 2016 01:29:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id lLm6vO9LZtqu; Fri,  9 Dec 2016 01:29:46 +0100 (CET)
Received: from [172.22.22.61] (55d41b28.access.ecotel.net [85.212.27.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id A831F31C2562;
	Fri,  9 Dec 2016 01:29:45 +0100 (CET)
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.1480346284.git.patrick.ohly@intel.com>
	<d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <5dbe9bcf-935d-dd2c-1a8e-2a62c569aab8@opendreambox.org>
Date: Fri, 9 Dec 2016 01:29:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <d96e4eb080323e3331ae743d1df3362a6c5a2309.1480346284.git.patrick.ohly@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/11] buildstats: add system state sampling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2016 00:29:47 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Patrick,

On 28.11.2016 16:33, Patrick Ohly wrote:
> /proc/[diskstats|meminfo|stat] get sampled and written to the same
> proc_<filename>.log files as during normal bootchat logging. This will
> allow rendering the CPU, disk and memory usage charts.
> 
> Right now sampling happens once a second, triggered by the heartbeat
> event.That produces quite a bit of data for long builds, which will be
> addressed in a separate commit by storing the data in a more compact
> form.
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/classes/buildstats.bbclass | 16 +++++++++++++
>  meta/lib/buildstats.py          | 50 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta/lib/buildstats.py
> 
> diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
> index 57ecc8f..2abc1a7 100644
> --- a/meta/classes/buildstats.bbclass
> +++ b/meta/classes/buildstats.bbclass
> @@ -188,3 +188,19 @@ python run_buildstats () {
>  addhandler run_buildstats
>  run_buildstats[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.build.TaskStarted bb.build.TaskSucceeded bb.build.TaskFailed"
>  
> +python runqueue_stats () {
> +    import buildstats
> +    from bb import event, runqueue
> +    # We should not record any samples before the first task has started,
> +    # because that's the first activity shown in the process chart.
> +    # Besides, at that point we are sure that the build variables
> +    # are available that we need to find the output directory.
> +    init = isinstance(e, bb.runqueue.runQueueTaskStarted)
> +    system_stats = buildstats.get_system_stats(d, init=init)
> +    if system_stats:
> +        # Ensure that we sample at important events.
> +        system_stats.sample(force=isinstance(e, bb.event.BuildCompleted))
> +}
> +
> +addhandler runqueue_stats
> +runqueue_stats[eventmask] = "bb.runqueue.runQueueTaskStarted bb.event.HeartbeatEvent bb.event.BuildCompleted"
> diff --git a/meta/lib/buildstats.py b/meta/lib/buildstats.py
> new file mode 100644
> index 0000000..1664c52
> --- /dev/null
> +++ b/meta/lib/buildstats.py
> @@ -0,0 +1,50 @@
> +# Implements system state sampling. Called by buildstats.bbclass.
> +# Because it is a real Python module, it can hold persistent state,
> +# like open log files and the time of the last sampling.
> +
> +import time
> +
> +class SystemStats:
> +    def __init__(self, d):
> +        bn = d.getVar('BUILDNAME', True)
> +        bsdir = os.path.join(d.getVar('BUILDSTATS_BASE', True), bn)
> +        bb.utils.mkdirhier(bsdir)
> +
> +        self.proc_files = []
> +        for filename in ('diskstats', 'meminfo', 'stat'):
> +            # In practice, this class gets instantiated only once in
> +            # the bitbake cooker process.  Therefore 'append' mode is
> +            # not strictly necessary, but using it makes the class
> +            # more robust should two processes ever write
> +            # concurrently.
> +            self.proc_files.append((filename,
> +                                    open(os.path.join(bsdir, 'proc_%s.log' % filename), 'ab')))
> +        # Last time that we sampled data.
> +        self.last = 0
> +        # Minimum number of seconds between recording a sample. This
> +        # becames relevant when we get called very often while many
> +        # short tasks get started. Sampling during quiet periods
> +        # depends on the heartbeat event, which fires less often.
> +        self.min_seconds = 1
> +
> +    def sample(self, force):
> +        now = time.time()
> +        if (now - self.last > self.min_seconds) or force:
> +            for filename, output in self.proc_files:
> +                with open(os.path.join('/proc', filename), 'rb') as input:
                        ^
this fails with a backtrace if /proc/diskstats is not available, which
may be the case in virtualized environments, e.g. Linux-VServer.

Regards,
Andreas

