Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: gy9bTGMzA1Zn7CTBaM724Iw4quI91GnUBSHeMY8EBDHJmP1/DXy0CKYn6daF0PtZn/Hfo5SCXb
 DcTXD7s8f0Kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467956"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467956"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:57 -0700
IronPort-SDR: wOSGmZZpctnMbMDPdMEEPv4e6Yk2cezPQ7aFi+H0XR+91dpjLMFnisHAfba7Sh8s3dC9lZEBG7
 e9hm1TlgskKw==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809150"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:55 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 15/18] libtool: make sure autoheader run before autoconf
Date: Mon, 12 Apr 2021 17:08:23 +0800
Message-Id: <7f2a5d0768d4b32d14d6dc436e0c79f57d7efb40.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

autoheader will update ../libtool-2.4.6/libltdl/config-h.in which
autoconf needs, so there comes a race sometimes as below:
 | configure.ac:45: error: required file 'config-h.in' not found
 | touch '../libtool-2.4.6/libltdl/config-h.in'

So make sure autoheader run before autoconf to avoid this race.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d8451cbef5906b67756582fdfc44eb01ed3512fc)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libtool/libtool-2.4.6.inc                 |  1 +
 ...-sure-autoheader-run-before-autoconf.patch | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index 8e17b56d46..19a03d4733 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://unwind-opt-parsing.patch \
            file://0001-libtool-Fix-support-for-NIOS2-processor.patch \
            file://0001-libtool-Check-for-static-libs-for-internal-compiler-.patch \
+           file://0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch \
           "
 
 SRC_URI[md5sum] = "addf44b646ddb4e3919805aa88fa7c5e"
diff --git a/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch b/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
new file mode 100644
index 0000000000..2e9908725e
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/0001-Makefile.am-make-sure-autoheader-run-before-autoconf.patch
@@ -0,0 +1,35 @@
+From dfbbbd359e43e0a55fbea06f2647279ad8761cb9 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 24 Mar 2021 03:04:13 +0000
+Subject: [PATCH] Makefile.am: make sure autoheader run before autoconf
+
+autoheader will update ../libtool-2.4.6/libltdl/config-h.in which
+autoconf needs, so there comes a race sometimes as below:
+ | configure.ac:45: error: required file 'config-h.in' not found
+ | touch '../libtool-2.4.6/libltdl/config-h.in'
+
+So make sure autoheader run before autoconf to avoid this race.
+
+Upstream-Status: Submitted [libtool-patches@gnu.org maillist]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 4142c90..fe1a9fc 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -365,7 +365,7 @@ lt_configure_deps = $(lt_aclocal_m4) $(lt_aclocal_m4_deps)
+ $(lt_aclocal_m4): $(lt_aclocal_m4_deps)
+ 	$(AM_V_GEN)cd '$(srcdir)/$(ltdl_dir)' && $(ACLOCAL) -I ../m4
+ 
+-$(lt_configure): $(lt_configure_deps)
++$(lt_configure): $(lt_configure_deps) $(lt_config_h_in)
+ 	$(AM_V_GEN)cd '$(srcdir)/$(ltdl_dir)' && $(AUTOCONF)
+ 
+ $(lt_config_h_in): $(lt_configure_deps)
+-- 
+2.29.2
+
-- 
2.30.2

