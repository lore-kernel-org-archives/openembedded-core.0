Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 42FB971B2E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 12:34:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 04:34:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,400,1515484800"; d="scan'208";a="20538501"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga007.fm.intel.com with ESMTP; 27 Feb 2018 04:34:16 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id F07E95802B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 04:34:15 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 14:37:05 +0200
Message-Id: <1519735027-10472-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/3] libinput: upgrade to version 1.10.0
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
X-List-Received-Date: Tue, 27 Feb 2018 12:34:16 -0000

1. Split package into libinput and libinput-tools.
2. Since libinput-tools contains python3 scripts, set RDEPENDS to python3
3. Fix a QA error related to python3 path:
        a) 0001-libinput-measure-touchpad-tap-fix-python-script-QA-e.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...asure-touchpad-tap-fix-python-script-QA-e.patch | 32 ++++++++++++++++++++++
 .../{libinput_1.9.4.bb => libinput_1.10.0.bb}      |  9 ++++--
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/libinput/0001-libinput-measure-touchpad-tap-fix-python-script-QA-e.patch
 rename meta/recipes-graphics/wayland/{libinput_1.9.4.bb => libinput_1.10.0.bb} (72%)

diff --git a/meta/recipes-graphics/wayland/libinput/0001-libinput-measure-touchpad-tap-fix-python-script-QA-e.patch b/meta/recipes-graphics/wayland/libinput/0001-libinput-measure-touchpad-tap-fix-python-script-QA-e.patch
new file mode 100644
index 0000000..eb771ab
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/0001-libinput-measure-touchpad-tap-fix-python-script-QA-e.patch
@@ -0,0 +1,32 @@
+From f595219dd3564a5fbf61646f2054f04f2e22238a Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Mon, 19 Feb 2018 11:21:37 +0200
+Subject: [PATCH] libinput-measure-touchpad-tap: fix python script QA error
+
+Tweak this python scripts to use '/usr/bin/env python3', Otherwise,
+it generate a QA error:
+
+QA Issue: /usr/libexec/libinput/libinput-measure-touchpad-tap contained
+in package libinput requires /usr/bin/python3, but no providers found
+in RDEPENDS_libinput? [file-rdeps]
+
+Upstream-Status: Accepted [https://cgit.freedesktop.org/wayland/libinput/commit/?id=920debffd7ee591bbc1014ee0961c75473429651]
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ tools/libinput-measure-touchpad-tap | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/libinput-measure-touchpad-tap b/tools/libinput-measure-touchpad-tap
+index 3037232..6f4f399 100755
+--- a/tools/libinput-measure-touchpad-tap
++++ b/tools/libinput-measure-touchpad-tap
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ # vim: set expandtab shiftwidth=4:
+ # -*- Mode: python; coding: utf-8; indent-tabs-mode: nil -*- */
+ #
+-- 
+2.4.0
+
diff --git a/meta/recipes-graphics/wayland/libinput_1.9.4.bb b/meta/recipes-graphics/wayland/libinput_1.10.0.bb
similarity index 72%
rename from meta/recipes-graphics/wayland/libinput_1.9.4.bb
rename to meta/recipes-graphics/wayland/libinput_1.10.0.bb
index 67a49df..5b75ffe 100644
--- a/meta/recipes-graphics/wayland/libinput_1.9.4.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.10.0.bb
@@ -8,9 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2184aef38ff137ed33ce9a63b9d1eb8f"
 DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
+           file://0001-libinput-measure-touchpad-tap-fix-python-script-QA-e.patch \
            "
-SRC_URI[md5sum] = "8b43d07d1698fb207a0492fc67554d4f"
-SRC_URI[sha256sum] = "0bcdbd4c4e3c2a2db322fbdf2ef3284f2e6d6fb7be3af80e6d8de7783f675190"
+SRC_URI[md5sum] = "dac92f0b094392c03ab1320d06173afd"
+SRC_URI[sha256sum] = "c2c72c2e0c63498b34d887c28ea84b8570b50fef7ffe489179a1253280d33f57"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 inherit meson pkgconfig lib_package
@@ -23,6 +24,10 @@ UDEVDIR = "`pkg-config --variable=udevdir udev`"
 
 EXTRA_OEMESON += "-Dudev-dir=${UDEVDIR} -Ddocumentation=false -Dtests=false"
 
+PACKAGES =+ "${PN}-tools"
+FILES_${PN}-tools = "${libexecdir}/libinput/libinput-*"
+RDEPENDS_${PN}-tools = "python3"
+
 # package name changed in 1.8.1 upgrade: make sure package upgrades work
 RPROVIDES_${PN} = "libinput"
 RREPLACES_${PN} = "libinput"
-- 
2.4.0


