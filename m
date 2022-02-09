Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E65C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 12:55:00 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.26043.1644411299896714769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 04:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T+IZmuB/;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id m25so1437992qka.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 04:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yegRon35SN7kqznBMebBT8kqxIcnt0Ivc6hopWMn+cA=;
        b=T+IZmuB/Sc5eETTiswxIHVMeAs69phg10f4mQhKBpjk0wJblEOlpFSfPBxtNwPnlFy
         c0HaBf/jXuzFZmIJj6+qx44BSZmOJWvSFz/VHPpdKcuIshH2WQxPXWLW1wMsAPOutyjb
         LGRbCYPbSgLH2gAAdo4SX4mLoo8d+MdkmahcRbP1fXU8+RZkXsvJpKwFJhxCNG1MfgCI
         pACuy+dayJHPgbvynSQFBffzgrWkjUNevWctkax2OQQ4zjq9hzaxlDxPkjGlXUZC2Zqq
         oCWrpiafmmVstEoWFfsb96LjrH7jpwLMR/SfBh8MqF2IRRdptc3dToOHf+BdAE2INBU3
         9gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yegRon35SN7kqznBMebBT8kqxIcnt0Ivc6hopWMn+cA=;
        b=AetzpIP39/4n1D9yyPOoFQ+fP0xlT0q4hzGXbQWqIB4Mr6iemyFN2hMN7YYYenCkz6
         v4anUgnta50EvFBL/Q5q+3mNUjUAIueO20/CHEy7+ycK/UGnMqNZbT8wo98rL6h56AVm
         Wg3Dz2e9xa60thUqAdh9HPCJfNJ9a99RkKZzU7DOZoNVVnCDeTToI3JtYUzuALYuV7la
         wQL9NSlfSiSDKarDW5PB7e22VmIGO+iwlHdZVwQmmdGkNOzRF425GyDtbgw7hf7eT7Mh
         UNdHXhdQwleWLV41j0xQfQ/McU8KCz98Wqf4ydnKMEcY53C/ap6WlE/DLLIan8ydmRcD
         dC1w==
X-Gm-Message-State: AOAM531r9jZWTIPJDWwOyY58Ni/HyZ5ciCYOsb33I/n/JmghWb+yA2PJ
	/QVy6wEwqMOpJvVnqfK8wkGo7xFPvW3d7w==
X-Google-Smtp-Source: 
 ABdhPJxmmk03buGISuaSz2po8EkMcTt83mQkv4WW0ZIyN3nucw6ZBVTesOlHESXEsJlofd9MpSCtBw==
X-Received: by 2002:a05:620a:4151:: with SMTP id
 k17mr919727qko.630.1644411298785;
        Wed, 09 Feb 2022 04:54:58 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 g10sm8605066qti.45.2022.02.09.04.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 04:54:58 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] gcc : Fix CVE-2021-46195
Date: Wed,  9 Feb 2022 04:54:54 -0800
Message-Id: <20220209125454.172117-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 12:55:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161555

Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=f10bec5ffa487ad3033ed5f38cfd0fc7d696deab]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc        |   1 +
 .../gcc/gcc/0001-CVE-2021-46195.patch         | 128 ++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-46195.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index a62f272d3c..7a45ff76c1 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -67,6 +67,7 @@ SRC_URI = "\
            file://0002-CVE-2021-42574.patch \
            file://0003-CVE-2021-42574.patch \
            file://0004-CVE-2021-42574.patch \
+           file://0001-CVE-2021-46195.patch \
 "
 SRC_URI[sha256sum] = "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-46195.patch b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-46195.patch
new file mode 100644
index 0000000000..7b3651c73e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-46195.patch
@@ -0,0 +1,128 @@
+From f10bec5ffa487ad3033ed5f38cfd0fc7d696deab Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 31 Jan 2022 14:28:42 +0000
+Subject: [PATCH] libiberty: Fix infinite recursion in rust demangler.
+
+libiberty/
+	PR demangler/98886
+	PR demangler/99935
+	* rust-demangle.c (struct rust_demangler): Add a recursion
+	counter.
+	(demangle_path): Increment/decrement the recursion counter upon
+	entry and exit.  Fail if the counter exceeds a fixed limit.
+	(demangle_type): Likewise.
+	(rust_demangle_callback): Initialise the recursion counter,
+	disabling if requested by the option flags.
+
+CVE: CVE-2021-46195
+Upstream-Status: Backport
+[https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=f10bec5ffa487ad3033ed5f38cfd0fc7d696deab]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ libiberty/rust-demangle.c | 47 ++++++++++++++++++++++++++++++++++-----
+ 1 file changed, 41 insertions(+), 6 deletions(-)
+
+diff --git a/libiberty/rust-demangle.c b/libiberty/rust-demangle.c
+index 18c760491bd..3b24d63892a 100644
+--- a/libiberty/rust-demangle.c
++++ b/libiberty/rust-demangle.c
+@@ -74,6 +74,12 @@ struct rust_demangler
+   /* Rust mangling version, with legacy mangling being -1. */
+   int version;
+ 
++  /* Recursion depth.  */
++  unsigned int recursion;
++  /* Maximum number of times demangle_path may be called recursively.  */
++#define RUST_MAX_RECURSION_COUNT  1024
++#define RUST_NO_RECURSION_LIMIT   ((unsigned int) -1)
++
+   uint64_t bound_lifetime_depth;
+ };
+ 
+@@ -671,6 +677,15 @@ demangle_path (struct rust_demangler *rdm, int in_value)
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
+   switch (tag = next (rdm))
+     {
+     case 'C':
+@@ -688,10 +703,7 @@ demangle_path (struct rust_demangler *rdm, int in_value)
+     case 'N':
+       ns = next (rdm);
+       if (!ISLOWER (ns) && !ISUPPER (ns))
+-        {
+-          rdm->errored = 1;
+-          return;
+-        }
++	goto fail_return;
+ 
+       demangle_path (rdm, in_value);
+ 
+@@ -776,9 +788,15 @@ demangle_path (struct rust_demangler *rdm, int in_value)
+         }
+       break;
+     default:
+-      rdm->errored = 1;
+-      return;
++      goto fail_return;
+     }
++  goto pass_return;
++
++ fail_return:
++  rdm->errored = 1;
++ pass_return:
++  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
++    -- rdm->recursion;
+ }
+ 
+ static void
+@@ -870,6 +888,19 @@ demangle_type (struct rust_demangler *rdm)
+       return;
+     }
+ 
++   if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
++    {
++      ++ rdm->recursion;
++      if (rdm->recursion > RUST_MAX_RECURSION_COUNT)
++	/* FIXME: There ought to be a way to report
++	   that the recursion limit has been reached.  */
++	{
++	  rdm->errored = 1;
++	  -- rdm->recursion;
++	  return;
++	}
++    }
++
+   switch (tag)
+     {
+     case 'R':
+@@ -1030,6 +1061,9 @@ demangle_type (struct rust_demangler *rdm)
+       rdm->next--;
+       demangle_path (rdm, 0);
+     }
++
++  if (rdm->recursion != RUST_NO_RECURSION_LIMIT)
++    -- rdm->recursion;
+ }
+ 
+ /* A trait in a trait object may have some "existential projections"
+@@ -1320,6 +1354,7 @@ rust_demangle_callback (const char *mangled, int options,
+   rdm.skipping_printing = 0;
+   rdm.verbose = (options & DMGL_VERBOSE) != 0;
+   rdm.version = 0;
++  rdm.recursion = (options & DMGL_NO_RECURSE_LIMIT) ? RUST_NO_RECURSION_LIMIT : 0;
+   rdm.bound_lifetime_depth = 0;
+ 
+   /* Rust symbols always start with _R (v0) or _ZN (legacy). */
+-- 
+2.27.0
+
-- 
2.31.1


