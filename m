Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAE8C87FCF
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:45:07 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.26747.1753469099607701379
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NPiIhkxQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b3bcb168fd5so2392766a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469099; x=1754073899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQvMXhlZlayx67Y6Dc7k6iygqLMX6C/0XzonRfr9oC4=;
        b=NPiIhkxQhlJYs63348S4zx0oD9pM5Jk/2TwAdP1/rq03Rte7kEHWKTH93SuJsMQ54T
         cVcTzaNOhbyb9AEVnFYqy8hb3dJYWAB6+XBzglZ9ZCZ8/31Tdg4YKAR5s9Pia17jJYPJ
         chOq//GXmrlotHEe24+h25WHDFnGtikc0Qq+KyXvRwpIMWJNYNIFwvd8SAiVQ6b3dFlQ
         DSp/yV0Ub5icQk6V+LJw3B7LNErZBcU/qq7n9DM8PhVZm284Ygm/YK1p6GCM3BcaRK0A
         SmNuWxHalucs2srcqVZerAOkoxRLVlF0g2P9bNhRWJ+ULVCzDOo3D0XHd4em+eFsIbtc
         NEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469099; x=1754073899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQvMXhlZlayx67Y6Dc7k6iygqLMX6C/0XzonRfr9oC4=;
        b=YxKAcnfpk7SOZ4pvtsG1h16bMpODSavicytEkXnunFyvcd2QL8XegNeSSadxzw3wyN
         SMnjS5b88UmBhdqmFJJWGOlCkoYsZAj7Y6xVSm/s4T4xFBMtAuwdAg5v8vssC6lavr/i
         IcQ1XkM5B6+/7kglNjh/RJCDlL2+mXSGJPK8/siF8M6fID38q6DgHF8Sebrgk4pX9UXs
         ImuwhFKIEfjb6qo6d4GR698zjX9k3kcJeKxyl1TDLl1utTR2L2JKP24J/n3NbI8Zyw9y
         EZwAM3z6c6B91xtQJcJ2mWsDtwio1JobvIznVccfGSANG/04KOXewVfIgY+9qNcXdbNI
         lhAw==
X-Gm-Message-State: AOJu0Yx0pc7x4wIfcpzxCQlpPlSDDeFk6C7GbnGDkh/QJsvSPANXEcJs
	8aGXO/ttrhP/Tzav/BBdjXEvxLmYvvA4FMvMUAo/zIWJLJQ5Sw3HbbADkpYKNDuqy0/50fPDxM3
	aQEKP
X-Gm-Gg: ASbGncvjnFTszOM5K52u3DNwMzCtEyRjOb6QLpSImAz0DtiMexpOI6M/YOGG3T2Jnyz
	dmFNLE3tclP1r6GqIc0gWdK8xc9sLTSNcg1if7SVVqJEeKX+tB/4QSbXRowlUo1vyB1rG40SLDI
	eohHYSw3utk51H1PExm/IsnbwMzIexjtmSqUGL/IyD9XUsRZ6utXbE1GyV0o8FuHxqY+et5RU2j
	pn61wAstFEYaD0MZhlcXqTP9BptE/8EDpPXiB8/I/hqmPx5mMK4T3aSCiTU1qmCc+97/14oK54y
	sTuCkrbAvu3TOjw7Si0IbS8EzCw5cCI6u8qflABS7uFTzS2f7ppPLD/MyZj6NvWeFvprxN/efn2
	vyNa2uRz9tMkJR9GYyNGwBrHD
X-Google-Smtp-Source: AGHT+IFd+euoCkskaBNuV0/VZXNqY+xUwxHkbgRE58VcfDwYofR4zgYmx1TQqK2VR5h7Sz68IjV+Lw==
X-Received: by 2002:a17:903:1a44:b0:235:5d1:e366 with SMTP id d9443c01a7336-23fb3051419mr53587725ad.10.1753469098581;
        Fri, 25 Jul 2025 11:44:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 15/16] mtools: upgrade 4.0.47 -> 4.0.48
Date: Fri, 25 Jul 2025 11:44:29 -0700
Message-ID: <d2c56de7c9d403c3432213bc20e04c2ed5f1db16.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753468892.git.steve@sakoman.com>
References: <cover.1753468892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220931

From: Wang Mingyu <wangmy@fujitsu.com>

clang_UNUSED.patch
disable-hardcoded-configs.patch
refreshed for 4.0.48

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 1d5aee7e67cd614073a15b47b832375428865260)

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch      | 6 +++---
 .../mtools/mtools/disable-hardcoded-configs.patch           | 6 +++---
 .../mtools/{mtools_4.0.47.bb => mtools_4.0.48.bb}           | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.47.bb => mtools_4.0.48.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
index 2f3c452420..ddf3706f51 100644
--- a/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
+++ b/meta/recipes-devtools/mtools/mtools/clang_UNUSED.patch
@@ -1,4 +1,4 @@
-From d8e9cf472f49c8dbb3b0855145974d199a83e8a4 Mon Sep 17 00:00:00 2001
+From 6914c6e15cd15daf1dae81458e5346958c9d5449 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 19 Sep 2018 11:55:41 -0700
 Subject: [PATCH] Undefine UNUSED macros with clang
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysincludes.h b/sysincludes.h
-index 6b322ff..48daecd 100644
+index 272b316..49ee5ae 100644
 --- a/sysincludes.h
 +++ b/sysincludes.h
-@@ -85,7 +85,7 @@ ac_cv_func_setpgrp_void=yes ../mtools/configure --build=i386-linux-gnu --host=i3
+@@ -98,7 +98,7 @@ ac_cv_func_setpgrp_void=yes ../mtools/configure --build=i386-linux-gnu --host=i3
  #if defined __GNUC__ && defined __STDC__
  /* gcc -traditional doesn't have PACKED, UNUSED and NORETURN */
  # define PACKED __attribute__ ((packed))
diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 1b3c3e003d..63992ac547 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 4e51cf33fc34e8e82661b9bc3ab13858a2ffe43d Mon Sep 17 00:00:00 2001
+From 16969d42ec6514883bcee87cc89b3e7864481d7e Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -11,10 +11,10 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 436c94b..794f098 100644
+index 2433457..3972150 100644
 --- a/config.c
 +++ b/config.c
-@@ -868,14 +868,6 @@ void read_config(void)
+@@ -849,14 +849,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.47.bb b/meta/recipes-devtools/mtools/mtools_4.0.48.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.47.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.48.bb
index 70d6579621..646735f3b3 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.47.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.48.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "31aa06078cc3f50591b95e71a909c56dd179d87e9cbdc07bf435e595bd7cc7ff"
+SRC_URI[sha256sum] = "03c29aac8735dd7154a989fbc29eaf2b506121ae1c3a35cd0bf2a02e94d271a9"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.43.0


