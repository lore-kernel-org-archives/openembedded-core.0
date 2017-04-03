Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id AA66371979
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 12:03:18 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id w43so165939772wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 05:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=SJLrqmL2EqGUhUqa4vl2IA4nDyHUh6HsaQOT9pblrr0=;
	b=rxXXg0YHj77Cg7G/7szIxMQ//FvXb9wfnNzebxcEtuEQtHcvNz73kyRLXqTO2bEjn0
	fJQt4Vh7IbRFzNLzIX1YeVGXu1wTBGGBz0ne04JKoPfiA4OP/v9djCRwSG7KF/pbrvhD
	2SteZdrIMa0vR2FeW8wudaVY6tAKxJZNra6BmjjGth9e/7ujB6nNQ/TYAGi9PGh8KEgq
	Afg1VGuNkO1+UsPJSYtrRcAsOojXpfbsaRvqrIpfCzaOoOxoHxOGe5Ms70xg6XpycYRf
	K1d7d8a5D7X3MgC/M5mdyo/SxTJULRF/f9V98xdQFdSMwupEVCljIHmzpmDeSZ1OBf6h
	mG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SJLrqmL2EqGUhUqa4vl2IA4nDyHUh6HsaQOT9pblrr0=;
	b=YCSm7yK+/5vkXO8vwHm6tD6Rn+xUnBUf8FRfWaW2YZPhnSK3P9zHwEqLpzelaDgdK/
	Ke6IPirZgjevpGClg34ZPAY7fx//9ZFVCBr13JdCMLxr5u/LnwGqyNmEUUYLM98BvUMi
	4lt3BNCHAI0rGm00i+7urp/YCG1LWkxSnGtT3GGl9RovYiT43ACDAJZQUmNLqtg9dZmz
	zPr+fj3vckq8p/YZGpizbH2+xEgnMESn2n7TgFHdDK0+NtDOlHv/r8rEfZgtH1v6ZlkC
	FutWCcWgwIryNQhqSWZGLYOVVWpxD0ADyCV0Z2xj9AnjMMRZ+GMH78buy9QehGRj+3kr
	PAHg==
X-Gm-Message-State: AFeK/H21nKiGqGcDKe00//tcBX/jHzMMHOG4VQzvvkP4qZo4DT+kCaGD1j4k7Wp1NVruFbLB
X-Received: by 10.28.125.14 with SMTP id y14mr9600080wmc.101.1491220999072;
	Mon, 03 Apr 2017 05:03:19 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	v29sm17858585wrv.66.2017.04.03.05.03.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Apr 2017 05:03:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 13:03:11 +0100
Message-Id: <1491220991-30131-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] libjpeg-turbo: don't depend on NASM for non-x86 targets
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
X-List-Received-Date: Mon, 03 Apr 2017 12:03:19 -0000

NASM is a x86-specific assembler so it is only required when building for x86
targets.  Use x86-architecture and class-target overrides to depend on NASM, but
explicitly disable and don't depend on it for native/nativesdk as complications
in the native overrides meant NASM was enabled for x86-64 but disabled for x86
(this will be investigated later).

Original patch by Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>, more
work to solve selftest failures by Richard Purdie
<richard.purdie@linuxfoundation.org>.  I just wrote a nice commit message.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
index 70d38f4..77adf0a 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=13;md5=05bab7c7ad899d85bfba60da1a127
                     file://jpeglib.h;endline=16;md5=f67d70e547a2662c079781c72f877f72 \
                     file://djpeg.c;endline=11;md5=b90b6d2b4119f9e5807cd273f525d2af \
 "
-DEPENDS = "nasm-native"
+DEPENDS_append_x86-64_class-target = " nasm-native"
+DEPENDS_append_x86_class-target    = " nasm-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://fix-mips.patch"
@@ -26,6 +27,10 @@ RCONFLICTS_${PN} += "jpeg"
 
 inherit autotools pkgconfig
 
+# Add nasm-native dependency consistently for all build arches is hard
+EXTRA_OECONF_append_class-native = "--without-simd"
+EXTRA_OECONF_append_class-nativesdk = "--without-simd"
+
 # Work around missing x32 ABI support
 EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--without-simd", "", d)}"
 
-- 
2.8.1


