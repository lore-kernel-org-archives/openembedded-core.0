Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EF4C369C9
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 17:33:39 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.14734.1744911216477283508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 10:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lAW723Hd;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227914acd20so18623345ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744911216; x=1745516016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwjAOYfYtFQLK0OEiNsl9vnbIDKJylWvKVCZTy6auRs=;
        b=lAW723HdcY04xWG74iBKjGlU2hOjZ2MwuqF+GYrcD3Ew0XGJInrbfAAVFcJhmwHvoS
         mjFsZokPHFQnMMDsLO1z1/Fx6prEts1N0ZXxLqeNBsG6PGVXOaz9/gudIVsdLvB3Qfdh
         5EIHNIarzk1TlegSsZKWh8Z5QJ/04Fawn/8ihLE/BxsocA2eHYkeD9WPjl5RAML9CneN
         2lbRriQPzH79jvW2sc/gStWHXvk7XpHJ2TVjnfubJ5QOy4GtUvg0CQ5ujy5+HQr/qh6P
         5moQJZcUQl40bdk4BOZO0i8yKP3vJWaMhqPjPsM9FDPsQCMCTGrkI3/2LyvEGHn0cKx0
         s8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744911216; x=1745516016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwjAOYfYtFQLK0OEiNsl9vnbIDKJylWvKVCZTy6auRs=;
        b=PoGdK48OEnbpYcPJECxNfsSMtdRu7Z8tjpZSZO5dmCqm2a+LfHyIiQdqngUaR9A5Z+
         j4fXDQ3dUEooxJne8dtPU2QJV/TC4Gv2HyiFCQfxR2Sw2Y3opIaQZwkLdbJDkcybvEua
         iv1yG29HjnkviY/c27UaLYeVkRC3hEFJD5DzMWXgZHdCu8/yTQ3DAGmHltVMryIodaV7
         21sSU7+pgSntWNF/TL0V952O/oP24fymeoqMhM+d/cKn8kajtsrQfWxD4+FLCp2Z23/e
         WS1T8B77NLXZhe67k+RZPKh7pjpG8OR4rC8mRxCrbeVkslBZqAfXXsPEhnTtjeWpc7CR
         Ud9g==
X-Gm-Message-State: AOJu0YxRIFYTZ9a+xvGsLllinQhkpqMS3dK6FlacWrxgXTxB4JiywIeN
	8DBJaTIYUNh0x8FUcQ84W0rQrM4Cx/cgoqhF++cpIYl0qbIpTRlzTisFIk32
X-Gm-Gg: ASbGncvBifCWi7rYuwcOpYBKPRzt72MupAqfFC+kIrHKjdtvuPPPZ27x+BuEv2ZbKrd
	uF2eE5R8bVCqo5kPkbnFbj8QJCkVrQcB7k6EGc255r2hw+wuACh/10Ie96oTqi/Dhld0IDA65Wa
	v5ztLiP18UHRfLbRaeREHZEkBH7qdOa6eZ8WwYiGhWx7+RFB+VmCdUzfDZIZBnPDJDrmg5+0bXK
	jtb3P1i+CA9o2awt9B/BtAv8RoR3F2+G0vtMxarENHymPAotIZQt+uRQQBXR++uNe5/W7h0JC5L
	sz1Ubcgf87kyzs4gEt0whYsEJwDLIjlv
X-Google-Smtp-Source: AGHT+IFkkDrKtZUjnm5k6RUQV3xV0El0/V+g70G+GHvVHY7GbnDn3STK8LR5SH6i98V2VyjnfHTdGQ==
X-Received: by 2002:a17:903:3bcc:b0:223:3eed:f680 with SMTP id d9443c01a7336-22c50d44a6bmr9136015ad.18.1744911215672;
        Thu, 17 Apr 2025 10:33:35 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ece2f8sm2550245ad.189.2025.04.17.10.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 10:33:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jacob Kroon <jacob.kroon@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] bitbake.conf: Switch prefix mapping to use -ffile-prefix-map
Date: Thu, 17 Apr 2025 10:33:32 -0700
Message-ID: <20250417173332.554656-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417173332.554656-1-raj.khem@gmail.com>
References: <20250417173332.554656-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 17:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215107

-ffile-prefix map is more comprehensive when it comes to reproducible
builds and its superset of all prefix-mapping options in compilers

This makes is cleaner and workable across gcc and clang, clang does not
support -fcanon-prefix-map and it has to be explicitly omitted when using
clang.

There are lambdas generated in templates by clang which still get the
absolute paths despite -fdebug-prefix-map, this helps with that as well.

nasm is an outlier and we have fixed it by adding -fdebug-prefix-map option
luckily we do not pass DEBUG_PREFIX_MAP to nasm, in all recipes which use
nasm either pass -fdebug-prefix-map explicitly to nasm or they rewrite it
to use nasm flags syntax.

We have discussed this in past [1]

[1] https://patchwork.yoctoproject.org/project/oe-core/patch/20230428032030.2047920-1-raj.khem@gmail.com/#10281

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf                         | 14 +++++---------
 meta/recipes-devtools/go/go-cross-canadian.inc |  6 +++---
 meta/recipes-devtools/go/go-runtime.inc        |  4 ++--
 meta/recipes-devtools/go/go-target.inc         |  4 ++--
 meta/recipes-devtools/rust/cargo_1.85.1.bb     |  2 +-
 5 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 501808204e5..b1dae172678 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -652,15 +652,11 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 ##################################################################
 TARGET_DBGSRC_DIR ?= "/usr/src/debug/${PN}/${PV}"
 # Beware: applied last to first
-DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
- -fmacro-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
- -fmacro-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${STAGING_DIR_HOST}= \
- -fmacro-prefix-map=${STAGING_DIR_HOST}= \
- -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
- -fmacro-prefix-map=${STAGING_DIR_NATIVE}= \
+DEBUG_PREFIX_MAP ?= "\
+ -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
+ -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
+ -ffile-prefix-map=${STAGING_DIR_HOST}= \
+ -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
 "
 DEBUG_LEVELFLAG ?= "-g"
 
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index ff6c063d69e..f9b172f37c3 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -8,9 +8,9 @@ PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 # it uses gcc on build machine during go-cross-canadian bootstrap, but
 # the gcc version may be old and not support option '-fmacro-prefix-map'
 # which is one of default values of DEBUG_PREFIX_MAP
-DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR} \
-                    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
-                    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+DEBUG_PREFIX_MAP = "-ffile-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR} \
+                    -ffile-prefix-map=${STAGING_DIR_HOST}= \
+                    -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
                     "
 
 export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index e5f17337bcb..a38c2ef9e9b 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -3,8 +3,8 @@ DEPENDS:class-nativesdk = "virtual/${TARGET_PREFIX}go"
 PROVIDES = "virtual/${TARGET_PREFIX}go-runtime"
 
 DEBUG_PREFIX_MAP = "\
-                     -fdebug-prefix-map=${STAGING_DIR_HOST}= \
-                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+                     -ffile-prefix-map=${STAGING_DIR_HOST}= \
+                     -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
 "
 
 export CGO_CFLAGS = "${CFLAGS}"
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 981c7abd313..fe60f4d9649 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -2,8 +2,8 @@ DEPENDS = "virtual/${TUNE_PKGARCH}-go go-native"
 DEPENDS:class-nativesdk = "virtual/${TARGET_PREFIX}go go-native"
 
 DEBUG_PREFIX_MAP = "\
-                     -fdebug-prefix-map=${STAGING_DIR_HOST}= \
-                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+                     -ffile-prefix-map=${STAGING_DIR_HOST}= \
+                     -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
 "
 
 export CGO_CFLAGS = "${CFLAGS}"
diff --git a/meta/recipes-devtools/rust/cargo_1.85.1.bb b/meta/recipes-devtools/rust/cargo_1.85.1.bb
index db18ecfda9a..150c2d2b801 100644
--- a/meta/recipes-devtools/rust/cargo_1.85.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.85.1.bb
@@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
 inherit cargo pkgconfig
 
-DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
+DEBUG_PREFIX_MAP += "-ffile-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
 
 do_cargo_setup_snapshot () {
 	${UNPACKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig

