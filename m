Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.6165.1618302308419286609
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Apr 2021 01:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13D8P7kV032025
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Apr 2021 01:25:07 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 13 Apr 2021 01:25:07 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 13 Apr 2021 01:25:06 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libtool: make sure autoheader run before automake
Date: Tue, 13 Apr 2021 16:25:05 +0800
Message-ID: <20210413082505.16279-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Issue: LINCD-5003

When use automake to generate Makefile.in from Makefile.am, there
comes below race:
 | configure.ac:45: error: required file 'config-h.in' not found

It is because the file config-h.in in updating process by autoheader,
so make automake run after autoheader to avoid the above race.

(LOCAL REV: NOT UPSTREAM) -- send to oe-core on 20210413

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
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
2.17.1

