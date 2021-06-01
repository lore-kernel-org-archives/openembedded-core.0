Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.52552.1622515163422857045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 19:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1512dJUO008095
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 31 May 2021 19:39:19 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 31 May 2021 19:39:19 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Mon, 31 May 2021 19:39:18 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>
Subject: [PATCH] nativesdk-libdnf: fix installed and not shipped files
Date: Tue, 1 Jun 2021 10:39:17 +0800
Message-ID: <20210601023917.21849-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since commit [1] applied, PYTHON_INSTALL_DIR is not right
on nativesdk build which caused [installed-vs-shipped] QA issue
...
|Building for python3
|-- Python install dir is
|tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-libdnf/0.63.0-r0/
recipe-sysroot-native/usr/lib/python3.9/site-packages
...

Yocto manually set PYTHON_INSTALL_DIR from recipe, it is not
necessary to call FindPythonInstDir.cmake which will override
Yocto setting

[1] https://github.com/rpm-software-management/libdnf/commit/f1cffbfb9f338da827e233c2d8ac3a25a6a59a69

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-drop-FindPythonInstDir.cmake.patch   | 42 +++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.63.0.bb |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
new file mode 100644
index 0000000000..d483dd410b
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
@@ -0,0 +1,42 @@
+From c0a465ccae395871ab10932975e37894220bc6a1 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 1 Jun 2021 10:23:59 +0800
+Subject: [PATCH] drop FindPythonInstDir.cmake
+
+Since commit [1] applied, PYTHON_INSTALL_DIR is not right
+on nativesdk build
+...
+|Building for python3
+|-- Python install dir is
+|tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-libdnf/0.63.0-r0/
+recipe-sysroot-native/usr/lib/python3.9/site-packages
+...
+
+Yocto manually set PYTHON_INSTALL_DIR from recipe, it is not
+necessary to call FindPythonInstDir.cmake which will override
+Yocto setting
+
+[1] https://github.com/rpm-software-management/libdnf/commit/f1cffbfb9f338da827e233c2d8ac3a25a6a59a69
+
+Upstream-Status: Inappropriate [Yocto specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ cmake/modules/FindPythonInstDir.cmake | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/cmake/modules/FindPythonInstDir.cmake b/cmake/modules/FindPythonInstDir.cmake
+index ed098ded..8b137891 100644
+--- a/cmake/modules/FindPythonInstDir.cmake
++++ b/cmake/modules/FindPythonInstDir.cmake
+@@ -1,6 +1 @@
+-EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "
+-from sys import stdout
+-from sysconfig import get_path
+-path=get_path(name='platlib', vars={'platbase':'${CMAKE_INSTALL_PREFIX}'})
+-stdout.write(path)"
+-OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++
+-- 
+2.18.1
+
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.63.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
index 79e8865456..a26ee55cb9 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch \
            file://enable_test_data_dir_set.patch \
            file://0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch \
+           file://0001-drop-FindPythonInstDir.cmake.patch \
            "
 
 SRCREV = "669a5c691acba91693d238d6262ac99a440aa9b3"
-- 
2.18.1

