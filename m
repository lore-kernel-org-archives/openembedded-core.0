Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id A07B973D47
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:21:06 +0000 (UTC)
Received: by paboj16 with SMTP id oj16so37880244pab.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0IMC1F6xsdAaJRd8U+Tl2fECGrifB20v0xW5c+Y/cqo=;
	b=gSiO27mUD8slxYFOQVEgTJLeHWzh/xsQivmMssjQwLzf43N40hw7uGLddtNlWgoWOp
	owtcj4y6ZjuBmVNukW2Osz32QijAsl873HIpBavy76gk3aEa/OrLagFjhhZtPLRfcD0R
	0MiyxQPawk+59gZn/INvRzfmxoYvmxffIU3SpGVzYG63FGVPdUs4QAurgeiXqx/k1xaj
	lL3uxGQSDpT7bLCV9lIf/45jwsp6t1ooVLFnhvPPL/8M2TxR2RqMAnfQ+Xs5mo0ZlyDJ
	U/QdEYjwJIXgNOh4fPMLBKdW89OsAQ5gl+nteiPyjH6/7eFHki6G6nzisnRRbiuu5PVk
	MaXg==
X-Received: by 10.70.18.68 with SMTP id u4mr7312175pdd.38.1428715268242;
	Fri, 10 Apr 2015 18:21:08 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nb10sm259984pdb.76.2015.04.10.18.21.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:21:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:45 -0700
Message-Id: <7e7a1d75a00f13cab25edc1dc794baad4f940ef8.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428714999.git.raj.khem@gmail.com>
References: <cover.1428714999.git.raj.khem@gmail.com>
Subject: [PATCH 14/17] xserver-xf86-config: Preload graphics driver modules for musl
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
X-List-Received-Date: Sat, 11 Apr 2015 01:21:06 -0000

musl does not support BIND_LAZY intentionally, which means
dlopen will always complain about missing symbols which is what
X does when loading graphics drivers, here we preload the needed
drivers for all emulator machines if libc is musl

Change-Id: I908c94c30db8a5e872922e1a677126d82fa17145
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-xserver/xserver-xf86-config/10-preload-modules.conf     | 9 +++++++++
 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb    | 9 +++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
new file mode 100644
index 0000000..7ceb6fd
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
@@ -0,0 +1,9 @@
+Section "Module"
+    Load "fbdevhw"
+    Load "fb"
+    Load "shadow"
+    Load "shadowfb"
+    Load "vbe"
+    Load "vgahw"
+EndSection
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 5420b7d..e07c204 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -7,9 +7,14 @@ PR = "r33"
 
 SRC_URI = "file://xorg.conf"
 
+SRC_URI_append_libc-musl = "\
+          file://10-preload-modules.conf \
+"
+
 S = "${WORKDIR}"
 
 CONFFILES_${PN} = "${sysconfdir}/X11/xorg.conf"
+CONFFILES_${PN}_append_libc-musl = " ${sysconfdir}/X11/xorg.conf.d/10-preload-modules.conf"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 ALLOW_EMPTY_${PN} = "1"
@@ -20,3 +25,7 @@ do_install () {
 		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
 	fi
 }
+
+do_install_append_libc-musl () {
+	install -Dm 0644 ${WORKDIR}/10-preload-modules.conf ${D}/${sysconfdir}/X11/xorg.conf.d/10-preload-modules.conf
+}
-- 
2.1.4


