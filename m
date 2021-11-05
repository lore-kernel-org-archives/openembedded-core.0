Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C5BC433FE
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 08:48:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.2747.1636102102387061044
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 01:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IM+t0zdO;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so9068216wme.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 01:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=acOlkw1VzrDW368MWH5T61YMi+xpay/sWwnbQl1qFbU=;
        b=IM+t0zdOpRqh6upe64jk/tI7yE3chahRqgLNtlH14AuMkeEFZEugV5/DiNBFQal0Ma
         VI3YCIMpx/9pVHAFvaSP0TTlPHwtUv0WmYfPuWBOTn0GSq9pNcKy51uQGqDNoGP5wQJj
         yT5EUEhKSmGHonpsX95vmU9N/Hh6H8PiyDl6O/boEkpbiCJpgd2hyqHxoV/6Ze+NUVuQ
         z1gvwSFBJjRyi4WaINxw2mzSJOuRoCXx+WnFs89yPu+N8HH8/xCobVBGdByW0FJl67Au
         L9Rn1P0RWNjVLVgJvIIqHUccL4lU2Ejmcc+JO6B3i4/q/vbEvtlrI3DIaOuKiakwusLf
         mrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=acOlkw1VzrDW368MWH5T61YMi+xpay/sWwnbQl1qFbU=;
        b=VGasiSRoJlnvG6NCbqOAPFZxhYcIh9O/BOgmrhSYAsFeyXdKrMKqKz9W+FSCdYGjTc
         iM/XFTzGzAYQYNU2lgowglFnw48FZ5fTypUSMCs+H0Z4Fu++mdfOqVxwOkUxyUQj7Mza
         mk+oxFhNwDoTRwPL2X3In95KklAdDiuSFn8FEVt7Krg7En5oqDIAD8570AZ5EdDv+wae
         XOlrgjB1xPUceGaqd4Ez7xrIAu/pj4/C9wQtd3cbChUt7ofreIXVTgNq75fds6vuMzXM
         INGBUPqLP43ck3iNUEWQQG1SjJmbazkVgoaM/yu/IdLH4Ybv6ihiz9+to9Pu3HSuj2fw
         BIZA==
X-Gm-Message-State: AOAM531o87xbLYWBdOfvxv5XtPlzVk/fxGPzARw5KRoJSxTZOLGzPB2v
	idnzmK9eTE4a2yEMSLh2dfBbO/Z7Ssg=
X-Google-Smtp-Source: 
 ABdhPJwFXojGJQud4nsNyWPEwxPxPZ7caAiXWK1prkjLJE5rekAMYy6srbA1uGTDtqA1ZTd36boWng==
X-Received: by 2002:a1c:43c1:: with SMTP id
 q184mr21474517wma.153.1636102101057;
        Fri, 05 Nov 2021 01:48:21 -0700 (PDT)
Received: from nereus.lab.linutronix.de. ([109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 d7sm7230432wrw.87.2021.11.05.01.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 01:48:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/7] systemd-bootchart: submit musl patches upstream
Date: Fri,  5 Nov 2021 09:48:09 +0100
Message-Id: <20211105084812.1828227-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211105084812.1828227-1-alex@linutronix.de>
References: <20211105084812.1828227-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 08:48:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157885

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch | 2 +-
 .../systemd-bootchart/0002-musl-does-not-provide-printf-h.patch | 2 +-
 .../0003-musl-does-not-provide-canonicalize_file_name.patch     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
index f392ceafcc..12eecc989b 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
@@ -12,8 +12,8 @@ systemd/0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
 Based on work by: Khem Raj <raj.khem@gmail.com>
 
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/47]
 ---
-Upstream-Status: Pending
 
  src/util.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
index 196272f7a2..8be3bed395 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
@@ -10,8 +10,8 @@ Original patch author: Emil Renner Berthing <systemd@esmil.dk>
 Includes work by: Khem Raj <raj.khem@gmail.com>
 
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/47]
 ---
-Upstream-Status: Pending
 
  Makefile.am               |   4 +
  configure.ac              |   3 +
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
index 7670d95f07..c2c276e458 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
@@ -9,8 +9,8 @@ systemd/0007-check-for-missing-canonicalize_file_name.patch
 Based on work by: Khem Raj <raj.khem@gmail.com>
 
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/47]
 ---
-Upstream-Status: Pending
 
  src/path-util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
-- 
2.20.1


