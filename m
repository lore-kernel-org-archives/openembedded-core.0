Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0816AFA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:30 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.2193.1666901788406356367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FPz6Q9l9;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id fy4so7881564ejc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rHdtzbms/rmMNMgMhxQ3T5qt7jxhBirBDQR64VpQX4=;
        b=FPz6Q9l9i5wX9GQDCbhVJxuY6PERRs/4YU2nWA8W87CtcGqCzYY9A77JsTyFUNHnyf
         m1ZgGcdhOmqx1vnpeJeaJhyq7IqyP+jaicfrKDPnX/xsNRV3MPQ2b47/VndQqM72z0oT
         JVABay4qsN0NCy4JPxnBc2753LOzQfugima1Jn6PprckDdXy6wCNSrAGcqiFTsfTugqC
         LHhXGlffNIAj7v+bpoxrPZ6w8rkRifBjV6q3zZ+yoE8ArHeo5NhFP2T+7cCng/pqdK3s
         fdBPmZ4bxZ3sghIFZYyqpS1B6Si/kmPr0MZddocXaAwzNMtU9+XGaUxLGHUfVIwfYlG+
         Wx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rHdtzbms/rmMNMgMhxQ3T5qt7jxhBirBDQR64VpQX4=;
        b=n7ueKGxSo6OG7dQeaY5NP6iEWx5sFFEQm6st3oGJYyf8Inm1Dh9czMrlkAR7n0JMjp
         mlijA/voZqeYkjKVUZ5HtIJEZ06g62HFnapnhvdOy7cdo93fafly2zsDgwdhjHdbX28m
         g5MTMvT+7uswRmtg3891RujGbo+FiAS2yQdENej0NMLjqSskaVhsnsIzOQr7z2s0PmCA
         f+K8h/QW8P4vuCrwBILXtMBdQWVyj1ZDE0yjgzPaQBTe+lC/ubdtksgigzmnJFRU2nu9
         JPmcubMBPh8sI4h42BA4xMEBuROuxI+1jN8KPcBzMe9ropYYTF3RxwvtlU6F4YzIDsGd
         NkvQ==
X-Gm-Message-State: ACrzQf1Qx6hmLgxVxY3ZjGhjv8RG1u3YQU+r2cYTFCU0pAyGeBfSCH7W
	BY9o/OQ7fT+pZnJ2gAqX9rcnzav8glf/Wg==
X-Google-Smtp-Source: AMsMyM4is0OjWNx1pVPqMc2mkFunWxqV9aDYXhm5/V2zbZKUvPedpu9B//HKgl0Wsl5NsS6grHLlyg==
X-Received: by 2002:a17:906:cc0b:b0:78e:1d51:36ea with SMTP id ml11-20020a170906cc0b00b0078e1d5136eamr44487957ejb.408.1666901786897;
        Thu, 27 Oct 2022 13:16:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/23] grep: update 3.7 -> 3.8
Date: Thu, 27 Oct 2022 22:15:53 +0200
Message-Id: <20221027201611.3644334-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172209

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...a-standard-layout-so-glibc-and-musl-.patch | 32 -------------------
 .../grep/{grep_3.7.bb => grep_3.8.bb}         |  8 ++---
 2 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-extended/grep/grep/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
 rename meta/recipes-extended/grep/{grep_3.7.bb => grep_3.8.bb} (84%)

diff --git a/meta/recipes-extended/grep/grep/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch b/meta/recipes-extended/grep/grep/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
deleted file mode 100644
index d8283d31b1..0000000000
--- a/meta/recipes-extended/grep/grep/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 981385237834bdf3e468421147eece68d9bfc7e7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 25 Mar 2022 13:34:26 -0700
-Subject: [PATCH] mcontext is not a standard layout so glibc and musl differ
-
-This is already applied to libsigsegv upstream, hopefully next version
-of grep will update its internal copy and we can drop this patch
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=commitdiff;h=a6ff69873110c0a8ba6f7fd90532dbc11224828c]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/sigsegv.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/sigsegv.c b/lib/sigsegv.c
-index 998c827..b6f4841 100644
---- a/lib/sigsegv.c
-+++ b/lib/sigsegv.c
-@@ -219,8 +219,8 @@ int libsigsegv_version = LIBSIGSEGV_VERSION;
- #   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gp_regs[1]
- #  else /* 32-bit */
- /* both should be equivalent */
--#   if 0
--#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
-+#   if ! defined __GLIBC__
-+#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_regs->gregs[1]
- #   else
- #    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
- #   endif
--- 
-2.35.1
-
diff --git a/meta/recipes-extended/grep/grep_3.7.bb b/meta/recipes-extended/grep/grep_3.8.bb
similarity index 84%
rename from meta/recipes-extended/grep/grep_3.7.bb
rename to meta/recipes-extended/grep/grep_3.8.bb
index 7005cbe164..be2caaa920 100644
--- a/meta/recipes-extended/grep/grep_3.7.bb
+++ b/meta/recipes-extended/grep/grep_3.8.bb
@@ -6,11 +6,9 @@ SECTION = "console/utils"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
-SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
-           file://0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch \
-          "
+SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5c10da312460aec721984d5d83246d24520ec438dd48d7ab5a05dbc0d6d6823c"
+SRC_URI[sha256sum] = "498d7cc1b4fb081904d87343febb73475cf771e424fb7e6141aff66013abc382"
 
 inherit autotools gettext texinfo pkgconfig
 
@@ -36,7 +34,7 @@ do_install () {
 inherit update-alternatives
 
 PACKAGECONFIG ??= "pcre"
-PACKAGECONFIG[pcre] = "--enable-perl-regexp,--disable-perl-regexp,libpcre"
+PACKAGECONFIG[pcre] = "--enable-perl-regexp,--disable-perl-regexp,libpcre2"
 
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.30.2


