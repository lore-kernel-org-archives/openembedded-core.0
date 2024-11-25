Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E583D5807A
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:53 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.17089.1732536103642425611
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RoOuso5T;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53dded7be84so1696937e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536102; x=1733140902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdW1om60pyxxaJtX0Z7uazOYUtzfEsIIERbdUaKIa9w=;
        b=RoOuso5TCRsKsTNmV336bEpLdyiYSrPslQqUgIiMM+SXy9cH2z8maIDm0Bn2/8wOFK
         BaV8stgP9iRESGlER+EyvRZhfsswtuT5s9Jtris0SUy8RZCmvNGT+7CE4eR8wjVJ8ju2
         12al0ucFU7pIgtk0iEaaI1nlnrnIzKB3GI2qfBlKMLK2SkIKdyrv3wmz3R97tpD9TQzd
         HazCHt3PpwIL0v4H5FTzOGL+/xNsFOI2rzeNc7FhGwaMk6hNKjo2r24zdJGcMpa+HBgg
         RVgHC+xNHMz0+KWxt68kN0h4keJno4axmRG983BMeQ+G0GGpO9//IemdGDL2NKxk39D0
         /QTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536102; x=1733140902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdW1om60pyxxaJtX0Z7uazOYUtzfEsIIERbdUaKIa9w=;
        b=wo6mdmd1dBp7l3Ppb6JUVVcMqXAhNNMYICbyh4DaGVUNmqqGDMovu3RuWIBA0eegwL
         NWKRELpvcfBpQyXLr14x92o1q/bUswcZu+r0tE6nbldi91A4kvPin4CO8BjoWgbL/56z
         jz8sS5xR2cn+wj06lk3mnZf3J8UZ2xrDymMrtncRiAYvNkTHF45LB89aSD8LRP49PjMh
         BT4eNkxYtjSJ2FYpdV6vyzo6Ob4fzMJX4nteZaJGZjxShY3sTxaTgp5xs7UEJukZRGz4
         X2xJrCFRnr/s1t34fYjb9o7NZb910+VZ6l+Wl3z/upe1iu6c6U2nSgNwVu78QQT2GCTA
         tQYQ==
X-Gm-Message-State: AOJu0Ywx9ESFCelsgmwTkAhofcg1vX/lgON8PFFI2enx4ymIw5iSCmTM
	c7e7GiyxsCqr0GyWMmC/ieHigu7vMlDx7XCPiWMKU1jZGbV4k19Tp6LiDw==
X-Gm-Gg: ASbGnctFzSLt48e/cE2MWbw2uFMpFQnl0WJev25E/Nei//utUITpf7/BRAh8kZWrPj5
	pPXDafZFQp8QAKm4mwYgBA7I0NZTJ4TDGM1AbEAvpW2LtJ/0FU4vZCszhEVze7DIIuscyx79uwL
	5guX4z/eubrN5k44jr3M+WVuXYWbDgZxjshCiCWZzpgQ8CLJv8gRzp6ikH0HhhB+FyU2DQeNdwn
	4m7esdfvL3D1iqq4w6z4lj7RA4qHXjr4NPKmhZRcjQsFqevyFDZj8iPJi4CSN7F6NsoiHzV1e3H
	udOuwoKM+sI=
X-Google-Smtp-Source: AGHT+IFVg12oQUydAODbePIDUIrctUS7EeuzLLcC1vo/A0XbXKBFmHPj4h0mO5DPApSa5IAj6jEz0Q==
X-Received: by 2002:a05:6512:3192:b0:53d:e5fd:a445 with SMTP id 2adb3069b0e04-53de5fda6afmr1009981e87.32.1732536101573;
        Mon, 25 Nov 2024 04:01:41 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:41 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/35] npth: upgrade 1.7 -> 1.8
Date: Mon, 25 Nov 2024 13:01:08 +0100
Message-Id: <20241125120127.2205232-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207763

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/npth/npth/musl-fix.patch | 37 -------------------
 .../npth/{npth_1.7.bb => npth_1.8.bb}         |  6 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-support/npth/npth/musl-fix.patch
 rename meta/recipes-support/npth/{npth_1.7.bb => npth_1.8.bb} (73%)

diff --git a/meta/recipes-support/npth/npth/musl-fix.patch b/meta/recipes-support/npth/npth/musl-fix.patch
deleted file mode 100644
index fabe78b14c5..00000000000
--- a/meta/recipes-support/npth/npth/musl-fix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 417abd56fd7bf45cd4948414050615cb1ad59134 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Fri, 1 Mar 2024 13:53:52 +0900
-Subject: [PATCH] Fix INSERT_EXPOSE_RWLOCK_API for musl C library.
-
-* configure.ac: Add a case for musl system.
-
-Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commit;h=417abd56fd7bf45cd4948414050615cb1ad59134]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
-
-GnuPG-bug-id: 5664
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
----
- configure.ac | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c1091b1..576a26e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -381,7 +381,10 @@ fi
- AC_SUBST(INSERT_NO_RWLOCK)
- 
- case "${host}" in
--    *-*-linux*|*-*-gnu*)
-+    *-*-linux-musl*)
-+        INSERT_EXPOSE_RWLOCK_API="1"
-+        ;;
-+    *-*-linux-gnu*|*-*-gnu*)
-         INSERT_EXPOSE_RWLOCK_API="defined(__USE_UNIX98) || defined(__USE_XOPEN2K)"
-         ;;
-     *)
--- 
-2.30.2
-
-
diff --git a/meta/recipes-support/npth/npth_1.7.bb b/meta/recipes-support/npth/npth_1.8.bb
similarity index 73%
rename from meta/recipes-support/npth/npth_1.7.bb
rename to meta/recipes-support/npth/npth_1.8.bb
index 0cf35565a36..a354af2a7c2 100644
--- a/meta/recipes-support/npth/npth_1.7.bb
+++ b/meta/recipes-support/npth/npth_1.8.bb
@@ -6,11 +6,9 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2caced0b25dfefd4c601d92bd15116de"
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 
-SRC_URI = "${GNUPG_MIRROR}/npth/npth-${PV}.tar.bz2 \
-           file://musl-fix.patch \
-           "
+SRC_URI = "${GNUPG_MIRROR}/npth/npth-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "8589f56937b75ce33b28d312fccbf302b3b71ec3f3945fde6aaa74027914ad05"
+SRC_URI[sha256sum] = "8bd24b4f23a3065d6e5b26e98aba9ce783ea4fd781069c1b35d149694e90ca3e"
 
 inherit autotools multilib_header
 
-- 
2.39.5


