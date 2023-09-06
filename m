Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE491EB8FAF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:41:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.292.1693968057863853420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=POCHA9aY;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693968060; x=1725504060;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JCip8MYde90a/L8DirEpMViLHSfmImYtUyQkTUs/+ug=;
  b=POCHA9aYCzz7YxkSsk+fQGkZ1rRU4VCX0fFCcvXebuWX6ivdySC3bWLQ
   757RgGd1POVwjzrf5Axdc4B8/xSTonu4PgBt1bO70i2tZ0PvDBEBqrXcG
   +PBBdkKxM06b2gTYTMWtDI7FowXs5rz6rS/Jrj91lHnAB/ldkrwvazywe
   pj8dq9gJEYxOKtAfeYL6Z51YpE8LE8T653zgVxZYwGA3ENJttEdpP5ECw
   b6m9LAiOOVjUDQm927WsRW9tzAJp9fKe9xc6uxh6Md+ZeCsI4ZnbyhWZq
   87QqtlEGVMuNrpzS1xuRNcvnRfL15xbDgcvj9kPxm8sNSMqQeOr2MV08N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407953268"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="407953268"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 19:41:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="776408659"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="776408659"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga001.jf.intel.com with ESMTP; 05 Sep 2023 19:40:59 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH 5/5] nasm: fix CVE-2022-44370
Date: Wed,  6 Sep 2023 10:21:18 +0800
Message-Id: <20230906022118.1593547-5-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230906022118.1593547-1-chee.yang.lee@intel.com>
References: <20230906022118.1593547-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 02:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187272

From: Archana Polampalli <archana.polampalli@windriver.com>

NASM v2.16 was discovered to contain a heap buffer overflow in the
component quote_for_pmake() asm/nasm.c:856

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-44370

Upstream patches:
https://github.com/netwide-assembler/nasm/commit/2d4e6952417ec6f08b6f135d2b5d0e19b7dae30d

( cherry picked from commit 1568df72136f46f0767bba56c10c48bf2a1ec259 )

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../nasm/nasm/CVE-2022-44370.patch            | 104 ++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.15.05.bb    |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch b/meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch
new file mode 100644
index 0000000000..1bd49c9fd9
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch
@@ -0,0 +1,104 @@
+From b37677f7e40276bd8f504584bcba2c092f1146a8 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin" <hpa@zytor.com>
+Date: Mon, 7 Nov 2022 10:26:03 -0800
+Subject: [PATCH] quote_for_pmake: fix counter underrun resulting in segfault
+
+while (nbs--) { ... } ends with nbs == -1. Rather than a minimal fix,
+introduce mempset() to make these kinds of errors less likely in the
+future.
+
+Fixes: https://bugzilla.nasm.us/show_bug.cgi?id=3392815
+Reported-by: <13579and24680@gmail.com>
+Signed-off-by: H. Peter Anvin <hpa@zytor.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-4437
+
+Reference to upstream patch:
+[https://github.com/netwide-assembler/nasm/commit/2d4e6952417ec6f08b6f135d2b5d0e19b7dae30d]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ asm/nasm.c         | 12 +++++-------
+ configure.ac       |  1 +
+ include/compiler.h |  7 +++++++
+ 3 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/asm/nasm.c b/asm/nasm.c
+index 7a7f8b4..675cff4 100644
+--- a/asm/nasm.c
++++ b/asm/nasm.c
+@@ -1,6 +1,6 @@
+ /* ----------------------------------------------------------------------- *
+  *
+- *   Copyright 1996-2020 The NASM Authors - All Rights Reserved
++ *   Copyright 1996-2022 The NASM Authors - All Rights Reserved
+  *   See the file AUTHORS included with the NASM distribution for
+  *   the specific copyright holders.
+  *
+@@ -814,8 +814,7 @@ static char *quote_for_pmake(const char *str)
+     }
+
+     /* Convert N backslashes at the end of filename to 2N backslashes */
+-    if (nbs)
+-        n += nbs;
++    n += nbs;
+
+     os = q = nasm_malloc(n);
+
+@@ -824,10 +823,10 @@ static char *quote_for_pmake(const char *str)
+         switch (*p) {
+         case ' ':
+         case '\t':
+-            while (nbs--)
+-                *q++ = '\\';
++            q = mempset(q, '\\', nbs);
+             *q++ = '\\';
+             *q++ = *p;
++            nbs = 0;
+             break;
+         case '$':
+             *q++ = *p;
+@@ -849,9 +848,8 @@ static char *quote_for_pmake(const char *str)
+             break;
+         }
+     }
+-    while (nbs--)
+-        *q++ = '\\';
+
++    q = mempset(q, '\\', nbs);
+     *q = '\0';
+
+     return os;
+diff --git a/configure.ac b/configure.ac
+index 39680b1..940ebe2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -199,6 +199,7 @@ AC_CHECK_FUNCS(strrchrnul)
+ AC_CHECK_FUNCS(iscntrl)
+ AC_CHECK_FUNCS(isascii)
+ AC_CHECK_FUNCS(mempcpy)
++AC_CHECK_FUNCS(mempset)
+
+ AC_CHECK_FUNCS(getuid)
+ AC_CHECK_FUNCS(getgid)
+diff --git a/include/compiler.h b/include/compiler.h
+index db3d6d6..b64da6a 100644
+--- a/include/compiler.h
++++ b/include/compiler.h
+@@ -256,6 +256,13 @@ static inline void *mempcpy(void *dst, const void *src, size_t n)
+ }
+ #endif
+
++#ifndef HAVE_MEMPSET
++static inline void *mempset(void *dst, int c, size_t n)
++{
++    return (char *)memset(dst, c, n) + n;
++}
++#endif
++
+ /*
+  * Hack to support external-linkage inline functions
+  */
+--
+2.40.0
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.05.bb b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
index 43088baf71..c5638debdd 100644
--- a/meta/recipes-devtools/nasm/nasm_2.15.05.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
+           file://CVE-2022-44370.patch \
            "
 
 SRC_URI[sha256sum] = "3c4b8339e5ab54b1bcb2316101f8985a5da50a3f9e504d43fa6f35668bee2fd0"
-- 
2.37.3


