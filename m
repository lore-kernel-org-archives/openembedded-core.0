Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.5412.1595477000393719442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 21:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06N42xfY020820
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 21:03:09 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Jul 2020
 21:03:06 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] Revert "python3: define a profile directory path"
Date: Wed, 22 Jul 2020 21:02:36 -0700
Message-ID: <20200723040236.75818-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723040236.75818-1-mingli.yu@windriver.com>
References: <20200723040236.75818-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After ccache upgrade to 3.7.11, there is below logic introduced.
58895dc Add knowledge about -fprofile-{correction,reorder-functions,values}

And the python3 ccache build issue [1] is fixed in ccache 3.7.11, so there
is no need to define a profile directory path for python3 any more.

[1] https://github.com/ccache/ccache/issues/615
---
 ...re.ac-define-a-path-for-profile-data.patch | 42 -------------------
 meta/recipes-devtools/python/python3_3.8.3.bb |  1 -
 2 files changed, 43 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-configure.ac-define-a-path-for-profile-data.patch

diff --git a/meta/recipes-devtools/python/python3/0001-configure.ac-define-a-path-for-profile-data.patch b/meta/recipes-devtools/python/python3/0001-configure.ac-define-a-path-for-profile-data.patch
deleted file mode 100644
index ee3d645521..0000000000
--- a/meta/recipes-devtools/python/python3/0001-configure.ac-define-a-path-for-profile-data.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 5e94e315119117898ce1a2798641848f61d796b1 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 9 Jul 2020 07:58:44 +0000
-Subject: [PATCH] configure.ac: define a path for profile data
-
-There comes below error when use ccache 3.7.10 to compile python3
-and check [1] for more details.
- | Python-3.8.3/Modules/_contextvarsmodule.c:43:1: error: source locations for function 'PyInit__contextvars' have changed, the profile data may be out of date [-Werror=coverage-mismatch]
-
-That's because the logic for profile directory changes a little in
-[2] after ccache upgrades to 3.7.10.
-
-So define a profile directory path accordingly to fix the above error.
-
-[1] https://github.com/ccache/ccache/issues/615
-[2] https://github.com/ccache/ccache/commit/91a2954eb47b4a106e2be6cf611917b895108e35
-
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/21408]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 08fe397..bb15bda 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1332,8 +1332,8 @@ case $cc_basename in
-         fi
-         ;;
-       *)
--        PGO_PROF_GEN_FLAG="-fprofile-generate"
--        PGO_PROF_USE_FLAG="-fprofile-use -fprofile-correction"
-+        PGO_PROF_GEN_FLAG="-fprofile-generate=$(pwd)"
-+        PGO_PROF_USE_FLAG="-fprofile-use=$(pwd) -fprofile-correction"
-         LLVM_PROF_MERGER="true"
-         LLVM_PROF_FILE=""
-         ;;
--- 
-2.26.2
-
diff --git a/meta/recipes-devtools/python/python3_3.8.3.bb b/meta/recipes-devtools/python/python3_3.8.3.bb
index 7e0f35ce41..a7cfbad5cd 100644
--- a/meta/recipes-devtools/python/python3_3.8.3.bb
+++ b/meta/recipes-devtools/python/python3_3.8.3.bb
@@ -32,7 +32,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-configure.ac-fix-LIBPL.patch \
            file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
-           file://0001-configure.ac-define-a-path-for-profile-data.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.17.1

