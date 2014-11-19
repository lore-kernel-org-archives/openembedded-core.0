Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id A2C3C714D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 09:02:37 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ex7so4566300wid.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 01:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=DSPyZ74FzhJxD8H+QVMzyClIYkESUhXI5jdtyEJ8OFQ=;
	b=xT+jdZhEZhPJ760u56kfqUwgBuPCVhmC5z5DqvDtDEIIFPSkGHiTs+sWGnnb8TnAR1
	BIW9tNboWjKQIwuZgGv2bhIeTb9VtxajNi3yEwT6Jzx0qg1Begc/7DeoaAXbT6ZL68ZH
	ysp3e/aMFL0gl9SEAw/LtijLAbWl7G97a5Vco1f+QRXeJIYPgk10SMRcw14QzJAKhUOS
	RbSn+iHFps+BN8fsHNpdaXD11/aIpd2TyVmP1KcWOgNk8A6N02+6qwokTSt5LAY3qM6k
	Baeo6vn3tQmZR7WQVR+VdJF6JNGBOz06BICbmt1DU2HwWUl9ioVxWFwwuAC180tRUZCz
	pcCA==
X-Received: by 10.180.212.52 with SMTP id nh20mr3579815wic.2.1416387758234;
	Wed, 19 Nov 2014 01:02:38 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id kn5sm1338638wjb.48.2014.11.19.01.02.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 01:02:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Nov 2014 10:02:30 +0100
Message-Id: <1416387750-10669-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH V2] midori: update to 0.5.8
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
X-List-Received-Date: Wed, 19 Nov 2014 09:02:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

midori has moved to cmake for configuration

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
V1->V2:

* move SRC_URI to permanent download location
* add subdir to SRC_URI

 meta/recipes-sato/midori/midori_0.5.5.bb | 47 --------------------------------
 meta/recipes-sato/midori/midori_0.5.8.bb | 27 ++++++++++++++++++
 2 files changed, 27 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-sato/midori/midori_0.5.5.bb
 create mode 100644 meta/recipes-sato/midori/midori_0.5.8.bb

diff --git a/meta/recipes-sato/midori/midori_0.5.5.bb b/meta/recipes-sato/midori/midori_0.5.5.bb
deleted file mode 100644
index a9379e7..0000000
--- a/meta/recipes-sato/midori/midori_0.5.5.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "A lightweight web browser"
-HOMEPAGE = "http://www.twotoasts.de/index.php?/pages/midori_summary.html"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-native libnotify libunique libxscrnsaver"
-
-SRC_URI = "http://www.midori-browser.org/downloads/${BPN}_${PV}_all_.tar.bz2 \
-"
-
-SRC_URI[md5sum] = "b99e87d4b73a4732ed1c1e591f0242ac"
-SRC_URI[sha256sum] = "ca69382a285222a86028abebd73fed1976735883027ff0adc094b627789bbd62"
-
-# midori depends on webkit-gtk, and webkit-gtk can NOT be built on
-# MIPS64 with n32 ABI. So remove it from mips64 n32 temporarily.
-COMPATIBLE_HOST_mips64 = "mips64.*-linux$"
-
-inherit gtk-icon-cache pkgconfig vala pythonnative
-
-do_configure() {
-    sed -i -e 's:, shell=False::g' -e s:/usr/X11R6/include::g -e s:/usr/X11R6/lib::g wscript
-    ./configure \
-            --prefix=${prefix} \
-            --bindir=${bindir} \
-            --sbindir=${sbindir} \
-            --libexecdir=${libexecdir} \
-            --datadir=${datadir} \
-            --sysconfdir=${sysconfdir} \
-            --sharedstatedir=${sharedstatedir} \
-            --localstatedir=${localstatedir} \
-            --libdir=${libdir} \
-            --includedir=${includedir} \
-            --infodir=${infodir} \
-            --mandir=${mandir} \
-            --disable-gtk3 \
-            --disable-zeitgeist \
-}
-
-PARALLEL_MAKE = ""
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_install() {
-    oe_runmake DESTDIR=${D} install
-}
-
-RRECOMMENDS_${PN} += "glib-networking ca-certificates gnome-icon-theme"
-
-FILES_${PN}-dev += "${datadir}/vala/vapi"
diff --git a/meta/recipes-sato/midori/midori_0.5.8.bb b/meta/recipes-sato/midori/midori_0.5.8.bb
new file mode 100644
index 0000000..bafbe62
--- /dev/null
+++ b/meta/recipes-sato/midori/midori_0.5.8.bb
@@ -0,0 +1,27 @@
+SUMMARY = "A lightweight web browser"
+HOMEPAGE = "http://midori-browser.org/"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-native libnotify libunique libxscrnsaver"
+
+SRC_URI = "https://launchpad.net/midori/trunk/0.5.8/+download/${BPN}-${PV}.tar.bz2;subdir=${BPN}-${PV}"
+SRC_URI[md5sum] = "b89e25e74199d705e74767499a415976"
+SRC_URI[sha256sum] = "af19135fd4c4b04345df4d3592e7939c20f9b40eaca24550e6cb619751aa9381"
+
+# midori depends on webkit-gtk, and webkit-gtk can NOT be built on
+# MIPS64 with n32 ABI. So remove it from mips64 n32 temporarily.
+COMPATIBLE_HOST_mips64 = "mips64.*-linux$"
+
+inherit gtk-icon-cache pkgconfig vala pythonnative cmake
+
+EXTRA_OECMAKE = " \
+    -DCMAKE_INSTALL_PREFIX=${prefix} \
+    -DUSE_ZEITGEIST=0 \
+"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+RRECOMMENDS_${PN} += "glib-networking ca-certificates gnome-icon-theme"
+
+FILES_${PN} += "${datadir}/appdata"
+
-- 
1.8.3.1


