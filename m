Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: elRp5tPiV04nBJplEbqgqewF5aocqIBuwSaAI9a9GnpN72GiI+SR9Krh2dKHT/ksXL0s7OmNjN
 DZEfF/Pj9LuA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818217"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818217"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:45 -0700
IronPort-SDR: dDYHy1eOw7GMYen0FAQdBQYf5B0S06hipoAH+Jtk2Va2EdEkvdzUad/gUBY3JVOXgudimosESO
 34VDI19gx3vQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067437"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:44 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 37/64] libtool: make sure autoheader run before automake
Date: Mon, 26 Apr 2021 08:53:08 +0800
Message-Id: <55372f0b2d8c57954a704a967178c75d19e0af89.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

When use automake to generate Makefile.in from Makefile.am, there
comes below race:
 | configure.ac:45: error: required file 'config-h.in' not found

It is because the file config-h.in in updating process by autoheader,
so make automake run after autoheader to avoid the above race.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1fc0a4a98e65db7efba8bb5cb835101ea5dd865b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libtool/libtool-2.4.6.inc                 |  1 +
 ...-sure-autoheader-run-before-automake.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-automake.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index 19a03d4733..e9225e140c 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -22,6 +22,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://0001-libtool-Fix-support-for-NIOS2-processor.patch \
            file://0001-libtool-Check-for-static-libs-for-internal-compiler-.patch \
            file://0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch \
+           file://0001-Makefile.am-make-sure-autoheader-run-before-automake.patch \
           "
 
 SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
diff --git a/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-automake.patch b/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-automake.patch
new file mode 100644
index 0000000000..87f8492346
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-automake.patch
@@ -0,0 +1,35 @@
+From e82c06584f02e3e4487aa73aa05981e2a35dc6d1 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 13 Apr 2021 07:17:29 +0000
+Subject: [PATCH] Makefile.am: make sure autoheader run before automake
+
+When use automake to generate Makefile.in from Makefile.am, there
+comes below race:
+ | configure.ac:45: error: required file 'config-h.in' not found
+
+It is because the file config-h.in in updating process by autoheader,
+so make automake run after autoheader to avoid the above race.
+
+Upstream-Status: Submitted [libtool-patches@gnu.org maillist]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 2752ecc..29950db 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -328,7 +328,7 @@ EXTRA_DIST     += $(lt_aclocal_m4) \
+ 		  $(lt_obsolete_m4) \
+ 		  $(stamp_mk)
+ 
+-$(lt_Makefile_in): $(lt_Makefile_am) $(lt_aclocal_m4)
++$(lt_Makefile_in): $(lt_Makefile_am) $(lt_aclocal_m4) $(lt_config_h_in)
+ 	$(AM_V_GEN)cd '$(srcdir)/$(ltdl_dir)' && $(AUTOMAKE) Makefile
+ 
+ # Don't let unused scripts leak into the libltdl Makefile
+-- 
+2.29.2
+
-- 
2.30.2

