Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9E3A601A4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 07:17:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB27Hj7B008654
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Dec 2016 23:17:45 -0800 (PST)
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Dec 2016 23:17:44 -0800
To: Michael Gloff <mgloff@emacinc.com>, OE Core
	<openembedded-core@lists.openembedded.org>
References: <CALXw4G5XD=N5QJg8OgvOGi-BDsAqUgmFqMddumdAq6MkC_LY5A@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <39e9a81f-28ed-3a83-afdb-4ce3886e7830@windriver.com>
Date: Fri, 2 Dec 2016 15:17:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CALXw4G5XD=N5QJg8OgvOGi-BDsAqUgmFqMddumdAq6MkC_LY5A@mail.gmail.com>
Subject: Re: Debugfs + nfs-utils-client + ipkg
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
X-List-Received-Date: Fri, 02 Dec 2016 07:17:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael,

On 12/02/2016 11:19 AM, Michael Gloff wrote:
> I've run into an issue recently when trying to build an image along with the
> companion debugfs. This error only occurs if 'nfs-utils-client' is added to
> IMAGE_INSTALL and ipkg packages are selected. I don't get the error with RPM or
> with removing nfs-utils-client. Also, I can see the missing files are present at
> some point during do_rootfs, but then must be getting wiped out? I noticed this
> in Krogoth first, but can reproduce in latest master. Any ideas?

Maybe something is wrong with opkg, it only happens when files are in 
/var/lib/foo, here is a *workaround*:

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a348b97..ba072c0 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -951,7 +951,7 @@ class OpkgRootfs(DpkgOpkgRootfs):
          if self.progress_reporter:
              self.progress_reporter.next_stage()

-        self._setup_dbg_rootfs(['/etc', '/var/lib/opkg', '/usr/lib/ssl'])
+        self._setup_dbg_rootfs(['/etc', '/var/lib/opkg', '/usr/lib/ssl', 
'/var/lib/nfs'])

          execute_pre_post_process(self.d, opkg_post_process_cmds)


This is not a regular fix, you can file a bug here:
https://bugzilla.yoctoproject.org/

We may fix it later.

// Robert

>
> developer@OEBuilder:~/oe/recipes/poky/build$ bitbake core-image-minimal
> Loading cache: 100%
> |##########################################################################################################################################################|
> Time: 0:00:00
> Loaded 1304 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION        = "1.32.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "universal"
> TARGET_SYS        = "i586-poky-linux"
> MACHINE           = "qemux86"
> DISTRO            = "poky"
> DISTRO_VERSION    = "2.2"
> TUNE_FEATURES     = "m32 i586"
> TARGET_FPU        = ""
> meta
> meta-poky
> meta-yocto-bsp    = "master:9e63f81c78e284c9b325fe04a1b59e61c7ad8a1a"
>
> Initialising tasks: 100%
> |#####################################################################################################################################################|
> Time: 0:00:03
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: core-image-minimal-1.0-r0 do_rootfs: Cannot get the installed packages
> list. Command
> '/home/developer/oe/recipes/poky/build/tmp/sysroots/x86_64-linux/usr/bin/opkg -f
> /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/opkg.conf
> -o
> /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs
> --force_postinstall --prefer-arch-to-version   status' returned 0 and stderr:
> Collected errors:
>  * file_md5sum_alloc: Failed to open file
> /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/nfs/etab:
> No such file or directory.
>  * file_md5sum_alloc: Failed to open file
> /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/nfs/rmtab:
> No such file or directory.
>  * file_md5sum_alloc: Failed to open file
> /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/nfs/xtab:
> No such file or directory.
>  * file_md5sum_alloc: Failed to open file
> /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/nfs/statd/state:
> No such file or directory.
>
> ERROR: core-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs
> ERROR: Logfile of failure stored in:
> /home/developer/oe/recipes/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.5361
> ERROR: Task
> (/home/developer/oe/recipes/poky/meta/recipes-core/images/core-image-minimal.bb:do_rootfs)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2168 tasks of which 2167 didn't need to be rerun
> and 1 failed.
>
> Summary: 1 task failed:
>
> /home/developer/oe/recipes/poky/meta/recipes-core/images/core-image-minimal.bb:do_rootfs
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
>
> Thanks,
>
> Michael Gloff
> mgloff@emacinc.com <mailto:mgloff@emacinc.com>
>
>

