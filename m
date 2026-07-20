Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CE9C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 20:49:59 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7823.1784580590311314785
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 13:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Z8Mg94Do;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4a46a53abc9so4592429b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 13:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784580589; x=1785185389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mxszqmdIbR2MPdeMVgx5fqVonA2ABH7pcopK+whIBY=;
        b=Z8Mg94DoIj0sFQvcEhQi4o60PsOqoWVvIuFER0LO3gRaxYVKhArN02HX9CDfW3IYDk
         m2n6tl7BHO7r6e7Ex3cCBh2W9qMIgzAoFxQv89/qWdeDQ1wA6GE2sQ0HNHDwPm/wVx6B
         iq5HP92iExq/fu8Yf/MJS+kujtKD3GZNLlFJCAxKnQXaGeOEJU3wI8+nt6BJvlLISshP
         +GdjmCcAmbQqxNag1Q7R+AUFyAwrqL0Ne8HgArKe9GXlK6CwYHOcZzheagpsAZN8dKud
         qnFPcA78pYmZRRAY+2HzUENRsn0oVVXvrstJIN+tTbKlaIr1gXOSyB1Mgb67OgW9FKDd
         BjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784580589; x=1785185389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mxszqmdIbR2MPdeMVgx5fqVonA2ABH7pcopK+whIBY=;
        b=NTxHn3rEEsVZmRGTKIUAkEnuddoJD5SMYRwHjL+wKYX1pTEJM+a/hJJyNH1pE6Va1W
         t4IDE3ejaXCcERr2fr/xZvv7ySYmTtV4jpFTDOOyqFw0E2aqhfD4ZfWe7C6nkuxaqoup
         6QNqz9vio/mcPJaIiOjzYgIiJBckL+Xa7FsNcPffWnOHcXQKTeLOtP69xdhsV60haGJg
         8vM1vuVdGuaNll59Er26NCnbvKYzYDJD/i234dPqRFTF40EPFLq6cb1b9Eg0HGydPEwJ
         FL1braSw0Dah8MKyrSJ4Ya9XU47xcD8XW4Fi2q8/0M6cM9+K/tpwwsAViYeZI28aAC/q
         IYoQ==
X-Gm-Message-State: AOJu0Yw/yTzXGjk8dDwIz9p3WbLu25NMf2CbDe8eFw40E1JxYKYGdj6o
	9ZMt6PQF8D/2xZ+xChwWVpX37JXq1bpdxhALKLeyx//zLvS5PE953BSotSDJuQ==
X-Gm-Gg: AfdE7ckcOmLgvkHbJAiZLH8nB5euaRxBmIHcP+lZp4Gz+D7PfEVN+RKToUVacisOFg5
	q37sfuW/vqQfbw7Ct4j8n3uORF+Y0LpYsC53C6zBm7kD3YZ2J9QMRaBSl9VC1HtRi9RuUP/D3ro
	VQVXRm6GVIBZmH5wy5VWiEaS9yFC7IhEMp4ffsmBj772MtEQTAgYYSwbYDWJ9TyEHqsHm5vev/F
	uf7DRYxFWFRWv5zV+KGGmc1bVLZd6l6q+eQ0z7A4spKZBBPCTLKtvTN47CObvP+W9Mv6+sOx8hh
	igrhmqb7gAXwks6LLmW78ubGlsUxcSwOvrK9rBIBD54cFJY+upbCrQiTWHIsX7+QyElNdgC1lUV
	UnQAPWD6MNNIzR8Cmusa6R/G7rtXVOL3g4Uupy+dsWL9PtPBGgdw9G5zKusZO6FbKw1wYUEAU8A
	==
X-Received: by 2002:a05:6808:f92:b0:495:9870:2b25 with SMTP id 5614622812f47-4a4d03a7f20mr8238040b6e.34.1784580589330;
        Mon, 20 Jul 2026 13:49:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::d8e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3cb030esm7993772b6e.12.2026.07.20.13.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 13:49:48 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3] gcc: Update license
Date: Mon, 20 Jul 2026 14:49:46 -0600
Message-ID: <20260720204946.2597206-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-10-JPEWhacker@gmail.com>
References: <20260715164739.364323-10-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 20:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241490

GPL-3.0-with-GCC-exception is a deprecated license ID, so replace it
with "GPL-3.0-or-later WITH GCC-exception-3.1".

Also, the LICENSE expression in gcc.inc appears to be incomplete,
missing GPL-2.0-or-later, LGPL-2.1-or-later, and LGPL-3.0-or-later, even
though the checksums for their corresponding license files are clearly
checked in LIC_FILES_CHKSUM.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-16.1.inc       | 2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc    | 4 ++--
 meta/recipes-devtools/gcc/libgcc-initial.inc | 2 +-
 meta/recipes-devtools/gcc/libgcc.inc         | 8 ++++----
 meta/recipes-devtools/gcc/libgfortran.inc    | 6 +++---
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-16.1.inc b/meta/recipes-devtools/gcc/gcc-16.1.inc
index 4598aff045..e2be559f19 100644
--- a/meta/recipes-devtools/gcc/gcc-16.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-16.1.inc
@@ -16,7 +16,7 @@ TOOLCHAIN_NATIVE = "gcc"
 DEPENDS =+ "mpfr gmp libmpc zlib zstd flex-native"
 NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
 
-LICENSE = "GPL-3.0-with-GCC-exception & GPL-3.0-only"
+LICENSE = "GPL-2.0-or-later AND GPL-3.0-or-later AND LGPL-2.1-or-later AND GPL-3.0-or-later WITH GCC-exception-3.1 AND LGPL-3.0-or-later"
 
 LIC_FILES_CHKSUM = "\
     file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index d58cbe9c1a..5dbc10031a 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -4,11 +4,11 @@ SUMMARY = "Runtime libraries from GCC"
 
 # Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPLv3"
 # All gcc-runtime packages are now covered by the runtime exception.
-LICENSE = "GPL-3.0-with-GCC-exception"
+LICENSE = "GPL-3.0-or-later WITH GCC-exception-3.1"
 
 CXXFLAGS:remove = "-fvisibility-inlines-hidden"
 CFLAGS:append = " -Wno-error=discarded-qualifiers"
- 
+
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=${includedir}/c++/${BINV} \
     --with-sysroot=/not/exist \
diff --git a/meta/recipes-devtools/gcc/libgcc-initial.inc b/meta/recipes-devtools/gcc/libgcc-initial.inc
index ce100d7ddc..d067f7eb00 100644
--- a/meta/recipes-devtools/gcc/libgcc-initial.inc
+++ b/meta/recipes-devtools/gcc/libgcc-initial.inc
@@ -31,7 +31,7 @@ require libgcc-common.inc
 
 DEPENDS = "virtual/cross-cc"
 
-LICENSE = "GPL-3.0-with-GCC-exception"
+LICENSE = "GPL-3.0-or-later WITH GCC-exception-3.1"
 
 PACKAGES = ""
 
diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 74e8746b42..e92dadf021 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -32,10 +32,10 @@ PACKAGES = "\
 
 # All libgcc source is marked with the exception.
 #
-LICENSE:${PN} = "GPL-3.0-with-GCC-exception"
-LICENSE:${PN}-dev = "GPL-3.0-with-GCC-exception"
-LICENSE:${PN}-dbg = "GPL-3.0-with-GCC-exception"
-LICENSE:${PN}-src = "GPL-3.0-with-GCC-exception"
+LICENSE:${PN} = "GPL-3.0-or-later WITH GCC-exception-3.1"
+LICENSE:${PN}-dev = "GPL-3.0-or-later WITH GCC-exception-3.1"
+LICENSE:${PN}-dbg = "GPL-3.0-or-later WITH GCC-exception-3.1"
+LICENSE:${PN}-src = "GPL-3.0-or-later WITH GCC-exception-3.1"
 
 FILES:${PN}-dev = "\
     ${base_libdir}/libgcc*.so \
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index fa6aecaaa3..1726b40c6a 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -60,9 +60,9 @@ PACKAGES = "\
     libgfortran-staticdev \
 "
 
-LICENSE:${PN} = "GPL-3.0-with-GCC-exception"
-LICENSE:${PN}-dev = "GPL-3.0-with-GCC-exception"
-LICENSE:${PN}-dbg = "GPL-3.0-with-GCC-exception"
+LICENSE:${PN} = "GPL-3.0-or-later WITH GCC-exception-3.1"
+LICENSE:${PN}-dev = "GPL-3.0-or-later WITH GCC-exception-3.1"
+LICENSE:${PN}-dbg = "GPL-3.0-or-later WITH GCC-exception-3.1"
 
 FILES:${PN} = "${libdir}/libgfortran.so.*"
 FILES:${PN}-dev = "\
-- 
2.54.0


