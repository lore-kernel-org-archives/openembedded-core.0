Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.11966.1589544808339045528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 05:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04FCD7Zo013183
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 05:13:17 -0700
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 May 2020
 05:12:56 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/4] lttng-tools: upgrade to 2.12.0
Date: Fri, 15 May 2020 15:11:05 +0300
Message-ID: <20200515121106.27860-3-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515121106.27860-1-ovidiu.panait@windriver.com>
References: <20200515121106.27860-1-ovidiu.panait@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

Upgrade lttng-tools 2.11.2 -> 2.12.0:
* drop x32 patch, as it was merged upstream
* License-Update: licenses were moved under LICENSES directory and changed in
  upstream commit [1]

[1] https://github.com/lttng/lttng-tools/commit/ab5be9fa2eb5ba9600a82cd18fd3cfcbac69169a

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../lttng/lttng-tools/x32.patch               | 36 -------------------
 ...-tools_2.11.2.bb => lttng-tools_2.12.0.bb} | 11 +++---
 2 files changed, 5 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/x32.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.11.2.bb => lttng-tools_2.12.0.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/x32.patch b/meta/recipes-kernel/lttng/lttng-tools/x32.patch
deleted file mode 100644
index 42cebf94ac..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/x32.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Fix build for x32
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
-Fix build error of src/common/utils.c for x32.
-
-Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/150]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-diff --git a/src/bin/lttng/utils.c b/src/bin/lttng/utils.c
-index 0e96ef0c..5c79c8c7 100644
---- a/src/bin/lttng/utils.c
-+++ b/src/bin/lttng/utils.c
-@@ -158,7 +158,7 @@ unsigned int fls_u32(uint32_t x)
- #define HAS_FLS_U32
- #endif
- 
--#if defined(__x86_64)
-+#if defined(__x86_64) && !defined(__ILP32__)
- static inline
- unsigned int fls_u64(uint64_t x)
- {
-diff --git a/src/common/utils.c b/src/common/utils.c
-index 08139e5e..3c389981 100644
---- a/src/common/utils.c
-+++ b/src/common/utils.c
-@@ -1223,7 +1223,7 @@ static inline unsigned int fls_u32(uint32_t x)
- #define HAS_FLS_U32
- #endif
- 
--#if defined(__x86_64)
-+#if defined(__x86_64) && !defined(__ILP32__)
- static inline
- unsigned int fls_u64(uint64_t x)
- {
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.0.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.12.0.bb
index 36a19ec18d..3aaf4490d6 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.0.bb
@@ -5,9 +5,9 @@ to extract program execution details from the Linux operating system \
 and interpret them."
 
 LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
-                    file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=40ef17463fbd6f377db3c47b1cbaded8 \
+                    file://LICENSES/GPL-2.0;md5=e68f69a54b44ba526ad7cb963e18fbce \
+                    file://LICENSES/LGPL-2.1;md5=9920968d0f2ff585ce61fae30344dd95"
 
 DEPENDS = "liburcu popt libxml2 util-linux"
 RDEPENDS_${PN} = "libgcc"
@@ -29,15 +29,14 @@ PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-nat
 PACKAGECONFIG_remove_arc = "lttng-ust"
 
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
-           file://x32.patch \
            file://0001-tests-do-not-strip-a-helper-library.patch \
            file://run-ptest \
            file://lttng-sessiond.service \
            file://0001-tests-regression-disable-the-tools-live-tests.patch \
            "
 
-SRC_URI[md5sum] = "68ed78f7fa4235477ea577e48b3cd245"
-SRC_URI[sha256sum] = "936477305b25f65c5dd22db9161287d30a309ce868b6180857b1fd1fb5e6a56b"
+SRC_URI[md5sum] = "4592201ea981f0722438345fb1f009d2"
+SRC_URI[sha256sum] = "405661d27617dc79a42712174a051a45c7ca12d167576c0d93f2de708ed29445"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.17.1

