Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4ABC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 20:54:38 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.292.1648241659039663761
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 13:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MtO5UGAE;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id s11so7429414pfu.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 13:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sTlphpo6ooCMsMp9EEnXRZFM+sVgAHXmSCZYhHszwuA=;
        b=MtO5UGAExDFUS4C5/cjU090m8/bpX2x1INKBxscbOlMtd7rqJiI2myGdscxhuTX1hp
         16NklPh3cLVYboJuEoBReLDq1NquJ9UV4WYOFn3UUYy9MCU4OagwseMmBrrx4lIDPGBl
         cgyIb+usQ5Bao8yctXgRGPh2yM2ZGTFxTrbi/bpsADE4n57i+ZgLfAqARvgS8fHzmLwA
         nybMq6PM6Ud7ySxZpQPyBOfN2YkdSBjWGEuNwQjZoD3FRkHbiMsEq+YJoT5EUNSr2fIJ
         KJG+BspG6j4TVGFeZjSYATqus2N+m+RhxvARzg8KqRxDPqnf5G/evB6jW62DFhhaZWX9
         KREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sTlphpo6ooCMsMp9EEnXRZFM+sVgAHXmSCZYhHszwuA=;
        b=PFQWapk1BypgwSYbWsteDEv5KyLQXfEidb+82jRITNYlYVZldLU+B6Ilbhg+WTD7V8
         ObZJb6cC6og/E8LDb2Ws13BSLh+zcbaE0CATnxYOXZm9mkvKEkgNGWX48kZwfQt+2Jta
         dfADb8AUPPRUZJtbPwbrHGQriwQj3TphgFVbES+7HOUYWG+wnW1rHvV31oJFbMJHZn3S
         JiCYzUtd8h2mbsQJhdlO1mg4lC5An4S1OGuOsgPx/140dU25+/AIIMym53iPCU5iPbqO
         qhzW99AW5VHus+7xavCapC5fyjCtdy/sIsahYXv8VwdJXdEMKr448NRnQ+bCgZgdzkNB
         RuPg==
X-Gm-Message-State: AOAM530erPtIYsnbrZyNRJ/4DZo60xOHupal3gHC3aiE3WAMTLudMjRM
	8Z/q8eN2fNQZ39MzsiDshWHxPeuY/X0=
X-Google-Smtp-Source: 
 ABdhPJyMcnlE72H7lFCdSrKApELox02g+ya/clMGiO89+CKV2vhe/cthYwr0Ocgr+UIfynyu9dU20g==
X-Received: by 2002:a05:6a00:1a4a:b0:4f7:be32:3184 with SMTP id
 h10-20020a056a001a4a00b004f7be323184mr12008027pfv.65.1648241658190;
        Fri, 25 Mar 2022 13:54:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm8869763pfh.143.2022.03.25.13.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 13:54:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] diffutils: Fix build on ppc/musl
Date: Fri, 25 Mar 2022 13:54:14 -0700
Message-Id: <20220325205415.486594-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 20:54:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163654

Backport a patch from libsigsegv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...a-standard-layout-so-glibc-and-musl-.patch | 33 +++++++++++++++++++
 .../diffutils/diffutils_3.8.bb                |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/diffutils/diffutils/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch

diff --git a/meta/recipes-extended/diffutils/diffutils/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch b/meta/recipes-extended/diffutils/diffutils/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
new file mode 100644
index 00000000000..4928e1eaff8
--- /dev/null
+++ b/meta/recipes-extended/diffutils/diffutils/0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch
@@ -0,0 +1,33 @@
+From f385ad6639380eb6dfa8b8eb4a5ba65dd12db744 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 25 Mar 2022 13:43:19 -0700
+Subject: [PATCH] mcontext is not a standard layout so glibc and musl differ
+
+This is already applied to libsigsegv upstream, hopefully next version
+of grep will update its internal copy and we can drop this patch
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/gitweb/?p=libsigsegv.git;a=commitdiff;h=a6ff69873110c0a8ba6f7fd90532dbc11224828c]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/sigsegv.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/sigsegv.c b/lib/sigsegv.c
+index 998c827..b6f4841 100644
+--- a/lib/sigsegv.c
++++ b/lib/sigsegv.c
+@@ -219,8 +219,8 @@ int libsigsegv_version = LIBSIGSEGV_VERSION;
+ #   define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.gp_regs[1]
+ #  else /* 32-bit */
+ /* both should be equivalent */
+-#   if 0
+-#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.regs->gpr[1]
++#   if ! defined __GLIBC__
++#    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_regs->gregs[1]
+ #   else
+ #    define SIGSEGV_FAULT_STACKPOINTER  ((ucontext_t *) ucp)->uc_mcontext.uc_regs->gregs[1]
+ #   endif
+-- 
+2.35.1
+
diff --git a/meta/recipes-extended/diffutils/diffutils_3.8.bb b/meta/recipes-extended/diffutils/diffutils_3.8.bb
index 8c3b9b0e5a2..8889c83ee20 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.8.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.8.bb
@@ -6,6 +6,7 @@ require diffutils.inc
 SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
            file://run-ptest \
            file://0001-Skip-strip-trailing-cr-test-case.patch \
+           file://0001-mcontext-is-not-a-standard-layout-so-glibc-and-musl-.patch \
            "
 
 SRC_URI[sha256sum] = "a6bdd7d1b31266d11c4f4de6c1b748d4607ab0231af5188fc2533d0ae2438fec"
-- 
2.35.1


