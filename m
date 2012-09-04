Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T8ucl-0003p2-Gn
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 17:01:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Sep 2012 07:48:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,367,1344236400"; d="scan'208";a="217617155"
Received: from unknown (HELO [10.255.12.252]) ([10.255.12.252])
	by fmsmga002.fm.intel.com with ESMTP; 04 Sep 2012 07:48:44 -0700
Message-ID: <504614CC.7030906@linux.intel.com>
Date: Tue, 04 Sep 2012 07:48:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <cover.1346346320.git.ross.burton@intel.com>
In-Reply-To: <cover.1346346320.git.ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Remove xserver-kdrive
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
X-List-Received-Date: Tue, 04 Sep 2012 15:01:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/30/2012 10:07 AM, Ross Burton wrote:
> Nobody is actually using xserver-kdrive anymore, apart from on two BSPs in
> meta-yocto that don't actually have video outputs.  Let's remove it.
>
> This is the first stage of the removal, once this has landed there is a lot of
> cruft to be removed too, I'm thinking specifically touchscreen tools that are
> kdrive-specific.
>
> The following changes since commit bb0aab79e488a99cb1b43f72f0e8ddbe39d97519:
>
>    yocto-bsp: use KBRANCH_DEFAULT in 'newbranch' cases (2012-08-29 14:23:36 -0700)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ross/xorg
>
> for you to fetch changes up to b4d8243842ad09c76d95efe611492f5e88c826a4:
>
>    x11-common: don't prune .svn directories on install, we're in git now (2012-08-30 18:04:20 +0100)
>
> ----------------------------------------------------------------
> Ross Burton (6):
>        bsp: set default XSERVER for PowerPC and MIPS machines to Xorg
>        xserver-xorg: ship the exa module in a separate package
>        task-core-x11: default to xserver-xorg instead of kdrive
>        xserver-kdrive: remove.
>        x11-common: just support Xorg now that kdrive has been removed
>        x11-common: don't prune .svn directories on install, we're in git now
>
>   .../x11-common/x11-common/etc/X11/Xserver          |   43 +-
>   meta/recipes-graphics/x11-common/x11-common_0.1.bb |    3 +-
>   .../xserver-kdrive-1.7.99.2/crosscompile.patch     |   23 -
>   .../xserver-kdrive-1.7.99.2/disable-apm.patch      |   24 -
>   .../enable-builtin-fonts.patch                     |   16 -
>   .../enable-xcalibrate.patch                        |  152 ------
>   .../error-address-work-around.patch                |  364 --------------
>   .../xserver-kdrive-1.7.99.2/extra-kmodes.patch     |   87 ----
>   .../fbdev_xrandr_ioctl.patch                       |   65 ---
>   .../fix-bogus-stack-variables.patch                |  233 ---------
>   .../fix-newer-xorg-headers.patch                   |   22 -
>   .../hide-cursor-and-ppm-root.patch                 |  312 ------------
>   .../xserver-kdrive-1.7.99.2/kdrive-evdev.patch     |  520 --------------------
>   .../xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch |   58 ---
>   .../keyboard-resume-workaround.patch               |   29 --
>   .../no-serial-probing.patch                        |   17 -
>   .../xserver-kdrive-1.7.99.2/nodolt.patch           |   16 -
>   .../xserver-kdrive-1.7.99.2/optional-xkb.patch     |   62 ---
>   .../xorg-xserver/xserver-kdrive.inc                |  113 -----
>   .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |   34 --
>   .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
>   .../xorg-xserver/xserver-xorg-common.inc           |    3 +
>   meta/recipes-sato/tasks/task-core-x11-mini.bb      |    4 +-
>   meta/recipes-sato/tasks/task-core-x11.bb           |    4 +-
>   .../arch/mips/conf/machine/{{=machine}}.conf       |    7 +-
>   .../arch/powerpc/conf/machine/{{=machine}}.conf    |    7 +-
>   26 files changed, 20 insertions(+), 2200 deletions(-)
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/crosscompile.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/disable-apm.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-builtin-fonts.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-xcalibrate.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/error-address-work-around.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/extra-kmodes.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fbdev_xrandr_ioctl.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-bogus-stack-variables.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-newer-xorg-headers.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/hide-cursor-and-ppm-root.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-evdev.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/keyboard-resume-workaround.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/no-serial-probing.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/nodolt.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/optional-xkb.patch
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
>
Merged into OE-Core

Thanks
	Sau!



