Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.2273.1616568540820692894
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 23:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12O6mrYv028486
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 23:48:59 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Mar 2021 23:48:55 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 23 Mar 2021 23:48:54 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libtool: make sure autoheader run before autoconf
Date: Wed, 24 Mar 2021 14:48:53 +0800
Message-ID: <20210324064853.46119-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

autoheader will update ../libtool-2.4.6/libltdl/config-h.in which
autoconf needs, so there comes a race sometimes as below:
 | configure.ac:45: error: required file 'config-h.in' not found
 | touch '../libtool-2.4.6/libltdl/config-h.in'

So make sure autoheader run before autoconf to avoid this race.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
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
2.29.2

