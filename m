Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id B3F89782B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 13:25:59 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id y43so58540957wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 06:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=laDmsJ3tnk0Sg/H+iZEEqNM0kscoOOMcf0Vz74eLdzk=;
	b=I1gPjA44/bXF+80oSQ4HMH+5oJuMolQ+xaI6MntdAmyD7/mBjddbUH4WOgYel8Vaij
	htSbUJOK/oA7tPT+A2S+JzQbiflcQpAxyxCGaO9TTd10S2ung/HGCrRagT2DGMWMHFDV
	Y14rdrjz2xGqhEYTZi1pqpSi5U6s7/fo8SwEAfg1mXUb5N4lBIcB9qiDIOllU5XJPl4n
	pk/4AgoRfCNg6WBZFqBXNnjyGLzAzcFRza7WGo0MnH3rF1X5myIV8tYRGiIwld25dNNP
	5ilSsmwKEvnUFGh7l4cPiD8aBygAdYcww/wpDJ35GmhZ2LRgdDXZIUuoLfgi+L+s4lMU
	wWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=laDmsJ3tnk0Sg/H+iZEEqNM0kscoOOMcf0Vz74eLdzk=;
	b=HKSdNCZY6NU4oygVi6hVZ5ROkN1CUXjvoQSH1InD3L+Vtbrcr2Och81JeI3Tl84iKn
	xQi52wOorjqBZTxeX9jGTM1xBoTesM65OfG3eN6g8YJ9t6f4OuhhjrKwEbaZb4QAflbp
	g1Fnutn1vsBJun+/12tU2GFAkAtnXL2h6XKt3hVKIXNxKhs2ui3Iyk4NZ1ryzTzAdcxx
	7HWIpFn8EaeiNoxVaWcTCvTKl5HT9zDH1kn/x6fUzcCXzMpLJyWXhwdG6ySuJkW9vPmn
	krI9GQBhzhi2/NGToiBRKtYLguaF5T2YlYH86YqwNAvR0zcr01ajJwqD+TUh5iMJ0xYR
	ZoKw==
X-Gm-Message-State: AIVw111dLJl3FttLGRYRr4gN0+6l+qwng8PmYhymnL37AMhpVCKMYlq2
	C8nJJFSUJ5EUWzABkb0=
X-Received: by 10.223.160.174 with SMTP id m43mr4088735wrm.194.1500470760411; 
	Wed, 19 Jul 2017 06:26:00 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	p23sm4740453wrc.35.2017.07.19.06.25.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jul 2017 06:25:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 14:25:52 +0100
Message-Id: <20170719132553.5979-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] libgcrypt: merge bb and inc file
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
X-List-Received-Date: Wed, 19 Jul 2017 13:26:01 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc      | 50 -----------------------
 meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb | 50 ++++++++++++++++++++++-
 2 files changed, 49 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt.inc

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
deleted file mode 100644
index 3c7e89aa92b..00000000000
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ /dev/null
@@ -1,50 +0,0 @@
-SUMMARY = "General purpose cryptographic library based on the code from GnuPG"
-HOMEPAGE = "http://directory.fsf.org/project/libgcrypt/"
-BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
-SECTION = "libs"
-
-# helper program gcryptrnd and getrandom are under GPL, rest LGPL
-LICENSE = "GPLv2+ & LGPLv2.1+ & GPLv3+"
-LICENSE_${PN} = "LGPLv2.1+"
-LICENSE_${PN}-dev = "GPLv2+ & LGPLv2.1+"
-LICENSE_dumpsexp-dev = "GPLv3+"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
-
-DEPENDS = "libgpg-error"
-
-UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
-SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
-           file://add-pkgconfig-support.patch \
-           file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
-           file://fix-ICE-failure-on-mips-with-option-O-and-g.patch \
-           file://fix-undefined-reference-to-pthread.patch \
-"
-
-BINCONFIG = "${bindir}/libgcrypt-config"
-
-inherit autotools texinfo binconfig-disabled pkgconfig
-
-EXTRA_OECONF = "--disable-asm"
-
-PACKAGECONFIG ??= "capabilities"
-PACKAGECONFIG[capabilities] = "--with-capabilities,--without-capabilities,libcap"
-
-do_configure_prepend () {
-	# Else this could be used in preference to the one in aclocal-copy
-	rm -f ${S}/m4/gpg-error.m4
-}
-
-# libgcrypt.pc is added locally and thus installed here
-do_install_append() {
-	install -d ${D}/${libdir}/pkgconfig
-	install -m 0644 ${B}/src/libgcrypt.pc ${D}/${libdir}/pkgconfig/
-}
-
-PACKAGES =+ "dumpsexp-dev"
-
-FILES_${PN}-dev += "${bindir}/hmac256"
-FILES_dumpsexp-dev += "${bindir}/dumpsexp"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb
index 2bc21d2e69b..7f7d852fb3b 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.7.7.bb
@@ -1,4 +1,52 @@
-require libgcrypt.inc
+SUMMARY = "General purpose cryptographic library based on the code from GnuPG"
+HOMEPAGE = "http://directory.fsf.org/project/libgcrypt/"
+BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
+SECTION = "libs"
 
+# helper program gcryptrnd and getrandom are under GPL, rest LGPL
+LICENSE = "GPLv2+ & LGPLv2.1+ & GPLv3+"
+LICENSE_${PN} = "LGPLv2.1+"
+LICENSE_${PN}-dev = "GPLv2+ & LGPLv2.1+"
+LICENSE_dumpsexp-dev = "GPLv3+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
+
+DEPENDS = "libgpg-error"
+
+UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
+SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
+           file://add-pkgconfig-support.patch \
+           file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
+           file://fix-ICE-failure-on-mips-with-option-O-and-g.patch \
+           file://fix-undefined-reference-to-pthread.patch \
+"
 SRC_URI[md5sum] = "36ace8f8dc4b1a82793ae759bbfc806f"
 SRC_URI[sha256sum] = "0e72e91290d553c303095a50ea660279d8f11b76c6c86e826f470442fcdf1edd"
+
+BINCONFIG = "${bindir}/libgcrypt-config"
+
+inherit autotools texinfo binconfig-disabled pkgconfig
+
+EXTRA_OECONF = "--disable-asm"
+
+PACKAGECONFIG ??= "capabilities"
+PACKAGECONFIG[capabilities] = "--with-capabilities,--without-capabilities,libcap"
+
+do_configure_prepend () {
+	# Else this could be used in preference to the one in aclocal-copy
+	rm -f ${S}/m4/gpg-error.m4
+}
+
+# libgcrypt.pc is added locally and thus installed here
+do_install_append() {
+	install -d ${D}/${libdir}/pkgconfig
+	install -m 0644 ${B}/src/libgcrypt.pc ${D}/${libdir}/pkgconfig/
+}
+
+PACKAGES =+ "dumpsexp-dev"
+
+FILES_${PN}-dev += "${bindir}/hmac256"
+FILES_dumpsexp-dev += "${bindir}/dumpsexp"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


