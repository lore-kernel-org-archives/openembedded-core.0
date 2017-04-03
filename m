Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0A898600EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 17:29:08 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id l43so180937001wre.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 10:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VcaiSCf+qrYtZV33GpSeA0vgCIE+eoxaQtDS0HDKhoM=;
	b=C4nmTWopsO0cxYaXA7v20V1F0cGJk3CAqm/ntqVLBVodBgT+KQZuD64kW/ZpCyfhGh
	qjpFBeMecCJM9Us4X2zVNK/vw7npxfGAHFV1PLupSP5uLBRK0u1npNzPaGbFNfmK6D5q
	/9NPOU/9xIkutqKzYk87dIliSDT9BZrhGqBS/BP7X6b4rGA8gQn11zkjNiCMUHVd+9yE
	jhWTYROcBpyubBa5fXpG8aMwVRDN+MZYndN6GRblWtD3Db3HRJCYykPy6w8kGhyVNfoa
	nU54arVD6AcICkFi7/ge7QhPdPbYyTguaNASBCbNNs+LEBA6IwCl/CxFOZYxoFbgazyU
	bUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VcaiSCf+qrYtZV33GpSeA0vgCIE+eoxaQtDS0HDKhoM=;
	b=ai4vEUqLMYNNjch8mu1QHPevSeBB72X/C9nwfQ7+0jX1DfsHZF8oncAGVKsKrIH5K+
	zmIRAkXPg7iZrzVYOZyRghjwHvctNbAWvBPBI5MUgmoUHHrBqnhCBs4uCCN4exswfxj3
	TVT4YLoKKxdVgTG7s6/hyuCq0aJdGFciM/K7IODaPxhE47M9Qh2sEzGx9SQ8WuHjU3XO
	e6xmv+EDJxtEu6jE92CIDRjFufb6DokNaSR4nVh5CibDttGyiaB0pgJDF79/xWyKzkqk
	BLqKMVqmEEo0m7LERIuuzH6Dum2ouiu7owIiQZOSAZjMxpC3rxWCI06WQ8qu3DgLN3Pk
	iboA==
X-Gm-Message-State: AFeK/H0Dxw53bmrDzG32k9Ak23zmBx6ox1zUsgnP/T8seBkrLlkv/GKJ
	XmSl279NXdkjmD5axpM=
X-Received: by 10.28.226.4 with SMTP id z4mr10600884wmg.135.1491240549370;
	Mon, 03 Apr 2017 10:29:09 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id h3sm5758844wrb.43.2017.04.03.10.29.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Apr 2017 10:29:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 18:28:43 +0100
Message-Id: <1491240523-14900-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH V3] libjpeg-turbo: don't depend on NASM for non-x86 targets
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
X-List-Received-Date: Mon, 03 Apr 2017 17:29:09 -0000

NASM is a x86-specific assembler so it is only required when building for x86
targets.  Use x86-architecture and class-target overrides to depend on NASM, but
explicitly disable and don't depend on it for native as complications in the
native overrides meant NASM was enabled for x86-64 but disabled for x86 (this
will be investigated later).

Original patch by Tristan Van Berkom <tristan.vanberkom@codethink.co.uk>, more
work to solve selftest failures by Richard Purdie
<richard.purdie@linuxfoundation.org>.  I just wrote a nice commit message.

Also fix some missing whitespace in _appends.

[ YOCTO #11240 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.1.bb
index 70d38f4..de2eeaf 100644
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
+EXTRA_OECONF_append_class-native = " --without-simd"
+
 # Work around missing x32 ABI support
 EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--without-simd", "", d)}"
 
@@ -33,8 +37,8 @@ EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx32
 EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf", "--without-simd", "", d)}"
 
 # Provide a workaround if Altivec unit is not present in PPC
-EXTRA_OECONF_append_class-target_powerpc = "${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "--without-simd", d)}"
-EXTRA_OECONF_append_class-target_powerpc64 = "${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "--without-simd", d)}"
+EXTRA_OECONF_append_class-target_powerpc = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "--without-simd", d)}"
+EXTRA_OECONF_append_class-target_powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "--without-simd", d)}"
 
 PACKAGES =+ "jpeg-tools libturbojpeg"
 
-- 
2.8.1


