Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDwp-0005dJ-Hw
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:10:59 +0200
Received: by gyg8 with SMTP id 8so3929580gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=S5HZh6bu7pvRPrksmxVhCU8VLanm7sLKtIfL/kao6Mo=;
	b=JXo3DNWfoQOgdViapoEePxrqKaoEzWEAwwMrpPia6FskmrumAMkU1BbOQn6xweZyJp
	WKelClyakBevogZntqOR5SsG6IYOqcyQc8MZUAwEvBhX15eolmQnM3PKaVZKy2iWjEHK
	BwiH76O7aVteWYgGKk8JK+ac33Q0qsxce4cTM=
Received: by 10.223.16.131 with SMTP id o3mr11876917faa.11.1318007121556;
	Fri, 07 Oct 2011 10:05:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h16sm13589891fab.19.2011.10.07.10.05.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:05:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:11 +0200
Message-Id: <cover.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCHv3 00/31] Xorg related changes
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
X-List-Received-Date: Fri, 07 Oct 2011 17:10:59 -0000

this patchset brings meta-oe and oe-core xorg stuff together and most of
xorg recipes will be removed from meta-oe (sending another pull request now).

This step is needed to be able to separate common x11 to meta-x11 or whatever later.

The following changes since commit 808b3123e359f1aebabb8af44694275e4075e031:

  gnutls: Disable p11-kit dependency explicitly to resolve build failures (2011-10-07 15:40:42 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/x11-v2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/x11-v2

Martin Jansa (31):
  xserver-xf86(-dri)-lite: rename to xserver-xorg and xserver-xorg-lite
  xserver-xorg: remove old git recipe
  glx-use-tls.inc: add include file to enable glx-tls only when
    TARGET_OS isn't uclibc
  xserver-xorg-common: fix LIC_FILES_CHKSUM
  xserver-xorg-common: move SRC_URI closer together
  xserver-xorg-common: Split out some bigger modules and extensions
    from the main package
  xserver-xorg-common: improve packaging
  xserver-xorg-common: move shared PROTO_DEPS and LIB_DEPS from
    xserver-xorg.inc and xserver-xorg-lite.inc to
    xserver-xorg-common.inc
  xserver-xorg-common: lower xserver-xf86-config and xkeyboard-config
    dependency to RRECOMMENDS  and add few more recipes to RRECOMMENDS
  xserver-xorg-common: move RDEPENDS_${PN} += xorg-minimal-fonts to
    shared .inc
  xserver-xorg: remove FILES_${PN} += "${bindir}/Xorg ", now we have
    whole ${bindir} in FILES_ defined in shared .inc
  xserver-xorg: replace hardcoded --enable-glx-tls with
    glx-use-tls.inc, which doesn't enable it for uClibc
  xserver-xorg: move shared EXTRA_OECONF entries to shared .inc
  xserver-xorg: add new version 1.11.1
  xserver-xorg: remove old 1.10.1 version
  xserver-xorg: remove COMPATIBLE_HOST
  xserver-xorg: drop unused files
  xserver-xorg: move patches to xserver-xf86-dri-lite-1.11.1 and use
    same directory from xserver-xf86-lite recipe
  xserver-kdrive: drop unused files (same files are in
    xserver-kdrive-1.7.99.2 directory
  xorg-driver-common.inc: use virtual/xserver instead of older
    virtual/xserver-xf86
  xorg-driver-common.inc: bump INC_PR to rebuild drivers agains new
    xserver-xorg ABI
  libx11: package xcb, merge few changes from meta-oe
  libx11: add new version 1.4.4
  libx11: remove older 1.3.4
  libx11: drop old 1.2.2 git version
  libx11-trim: move files for libx11-trim from libx11-1.3.4 to
    libx11-trim-1.3.4
  libx11-diet: move old patches used only by libx11-diet-1.3 to
    separate directory
  mesa: add mesa-dri.inc and mesa-xlib.inc with shared options, move
    uclibc.patch
  mesa-dri-glsl-native: drop recipe which wasn't usefull since 7.8.2
    was removed
  mesa: add new version 7.11
  mesa: drop older 7.10.2 and 7.7+git recipes

 meta/conf/distro/include/default-providers.inc     |    4 +-
 .../conf/distro/include/distro_tracking_fields.inc |   20 +-
 meta/conf/machine/qemux86-64.conf                  |    6 +-
 meta/conf/machine/qemux86.conf                     |    6 +-
 meta/conf/multilib.conf                            |    2 +-
 meta/recipes-graphics/mesa/glx-use-tls.inc         |    7 +
 meta/recipes-graphics/mesa/mesa-7.11.inc           |   15 +
 meta/recipes-graphics/mesa/mesa-common.inc         |   36 ++-
 .../mesa/mesa-dri-glsl-native_7.11.bb              |   28 +
 .../mesa/mesa-dri-glsl-native_7.8.2.bb             |   27 -
 meta/recipes-graphics/mesa/mesa-dri.inc            |   22 +
 meta/recipes-graphics/mesa/mesa-dri/cross2.patch   |   46 --
 meta/recipes-graphics/mesa/mesa-dri/crossfix.patch |   18 -
 meta/recipes-graphics/mesa/mesa-dri/i586/matypes.h |  162 ------
 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb      |   40 --
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    4 +
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |   57 --
 meta/recipes-graphics/mesa/mesa-xlib.inc           |    1 +
 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb     |   22 -
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    4 +
 .../mesa/{mesa-dri => mesa}/uclibc.patch           |    0
 .../xorg-driver/xorg-driver-common.inc             |    4 +-
 .../xorg-lib/libx11-1.4.4/keysymdef_include.patch  |   23 +
 .../libx11-1.4.4/x11_disable_makekeys.patch        |   29 +
 .../{libx11 => libx11-diet-1.3}/X18NCMSstubs.diff  |    0
 .../fix-disable-xlocale.diff                       |    0
 .../fix-utf8-wrong-define.patch                    |    0
 .../include_fix.patch                              |    0
 .../{libx11-git => libx11-diet-1.3}/nodolt.patch   |    0
 .../x11_disable_makekeys.patch                     |    0
 meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb  |    3 +-
 meta/recipes-graphics/xorg-lib/libx11-diet_git.bb  |   17 -
 .../xorg-lib/libx11-git/X18NCMSstubs.diff          |  570 --------------------
 .../xorg-lib/libx11-git/x11_disable_makekeys.patch |   30 -
 .../include_fix.patch                              |    0
 .../makekeys_crosscompile.patch                    |    0
 .../nodolt.patch                                   |    0
 .../x11_disable_makekeys.patch                     |    0
 .../xorg-lib/libx11-trim/include_fix.patch         |   25 -
 .../xorg-lib/libx11-trim/nodolt.patch              |   14 -
 .../recipes-graphics/xorg-lib/libx11-trim_1.3.4.bb |   10 +-
 meta/recipes-graphics/xorg-lib/libx11-trim_git.bb  |   13 -
 meta/recipes-graphics/xorg-lib/libx11.inc          |   25 +-
 .../xorg-lib/libx11/fix-disable-xlocale.diff       |   16 -
 .../xorg-lib/libx11/fix-utf8-wrong-define.patch    |   17 -
 .../xorg-lib/libx11/include_fix.patch              |   25 -
 meta/recipes-graphics/xorg-lib/libx11/nodolt.patch |   14 -
 .../xorg-lib/libx11/x11_disable_makekeys.patch     |   31 --
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb     |   35 --
 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb     |   18 +
 meta/recipes-graphics/xorg-lib/libx11_git.bb       |   14 -
 meta/recipes-graphics/xorg-lib/libx11_git.inc      |   11 -
 .../xorg-xserver/files/macro_tweak.patch           |   20 -
 .../xorg-xserver/xserver-kdrive/disable-apm.patch  |   24 -
 .../xserver-kdrive/disable-xf86-dga-xorgcfg.patch  |   43 --
 .../xorg-xserver/xserver-kdrive/extra-kmodes.patch |   87 ---
 .../xserver-kdrive/fbdev_xrandr_ioctl.patch        |   63 ---
 .../xserver-kdrive/no-serial-probing.patch         |   17 -
 .../xorg-xserver/xserver-xf86-common.inc           |   42 --
 .../xorg-xserver/xserver-xf86-dri-lite.inc         |   36 --
 .../cache-xkbcomp-output-for-fast-start-up.patch   |  360 ------------
 .../xserver-xf86-dri-lite/fix_macros1.patch        |   24 -
 .../fix_open_max_preprocessor_error.patch          |   15 -
 .../xserver-xf86-dri-lite/macro_tweak.patch        |   30 -
 .../xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb   |   20 -
 .../xorg-xserver/xserver-xf86-dri-lite_git.bb      |   25 -
 .../xorg-xserver/xserver-xf86-lite.inc             |   34 --
 .../xserver-xf86-lite/crosscompile.patch           |   22 -
 .../xorg-xserver/xserver-xf86-lite_1.10.1.bb       |   12 -
 .../xorg-xserver/xserver-xorg-1.11.1.inc           |    7 +
 .../crosscompile.patch                             |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    7 +-
 .../xorg-xserver/xserver-xorg-common.inc           |  121 +++++
 .../xorg-xserver/xserver-xorg-lite.inc             |    6 +
 .../xorg-xserver/xserver-xorg-lite_1.11.1.bb       |    4 +
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   13 +
 .../xorg-xserver/xserver-xorg_1.11.1.bb            |    4 +
 78 files changed, 381 insertions(+), 2126 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/glx-use-tls.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-7.11.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.8.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri/cross2.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri/crossfix.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri/i586/matypes.h
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.10.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_git.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.10.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
 rename meta/recipes-graphics/mesa/{mesa-dri => mesa}/uclibc.patch (100%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/keysymdef_include.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch
 rename meta/recipes-graphics/xorg-lib/{libx11 => libx11-diet-1.3}/X18NCMSstubs.diff (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-git => libx11-diet-1.3}/fix-disable-xlocale.diff (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-git => libx11-diet-1.3}/fix-utf8-wrong-define.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-git => libx11-diet-1.3}/include_fix.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-git => libx11-diet-1.3}/nodolt.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-trim => libx11-diet-1.3}/x11_disable_makekeys.patch (100%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-git/X18NCMSstubs.diff
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-git/x11_disable_makekeys.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-1.3.4 => libx11-trim-1.3.4}/include_fix.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-1.3.4 => libx11-trim-1.3.4}/makekeys_crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-1.3.4 => libx11-trim-1.3.4}/nodolt.patch (100%)
 rename meta/recipes-graphics/xorg-lib/{libx11-1.3.4 => libx11-trim-1.3.4}/x11_disable_makekeys.patch (100%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim/include_fix.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-disable-xlocale.diff
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/fix-utf8-wrong-define.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/include_fix.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/x11_disable_makekeys.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_git.inc
 delete mode 100644 meta/recipes-graphics/xorg-xserver/files/macro_tweak.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-apm.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-xf86-dga-xorgcfg.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/extra-kmodes.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/fbdev_xrandr_ioctl.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/no-serial-probing.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/cache-xkbcomp-output-for-fast-start-up.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_macros1.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/fix_open_max_preprocessor_error.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite/macro_tweak.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-dri-lite => xserver-xorg-1.11.1}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite => xserver-xorg-1.11.1}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xf86-lite => xserver-xorg-1.11.1}/macro_tweak.patch (74%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb

-- 
1.7.7



