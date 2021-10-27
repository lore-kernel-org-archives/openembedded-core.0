Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E97AC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 10:47:37 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.10006.1635331656464256226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 03:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YLb7ozyV;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id h193so2559538pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 03:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qn4Xx1KnEY4AM2J6uYLPXN1pwzxnD4RAFzHfzKzDxHU=;
        b=YLb7ozyVJFwMySwrqJc5sDDH+ZsbDSYzgvj5gukkxNe+LG9zNTeh/J4G5IQ7HftRhP
         eMC8yk6UMtkCONigVapp3asS12ZNCZteWZHaZJhRJYORGEbOL+H1iC4y6gDZLHHW+Bx+
         MtwRqTT35oYU8C8T1jiBREQ8f+ymXcmGuXqpcU4hZEGniJkPMwAQiYhlt9quOxmEvXCj
         3z5mnRpNOsbCwnA1XnzOS8yYGgN5JmSJi2vkWbr3fiJSAZxN1gMFtAfByZosUOcuvGgp
         b/rh89sUREoJNrhiOKHOWU0mhEWHKqftJ4g724Lj29hPEVdfkJ06tWRYXP+k+JAbVAPp
         hqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qn4Xx1KnEY4AM2J6uYLPXN1pwzxnD4RAFzHfzKzDxHU=;
        b=2Zy6R428xdJgLfV0C5ki51x634LQFbmHZMEhwv864X3vR1dl0Ld8qDKVH7x2iGijOQ
         PStPntDEhvUaIVJKJNDiRRCkNdcFqOBIYu5ayMn4zLiriVBG3cWBCuAMq0U+jbsmImm5
         LJZp095p6yctv8Ivj9QWyVhrp4XXj1eeesGnFckSSMeDa+GElLui93JCGcenyYrkIGDu
         yMu3qdyFempWhB+rGQNFW4SBc3aFs/6TMaix6lPhufPGBy3rbR1VKV0K4ETDIk+EZsZr
         BYCCVS+rn9KNnDbMzjnh9OINxfJ1M6SMHPz/f5PQ+1+/gyXSyMD/2FfIzkAk/gZ+V4GH
         MgAQ==
X-Gm-Message-State: AOAM532FrNLACo7/b5Umen4xLnij7WfS2Z0tim5UDT3nPhjKV8a4YyrS
	2880SzduM0nY3o/0AYgdxRLwq6aPM2c=
X-Google-Smtp-Source: 
 ABdhPJx9VAfXynIOGOyAChin7NoZKf6aDKohmvL8grSsQnw/U1PliM4J91b0Xcki7hcGU+oSnBhiIQ==
X-Received: by 2002:a63:7242:: with SMTP id c2mr23229106pgn.321.1635331655695;
        Wed, 27 Oct 2021 03:47:35 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 l11sm3677370pjg.22.2021.10.27.03.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 03:47:35 -0700 (PDT)
From: Pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	richard.purdie@linuxfoundation.org,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH] binutils: Fix CVE-2021-3530
Date: Wed, 27 Oct 2021 03:47:05 -0700
Message-Id: <20211027104705.113970-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 10:47:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157510

Backport from binutils-2_37

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 .../binutils/binutils-2.36.inc                |  1 +
 .../binutils/0017-CVE-2021-3530.patch         | 97 +++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2021-3530.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/recipes-devtools/binutils/binutils-2.36.inc
index 9d770db5a8..981692e457 100644
--- a/meta/recipes-devtools/binutils/binutils-2.36.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
@@ -44,5 +44,6 @@ SRC_URI = "\
      file://0001-CVE-2021-20197.patch \
      file://0002-CVE-2021-20197.patch \
      file://0003-CVE-2021-20197.patch \
+     file://0017-CVE-2021-3530.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2021-3530.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2021-3530.patch
new file mode 100644
index 0000000000..f1934aa600
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-CVE-2021-3530.patch
@@ -0,0 +1,97 @@
+From 25162c795b1a2becf936bb3581d86a307ea491eb Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 15 Jul 2021 16:51:56 +0100
+Subject: [PATCH] Fix a stack exhaustion problem in the Rust demangling code in
+ the libiberty library.
+
+	PR 99935
+	* rust-demangle.c: Add recursion limit.
+---
+ libiberty/ChangeLog       |  5 +++++
+ libiberty/rust-demangle.c | 31 +++++++++++++++++++++++++------
+ 2 files changed, 30 insertions(+), 6 deletions(-)
+
+diff --git a/libiberty/ChangeLog b/libiberty/ChangeLog
+index bc1b35b97c4..8e39fd28eba 100644
+--- a/libiberty/ChangeLog
++++ b/libiberty/ChangeLog
+@@ -1,3 +1,8 @@
++2021-07-15  Nick Clifton  <nickc@redhat.com>
++
++	PR 99935
++	* rust-demangle.c: Add recursion limit.
++
+ 2021-01-04  Martin Liska  <mliska@suse.cz>
+ 
+ 	* strverscmp.c: Convert to utf8 from iso8859.
+diff --git a/libiberty/rust-demangle.c b/libiberty/rust-demangle.c
+index 449941b56dc..df09b7b8fdd 100644
+--- a/libiberty/rust-demangle.c
++++ b/libiberty/rust-demangle.c
+@@ -74,6 +74,12 @@ struct rust_demangler
+   /* Rust mangling version, with legacy mangling being -1. */
+   int version;
+ 
++  /* Recursion depth.  */
++  uint recursion;
++  /* Maximum number of times demangle_path may be called recursively.  */
++#define RUST_MAX_RECURSION_COUNT  1024
++#define RUST_NO_RECURSION_LIMIT   ((uint) -1)
++
+   uint64_t bound_lifetime_depth;
+ };
+ 
+@@ -671,6 +677,15 @@ demangle_path (struct rust_demangler *rd
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
+@@ -688,10 +703,7 @@ demangle_path (struct rust_demangler *rd
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
+@@ -776,9 +788,15 @@ demangle_path (struct rust_demangler *rd
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
+@@ -1317,6 +1335,7 @@ rust_demangle_callback (const char *mang
+   rdm.skipping_printing = 0;
+   rdm.verbose = (options & DMGL_VERBOSE) != 0;
+   rdm.version = 0;
++  rdm.recursion = (options & DMGL_NO_RECURSE_LIMIT) ? RUST_NO_RECURSION_LIMIT : 0;
+   rdm.bound_lifetime_depth = 0;
+ 
+   /* Rust symbols always start with _R (v0) or _ZN (legacy). */
-- 
2.31.1


