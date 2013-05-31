Return-Path: <net147@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 994A960655
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 03:57:56 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id rp8so1505915pbb.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 20:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=TgKO1SzjrYDYhFpMEUmC//VREFHk6HDG4EvCnf+zLhM=;
	b=XgPwCVZh93hg895FsV5PfTCAITdAOx7Fd1GgUq7vsoI4C5i6aXb50SIxKo1BWPuh5F
	uhZD7ovZnerqR7XBNMS/mTWvYnBIaB/wbgBAfzIGztRXurT+OGSNu/cDW3rACCWk0KFt
	EfCMpZeiBKHsjbh74GpN7FnvbiiwFIWqDR9bu4113ju3hkKnvBRuVjaWdLQKXbqHWvCY
	YVM5WohDrfKwMJxm+K0dTLBJ8YgacNrjtQ2dxT9ccorwp8Wg4OJJTSsRkWao9LXyRau2
	zSSzjj8EXwEBmO/3NpAmlPUniUzzXFnsjWC0ymqplwUuV6PB8dL5qSBlGSwGAwqLeOZF
	kquA==
X-Received: by 10.68.101.226 with SMTP id fj2mr11170942pbb.6.1369972677699;
	Thu, 30 May 2013 20:57:57 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ra4sm47727056pab.9.2013.05.30.20.57.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 20:57:56 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 14:11:40 +1000
Message-Id: <1369973500-13042-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [PATCH] file: remove obsolete version check patch
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
X-List-Received-Date: Fri, 31 May 2013 03:57:57 -0000

After e8d2a2a3646f964ec61ece62e14788cd7184dd01 [OE-Core], file --version
returns file-5.14 instead of file.real-5.14 so the patch is no longer
necessary and causes the build to fail with the following:
| Cannot use the installed version of file (file-5.14) to
| cross-compile file 5.14
| Please install file 5.14 locally first

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../file/file/fix_version_check.patch               | 21 ---------------------
 meta/recipes-devtools/file/file_5.14.bb             |  1 -
 2 files changed, 22 deletions(-)
 delete mode 100644 meta/recipes-devtools/file/file/fix_version_check.patch

diff --git a/meta/recipes-devtools/file/file/fix_version_check.patch b/meta/recipes-devtools/file/file/fix_version_check.patch
deleted file mode 100644
index bd24ccb..0000000
--- a/meta/recipes-devtools/file/file/fix_version_check.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Since we are cross-compiling and need to have a cover script this
-version check sees "file.real-5.09" not "file-5.09", so fix the
-sed.
-
-Upstream-Status: Inapproriate [build-specific]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: file-5.09/magic/Makefile.am
-===================================================================
---- file-5.09.orig/magic/Makefile.am
-+++ file-5.09/magic/Makefile.am
-@@ -260,7 +260,7 @@ ${MAGIC}: $(EXTRA_DIST) $(FILE_COMPILE_D
- 	@(if expr "${FILE_COMPILE}" : '.*/.*' > /dev/null; then \
- 	    echo "Using ${FILE_COMPILE} to generate ${MAGIC}" > /dev/null; \
- 	  else \
--	    v=$$(file --version | sed -e s/file-// -e q); \
-+	    v=$$(file --version | sed -e s/file.real-// -e q); \
- 	    if [ "$$v" != "${PACKAGE_VERSION}" ]; then \
- 		echo "Cannot use the installed version of file ($$v) to"; \
- 		echo "cross-compile file ${PACKAGE_VERSION}"; \
diff --git a/meta/recipes-devtools/file/file_5.14.bb b/meta/recipes-devtools/file/file_5.14.bb
index 4270ff2..c8b902c 100644
--- a/meta/recipes-devtools/file/file_5.14.bb
+++ b/meta/recipes-devtools/file/file_5.14.bb
@@ -13,7 +13,6 @@ DEPENDS_class-native = "zlib-native"
 PR = "r0"
 
 SRC_URI = "ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz \
-           file://fix_version_check.patch \
            file://dump \
            file://filesystems"
 
-- 
1.8.3


