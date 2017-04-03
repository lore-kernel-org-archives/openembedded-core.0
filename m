Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 32A237199A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 12:04:36 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id w43so165990052wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=xQIsR4uf64TZuG1Hq8dgRewjRvuKSK5FFL8SLXQEcSA=;
	b=w0kxYN+rcJFnleI1aJKrus4c42iBVaPX4HNFfPAbjL1xLAIwS8tgLP2047e5ZtgTp4
	CdHl+m8CQFEOtF0FqxqbpztusekNq5w2cPbyPzR9H1TxjO16eu9Tuo4/DJPwEzXy5KsK
	GebIdVt+vpIEHTz0Ur0QmxjY5i+xk4uo1xGb5rQrZP8jmy5NfRnuO+IG7/QfkrJKKYLz
	fbh0d+XuDgqbgUhyd1fAizKy+Galir6D2pXYrgSxh7dfQCC33jB/7NHf7gjR6OErZ7C7
	V+NCXY67a6yGFLMxeSEEUY9f+IWe3MBjmu1cBsNKeNo/R8ZaUHUwXKt4G0P/AfiGGSdh
	ocuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xQIsR4uf64TZuG1Hq8dgRewjRvuKSK5FFL8SLXQEcSA=;
	b=jPNqbjQzSY6adtzUrYMAbDraE//5BAiiUF4HJpKNxt+cIkkQ1zxtbP9IV+nUX2h48D
	XKTzVqxm3XBbqdmW228sjUhrr7Y2iEzm9IKVtRtCBt1d02DG+SPhcx/TZD5M60YKH5kD
	172Bx8DTnpA01IfzWJK3NGqNBhiHxcxul3SOtiHKTuB8ejJGlVjq1rXh0QRUfJmf49UB
	WuJNhmFRmk7x74HbjpIF7mvCkhs9D8zIIcCrAE5RWmlub6Ah9LAsbT+I3dSrEJYMICCk
	Fb2RIMoIxp7FYV0cZadZw7yPe7r5vpgQ/m0obOin+BXYHm5t0R5yZLW3Hkd44fFO1HL3
	JbZA==
X-Gm-Message-State: AFeK/H1FVtsjiDGcq2h32ctivl2yKLtQsg1litc6KQujeD7Ny5WV8MP7oiX8nrC5JLLn/yWA
X-Received: by 10.28.174.203 with SMTP id x194mr9714151wme.85.1491221077522;
	Mon, 03 Apr 2017 05:04:37 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	18sm17959970wrt.52.2017.04.03.05.04.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Apr 2017 05:04:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 13:04:34 +0100
Message-Id: <1491221074-30437-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH V2] libjpeg-turbo: don't depend on NASM for non-x86 targets
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
X-List-Received-Date: Mon, 03 Apr 2017 12:04:37 -0000

NASM is a x86-specific assembler so it is only required when building for x86
targets.  Use x86-architecture and class-target overrides to depend on NASM, but
explicitly disable and don't depend on it for native as complications in the
native overrides meant NASM was enabled for x86-64 but disabled for x86 (this
will be investigated later).

Original patch by Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>, more
work to solve selftest failures by Richard Purdie
<richard.purdie@linuxfoundation.org>.  I just wrote a nice commit message.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
index 70d38f4..6f407cc 100644
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
@@ -26,6 +27,9 @@ RCONFLICTS_${PN} += "jpeg"
 
 inherit autotools pkgconfig
 
+# Add nasm-native dependency consistently for all build arches is hard
+EXTRA_OECONF_append_class-native = "--without-simd"
+
 # Work around missing x32 ABI support
 EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--without-simd", "", d)}"
 
-- 
2.8.1


