Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F6FC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 09:20:15 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.51847.1658308810452196861
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O+3FcxNU;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id b10so6271418pjq.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xtEKS71Y1avoqCoSAMtfEoaUbR5RrxQcIrAjBbzopc8=;
        b=O+3FcxNUi4NEgmbodGyuNrqzInLeCt0pdJHzetlUbjBFO+KV+poCVEOWwg5sfa9/Bc
         YsEAzpYX9kK/w0BTf4cdUEuLaufQskc79IOZk7Z20tYfkrs5JE6bUHoevmUi9rnaMmGY
         qDm6WvPcO/22Oum8CHxs2FSCyRYS3N8Vro9RQ74l/+KkHYs5t2OhXk6vLiS8M+9bPcZT
         7lDIpvThBcAeWZMYioWQo5DW77kteF0K3PE9AjXQMtRMDmm+Vti5QEyZPjYROPBTkw1q
         /5YrYXphkV8Yfjn2Fylo3nQ0KMD1fgyX6GZEZa/yWOssNVj0a0cEUmsRyZ9wEj+hqw3m
         xofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xtEKS71Y1avoqCoSAMtfEoaUbR5RrxQcIrAjBbzopc8=;
        b=3SOW8XZ01WBfZuYKDPi9JEUTnPbkOJ/B8VetvyQm6pnjORRqjIzMNKgGsWtYr9Ak0n
         8pNAn/7hpBETx+U/QMrFJj2QMHZYPRmrzzkI+gMj3GBI/eQW1V5t+fqxE7BmJaQX0twk
         YELsa8vzHNJDBzR2WMB9mBiGa88lMOQpcglhQdHPKQ/fKPVlgMphBXPwweLGnzVuvOeG
         yb6VZ+iTIslcmASa1fau8lgD+ZBWtQSEZkzt6wf45FS4OFdQVab42y3L7Jr6p2uIYJkF
         cWves1l3ijMDIVQtF6JeondO/kKpEpWT7P/4tvsvoYGIbma28fvjaxzfMwA2wC8Ol+oO
         gAEg==
X-Gm-Message-State: AJIora8ytg7IDy86XNdyGFYPWbPwiYL41TmYtVxBMPyaEXthI2+uIF/n
	hceNB6NJQvtLo3BdTshuWARO0d75xHA=
X-Google-Smtp-Source: 
 AGRyM1ut9mQaSJnLWbnkkt2gtBAxtZQmWDUeyWHG6m5JTn+BJn2GFYBt+1dRXFe5YMTEscyNOxBLHg==
X-Received: by 2002:a17:90b:1a84:b0:1ef:dc5c:3088 with SMTP id
 ng4-20020a17090b1a8400b001efdc5c3088mr4225096pjb.245.1658308809607;
        Wed, 20 Jul 2022 02:20:09 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 129-20020a621487000000b0052521fd273fsm13051891pfu.218.2022.07.20.02.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 02:20:09 -0700 (PDT)
From: pgowda.cve@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com
Subject: [kirkstone][PATCH] gcc: Backport a fix for gcc bug 105039
Date: Wed, 20 Jul 2022 14:50:03 +0530
Message-Id: <20220720092003.3342876-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 09:20:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168347

From: Naveen <naveen.gowda@windriver.com>

Backport a fix from:
https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=9234cdca6ee88badfc00297e72f13dac4e540c79

which fixes rust recursion issues in the demangler.

Signed-off-by: Naveen <naveen.gowda@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-11.3.inc        |  2 +-
 .../gcc/gcc/0030-rust-recursion-limit.patch   | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0030-rust-recursion-limit.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools/gcc/gcc-11.3.inc
index acbb43a25f..2cebeb2bc8 100644
--- a/meta/recipes-devtools/gcc/gcc-11.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
@@ -59,7 +59,7 @@ SRC_URI = "\
            file://0027-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch \
            file://0029-Fix-install-path-of-linux64.h.patch \
-           \
+           file://0030-rust-recursion-limit.patch \
            file://0001-CVE-2021-42574.patch \
            file://0002-CVE-2021-42574.patch \
            file://0003-CVE-2021-42574.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0030-rust-recursion-limit.patch b/meta/recipes-devtools/gcc/gcc/0030-rust-recursion-limit.patch
new file mode 100644
index 0000000000..bbe2f18f6f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0030-rust-recursion-limit.patch
@@ -0,0 +1,92 @@
+From 9234cdca6ee88badfc00297e72f13dac4e540c79 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 1 Jul 2022 15:58:52 +0100
+Subject: [PATCH] Add a recursion limit to the demangle_const function in the
+ Rust demangler.
+
+libiberty/
+	PR demangler/105039
+	* rust-demangle.c (demangle_const): Add recursion limit.
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=9234cdca6ee88badfc00297e72f13dac4e540c79]
+---
+ libiberty/rust-demangle.c | 29 ++++++++++++++++++++---------
+ 1 file changed, 20 insertions(+), 9 deletions(-)
+
+diff --git a/libiberty/rust-demangle.c b/libiberty/rust-demangle.c
+index bb58d900e27..36afcfae278 100644
+--- a/libiberty/rust-demangle.c
++++ b/libiberty/rust-demangle.c
+@@ -126,7 +126,7 @@ parse_integer_62 (struct rust_demangler *rdm)
+     return 0;
+ 
+   x = 0;
+-  while (!eat (rdm, '_'))
++  while (!eat (rdm, '_') && !rdm->errored)
+     {
+       c = next (rdm);
+       x *= 62;
+@@ -1148,6 +1148,15 @@ demangle_const (struct rust_demangler *rdm)
+   if (rdm->errored)
+     return;
+ 
++  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
++    {
++      ++ rdm->recursion;
++      if (rdm->recursion > RUST_MAX_RECURSION_COUNT)
++	/* FIXME: There ought to be a way to report
++	   that the recursion limit has been reached.  */
++	goto fail_return;
++    }
++
+   if (eat (rdm, 'B'))
+     {
+       backref = parse_integer_62 (rdm);
+@@ -1158,7 +1167,7 @@ demangle_const (struct rust_demangler *rdm)
+           demangle_const (rdm);
+           rdm->next = old_next;
+         }
+-      return;
++      goto pass_return;
+     }
+ 
+   ty_tag = next (rdm);
+@@ -1167,7 +1176,7 @@ demangle_const (struct rust_demangler *rdm)
+     /* Placeholder. */
+     case 'p':
+       PRINT ("_");
+-      return;
++      goto pass_return;
+ 
+     /* Unsigned integer types. */
+     case 'h':
+@@ -1200,18 +1209,20 @@ demangle_const (struct rust_demangler *rdm)
+       break;
+ 
+     default:
+-      rdm->errored = 1;
+-      return;
++      goto fail_return;
+     }
+ 
+-  if (rdm->errored)
+-    return;
+-
+-  if (rdm->verbose)
++  if (!rdm->errored && rdm->verbose)
+     {
+       PRINT (": ");
+       PRINT (basic_type (ty_tag));
+     }
++
++ fail_return:
++  rdm->errored = 1;
++ pass_return:
++  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
++    -- rdm->recursion;
+ }
+ 
+ static void
+-- 
+2.31.1
+
-- 
2.25.1


