Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 62B526BD72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 01:56:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7U1ud82022851
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:56:39 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 29 Aug 2013 18:56:38 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Aug 2013 09:56:35 +0800
Message-ID: <cover.1377827133.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] remove the unnecessary protocol parameters
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
X-List-Received-Date: Fri, 30 Aug 2013 01:56:39 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

What I did to remove these:
I checked that we only use git and svn:
$ find meta \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed -n 's/.*"\(\w*:\/\/\).*\(;protocol=\w*\)/\1 \2/p' {} \; | sort | uniq
git:// ;protocol=git \
git:// ;protocol=git"
git:// ;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
git:// ;protocol=git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
git:// ;protocol=git" % (gstpkg_basename, branch))
git:// ;protocol=git;nocheckout=1;branch=${KBRANCH},${KMETA};name=machine,meta"
git:// ;protocol=http \
svn:// ;protocol=http \
svn:// ;protocol=http;module=trunk \
svn:// ;protocol=svn"

So I think it's safe to simply remove ";protocol=git" and ";protocol=svn":

$ find meta \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed -i 's/;protocol=git//; s/;protocol=svn//' {} \;

What left with protocol parameter after removal is:
$ find meta \( -name *.bb -o -name *.inc -o -name *.bbclass \) -exec sed -n 's/.*"\(\w*:\/\/\).*\(;protocol=\w*\)/\1 \2/p' {} \; | sort | uniq
git:// ;protocol=http \
svn:// ;protocol=http \
svn:// ;protocol=http;module=trunk 

Please refer to "[OE-core] [PATCH] u-boot: update to 2013.07" for detail discussions.

tested info:
MACHINE ??= "qemux86-64"

$ bitbake world

--
The following changes since commit 7d93288117e7054472d8a01dde0b38bc0ff98c27:

  buildtools-tarball: Add python-pkgutil (2013-08-29 00:22:49 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_remove_protocol_0830_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_remove_protocol_0830_0

Jackie Huang (1):
  remove the unnecessary protocol parameters

 meta/classes/clutter.bbclass                       |    2 +-
 .../eee-acpi-scripts/eee-acpi-scripts_git.bb       |    2 +-
 .../u-boot/u-boot-fw-utils_2013.01.01.bb           |    2 +-
 .../u-boot/u-boot-mkimage_2013.01.01.bb            |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb          |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb          |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb       |    2 +-
 meta/recipes-bsp/u-boot/u-boot_2013.07.bb          |    2 +-
 meta/recipes-bsp/x-load/x-load_git.bb              |    6 +++---
 meta/recipes-bsp/zaurusd/zaurusd_git.bb            |    2 +-
 .../connman/connman-gnome_0.7.bb                   |    2 +-
 .../mobile-broadband-provider-info_git.bb          |    2 +-
 meta/recipes-connectivity/neard/neard_0.10.bb      |    2 +-
 meta/recipes-connectivity/ofono/ofono_git.bb       |    2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb       |    2 +-
 .../images/build-appliance-image_8.0.bb            |    2 +-
 meta/recipes-core/psplash/psplash_git.bb           |    2 +-
 meta/recipes-core/uclibc/uclibc-git.inc            |    2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |    2 +-
 .../btrfs-tools/btrfs-tools_git.bb                 |    2 +-
 meta/recipes-devtools/gnu-config/gnu-config_git.bb |    2 +-
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb       |    2 +-
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |    2 +-
 meta/recipes-devtools/prelink/prelink_git.bb       |    2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    2 +-
 meta/recipes-devtools/qemu/qemu_git.bb             |    2 +-
 .../recipes-devtools/swabber/swabber-native_git.bb |    2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
 .../recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb |    2 +-
 .../gtk-theme-torturer/gtk-theme-torturer_git.bb   |    2 +-
 meta/recipes-graphics/drm/libdrm_git.bb            |    2 +-
 meta/recipes-graphics/fstests/fstests_git.bb       |    2 +-
 meta/recipes-graphics/libfakekey/libfakekey_git.bb |    2 +-
 .../matchbox-wm/matchbox-wm_git.bb                 |    2 +-
 meta/recipes-graphics/mesa/mesa_git.bb             |    2 +-
 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb           |    2 +-
 meta/recipes-graphics/xcb/libxcb_git.bb            |    2 +-
 meta/recipes-graphics/xcb/xcb-proto_git.bb         |    2 +-
 .../xinput-calibrator/xinput-calibrator_git.bb     |    2 +-
 .../xorg-driver/xf86-input-keyboard_git.bb         |    2 +-
 .../xorg-driver/xf86-input-mouse_git.bb            |    2 +-
 .../xorg-driver/xf86-input-synaptics_git.bb        |    2 +-
 .../xorg-driver/xf86-video-intel_git.bb            |    2 +-
 .../xorg-driver/xf86-video-omap_git.bb             |    2 +-
 .../recipes-graphics/xorg-lib/libxcalibrate_git.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libxext_git.bb      |    2 +-
 meta/recipes-graphics/xorg-lib/libxi_git.bb        |    2 +-
 .../xorg-proto/calibrateproto_git.bb               |    2 +-
 meta/recipes-graphics/xorg-proto/dri2proto_git.bb  |    2 +-
 meta/recipes-graphics/xorg-proto/inputproto_git.bb |    2 +-
 .../xvideo-tests/xvideo-tests_git.bb               |    2 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb       |    2 +-
 meta/recipes-kernel/dtc/dtc.inc                    |    2 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 .../linux-firmware/linux-firmware_git.bb           |    2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       |    2 +-
 meta/recipes-kernel/lttng/babeltrace_1.1.1.bb      |    2 +-
 meta/recipes-kernel/lttng/lttng-modules_git.bb     |    2 +-
 meta/recipes-kernel/lttng/lttng-tools_2.2.0.bb     |    2 +-
 meta/recipes-kernel/lttng/lttng-ust_2.2.0.bb       |    2 +-
 meta/recipes-kernel/oprofile/oprofile_git.bb       |    2 +-
 .../oprofile/oprofileui-server_git.bb              |    2 +-
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    2 +-
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    2 +-
 meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb   |    2 +-
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |    2 +-
 .../gstreamer/gstreamer1.0-libav_git.bb            |    2 +-
 .../gstreamer/gstreamer1.0-omx_git.bb              |    2 +-
 .../gstreamer/gstreamer1.0-plugins.inc             |    2 +-
 .../gstreamer/gstreamer1.0_git.bb                  |    2 +-
 meta/recipes-sato/gaku/gaku_git.bb                 |    2 +-
 .../gtk-engines/gtk-sato-engine_git.bb             |    2 +-
 meta/recipes-sato/libowl/libowl_git.bb             |    2 +-
 .../matchbox-config-gtk/matchbox-config-gtk_git.bb |    2 +-
 .../matchbox-desktop-sato_git.bb                   |    2 +-
 .../matchbox-desktop/matchbox-desktop_git.bb       |    2 +-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |    2 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    2 +-
 .../matchbox-terminal/matchbox-terminal_git.bb     |    2 +-
 .../matchbox-theme-sato/matchbox-theme-sato_git.bb |    2 +-
 .../recipes-sato/owl-video-widget/libowl-av_git.bb |    2 +-
 .../recipes-sato/owl-video-widget/owl-video_git.bb |    2 +-
 meta/recipes-sato/puzzles/oh-puzzles_git.bb        |    2 +-
 meta/recipes-sato/puzzles/puzzles_r9765.bb         |    2 +-
 .../sato-screenshot/sato-screenshot_git.bb         |    2 +-
 .../settings-daemon/settings-daemon_git.bb         |    2 +-
 meta/recipes-sato/web/web-webkit_git.bb            |    2 +-
 98 files changed, 100 insertions(+), 100 deletions(-)

-- 
1.7.4.1


