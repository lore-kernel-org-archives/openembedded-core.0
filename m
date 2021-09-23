Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.1361.1632383171327041279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Sep 2021 00:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18N7kABd007342
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 00:46:10 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18N7k9kY019296
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Sep 2021 00:46:10 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 23 Sep 2021 00:46:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 23 Sep 2021 00:46:08 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 23 Sep 2021 00:46:07 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] lttng-ust: fix do_compile error when PACKAGECONFIG examples is enabled
Date: Thu, 23 Sep 2021 15:45:16 +0800
Message-ID: <20210923074516.28840-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

when PACKAGECONFIG enabled examples, compile failed with error:
fix below compile error during PACKGAGECONFIG examples is enabled:
tmp/work/corei7-64-wrs-linux/lttng-ust/2_2.13.0-r0/recipe-sysroot-native/usr/bin/x86_64-wrs-linux/../../libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/11.2.0/ld: warning: liblttng-ust-common.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
tmp/work/corei7-64-wrs-linux/lttng-ust/2_2.13.0-r0/recipe-sysroot-native/usr/bin/x86_64-wrs-linux/../../libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/11.2.0/ld: warning: liblttng-ust-tracepoint.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-Makefile.am-update-rpath-link.patch  | 35 +++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch b/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch
new file mode 100644
index 0000000000..cbbf1df812
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/0001-Makefile.am-update-rpath-link.patch
@@ -0,0 +1,35 @@
+From 06279f50e924d1d55b43eb3b299f6633ecb1f7a4 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 22 Sep 2021 16:33:10 +0800
+Subject: [PATCH] Makefile.am: update rpath link
+
+since commit 6339062 Move liblttng-ust to 'src/lib/',
+liblttng-ust.so/liblttng-ust-common.so/liblttng-ust-tracepoint.so
+'s location changed from one dir to multiple dirs. which make below
+error:
+ld: warning: liblttng-ust-common.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
+ld: warning: liblttng-ust-tracepoint.so.1, needed by ../../../src/lib/lttng-ust/.libs/liblttng-ust.so, not found (try using -rpath or -rpath-link)
+
+Upstream-Status: Submitted [https://github.com/lttng/lttng-ust/pull/61]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ doc/examples/Makefile.am | 2 +-
+ 1 file changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/doc/examples/Makefile.am b/doc/examples/Makefile.am
+index 8ee0564..20d246c 100644
+--- a/doc/examples/Makefile.am
++++ b/doc/examples/Makefile.am
+@@ -142,7 +142,7 @@ all-local:
+ 				CFLAGS='$(CFLAGS)' \
+ 				AM_CFLAGS='$(AM_CFLAGS)' \
+ 				LDFLAGS="$(LDFLAGS)" \
+-				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -Wl,-rpath="$(PWD)/../../src/lib/lttng-ust/.libs/" -Wl,-rpath-link="$(PWD)/../../src/lib/lttng-ust/.libs/"' \
++				AM_LDFLAGS='$(AM_LDFLAGS) -L../../../src/lib/lttng-ust/.libs -Wl,-rpath="$(PWD)/../../src/lib/lttng-ust/.libs/" -Wl,-rpath-link="$(PWD)/../../src/lib/lttng-ust/.libs/:$(PWD)/../../src/lib/lttng-ust-tracepoint/.libs:$(PWD)/../../src/lib/lttng-ust-common/.libs/"' \
+ 				LTTNG_GEN_TP_PATH="$$rel_src_subdir$(top_srcdir)/tools/" \
+ 				AM_V_P="$(AM_V_P)" \
+ 				AM_V_at="$(AM_V_at)" \
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb
index 3b0e205ab8..4ec92c0683 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.13.0.bb
@@ -30,6 +30,7 @@ PE = "2"
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
+           file://0001-Makefile.am-update-rpath-link.patch \
            "
 
 SRC_URI[sha256sum] = "54e4c933679cf6a07971dc5861ce57fc4876ab740ab612407b30b5fc85371750"
-- 
2.17.1

