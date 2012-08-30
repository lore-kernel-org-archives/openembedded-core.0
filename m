Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T78Pq-0004g2-PA
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 19:20:27 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 30 Aug 2012 10:08:07 -0700
Received: by wibhn17 with SMTP id hn17so498716wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 10:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=3RGKIl+7EasmdpvudwbLMJCTGP8F1fFeuf7mqyDRFpA=;
	b=YMs2qRP0GEZX0fUDGoYfvXgIbLR9C84YgEYR2FdBmjJqWd5IEbdw33jr6J8Nx5bAgL
	lMaHRyvw11EBPnEhLcMjcdIbZdHn5MeoOafDgBd3/DBCCJbgsv8iaMW4pu6CwJiSimfh
	yCqC2dHOPs8qFPmPuEr2kUx/WxmTDbAkuUe1LPZLet9zXAHNhQHC4FmP2G60Rh3XoDDF
	GN4zwLLmnCzcibhu6aSSleHM97pKokpb8hOCtqECKJ442eBY/G02Y5cyaGRmE2+Uhce1
	mGEvQz5p1vhHw2hbe0K3DOzPmESNhqQkP8RK3GnOQRunSjnFhBTRJ376UxqCT5vy7Hn/
	oKFg==
Received: by 10.180.7.200 with SMTP id l8mr1892471wia.9.1346346487599;
	Thu, 30 Aug 2012 10:08:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hv8sm1707554wib.0.2012.08.30.10.08.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 10:08:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2012 18:07:19 +0100
Message-Id: <cover.1346346320.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmTH5LMYBHmD+IqJbVixZKjuGzVvvi2YfzCHWeS71JuwfR/DG9lm2+Hqn2+/tWT31rc+gvm
Subject: [PATCH 0/6] Remove xserver-kdrive
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 17:20:27 -0000

Nobody is actually using xserver-kdrive anymore, apart from on two BSPs in
meta-yocto that don't actually have video outputs.  Let's remove it.

This is the first stage of the removal, once this has landed there is a lot of
cruft to be removed too, I'm thinking specifically touchscreen tools that are
kdrive-specific.

The following changes since commit bb0aab79e488a99cb1b43f72f0e8ddbe39d97519:

  yocto-bsp: use KBRANCH_DEFAULT in 'newbranch' cases (2012-08-29 14:23:36 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/xorg

for you to fetch changes up to b4d8243842ad09c76d95efe611492f5e88c826a4:

  x11-common: don't prune .svn directories on install, we're in git now (2012-08-30 18:04:20 +0100)

----------------------------------------------------------------
Ross Burton (6):
      bsp: set default XSERVER for PowerPC and MIPS machines to Xorg
      xserver-xorg: ship the exa module in a separate package
      task-core-x11: default to xserver-xorg instead of kdrive
      xserver-kdrive: remove.
      x11-common: just support Xorg now that kdrive has been removed
      x11-common: don't prune .svn directories on install, we're in git now

 .../x11-common/x11-common/etc/X11/Xserver          |   43 +-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |    3 +-
 .../xserver-kdrive-1.7.99.2/crosscompile.patch     |   23 -
 .../xserver-kdrive-1.7.99.2/disable-apm.patch      |   24 -
 .../enable-builtin-fonts.patch                     |   16 -
 .../enable-xcalibrate.patch                        |  152 ------
 .../error-address-work-around.patch                |  364 --------------
 .../xserver-kdrive-1.7.99.2/extra-kmodes.patch     |   87 ----
 .../fbdev_xrandr_ioctl.patch                       |   65 ---
 .../fix-bogus-stack-variables.patch                |  233 ---------
 .../fix-newer-xorg-headers.patch                   |   22 -
 .../hide-cursor-and-ppm-root.patch                 |  312 ------------
 .../xserver-kdrive-1.7.99.2/kdrive-evdev.patch     |  520 --------------------
 .../xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch |   58 ---
 .../keyboard-resume-workaround.patch               |   29 --
 .../no-serial-probing.patch                        |   17 -
 .../xserver-kdrive-1.7.99.2/nodolt.patch           |   16 -
 .../xserver-kdrive-1.7.99.2/optional-xkb.patch     |   62 ---
 .../xorg-xserver/xserver-kdrive.inc                |  113 -----
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |   34 --
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-common.inc           |    3 +
 meta/recipes-sato/tasks/task-core-x11-mini.bb      |    4 +-
 meta/recipes-sato/tasks/task-core-x11.bb           |    4 +-
 .../arch/mips/conf/machine/{{=machine}}.conf       |    7 +-
 .../arch/powerpc/conf/machine/{{=machine}}.conf    |    7 +-
 26 files changed, 20 insertions(+), 2200 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/disable-apm.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-builtin-fonts.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-xcalibrate.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/error-address-work-around.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/extra-kmodes.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fbdev_xrandr_ioctl.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-newer-xorg-headers.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/hide-cursor-and-ppm-root.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/keyboard-resume-workaround.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/no-serial-probing.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/optional-xkb.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb

Ross Burton (6):
  bsp: set default XSERVER for PowerPC and MIPS machines to Xorg
  xserver-xorg: ship the exa module in a separate package
  task-core-x11: default to xserver-xorg instead of kdrive
  xserver-kdrive: remove.
  x11-common: just support Xorg now that kdrive has been removed
  x11-common: don't prune .svn directories on install, we're in git now

 .../x11-common/x11-common/etc/X11/Xserver          |   43 +-
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |    3 +-
 .../xserver-kdrive-1.7.99.2/crosscompile.patch     |   23 -
 .../xserver-kdrive-1.7.99.2/disable-apm.patch      |   24 -
 .../enable-builtin-fonts.patch                     |   16 -
 .../enable-xcalibrate.patch                        |  152 ------
 .../error-address-work-around.patch                |  364 --------------
 .../xserver-kdrive-1.7.99.2/extra-kmodes.patch     |   87 ----
 .../fbdev_xrandr_ioctl.patch                       |   65 ---
 .../fix-bogus-stack-variables.patch                |  233 ---------
 .../fix-newer-xorg-headers.patch                   |   22 -
 .../hide-cursor-and-ppm-root.patch                 |  312 ------------
 .../xserver-kdrive-1.7.99.2/kdrive-evdev.patch     |  520 --------------------
 .../xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch |   58 ---
 .../keyboard-resume-workaround.patch               |   29 --
 .../no-serial-probing.patch                        |   17 -
 .../xserver-kdrive-1.7.99.2/nodolt.patch           |   16 -
 .../xserver-kdrive-1.7.99.2/optional-xkb.patch     |   62 ---
 .../xorg-xserver/xserver-kdrive.inc                |  113 -----
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |   34 --
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-common.inc           |    3 +
 meta/recipes-sato/tasks/task-core-x11-mini.bb      |    4 +-
 meta/recipes-sato/tasks/task-core-x11.bb           |    4 +-
 .../arch/mips/conf/machine/{{=machine}}.conf       |    7 +-
 .../arch/powerpc/conf/machine/{{=machine}}.conf    |    7 +-
 26 files changed, 20 insertions(+), 2200 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/disable-apm.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-builtin-fonts.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-xcalibrate.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/error-address-work-around.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/extra-kmodes.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fbdev_xrandr_ioctl.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-newer-xorg-headers.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/hide-cursor-and-ppm-root.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/keyboard-resume-workaround.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/no-serial-probing.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/optional-xkb.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb

-- 
1.7.10



