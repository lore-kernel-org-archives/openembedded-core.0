Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.8249.1595926401137223222
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: VU0yQYJm+yx6LNEnnW3KALeKIBlpZarBuGCi0OmLIYS5yNVwAP/+bAt8NmlbX8NxgjJvtRZvGU
 E2OarOcmd2Cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699771"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699771"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:20 -0700
IronPort-SDR: Yt2q39MIDk1l33yqBkF8eW/WiBgPNqVEfTTm6uQCug9hKY6y7N+LQ8yJTR6EL1lMetKA/SCMZA
 ld4B1RFPyEqA==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245958"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:19 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 25/32] sqlite: backport CVE fix
Date: Tue, 28 Jul 2020 16:51:26 +0800
Message-Id: <36edee3e489e7bd94d6fa555f87d94c5ec0f3ad8.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Fixes CVE-2020-11655

(From OE-Core rev: 3b06a6c73f4e49c6d00f758423c2e8865ec2de00)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[ without the CVE-2020-11656 fix that did not apply cleanly ]
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../sqlite/files/CVE-2020-11655.patch         | 32 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.29.0.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-11655.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2020-11655.patch b/meta/recipes-support/sqlite/files/CVE-2020-11655.patch
new file mode 100644
index 0000000000..c2360cb867
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2020-11655.patch
@@ -0,0 +1,32 @@
+From a4601326d61bf1a11151ac6b78b50804bfd03b4d Mon Sep 17 00:00:00 2001
+From: Sakib Sajal <sakib.sajal@windriver.com>
+Date: Thu, 30 Apr 2020 10:46:16 -0700
+Subject: [PATCH 2/2] In the event of a semantic error in an aggregate query,
+ early-out the resetAccumulator() function to prevent problems due to
+ incomplete or incorrect initialization of the AggInfo object. Fix for ticket
+ [af4556bb5c285c08].
+
+FossilOrigin-Name: 4a302b42c7bf5e11ddb5522ca999f74aba397d3a7eb91b1844bb02852f772441
+Upstream-Status: Backport [c415d91007e1680e4eb17def583b202c3c83c718]
+
+CVE: CVE-2020-11655
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ sqlite3.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 1df6633..726adf7 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -133242,6 +133242,7 @@ static void resetAccumulator(Parse *pParse, AggInfo *pAggInfo){
+   struct AggInfo_func *pFunc;
+   int nReg = pAggInfo->nFunc + pAggInfo->nColumn;
+   if( nReg==0 ) return;
++  if( pParse->nErr ) return;
+ #ifdef SQLITE_DEBUG
+   /* Verify that all AggInfo registers are within the range specified by
+   ** AggInfo.mnReg..AggInfo.mxReg */
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
index cf3b179845..95e1174b07 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.29.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.sqlite.org/2019/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://CVE-2019-19926.patch \
            file://CVE-2019-19959.patch \
            file://CVE-2019-20218.patch \
+           file://CVE-2020-11655.patch \
 "
 SRC_URI[md5sum] = "8f3dfe83387e62ecb91c7c5c09c688dc"
 SRC_URI[sha256sum] = "8e7c1e2950b5b04c5944a981cb31fffbf9d2ddda939d536838ebc854481afd5b"
-- 
2.25.4

