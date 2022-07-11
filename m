Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AD5C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 14:24:41 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.29176.1657549476290976336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 07:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BaVdTYHo;
 spf=pass (domain: gmail.com, ip: 209.85.216.52,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id fz10so4978461pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 07:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cqVGqfGbCgW2Kruosq/2OgSUZ+9TlYab0fcUVWB3tzo=;
        b=BaVdTYHomfc/cabUQIIpLEdG5c5n85A2EmKKu2HS6W/AkIAeiYvNQQ/ZjC6Hfodv8s
         VyHEtf023jcRZJlsRSjVVUC4T+MyDdcJMb1rX4G6rNGC8RBf0J5bFY+OQLOYaNo17w2P
         KBV+Mf88MAg/X+QvnC64Nxt72hoD3X9+pPLLurmVLOlmkv1fBd5kXuVGwW6SKWr9pXdD
         ecnnjTgob+tk/GKCSj+SJmK/i4j1dM9cTQ7oAY4tvYnPbJAwq1l3zJZTDlMVR4IACRHj
         W16jJCIEj8sYtCib2YlhbmZaR06H9ArX7FHjkR7rW6SoEokkASvbkoARwtba5PlpKZZH
         +s2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cqVGqfGbCgW2Kruosq/2OgSUZ+9TlYab0fcUVWB3tzo=;
        b=URGlAB+laKti3Np3uEUvsVz2lEvoa5Pd6SOr3xJph60Zw1nHPUuCiHaj78kNRSOqaQ
         VNnP2M0PsWFaLHIuQGQ6uayvHYd1Oye2yzwx55pFKOcNBmh3ORvzZiuK7ql0krhKxLLT
         MScTKKZpVQHHtCE6FnxkFyibRl9+UlXlnOjC50QgjMypMMnxhXwJmyQgjdCJILjScjtp
         PyiyN8UX7TbMBMmtYPibU+oQUraqibtXrvji0eCAkCqvPoQLAnuwp26OwV7n6IWatg1E
         E9YAXlujApAy58PFeXcVHlNG8868DeV5dmWyqJm75nTOcrJ678f1+M4J7pDpW+Pn9jU3
         l/5g==
X-Gm-Message-State: AJIora/jZTDMVhLA0SdzPhjjWzWnTLEDSH2EMfsJnFNcRkggGEar+jXc
	ACt5IG5RDIh4Eg+DL5s42CFrgTRLWXc=
X-Google-Smtp-Source: 
 AGRyM1uoRiS/58LKy1/zYFqyshZOHYtiagcGuWbGUuoPVIkO8v0owltvmxBKs9XTMRs3IUZ0Q4UhNw==
X-Received: by 2002:a17:90b:378a:b0:1ef:9edf:6f86 with SMTP id
 mz10-20020a17090b378a00b001ef9edf6f86mr17776179pjb.15.1657549475374;
        Mon, 11 Jul 2022 07:24:35 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 h123-20020a62de81000000b005252a06750esm4781817pfg.182.2022.07.11.07.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 07:24:35 -0700 (PDT)
From: pgowda.cve@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] gcc : Bug-105039
Date: Mon, 11 Jul 2022 19:54:25 +0530
Message-Id: <20220711142425.4152037-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 14:24:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167872

From: pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=9234cdca6ee88badfc00297e72f13dac4e540c79]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-12.1.inc        |  1 +
 .../gcc/gcc/0026-rust-recursion-limit.patch   | 92 +++++++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-rust-recursion-limit.patch

diff --git a/meta/recipes-devtools/gcc/gcc-12.1.inc b/meta/recipes-devtools/gcc/gcc-12.1.inc
index 250b587e78..8c6c4a0305 100644
--- a/meta/recipes-devtools/gcc/gcc-12.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-12.1.inc
@@ -63,6 +63,7 @@ SRC_URI = "${BASEURI} \
            file://0023-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0024-Fix-install-path-of-linux64.h.patch \
            file://0025-Move-sched.h-include-ahead-of-user-headers.patch \
+           file://0026-rust-recursion-limit.patch \
 "
 SRC_URI[sha256sum] = "62fd634889f31c02b64af2c468f064b47ad1ca78411c45abe6ac4b5f8dd19c7b"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0026-rust-recursion-limit.patch b/meta/recipes-devtools/gcc/gcc/0026-rust-recursion-limit.patch
new file mode 100644
index 0000000000..bbe2f18f6f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0026-rust-recursion-limit.patch
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


