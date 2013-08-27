Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 553B86A95B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 12:21:32 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7RCXg1E015089; Tue, 27 Aug 2013 13:33:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aYh8w_pk58lx; Tue, 27 Aug 2013 13:33:42 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7RCXboN015085
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 27 Aug 2013 13:33:39 +0100
Message-ID: <1377606070.32502.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ml@communistcode.co.uk
Date: Tue, 27 Aug 2013 13:21:10 +0100
In-Reply-To: <521C969A.30909@communistcode.co.uk>
References: <521C969A.30909@communistcode.co.uk>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: do_root_fs failing on flock command
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
X-List-Received-Date: Tue, 27 Aug 2013 12:21:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-27 at 13:07 +0100, Jack Mitchell wrote:
> I'm attempting to build core-image-minimal using oe-core + 
> meta-beagleboard on an NFS mount. I'm running into the following error:
> 
> > [jack@archAntec beaglebone]$ bitbake core-image-minimal
> > Loading cache: 100% 
> > |#######################################################################################################| 
> > ETA:  00:00:00
> > Loaded 1193 entries from dependency cache.
> >
> > Build Configuration:
> > BB_VERSION        = "1.19.1"
> > BUILD_SYS         = "x86_64-linux"
> > NATIVELSBSTRING   = "Arch-Linux"
> > TARGET_SYS        = "arm-oe-linux-gnueabi"
> > MACHINE           = "beaglebone"
> > DISTRO_VERSION    = "oe-core.0"
> > TUNE_FEATURES     = "armv7a vfp neon"
> > TARGET_FPU        = "vfp-neon"
> > meta              = "master:2ac7783e04f5e8e6005f967e1a6dd65d2fc6a19a"
> > common-bsp        = "master:f02fabd39cd49bf5932fa5f90e83084d49a8cbe2"
> >
> > NOTE: Resolving any missing task queue dependencies
> > NOTE: Preparing runqueue
> > NOTE: Executing SetScene Tasks
> > NOTE: Executing RunQueue Tasks
> > ERROR: Function failed: do_rootfs (log file is located at 
> > /mnt/mediaserver/Projects/oe-core/beaglebone/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_rootfs.19520)
> > ERROR: Logfile of failure stored in: 
> > /mnt/mediaserver/Projects/oe-core/beaglebone/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_rootfs.19520
> > Log data follows:
> > | DEBUG: Executing python function rootfs_process_ignore
> > | DEBUG: Python function rootfs_process_ignore finished
> > | DEBUG: Executing python function rootfs_runtime_mapping
> > | DEBUG: Python function rootfs_runtime_mapping finished
> > | DEBUG: Executing shell function do_rootfs
> > | flock: 
> > /mnt/mediaserver/Projects/oe-core/beaglebone/tmp-eglibc/deploy/ipk/Packages.flock: 
> > Bad file descriptor
> > | WARNING: 
> > /mnt/mediaserver/Projects/oe-core/beaglebone/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/temp/run.do_rootfs.19520:1 
> > exit 65 from
> > |   flock $pkgdir/Packages.flock -c "opkg-make-index -r 
> > $pkgdir/Packages -p $pkgdir/Packages -m $pkgdir/"
> > | ERROR: Function failed: do_rootfs (log file is located at 
> > /mnt/mediaserver/Projects/oe-core/beaglebone/tmp-eglibc/work/beaglebone-oe-linux-gnueabi/core-image-minimal/1.0-r0/temp/log.do_rootfs.19520)
> > ERROR: Task 7 
> > (/mnt/mediaserver/Projects/oe-core/meta/recipes-core/images/core-image-minimal.bb, 
> > do_rootfs) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 1580 tasks of which 1579 didn't need to 
> > be rerun and 1 failed.
> > No currently running tasks (1579 of 1581)
> >
> > Summary: 1 task failed:
> > /mnt/mediaserver/Projects/oe-core/meta/recipes-core/images/core-image-minimal.bb, 
> > do_rootfs
> > Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> 
> Does anyone have any insight to why this may be failing. It mentions a 
> bad file descriptor, so I assume it is related to building on an NFS mount.

Correct, running builds on NFS isn't really recommended or supported
(other than the downloads and sstate directories). I looks like the
locking didn't work on the NFS mount and reading the man page for flock
suggests that even if you do get NFS locking working, its still not
recommended.

Cheers,

Richard


