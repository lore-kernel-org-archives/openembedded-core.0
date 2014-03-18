Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 037136F8D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 22:28:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Mar 2014 15:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,680,1389772800"; d="scan'208";a="502627918"
Received: from unknown (HELO [10.255.12.240]) ([10.255.12.240])
	by orsmga002.jf.intel.com with ESMTP; 18 Mar 2014 15:28:49 -0700
Message-ID: <5328C8A0.1010100@linux.intel.com>
Date: Tue, 18 Mar 2014 15:28:48 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Alex DAMIAN <alexandru.damian@intel.com>, 
	openembedded-core@lists.openembedded.org
References: <b01b97b0f8a67d3aeae9ed01e24c5e6bace8e43b.1395068545.git.alexandru.damian@intel.com>
	<6f3acb92219b832f847d4e59342c8c4582ac5b78.1395068545.git.alexandru.damian@intel.com>
In-Reply-To: <6f3acb92219b832f847d4e59342c8c4582ac5b78.1395068545.git.alexandru.damian@intel.com>
Subject: Re: [PATCH 3/3] buildstats: use TaskBase time for elapsed time
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
X-List-Received-Date: Tue, 18 Mar 2014 22:28:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/17/2014 08:04 AM, Alex DAMIAN wrote:
> From: Marius Avram <marius.avram@intel.com>
>
> To avoid any further inconsistencies between buildstats and buildinfohelper
> from toaster, buildstats will measure task duration using the time field
> from within the TaskBase events: TaskStarted and TaskSucceeded/TaskFailed.
>

This patch seems to be causing some problems:

> ERROR: Execution of event handler 'run_buildstats' failed
> Traceback (most recent call last):
>   File "run_buildstats(e)", line 72, in run_buildstats(e=<bb.build.TaskStarted object at 0x6e45590>)
> AttributeError: 'TaskStarted' object has no attribute 'time'
>
> ERROR: Execution of event handler 'run_buildstats' failed
> Traceback (most recent call last):
>   File "run_buildstats(e)", line 88, in run_buildstats(e=<bb.build.TaskSucceeded object at 0x6e40190>)
>   File "buildstats.bbclass", line 5, in write_task_data(status='passed', logfile='/home/sgw/yocto/builds/world/tmp/buildstats/linux-yocto-qemux86-64/201403181525/linux-yocto-3.10.32+gitAUTOINC+7b3b87d4d5_78afd3095c-r0/do_clean', dev='sda5', e=<bb.build.TaskSucceeded object at 0x6e40190>)
> IOError: [Errno 2] No such file or directory: '/home/sgw/yocto/builds/world/tmp/buildstats/linux-yocto-qemux86-64/201403181525/linux-yocto-3.10.32+gitAUTOINC+7b3b87d4d5_78afd3095c-r0/do_clean'
>
> ERROR: Execution of event handler 'run_buildstats' failed
> Traceback (most recent call last):
>   File "run_buildstats(e)", line 72, in run_buildstats(e=<bb.build.TaskStarted object at 0x74f59d0>)
> AttributeError: 'TaskStarted' object has no attribute 'time'
>
> ERROR: Execution of event handler 'run_buildstats' failed
> Traceback (most recent call last):
>   File "run_buildstats(e)", line 88, in run_buildstats(e=<bb.build.TaskSucceeded object at 0x6e48dd0>)
>   File "buildstats.bbclass", line 5, in write_task_data(status='passed', logfile='/home/sgw/yocto/builds/world/tmp/buildstats/linux-yocto-qemux86-64/201403181525/linux-yocto-3.10.32+gitAUTOINC+7b3b87d4d5_78afd3095c-r0/do_cleansstate', dev='sda5', e=<bb.build.TaskSucceeded object at 0x6e48dd0>)



Sau!


> Signed-off-by: Marius Avram <marius.avram@intel.com>
> ---
>   meta/classes/buildstats.bbclass | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
> index 72fff11..89ae72c 100644
> --- a/meta/classes/buildstats.bbclass
> +++ b/meta/classes/buildstats.bbclass
> @@ -109,14 +109,17 @@ def get_diskdata(var, dev, data):
>           diskdata["End"+key] = str(int(newdiskdata[key]))
>       return diskdata
>
> -def set_timedata(var, data):
> +def set_timedata(var, data, server_time=None):
>       import time
> -    time = time.time()
> +    if server_time:
> +        time = server_time
> +    else:
> +        time = time.time()
>       cputime = get_cputime()
>       proctime = get_process_cputime(os.getpid())
>       data.setVar(var, (time, cputime, proctime))
>
> -def get_timedata(var, data):
> +def get_timedata(var, data, server_time=None):
>       import time
>       timedata = data.getVar(var, False)
>       if timedata is None:
> @@ -124,7 +127,11 @@ def get_timedata(var, data):
>       oldtime, oldcpu, oldproc = timedata
>       procdiff = get_process_cputime(os.getpid()) - oldproc
>       cpudiff = get_cputime() - oldcpu
> -    timediff = time.time() - oldtime
> +    if server_time:
> +        end_time = server_time
> +    else:
> +        end_time = time.time()
> +    timediff = end_time - oldtime
>       if cpudiff > 0:
>           cpuperc = float(procdiff) * 100 / cpudiff
>       else:
> @@ -136,7 +143,7 @@ def write_task_data(status, logfile, dev, e):
>       bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
>       taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
>       file = open(os.path.join(logfile), "a")
> -    timedata = get_timedata("__timedata_task", e.data)
> +    timedata = get_timedata("__timedata_task", e.data, e.time)
>       if timedata:
>           elapsedtime, cpu = timedata
>           file.write(bb.data.expand("${PF}: %s: Elapsed time: %0.2f seconds \n" %
> @@ -160,7 +167,7 @@ def write_task_data(status, logfile, dev, e):
>   	    file.write("Status: PASSED \n")
>       else:
>           file.write("Status: FAILED \n")
> -    file.write("Ended: %0.2f \n" % time.time())
> +    file.write("Ended: %0.2f \n" % e.time)
>       file.close()
>
>   python run_buildstats () {
> @@ -234,7 +241,7 @@ python run_buildstats () {
>           taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
>           if device != "NoLogicalDevice":
>               set_diskdata("__diskdata_task", device, e.data)
> -        set_timedata("__timedata_task", e.data)
> +        set_timedata("__timedata_task", e.data, e.time)
>           try:
>               bb.utils.mkdirhier(taskdir)
>           except:
> @@ -242,7 +249,7 @@ python run_buildstats () {
>           # write into the task event file the name and start time
>           file = open(os.path.join(taskdir, e.task), "a")
>           file.write("Event: %s \n" % bb.event.getName(e))
> -        file.write("Started: %0.2f \n" % time.time())
> +        file.write("Started: %0.2f \n" % e.time)
>           file.close()
>
>       elif isinstance(e, bb.build.TaskSucceeded):
>

