Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id B66677232E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 08:12:02 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id ex7so533264wid.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Dec 2014 00:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=UtCcgIBIrcJ/Dt4lxJ+WnLctw+jiRXOP/+/IJg3uMZk=;
	b=DdKjZfNgG/0zl85MYWHH8WnAdQEGM2foc5Q+DEeu5uAMcnUNBxeVbKfsssUhlqtUZ/
	5pumT8jPsjqNkUuLyPziHJ+ns1RpLeSID9n4NMWgoC4eXU/hf2rza7h/eISkZH3XivLx
	7xU1CkIhjraNu4RcAOTkIQNWeHVw6SK9QX+lPhzTgpsj0dmLCurMw92pnbNdsK2hxMGG
	QInP3qB43vWIG57MpOZ4qlkuvC0uRtgyirUVg7sieJuisiIkjbyHxuXPueIHAo32W2DD
	EtKmMqq4vZOOixc5s9f9gKg+On43x/I+kfOGpK5AWGUq8SqSl28BEwPzXUcFScEyHsFT
	3dLw==
X-Received: by 10.180.80.194 with SMTP id t2mr2293222wix.6.1417767122386;
	Fri, 05 Dec 2014 00:12:02 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id iz19sm1239728wic.8.2014.12.05.00.12.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Dec 2014 00:12:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Dec 2014 09:11:55 +0100
Message-Id: <1417767115-29623-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH][V3] midori: update to 0.5.8
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
X-List-Received-Date: Fri, 05 Dec 2014 08:12:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

midori has moved to cmake for configuration

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-sato/midori/midori_0.5.5.bb | 47 --------------------------------
 meta/recipes-sato/midori/midori_0.5.8.bb | 26 ++++++++++++++++++
 2 files changed, 26 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-sato/midori/midori_0.5.5.bb
 create mode 100644 meta/recipes-sato/midori/midori_0.5.8.bb
V2->V3:
  * remove libunique from DEPENDS
  * checked: DEPENDS gtk+ is in webkit-gtk
  * checked: midori ignores gtk3+ if not set explitly by -DUSE_GTK3 or -DUSE_GRANITE or -DHALF_BRO_INCOM_WEBKIT2 in EXTRA_OECMAKE

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
index 0000000..299ecb3
--- /dev/null
+++ b/meta/recipes-sato/midori/midori_0.5.8.bb
@@ -0,0 +1,26 @@
+SUMMARY = "A lightweight web browser"
+HOMEPAGE = "http://midori-browser.org/"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-native libnotify libxscrnsaver"
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
-- 
1.8.3.1


