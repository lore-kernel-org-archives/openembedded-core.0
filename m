Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.2572.1594284686331032186
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 01:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0698pO8v006168
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Jul 2020 01:51:25 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Thu, 9 Jul 2020 01:51:12 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3: define a profile directory path
Date: Thu, 9 Jul 2020 16:48:17 +0800
Message-ID: <20200709084817.2936467-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After ccache upgrade to 3.7.10, there comes below error when
enable ccache to build python3 and check [1] and [2] for more
details.
 | Python-3.8.3/Modules/_contextvarsmodule.c:43:1: error: source locations for function 'PyInit__contextvars' have changed, the profile data may be out of date [-Werror=coverage-mismatch]

That's because the logic for profile directory changes a little in
[3] after ccache upgrades to 3.7.10.

So define a profile directory path accordingly to fix the above error.

[1] https://github.com/ccache/ccache/issues/615
[2] https://lists.openembedded.org/g/openembedded-core/topic/75170448#140065
[3] https://github.com/ccache/ccache/commit/91a2954eb47b4a106e2be6cf611917b895108e35

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...re.ac-define-a-path-for-profile-data.patch | 42 +++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.3.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-configure.ac-define-a-path-for-profile-data.patch

diff --git a/meta/recipes-devtools/python/python3/0001-configure.ac-define-a-path-for-profile-data.patch b/meta/recipes-devtools/python/python3/0001-configure.ac-define-a-path-for-profile-data.patch
new file mode 100644
index 0000000000..ee3d645521
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-configure.ac-define-a-path-for-profile-data.patch
@@ -0,0 +1,42 @@
+From 5e94e315119117898ce1a2798641848f61d796b1 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 9 Jul 2020 07:58:44 +0000
+Subject: [PATCH] configure.ac: define a path for profile data
+
+There comes below error when use ccache 3.7.10 to compile python3
+and check [1] for more details.
+ | Python-3.8.3/Modules/_contextvarsmodule.c:43:1: error: source locations for function 'PyInit__contextvars' have changed, the profile data may be out of date [-Werror=coverage-mismatch]
+
+That's because the logic for profile directory changes a little in
+[2] after ccache upgrades to 3.7.10.
+
+So define a profile directory path accordingly to fix the above error.
+
+[1] https://github.com/ccache/ccache/issues/615
+[2] https://github.com/ccache/ccache/commit/91a2954eb47b4a106e2be6cf611917b895108e35
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/21408]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 08fe397..bb15bda 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1332,8 +1332,8 @@ case $cc_basename in
+         fi
+         ;;
+       *)
+-        PGO_PROF_GEN_FLAG="-fprofile-generate"
+-        PGO_PROF_USE_FLAG="-fprofile-use -fprofile-correction"
++        PGO_PROF_GEN_FLAG="-fprofile-generate=$(pwd)"
++        PGO_PROF_USE_FLAG="-fprofile-use=$(pwd) -fprofile-correction"
+         LLVM_PROF_MERGER="true"
+         LLVM_PROF_FILE=""
+         ;;
+-- 
+2.26.2
+
diff --git a/meta/recipes-devtools/python/python3_3.8.3.bb b/meta/recipes-devtools/python/python3_3.8.3.bb
index a7cfbad5cd..7e0f35ce41 100644
--- a/meta/recipes-devtools/python/python3_3.8.3.bb
+++ b/meta/recipes-devtools/python/python3_3.8.3.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
+           file://0001-configure.ac-define-a-path-for-profile-data.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1

