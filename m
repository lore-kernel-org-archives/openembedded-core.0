Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.32582.1630998136647915212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 00:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="207344473"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="207344473"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 00:02:17 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="537804495"
Received: from tengjieg-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.137.164])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 00:02:16 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/11] lz4: Security Fix for CVE-2021-3520
Date: Tue,  7 Sep 2021 15:01:59 +0800
Message-Id: <d7d278286d4dea215f3e8fbff59a9e95056cb7f4.1630997270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630997270.git.anuj.mittal@intel.com>
References: <cover.1630997270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Source: https://github.com/lz4/lz4
MR: 111604
Type: Security Fix
Disposition: Backport from https://github.com/lz4/lz4/commit/8301a21773ef61656225e264f4f06ae14462bca7#diff-7055e9cf14c488aea9837aaf9f528b58ee3c22988d7d0d81d172ec62d94a88a7
ChangeID: 58492f950164e75954a97cf084df6f9af3d88244
Description:

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d6a089a2f637051333e0137d2e748c823e2aa98)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../lz4/files/CVE-2021-3520.patch             | 27 +++++++++++++++++++
 meta/recipes-support/lz4/lz4_1.9.3.bb         |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/lz4/files/CVE-2021-3520.patch

diff --git a/meta/recipes-support/lz4/files/CVE-2021-3520.patch b/meta/recipes-support/lz4/files/CVE-2021-3520.patch
new file mode 100644
index 0000000000..5ac8f6691f
--- /dev/null
+++ b/meta/recipes-support/lz4/files/CVE-2021-3520.patch
@@ -0,0 +1,27 @@
+From 8301a21773ef61656225e264f4f06ae14462bca7 Mon Sep 17 00:00:00 2001
+From: Jasper Lievisse Adriaanse <j@jasper.la>
+Date: Fri, 26 Feb 2021 15:21:20 +0100
+Subject: [PATCH] Fix potential memory corruption with negative memmove() size
+
+Upstream-Status: Backport
+https://github.com/lz4/lz4/commit/8301a21773ef61656225e264f4f06ae14462bca7#diff-7055e9cf14c488aea9837aaf9f528b58ee3c22988d7d0d81d172ec62d94a88a7
+CVE: CVE-2021-3520
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ lib/lz4.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: git/lib/lz4.c
+===================================================================
+--- git.orig/lib/lz4.c
++++ git/lib/lz4.c
+@@ -1665,7 +1665,7 @@ LZ4_decompress_generic(
+                  const size_t dictSize         /* note : = 0 if noDict */
+                  )
+ {
+-    if (src == NULL) { return -1; }
++    if ((src == NULL) || (outputSize < 0)) { return -1; }
+ 
+     {   const BYTE* ip = (const BYTE*) src;
+         const BYTE* const iend = ip + srcSize;
diff --git a/meta/recipes-support/lz4/lz4_1.9.3.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
index effc530b94..9d5dc0253a 100644
--- a/meta/recipes-support/lz4/lz4_1.9.3.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
@@ -14,6 +14,7 @@ SRCREV = "d44371841a2f1728a3f36839fd4b7e872d0927d3"
 
 SRC_URI = "git://github.com/lz4/lz4.git;branch=release \
            file://run-ptest \
+           file://CVE-2021-3520.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
-- 
2.31.1

