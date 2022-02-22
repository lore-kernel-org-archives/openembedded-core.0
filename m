Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4341AC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:44 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.13657.1645542520813188935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=EBTMRvUT;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542523; x=1677078523;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0s4g6UlIqMagjZKMm0ooRn0aK/U2dQjGbGWFN7Qe+9Y=;
  b=EBTMRvUTyt0HbLKPoq2Qu9qLvAH7OPLWFyCEMewGcEGvH947Z4kuJaCv
   dJj4GaY6K7pafD0+HQOF1S+1VWCqYa0rnEOB3X2QrFhR8BWf8w3vadG9m
   0Rhm9cwWfILzr2DWUxYvoWqGDWI2knyCT03iF/d4NCWSijJaZAfJLmz4P
   yzw54zAFmgMWKQoDusPjvBtKhC8YBcPrXn2FqWVJ7IFtwqe+jMT7bPq/i
   LwZmTWaPSTIzTOP8rETSUbt/Qce3xRG/y05cn8HnNmK1SNJpRmuqaYMmV
   E6ZELqQcLUSqPzC6d8xVEgsxeEQZNaOxaVNgKg6HiKDdtw1m46uB3FbAU
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305219"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305219"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258740"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:25 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 24/38] gcc : Fix CVE-2021-46195
Date: Tue, 22 Feb 2022 23:07:25 +0800
Message-Id: 
 <10ae047aba143efb7b736029d14da46ea0905f6f.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162160

From: pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=f10bec5ffa487ad3033ed5f38cfd0fc7d696deab]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81e9f8aedab70dfb0a016601150623ef9a7c1596)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc        |   1 +
 .../gcc/gcc/0001-CVE-2021-46195.patch         | 128 ++++++++++++++++++
 2 files changed, 129 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-46195.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index 886ef3c35b..40d2b59354 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -76,6 +76,7 @@ SRC_URI = "\
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
2.35.1


