Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RNTRR-00046B-0E
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 18:57:05 +0100
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 07 Nov 2011 09:50:50 -0800
Received: by wye20 with SMTP id 20so5188800wye.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 09:50:48 -0800 (PST)
Received: by 10.216.39.206 with SMTP id d56mr3994645web.80.1320688248689;
	Mon, 07 Nov 2011 09:50:48 -0800 (PST)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id z33sm2085105wbm.5.2011.11.07.09.50.46
	(version=SSLv3 cipher=OTHER); Mon, 07 Nov 2011 09:50:47 -0800 (PST)
Message-ID: <4EB81A75.1070709@intel.com>
Date: Mon, 07 Nov 2011 09:50:45 -0800
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320190748.git.elizabeth.flanagan@intel.com>
	<ac412c93c681ef335970a678465aa015164f1015.1320190748.git.elizabeth.flanagan@intel.com>
In-Reply-To: <ac412c93c681ef335970a678465aa015164f1015.1320190748.git.elizabeth.flanagan@intel.com>
Subject: Re: [PATCH 1/1] [Yocto Bug 1700] Fix for buildstats on tmpfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Nov 2011 17:57:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2011 11:41 PM, Beth Flanagan wrote:
> From: Elizabeth Flanagan<elizabeth.flanagan@intel.com>
>
> tmpfs/encryptfs/(and most likely, but not confirmed)ramfs TMPDIRs
> cause diskstats to choke. No device entry ends up in /proc/diskstats
> for these fs types, which ends up causing the failure.
>
> The short term solution is to exclude these fs types from diskstat
> collection. Longer term we will want to see if we can collect
> meaningful diskio for each of these, and other, use cases, but for
> this cleans up Bug 1700.
>
> Signed-off-by: Elizabeth Flanagan<elizabeth.flanagan@intel.com>
> ---
>   meta/classes/buildstats.bbclass |   37 ++++++++++++++++++++++++++-----------
>   1 files changed, 26 insertions(+), 11 deletions(-)
>
> diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
> index 55cbb3c..96c98d4 100644
> --- a/meta/classes/buildstats.bbclass
> +++ b/meta/classes/buildstats.bbclass
> @@ -48,13 +48,24 @@ def set_device(e):
>       # something like stick DL_DIR on a different partition and this would
>       # throw stats gathering off. The same goes with SSTATE_DIR. However, let's
>       # get the basics in here and work on the cornercases later.
> +    # A note. /proc/diskstats does not contain info on encryptfs, tmpfs, etc.
> +    # If we end up hitting one of these fs, we'll just skip diskstats collection.
>       ############################################################################
>       device=os.stat(tmpdir)
>       majordev=os.major(device.st_dev)
>       minordev=os.minor(device.st_dev)
> +    ############################################################################
> +    # Bug 1700:
> +    # Because tmpfs/encryptfs/ramfs etc inserts no entry in /proc/diskstats
> +    # we set rdev to NoLogicalDevice and search for it later. If we find NLD
> +    # we do not collect diskstats as the method to collect meaningful statistics
> +    # for these fs types requires a bit more research.
> +    ############################################################################
>       for line in open("/proc/diskstats", "r"):
>           if majordev == int(line.split()[0]) and minordev == int(line.split()[1]):
>              rdev=line.split()[2]
> +        else:
> +           rdev="NoLogicalDevice"
>       file = open(bb.data.getVar('DEVFILE', e.data, True), "w")
>       file.write(rdev)
>       file.close()
> @@ -133,10 +144,11 @@ def write_task_data(status, logfile, dev, e):
>       # For the best information, running things with BB_TOTAL_THREADS = "1"
>       # would return accurate per task results.
>       ############################################################################
> -    diskdata = get_diskdata("__diskdata_task", dev, e.data)
> -    if diskdata:
> -        for key in sorted(diskdata.iterkeys()):
> -            file.write(key + ": " + diskdata[key] + "\n")
> +    if dev != "NoLogicalDevice":
> +        diskdata = get_diskdata("__diskdata_task", dev, e.data)
> +        if diskdata:
> +            for key in sorted(diskdata.iterkeys()):
> +                file.write(key + ": " + diskdata[key] + "\n")
>       if status is "passed":
>   	    file.write("Status: PASSED \n")
>       else:
> @@ -169,7 +181,8 @@ python run_buildstats () {
>               bb.mkdirhier(bsdir)
>           except:
>               pass
> -        set_diskdata("__diskdata_build", device, e.data)
> +        if device != "NoLogicalDevice":
> +            set_diskdata("__diskdata_build", device, e.data)
>           set_timedata("__timedata_build", e.data)
>           build_time = os.path.join(bsdir, "build_stats")
>           # write start of build into build_time
> @@ -185,7 +198,7 @@ python run_buildstats () {
>
>       elif isinstance(e, bb.event.BuildCompleted):
>           bn = get_bn(e)
> -        dev = get_device(e)
> +        device = get_device(e)
>           bsdir = os.path.join(bb.data.getVar('BUILDSTATS_BASE', e.data, True), bn)
>           taskdir = os.path.join(bsdir, bb.data.expand("${PF}", e.data))
>           build_time = os.path.join(bsdir, "build_stats")
> @@ -201,10 +214,11 @@ python run_buildstats () {
>               file.write("Elapsed time: %0.2f seconds \n" % (time))
>               if cpu:
>                   file.write("CPU usage: %0.1f%% \n" % cpu)
> -        diskio = get_diskdata("__diskdata_build", dev, e.data)
> -        if diskio:
> -            for key in sorted(diskio.iterkeys()):
> -                file.write(key + ": " + diskio[key] + "\n")
> +        if device != "NoLogicalDevice":
> +            diskio = get_diskdata("__diskdata_build", device, e.data)
> +            if diskio:
> +                for key in sorted(diskio.iterkeys()):
> +                    file.write(key + ": " + diskio[key] + "\n")
>           file.close()
>
>       if isinstance(e, bb.build.TaskStarted):
> @@ -212,7 +226,8 @@ python run_buildstats () {
>           device = get_device(e)
>           bsdir = os.path.join(bb.data.getVar('BUILDSTATS_BASE', e.data, True), bn)
>           taskdir = os.path.join(bsdir, bb.data.expand("${PF}", e.data))
> -        set_diskdata("__diskdata_task", device, e.data)
> +        if device != "NoLogicalDevice":
> +            set_diskdata("__diskdata_task", device, e.data)
>           set_timedata("__timedata_task", e.data)
>           try:
>               bb.mkdirhier(taskdir)

Merged into OE-Core with minor tweak to fix commit message formating

Thanks
	Sau!



