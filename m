Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B9C1778687
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 13:12:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 05:12:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,507,1508828400"; 
   d="scan'208";a="8439271"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 Jan 2018 05:12:44 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jan 2018 15:12:34 +0200
Message-Id: <20180104131238.21452-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180104131238.21452-1-alexander.kanavin@linux.intel.com>
References: <20180104131238.21452-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/9] libinput: convert to meson build
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
X-List-Received-Date: Thu, 04 Jan 2018 13:12:43 -0000

Drop libunwind option, as it is only used if tests are enabled
(and they're unconditionally not enabled).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-graphics/wayland/libinput_1.8.4.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/wayland/libinput_1.8.4.bb b/meta/recipes-graphics/wayland/libinput_1.8.4.bb
index aea23480ec8..83899533823 100644
--- a/meta/recipes-graphics/wayland/libinput_1.8.4.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.8.4.bb
@@ -7,21 +7,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2184aef38ff137ed33ce9a63b9d1eb8f"
 
 DEPENDS = "libevdev udev mtdev"
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
+           "
 
 SRC_URI[md5sum] = "aeeb79bfe1b1cb64c939098468d350b3"
 SRC_URI[sha256sum] = "5ad95c8db75d59f1662199df748f912b150c3294d33cd4dd592aeb1908fe9d7f"
 
-inherit autotools pkgconfig lib_package
+inherit meson pkgconfig lib_package
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
-PACKAGECONFIG[libwacom] = "--enable-libwacom,--disable-libwacom,libwacom"
-PACKAGECONFIG[gui] = "--enable-debug-gui,--disable-debug-gui,cairo gtk+3"
+PACKAGECONFIG[libwacom] = "-Dlibwacom=true,-Dlibwacom=false,libwacom"
+PACKAGECONFIG[gui] = "-Ddebug-gui=true,-Ddebug-gui=false,cairo gtk+3"
 
 UDEVDIR = "`pkg-config --variable=udevdir udev`"
 
-EXTRA_OECONF += "--with-udev-dir=${UDEVDIR} --disable-documentation --disable-tests"
+EXTRA_OEMESON += "-Dudev-dir=${UDEVDIR} -Ddocumentation=false -Dtests=false"
 
 # package name changed in 1.8.1 upgrade: make sure package upgrades work
 RPROVIDES_${PN} = "libinput"
-- 
2.15.1


