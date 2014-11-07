Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id BB13065D3C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 07:52:19 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hi2so3727606wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Nov 2014 23:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=He53LqNpUoPVR7fY1CmrSwgepNHZ8UamsTgoW0UP/Pg=;
	b=vyqnmiVoNlz6rAgdT/nbgBAHsmlTYIlyQtGnQi9IjrK6m731HzZN0YjGN5nyCj6J8D
	FOg41lTah+raNux5OB6/aG4nMyY52FjLHeIyya8fIJz/EurHj4j+ojyxcOHwE4CAYOdK
	GAWRTkpe7SsrxCswRDn/mDsOkgd/6OvGh0uDbhInDFCq0JNIOyx5osZKRfDgyrVkBo9V
	O+rSTfMDFHwkbtSDRWYvLArrrX4aX+s2MWu+eSC2vy9IgLykRmk6dNDooVutzsNMHXgY
	gRDZUIVhwygSOJof/QW0DQ0yrBMOuthSnOpZqMjQgD3N7BSHCG0eOsNwjfGw2Dc4d+6j
	JTzQ==
X-Received: by 10.180.20.8 with SMTP id j8mr2518238wie.60.1415346739646;
	Thu, 06 Nov 2014 23:52:19 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id md11sm982653wic.15.2014.11.06.23.52.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Nov 2014 23:52:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Nov 2014 08:52:08 +0100
Message-Id: <1415346729-16760-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1415346729-16760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1415346729-16760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] midori: update to 0.5.8
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
X-List-Received-Date: Fri, 07 Nov 2014 07:52:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

midori has moved to cmake for configuration

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-sato/midori/midori_0.5.5.bb | 47 --------------------------------
 meta/recipes-sato/midori/midori_0.5.8.bb | 31 +++++++++++++++++++++
 2 files changed, 31 insertions(+), 47 deletions(-)
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
index 0000000..9c45975
--- /dev/null
+++ b/meta/recipes-sato/midori/midori_0.5.8.bb
@@ -0,0 +1,31 @@
+SUMMARY = "A lightweight web browser"
+HOMEPAGE = "http://midori-browser.org/"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-native libnotify libunique libxscrnsaver"
+
+SRC_URI = "http://www.midori-browser.org/downloads/${BPN}_${PV}_all_.tar.bz2 \
+"
+
+SRC_URI[md5sum] = "b89e25e74199d705e74767499a415976"
+SRC_URI[sha256sum] = "af19135fd4c4b04345df4d3592e7939c20f9b40eaca24550e6cb619751aa9381"
+
+S = "${WORKDIR}"
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


