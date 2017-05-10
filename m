Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECAF171A76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 06:29:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v4A6TDI0011425
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 May 2017 23:29:13 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 9 May 2017 23:29:12 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 May 2017 14:29:11 +0800
Message-ID: <20170510062911.24305-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] icu: Use LARGE_BUFFER_MAX_SIZE for cmd
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
X-List-Received-Date: Wed, 10 May 2017 06:29:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The previous patch used LARGE_BUFFER_MAX_SIZE instead
of SMALL_BUFFER_MAX_SIZE for cmd in function pkg_installLibrary,
which only fixed some of the cases when the command line
is too long, some other cases indicate that the
LARGE_BUFFER_MAX_SIZE is also needed in pkg_installCommonMode
and pkg_installFileMode to avoid overflow:

| *** buffer overflow detected ***: ../bin/pkgdata terminated

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../icu/icu/icu-pkgdata-large-cmd.patch            | 28 ++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch b/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
index 6e40659227f..e758a623ef4 100644
--- a/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
+++ b/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
@@ -8,14 +8,16 @@ LARGE_BUFFER_MAX_SIZE.
 Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 ---
- tools/pkgdata/pkgdata.cpp |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ tools/pkgdata/pkgdata.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/tools/pkgdata/pkgdata.cpp b/tools/pkgdata/pkgdata.cpp
+index 60167dd..506dd32 100644
 --- a/tools/pkgdata/pkgdata.cpp
 +++ b/tools/pkgdata/pkgdata.cpp
-@@ -1019,7 +1019,7 @@ normal_symlink_mode:
+@@ -1084,7 +1084,7 @@ normal_symlink_mode:
  
  static int32_t pkg_installLibrary(const char *installDir, const char *targetDir, UBool noVersion) {
      int32_t result = 0;
@@ -24,6 +26,24 @@ diff --git a/tools/pkgdata/pkgdata.cpp b/tools/pkgdata/pkgdata.cpp
  
      sprintf(cmd, "cd %s && %s %s %s%s%s",
              targetDir,
+@@ -1152,7 +1152,7 @@ static int32_t pkg_installLibrary(const char *installDir, const char *targetDir,
+ 
+ static int32_t pkg_installCommonMode(const char *installDir, const char *fileName) {
+     int32_t result = 0;
+-    char cmd[SMALL_BUFFER_MAX_SIZE] = "";
++    char cmd[LARGE_BUFFER_MAX_SIZE] = "";
+ 
+     if (!T_FileStream_file_exists(installDir)) {
+         UErrorCode status = U_ZERO_ERROR;
+@@ -1184,7 +1184,7 @@ static int32_t pkg_installCommonMode(const char *installDir, const char *fileNam
+ #endif
+ static int32_t pkg_installFileMode(const char *installDir, const char *srcDir, const char *fileListName) {
+     int32_t result = 0;
+-    char cmd[SMALL_BUFFER_MAX_SIZE] = "";
++    char cmd[LARGE_BUFFER_MAX_SIZE] = "";
+ 
+     if (!T_FileStream_file_exists(installDir)) {
+         UErrorCode status = U_ZERO_ERROR;
 -- 
-1.7.10.4
+1.9.1
 
-- 
2.11.0


