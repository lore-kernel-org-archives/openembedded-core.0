Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsuL-0000cZ-T6
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:40:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2012 14:31:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="159193709"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2012 14:31:14 -0700
Message-ID: <4F9B1022.2030804@linux.intel.com>
Date: Fri, 27 Apr 2012 14:31:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Yang Shi <yang.shi@windriver.com>
References: <1334009754-3012-1-git-send-email-yang.shi@windriver.com>
In-Reply-To: <1334009754-3012-1-git-send-email-yang.shi@windriver.com>
Cc: dvhart@linux.intel.com, 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [V2 PATCH 0/2] Fix init-live.sh to use unionfs for live CD and remove questioned ISO image
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
X-List-Received-Date: Fri, 27 Apr 2012 21:40:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2012 03:15 PM, Yang Shi wrote:
>
> Changelog V1 ->  V2:
> * Refined patch 1/2 log
> * Fixed some spelling erros in patch 1/2
> * Instead of removing questioned ISO images, just throw warning info in patch 2/2
>
>
> When booting up with liveCD image, init scripts can't work well on read-only filesystem. Unionfs,
> which is supported in Yocto kernel, allows a filesystem to appear as writeable, but without
> actually allowing writes to change the filesystem.
>
> Use unionfs to mount rootfs and make root file system can be writen when using liveCD to boot up.
> Set UNION_FS variable depending on kernel config, so that it can work with kernel which doesn't
> have unionfs feature.
>
> For the liveCD image, interactive bootup is needed, but psplash prevents from
> booting interactively. In such case ISO image is not usable, so throw warning
> info when building ISO image without unionfs enabled in kernel.
>
> We tried a lot of different ways to achieve this:
>
> 1. Check if ISO image is built in initramfs-live-boot.bb or not, then prevent from generating ISO image.
> But, we can't distinguish minimal image or sato image.
>
> 2. Check if x11 feature is included in initramfs-live-boot.bb or not, then prevent from generating ISO image.
> But, x11 feature is contained in minimal image as well even though the package is not built.
>
> 3. Tried to append some check code in build_iso() in core-image-sato.bb, but poky can't support append code
> in build_xxx functions like what we do for do_xxx funcitons.
>
> So, we came up with current solution. Any new suggestion is appreciated.
>
> One more thing is that if IMAGE_FSTYPE += "live" is not set in conf/local.conf with this fix, we will get below
> error when building sato image:
>
> ERROR: Running idle function
> Traceback (most recent call last):
>    File "/home/yshi/yocto/poky/bitbake/lib/bb/server/process.py", line
> 122, in ProcessServer.idle_commands(delay=0.1):
>                   try:
>      >                 retval = function(self, data, False)
>                       if retval is False:
>    File "/home/yshi/yocto/poky/bitbake/lib/bb/cooker.py", line 1130, in
> buildTargetsIdle(server=<ProcessServer(ProcessServer-1, started)>,
> rq=<bb.runqueue.RunQueue instance at 0x74e4638>, abort=False):
>                   try:
>      >                 retval = rq.execute_runqueue()
>                   except runqueue.TaskFailure as exc:
>    File "/home/yshi/yocto/poky/bitbake/lib/bb/runqueue.py", line 947,
> in RunQueue.execute_runqueue():
>                   self.rqexe = RunQueueExecuteDummy(self)
>      >             if self.rqdata.prepare() == 0:
>                       self.state = runQueueComplete
>    File "/home/yshi/yocto/poky/bitbake/lib/bb/runqueue.py", line 719,
> in RunQueueData.prepare():
>
> procdep.append(self.taskData.fn_index[self.runq_fnid[dep]] + "." +
> self.runq_task[dep])
>      >                     self.runq_hash[task] =
> bb.parse.siggen.get_taskhash(self.taskData.fn_index[self.runq_fnid[task]],
> self.runq_task[task], procdep, self.dataCache)
>
>    File "/home/yshi/yocto/poky/bitbake/lib/bb/siggen.py", line 153, in
> SignatureGeneratorOEBasicHash.get_taskhash(fn='/home/yshi/yocto/poky/meta/recipes-sato/images/core-image-sato.bb',
> task='do_bootimg', deps=[], dataCache=<bb.cache.CacheData object at
> 0x2148490>):
>               k = fn + "." + task
>      >         data = dataCache.basetaskhash[k]
>               self.runtaskdeps[k] = []
> KeyError: '/home/yshi/yocto/poky/meta/recipes-sato/images/core-image-sato.bb.do_bootimg'
>
> NOTE: Preparing runqueue
>
> Bruce pointed out there was a large discussion about this on hte list last week, so this should be a known issue in poky.
>
> The following changes since commit f81b0593e74a31cb2d992df0583948ff57e3ed98:
>
>    gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in include/gdbm (2012-03-23 17:56:29 +0200)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib yshi/1487v2
>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=yshi/1487v2
>
> Yang Shi (2):
>        initrdscripts: fix init-live.sh and use unionfs
>        sato:  Throw warning when building ISO image without unionfs enabled
>
>   meta/recipes-core/initrdscripts/files/init-live.sh |   23 ++++++++++++++++---
>   .../initrdscripts/initramfs-live-boot_1.0.bb       |    9 +++++++-
>   meta/recipes-sato/images/core-image-sato.bb        |   14 ++++++++++++
>   3 files changed, 41 insertions(+), 5 deletions(-)
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
>

The first part of the patch set was merged, but then later disabled as 
there were problems with unionfs and images.

Please revisit this patch set

Thanks
	Sau!


