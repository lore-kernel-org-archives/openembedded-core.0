Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A472EC87FCE
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:36:10 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.5261.1753392968128454801
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:36:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CAWtWgK8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-75bd436d970so995940b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392967; x=1753997767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQvMXhlZlayx67Y6Dc7k6iygqLMX6C/0XzonRfr9oC4=;
        b=CAWtWgK8we3Hn1u71Zx2Zu/U9Yk1/KChEnm31sH8qjTHdc4Icb2XTQMcVSdeTAsSZj
         o/HlcE0zsytdFhqfXBcXjzLW1GqFsGOxePPIhyhOZO3Qh+QDa8OiZbTCBAsF0cktRLE8
         /+cm3FFp7bmiBKVnphwpfF+g80NndiAAAMVohOqRoo5IHS85DFq5ubGKWNz6KujUJvRl
         21QWlBWrbwCjwhmkz2PBMetKwgNndZlnn6NsWnE+qz8x0PQGSQ10i8+hJMDD7Z2rXbFv
         HJuhmkoL4l7s0gLgC9RNRqaA7jOKFfqCSQXZOR4VMElV+g+3JH1ixYCJ58Ft0sr86upw
         O8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392967; x=1753997767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQvMXhlZlayx67Y6Dc7k6iygqLMX6C/0XzonRfr9oC4=;
        b=FeXhd8hbcWEVF3m3djVtZU3l8vPq8S7PfhAlfXdzXdAqPK5gy/EZJSJ7Ls1yNjVV+q
         po2087MVqt8HiEeDv4kWQUBu/03El8GKseRA7brr8QRaCVZb/UVRDTrOp6MWkWVvAIIu
         5w/za+Hop88+ZtBstSoK8yqqnonmKqlJd69Jcs2NkGIX1u0qDHKdESBD8BFg2f0Bk7Mf
         v+rBN6r7F8yX2PLK4QZOOwyknzsjzxWbsYc9BN1V9pAidEbOALxMlcCkVlirk73fJwbc
         juulzvp+mpynpGt4OBoP+aOtOSGeejADoToRTootABdzd+GvZMMjq2l9rGNxTUKCoZQv
         e/XA==
X-Gm-Message-State: AOJu0YypFLUfLxKOsB5swxZ1BZ313U6NZhzD/VFvBNwDkb4orK2zr9Ll
	x6yE91G7rELsCYgXrKFeuhiBiRM1CveFcgXIAu4bIZgj3lm+vMdiL2lJ+WVUZGyKYQEvUybYORE
	fRb00
X-Gm-Gg: ASbGncvGioHE7AWJ3yd3Nt71a5RPneu5n2+yv4yI+NjJxMr8xNp9qtWPRy/o2dVlcJP
	LcsoVfUEf+qQ1bRsTCqNcRnglngKyqMVA6kgaT3hLgTk9eZyRJ9mobeuSecCzJ6Cy2Iy0SY53oP
	ks+fLModqy+xefQZxiMAlE18O3baN1FTPYpvZ3KvJ6VsXuSD3HRbB1uaxCiN5qeYKoKqelIzG3r
	iOkmhcnL4ncXsENvpO1BoljNXiGT495fheQ9J1N7GXNq3SlpBXaioI4UUfhlygk/wS6G2VQH/sY
	rfZKFWBMOI3hjbTolvH+sp0eEGXJiyTHObx1ysSePdWcos/bcW4hMLvglO2jdrbtstMsoW51yos
	w78wRpY9vy2XQ
X-Google-Smtp-Source: AGHT+IGnlbY/cW8imxDcpDPdvisEn8doSjqqf2Nb6fSIZ/N1vspWUB4d/voBr14W6rIu7MRr8fqupw==
X-Received: by 2002:a05:6a20:258d:b0:23d:6956:26e1 with SMTP id adf61e73a8af0-23d6956272dmr912640637.46.1753392967276;
        Thu, 24 Jul 2025 14:36:07 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.36.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:36:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/16] mtools: upgrade 4.0.47 -> 4.0.48
Date: Thu, 24 Jul 2025 14:35:31 -0700
Message-ID: <e3b70d38983bed43a77d739a7f69f027e563fa3c.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753392770.git.steve@sakoman.com>
References: <cover.1753392770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220888

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


