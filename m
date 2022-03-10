Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116FDC433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 04:31:21 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.6178.1646886679678588760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 20:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pt2y0XuK;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id w4so3771346ply.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 20:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wVvTstY/f6dftiiNbcifUwCHpVQIzFZpx6g/JUsPM6U=;
        b=pt2y0XuKuW87Q/FMIitRgEBKvIAbh8r7ryXgHVyKlK85HTLJhCdExFMDT+Nz3/7TeL
         d42uVBnzQ7zKIcZcJHXCsYaIJ5XTnCjMDEHkaMy2cjPAflkVtez0ddNMkvpEQT5gqHSM
         uCsMowL1vOnMkdF5Crpk/5isK2+f656Ce8W8Q888vdv4dEFCu/rVnL4uL3ItDCSK/Xur
         nZ/Z4zu9zUqKdonYXS9w365wTYAVNA+hFi8tArMD4GsrSflmVNcqQLEVHm9qMGSzDQZr
         9ASr4RE5eFh21ulX2DiizPUCf4uuWBeC4TdNs5dQp2uEXA33TOBYqk0HAmMi+Lm1cEBz
         Oi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wVvTstY/f6dftiiNbcifUwCHpVQIzFZpx6g/JUsPM6U=;
        b=3d3XdmnntLYH1VI/zJ6WCrAA/8yvTadJhDV5Q2gaOuro6YKgWWAvTUDq/EUcsZvZGg
         iHbmsuAPj2cOAmye8s7qPIxK0qF0qGxjctyGIftaWWAetq6i0ZDGFbxqHAGlwU1hYmjd
         FErF3jP6VOgYAFzbhmhJJOg5gizH64VGYHFg5Su+qGbJbT5Pt2yT/YrwIYuj+cyn/pjr
         seCQqr5aDfGQ7pAiUTtwEKSP3TrMO8a0LjpWymwF4Mnw0ND1SZiCNRQtY5oV8USWre4Q
         /7CPi6PSA/sg2KhvLaJZsH60AdY3afcckKmvHSMqU6qUswFve8YNUjh0KUwr09IH8Lq8
         8xyw==
X-Gm-Message-State: AOAM532QAeNhJEYLO07Fh315K30GlIsBDh1NzKG4GGNErw9BP1pG1McN
	I25nIEFJdCn5osi0YHcwayturqmTHwq8sQ==
X-Google-Smtp-Source: 
 ABdhPJzy/3D9hdVcmVNxLHnuiJ6sv81cjWTA1dPjku9TdYnbVBxb64V6unIYNoLZHHrmTtImL9PZDw==
X-Received: by 2002:a17:903:1209:b0:14e:e31c:b8c4 with SMTP id
 l9-20020a170903120900b0014ee31cb8c4mr3157497plh.153.1646886678846;
        Wed, 09 Mar 2022 20:31:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 j7-20020a637a47000000b003803fbcc005sm3817944pgn.59.2022.03.09.20.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 20:31:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] m4: Fix build on musl/ppc
Date: Wed,  9 Mar 2022 20:31:16 -0800
Message-Id: <20220310043116.476846-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 04:31:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/m4/m4-1.4.19.inc        |  1 +
 .../0001-sigsegv-Fix-build-on-ppc-musl.patch  | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.patch

diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index 2785a3d22cd..2adf4de6f2f 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -8,6 +8,7 @@ inherit autotools texinfo ptest gettext
 
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
            file://ac_config_links.patch \
+           file://0001-sigsegv-Fix-build-on-ppc-musl.patch \
            "
 SRC_URI:append:class-target = " file://run-ptest \
                                 file://serial-tests-config.patch \
diff --git a/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.patch b/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.patch
new file mode 100644
index 00000000000..8f2ad81c0c5
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/0001-sigsegv-Fix-build-on-ppc-musl.patch
@@ -0,0 +1,37 @@
+From 36d5e26f606e070553eb0fff1f738e61970be5d7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Mar 2022 20:22:20 -0800
+Subject: [PATCH] sigsegv: Fix build on ppc/musl
+
+mcontext is not a standard layout so glibc and musl differ sadly.
+
+Fixes
+../../m4-1.4.19/lib/sigsegv.c: In function 'sigsegv_handler':                                                                                                                               ../../m4-1.4.19/lib/sigsegv.c:223:75: error: 'mcontext_t' has no member named 'uc_regs'; did you mean 'gregs'?                                                                                223 | #    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]                                                                                               |                                                                           ^~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/sigsegv.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/lib/sigsegv.c b/lib/sigsegv.c
+index 696a152..fa0c465 100644
+--- a/lib/sigsegv.c
++++ b/lib/sigsegv.c
+@@ -217,10 +217,10 @@ int libsigsegv_version = LIBSIGSEGV_VERSION;
+ #   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gp_regs[1]
+ #  else /* 32-bit */
+ /* both should be equivalent */
+-#   if 0
+-#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
++#   if ! defined __GLIBC__
++#      define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_regs->gregs[1]
+ #   else
+-#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
++#      define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
+ #   endif
+ #  endif
+ 
+-- 
+2.35.1
+
-- 
2.35.1


