Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: /PThUljYilJlcjDHjFNjLb1PAbVOOno1BN+FkVE21Q2tqOGuoOFmP1KSFs7F4+UYGvXDdDRGYz
 x4JLk5pFh3UA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158720023"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158720023"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:33 -0800
IronPort-SDR: 9tqzvqqlufKwGmoiJq2ciQBm484BLW3gkWLfIdOJm+LgNYyv2VLgMAIRku6R0p4KgdDLfI0ClI
 4t6FDZndyMgg==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802987"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:32 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 14/19] gawk: Avoid using host ar during cross compile
Date: Tue, 17 Nov 2020 23:36:03 +0800
Message-Id: <93178cea0e694cccd602ba965909f50f1b7159c7.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5bc83ca06d0d38a6eb9fcc0343d081021dafb2ce)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-Use-cross-AR-during-compile.patch    | 35 +++++++++++++++++++
 meta/recipes-extended/gawk/gawk_5.1.0.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch

diff --git a/meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch b/meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch
new file mode 100644
index 0000000000..ca0d668ce9
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/0001-Use-cross-AR-during-compile.patch
@@ -0,0 +1,35 @@
+From 207b94e37c84007b294e57878c913271aad544ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 11 Nov 2020 23:13:23 -0800
+Subject: [PATCH] Use cross AR during compile
+
+If AR is specifcied then it should be used instead of defaulting to 'ar'
+from host
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 31364ab..4804f7b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -92,6 +92,13 @@ GAWK_CANONICAL_HOST
+ AC_USE_SYSTEM_EXTENSIONS
+ 
+ dnl checks for programs
++m4_ifndef([AC_PROG_AR],[dnl
++  AN_MAKEVAR([AR], [AC_PROG_AR])
++  AN_PROGRAM([ar], [AC_PROG_AR])
++  AC_DEFUN([AC_PROG_AR],
++  [AC_CHECK_TOOL(AR, ar, :)])
++])
++AC_PROG_AR
+ AC_PROG_EGREP
+ AC_PROG_YACC
+ AC_PROG_LN_S
+-- 
+2.29.2
+
diff --git a/meta/recipes-extended/gawk/gawk_5.1.0.bb b/meta/recipes-extended/gawk/gawk_5.1.0.bb
index 0d005cd43b..8c6411c867 100644
--- a/meta/recipes-extended/gawk/gawk_5.1.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.1.0.bb
@@ -17,6 +17,7 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
+           file://0001-Use-cross-AR-during-compile.patch \
 "
 
 SRC_URI[md5sum] = "f719bc9966df28e67fc6ebc405e7ea03"
-- 
2.28.0

