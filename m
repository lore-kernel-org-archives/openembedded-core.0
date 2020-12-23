Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: JlMDLUm0MWp7YePUxohkQg4iVn+0AAjZ/oQZRPRnMOvY/fVM/23n5XkEWART3iCOZEXVAXtKBc
 qt0gTFPk9+eA==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236059"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236059"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:17 -0800
IronPort-SDR: ppcBFKfvIyBqVSAC4O7IQhat1n0rFBhBFjkHaH1U8e9gO5J5sIGjsUTAQoRq94PeIasn62vpOF
 8CSOCpcJJA2w==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027606"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:16 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 18/35] ruby: fix reproducibility
Date: Wed, 23 Dec 2020 23:18:28 +0800
Message-Id: <2aa9abce9b54fa79293a14ca758d14627d9c00bf.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07c26e3292dbaf71873f71bec2a631f880b2e76d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...e.in-do-not-write-host-cross-cc-item.patch | 32 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.7.1.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
new file mode 100644
index 0000000000..826daf2cda
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch
@@ -0,0 +1,32 @@
+From 2368d07660a93a2c41d63f3ab6054ca4daeef820 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 17 Nov 2020 18:31:40 +0000
+Subject: [PATCH] template/Makefile.in: do not write host cross-cc items into
+ target config
+
+This helps reproducibility.
+
+Upstream-Status: Inapproppriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ template/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/template/Makefile.in b/template/Makefile.in
+index 10dc826..940ee07 100644
+--- a/template/Makefile.in
++++ b/template/Makefile.in
+@@ -657,11 +657,11 @@ mjit_config.h:
+ 	echo '#endif'; \
+ 	quote MJIT_MIN_HEADER_NAME "$(MJIT_MIN_HEADER_NAME)"; \
+ 	sep=,; \
+-	quote "MJIT_CC_COMMON  " $(MJIT_CC); \
++	quote "MJIT_CC_COMMON  " ; \
+ 	quote "MJIT_CFLAGS      MJIT_ARCHFLAG" $(MJIT_CFLAGS); \
+ 	quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
+ 	quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
+-	quote "MJIT_LDSHARED   " $(MJIT_LDSHARED); \
++	quote "MJIT_LDSHARED   " ; \
+ 	quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
+ 	quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
+ 	quote 'PRELOADENV       "@PRELOADENV@"'; \
diff --git a/meta/recipes-devtools/ruby/ruby_2.7.1.bb b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
index f87686f6f7..a6c65e887b 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
@@ -7,6 +7,7 @@ SRC_URI += " \
            file://run-ptest \
            file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
            file://CVE-2020-25613.patch \
+           file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
            "
 
 SRC_URI[md5sum] = "debb9c325bf65021214451660f46e909"
-- 
2.29.2

