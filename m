Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D47957F489
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 05:56:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 00E5uXM9007182
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 21:56:33 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 13 Jan 2020 21:56:32 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2020 13:56:09 +0800
Message-ID: <20200114055609.4115-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114055609.4115-1-Qi.Chen@windriver.com>
References: <20200114055609.4115-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libubootenv: do not use hardcoded lib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jan 2020 05:56:33 -0000
Content-Type: text/plain

Avoid using hardcoded lib to fix the following error.

  ERROR: libubootenv-0.2-r0 do_package: QA Issue: libubootenv: Files/directories were installed but not shipped in any package:
    /usr/lib/libubootenv.so
    /usr/lib/libubootenv.so.0.2

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...keLists.txt-do-not-use-hardcoded-lib.patch | 28 +++++++++++++++++++
 meta/recipes-bsp/u-boot/libubootenv_0.2.bb    |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/libubootenv/0001-CMakeLists.txt-do-not-use-hardcoded-lib.patch

diff --git a/meta/recipes-bsp/u-boot/libubootenv/0001-CMakeLists.txt-do-not-use-hardcoded-lib.patch b/meta/recipes-bsp/u-boot/libubootenv/0001-CMakeLists.txt-do-not-use-hardcoded-lib.patch
new file mode 100644
index 0000000000..6d68fd6add
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/libubootenv/0001-CMakeLists.txt-do-not-use-hardcoded-lib.patch
@@ -0,0 +1,28 @@
+From e350e181b16c99c7d1c5a81c8255a315898c94dd Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Mon, 13 Jan 2020 21:49:36 -0800
+Subject: [PATCH] CMakeLists.txt: do not use hardcoded lib
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 051732b..d4134b7 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -19,7 +19,7 @@ add_executable(fw_setenv fw_setenv.c)
+ target_link_libraries(fw_printenv ubootenv z)
+ target_link_libraries(fw_setenv ubootenv z)
+ 
+-install (TARGETS ubootenv DESTINATION lib)
++install (TARGETS ubootenv DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ install (FILES libuboot.h DESTINATION include)
+ install (TARGETS fw_printenv DESTINATION bin)
+ install (TARGETS fw_setenv DESTINATION bin)
+-- 
+2.21.0
+
diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
index 23230d132e..31bdaf3ded 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
@@ -11,7 +11,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 
-SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
+SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https \
+           file://0001-CMakeLists.txt-do-not-use-hardcoded-lib.patch"
 SRCREV = "bf6ff631c0e38cede67268ceb8bf1383b5f8848e"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


