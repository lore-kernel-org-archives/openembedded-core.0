Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB99C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 07:53:39 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.7175.1646898817837433770
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 23:53:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nswpdk1/;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id t14so4071472pgr.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 23:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Msa0305MdT+Xj+z5725ZV/wiAoondBJD1dH7/p64URc=;
        b=nswpdk1/IS6pEpSoC/Ts5dEhLlZUyVnYhWybenZW+nnKgrCBgrmhW1XZ7AxfQiggGQ
         xZBJdlsasUomV9kdN7DEAilnVamPyVvPqGPCIqIuKXpDeEat478jTmetmiDylDdone3T
         R+oVlyTKn0AowfGCczLyyi/fkoP+2xdB99cV1PCvVIHvShbLMADzODDYguBWr56bhxvi
         rERjac3xrFxaMOLT8vcq9Z6G3EYDSlLPSOdg8nbhYlH2dVnaid5AJcudCow0vv3fx2sR
         VTunkBFzw5ydKY4/huh3uGRx6dxqDrF0f8qw2deTnrF/unAgED6YvcOpSHmZ288XLTch
         ZnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Msa0305MdT+Xj+z5725ZV/wiAoondBJD1dH7/p64URc=;
        b=FGOEuNVKNIXldLj6/J2nWhMvyPS/YoCm/yctmOEONiKO91NEFxcS/5GEzcn/rSm2+z
         MZgCp6FOO6jqSFR2csWwLhpVx6jp7ncgpEefYIIhhYWmuyqPRez8qzLxSielGEd4Gum2
         yjEthvQ4xpOSJoDwxyyUp4SX6O0YjMtVb2sYxpHIPDLOkYZ5Xbo5BMGLn7Au6bqhq02F
         rCEx9MG1aH8N6y8HF9qp1PO1zDT/YDGJo65XEfP4IJTLYg3P1ehixlTjnA+o7SyUjr/y
         lOJE9OJS5QniXcccUl2xIF1SSkxma3ziUgDW9qVqjYnicux8Sa/mV7f1H7Wt/b7nhzuL
         V2Ew==
X-Gm-Message-State: AOAM531NdiqUxb/Z1neXL9sl3WS5ljg6fPWn+gy+EJz1oVk9KyPe2HRD
	tcrngbrGnHWn0JJ6peTEvcuKYhpdtz+ksA==
X-Google-Smtp-Source: 
 ABdhPJxP1aXhsH4PGsVk1Gzb3fs6nLaivmRFuOMiv+CGHMR2htwyplkL9WJgSIfxAQwDrdsGlQpMzg==
X-Received: by 2002:a63:7502:0:b0:37f:f089:7d56 with SMTP id
 q2-20020a637502000000b0037ff0897d56mr2993915pgc.531.1646898817076;
        Wed, 09 Mar 2022 23:53:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 o13-20020a17090a3d4d00b001bf7d65f1e2sm4906830pjf.3.2022.03.09.23.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 23:53:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] m4: Fix build on musl/ppc
Date: Wed,  9 Mar 2022 23:53:34 -0800
Message-Id: <20220310075334.3060973-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 07:53:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163003

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update patch status

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
index 00000000000..04320de63a2
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
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/m4-patches/2022-03/msg00000.html]
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


