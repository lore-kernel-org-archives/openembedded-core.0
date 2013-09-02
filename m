Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 347886BEDB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 16:13:36 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id n12so3842101wgh.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2013 09:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=C5sKEYpgXdHl4ec0EwEnNldA6sNkW5NEoy+SL3j2OUs=;
	b=DoqTlXC821CzruHykGUsfHKA5xlc9S2wT0RQ0NC1HE5MPyOHNQOTDjNHUnYkkNwSsj
	uWmItUTOm/sJsUjIZ2VVT0ryZyKo0tDG+h6+/82FolGBEhwAU0r+W/XLWcB1WgepwIpb
	4kVGwy35kKRNg3WmA3ctWChf5ivgntvrV92UfKaTVxjANlCRaPNR94DNA4WoH+hX7ewF
	oLz1hJ9U3ezlsD3P68rx7K7kb9jtvCwH5Rb6A/CQEPoY87I4IcCIcOraabGmjBb6kWmN
	nY/IC/F+ntJuA4fYfMO0pJXEeNqXnVkedWm48Enrx0BhbfV2kDwWLabDCywGFczqv786
	GdrA==
X-Gm-Message-State: ALoCoQn8QscVqiILEF6Cl7V9k7HGjrGBB3ljzmBQBrIAwQKO/gzHXq/Lnr8k+sK+Qr+SbzCPHFMo
X-Received: by 10.180.211.19 with SMTP id my19mr14541557wic.19.1378138415898; 
	Mon, 02 Sep 2013 09:13:35 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id pn7sm18828102wic.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Sep 2013 09:13:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Sep 2013 17:13:32 +0100
Message-Id: <1378138412-10373-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] eglinfo: add recipes for x11 and fb backends
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
X-List-Received-Date: Mon, 02 Sep 2013 16:13:37 -0000

eglinfo is a small utility for printing out information about EGL as well
as about its client APIs, OpenGL / OpenGLES 1.x / OpenGLES 2.x / OpenVG.

Recipe originally by Carlos Rafael Giani <dv@pseudoterminal.org>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb  |   11 ++++++++
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb |    8 ++++++
 meta/recipes-graphics/eglinfo/eglinfo.inc        |   32 ++++++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
 create mode 100644 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
 create mode 100644 meta/recipes-graphics/eglinfo/eglinfo.inc

diff --git a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
new file mode 100644
index 0000000..65b265f
--- /dev/null
+++ b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
@@ -0,0 +1,11 @@
+EGLINFO_PLATFORM ?= "fb"
+EGLINFO_BINARY_NAME ?= "eglinfo-fb"
+
+# .bbappend files in BSP meta layers can add EGLINFO_DEVICE
+# values if necessary. eglinfo.inc contains default values for
+# the currently supported devices.
+# Consult the eglinfo README.md for details
+
+include eglinfo.inc
+
+SUMMARY += "(Framebuffer version)"
diff --git a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
new file mode 100644
index 0000000..18fc893
--- /dev/null
+++ b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
@@ -0,0 +1,8 @@
+EGLINFO_PLATFORM ?= "x11"
+EGLINFO_BINARY_NAME ?= "eglinfo-x11"
+
+include eglinfo.inc
+
+DEPENDS += "virtual/libx11"
+
+SUMMARY += "(X11 version)"
diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc b/meta/recipes-graphics/eglinfo/eglinfo.inc
new file mode 100644
index 0000000..d53d0ff
--- /dev/null
+++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
@@ -0,0 +1,32 @@
+SUMMARY = "Utility for printing information EGL and its client APIs (OpenGL, OpenGL ES, OpenVG)"
+SECTION = "graphics"
+LICENSE = "Zlib"
+HOMEPAGE = "https://github.com/dv1/eglinfo"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8d4f33bc3add976f7dfae85dab66f03c"
+
+DEPENDS = "virtual/egl"
+
+SRC_URI = "git://github.com/dv1/eglinfo.git;branch=master"
+SRCREV = "4a49ff59545d9b6a8222badab64115f89d3a6774"
+
+S = "${WORKDIR}/git"
+
+inherit waf
+
+# BSP layers should add .bbappend files for the -x11 and -fb .bb recipes,
+# which append the respective EGL/OpenGLES/OpenVG libraries to DEPENDS
+# not doing that here, since some platforms might not have OpenGL ES or OpenVG support
+# (in that case, the eglinfo build scripts automatically disable the relevant code paths)
+
+EGLINFO_DEVICE ?= "generic"
+EGLINFO_DEVICE_raspberrypi ?= "raspberrypi"
+EGLINFO_DEVICE_beagleboard ?= "beagleboard"
+EGLINFO_DEVICE_mx6 ?= "imx6"
+
+EXTRA_OECONF = "--platform=${EGLINFO_PLATFORM} \
+                --device=${EGLINFO_DEVICE} \
+                --sysroot ${STAGING_DIR_TARGET}"
+
+do_install_append() {
+	mv ${D}/${bindir}/eglinfo ${D}/${bindir}/${EGLINFO_BINARY_NAME}
+}
-- 
1.7.10.4


