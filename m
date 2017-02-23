Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5A86C72FF1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 10:24:12 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 02:24:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="228763976"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 23 Feb 2017 02:24:14 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id BA0546A4004;
	Thu, 23 Feb 2017 02:24:12 -0800 (PST)
Date: Thu, 23 Feb 2017 12:18:04 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170223101804.GA29462@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1487690169.git.ed.bartosh@linux.intel.com>
	<CAJTo0LZT_D4gXYRY__zWuDCY9zOKaHL1tmgqppP5=8qJzijn+Q@mail.gmail.com>
	<20170222205335.GA13229@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170222205335.GA13229@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] wic: fix for #11017
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
X-List-Received-Date: Thu, 23 Feb 2017 10:24:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 22, 2017 at 10:53:35PM +0200, Ed Bartosh wrote:
> On Wed, Feb 22, 2017 at 04:38:55PM +0000, Burton, Ross wrote:
> > Hi Ed,
> > 
> > Something in your latest patchset is breaking selftest:
> > 
> > https://autobuilder.yoctoproject.org/main/builders/nightly-wic/builds/626/steps/CreateWicImages/logs/stdio
> > 
> > The broken commit is somewhere in ross/mut-wic.  Can you verify that I
> > didn't leave something out, or otherwise chase this?
> > 
> I couldn't reproduce this so far. Will investigate further.
> 
> Can you merge this patchset please?
> http://lists.openembedded.org/pipermail/openembedded-core/2017-February/132854.html
> 
> The failure is most probably caused by patchset from this thread.
> 

Still not able to reproduce it. It works just fine in my environment.
This time I used setup as close to AB as I could get: core-image-sato
image, genericx86-64 machine, clean build.

[build-genericx86-64 (ed/wic/wip)]$ rm -rf tmp/

[build-genericx86-64 (ed/wic/wip)]$ bitbake core-image-sato
WARNING: Host distribution "opensuse-13.2" has not been validated with
this version of the build system; you may possibly experience unexpected
failures. It is recommended that you use a tested distribution.
Parsing recipes: 100%
|###############################################################################################################################################|
Time: 0:00:13
Parsing of 856 .bb files complete (0 cached, 856 parsed). 1322 targets,
53 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.33.1"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "opensuse-13.2"
TARGET_SYS        = "x86_64-poky-linux"
MACHINE           = "genericx86-64"
DISTRO            = "poky"
DISTRO_VERSION    = "2.2+snapshot-20170222"
TUNE_FEATURES     = "m64 core2"
TARGET_FPU        = ""
meta
meta-poky
meta-yocto-bsp    =
"ed/wic/wip:5d96bc6d1af89dda11f3266548fe1547152c86e1"

Initialising tasks: 100%
|############################################################################################################################################|
Time: 0:00:15
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 6116 tasks of which 2807 didn't need to
be rerun and all succeeded.

Summary: There was 1 WARNING message shown.

[build-genericx86-64 (ed/wic/wip)]$ wic create directdisk -e core-image-sato
INFO: Creating image(s)...

INFO: The new image(s) can be found here:
  ./directdisk-201702231207-sda.direct

The following build artifacts were used to create the image(s):
  ROOTFS_DIR:
/home/ed/git/yocto/poky/build-genericx86-64/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0-r0/rootfs
  BOOTIMG_DIR:
/home/ed/git/yocto/poky/build-genericx86-64/tmp/work/core2-64-poky-linux/wic-tools/1.0-r0/recipe-sysroot/usr/share
  KERNEL_DIR:
/home/ed/git/yocto/poky/build-genericx86-64/tmp/deploy/images/genericx86-64
  NATIVE_SYSROOT:
/home/ed/git/yocto/poky/build-genericx86-64/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0-r0/recipe-sysroot-native

INFO: The image(s) were created using OE kickstart file:
  /home/ed/git/yocto/poky/scripts/lib/wic/canned-wks/directdisk.wks


Could it be because of something in AB setup?

Regards,
Ed

> > On 21 February 2017 at 15:23, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > 
> > > Hi,
> > >
> > > This patchset improves handling of wic native tool dependencies and
> > > fixes minor bugs in the wic code.
> > >
> > > The following changes since commit 9a0ddad5e178d16f302af2d05c3236
> > > 8572849fd3:
> > >
> > >   wic: pluginbase: use global dictionary (2017-02-20 11:58:28 +0200)
> > >
> > > are available in the git repository at:
> > >
> > >   git://git.yoctoproject.org/poky-contrib ed/wic/wip
> > >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip
> > >
> > > Ed Bartosh (6):
> > >   wic: use 2 sysroots to find native executable
> > >   wic: use image recipe sysroot as default
> > >   wic: exec_native_cmd: improve debug message
> > >   wic: exec_native_cmd: fix undefined variable error
> > >   wic: add WKS_FILE_DEPENDS variable
> > >   wic: raise WicError instead of calling logger.error
> > >
> > >  meta-selftest/recipes-test/images/wic-image-minimal.bb |  2 +-
> > >  meta/classes/image_types_wic.bbclass                   |  2 ++
> > >  scripts/lib/wic/plugins/source/bootimg-pcbios.py       |  4 ++--
> > >  scripts/lib/wic/utils/misc.py                          | 13 +++++++++----
> > >  scripts/wic                                            |  2 +-
> > >  5 files changed, 15 insertions(+), 8 deletions(-)
> > >
> > > --
> > > Regards,
> > > Ed
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> 
> -- 
> --
> Regards,
> Ed
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed

