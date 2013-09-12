Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CEF966A5AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 09:33:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8C9XgWA012363
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 02:33:42 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 12 Sep 2013 02:33:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2013 05:33:36 -0400
Message-ID: <c6dc3cb329428e92cb035be504e044c1c3c0e939.1378978213.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1378978213.git.liezhi.yang@windriver.com>
References: <cover.1378978213.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] icu-native: do_install: Segmentation fault
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
X-List-Received-Date: Thu, 12 Sep 2013 09:33:39 -0000
Content-Type: text/plain

There was a "Segmentation fault" error when build icu-native when the
TMPDIR is in a deep directory (for example, when len(readlink -f $TMPDIR
== 410)), use LARGE_BUFFER_MAX_SIZE for cmd rather than
SMALL_BUFFER_MAX_SIZE would fix the problem, this should be a misplay
because other cmd uses LARGE_BUFFER_MAX_SIZE.

[YOCTO #5171]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../icu/icu-51.2/icu-pkgdata-large-cmd.patch       |   29 ++++++++++++++++++++
 meta/recipes-support/icu/icu_51.2.bb               |    4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patch

diff --git a/meta/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patch b/meta/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patch
new file mode 100644
index 0000000..6e40659
--- /dev/null
+++ b/meta/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patch
@@ -0,0 +1,29 @@
+pkgdata.cpp: use LARGE_BUFFER_MAX_SIZE for cmd
+
+Use LARGE_BUFFER_MAX_SIZE for cmd rather than SMALL_BUFFER_MAX_SIZE,
+otherwise there was a Segmentation fault error when the command line is
+long, this should be a misplay since other cmd uses
+LARGE_BUFFER_MAX_SIZE.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ tools/pkgdata/pkgdata.cpp |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/pkgdata/pkgdata.cpp b/tools/pkgdata/pkgdata.cpp
+--- a/tools/pkgdata/pkgdata.cpp
++++ b/tools/pkgdata/pkgdata.cpp
+@@ -1019,7 +1019,7 @@ normal_symlink_mode:
+ 
+ static int32_t pkg_installLibrary(const char *installDir, const char *targetDir, UBool noVersion) {
+     int32_t result = 0;
+-    char cmd[SMALL_BUFFER_MAX_SIZE];
++    char cmd[LARGE_BUFFER_MAX_SIZE];
+ 
+     sprintf(cmd, "cd %s && %s %s %s%s%s",
+             targetDir,
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-support/icu/icu_51.2.bb b/meta/recipes-support/icu/icu_51.2.bb
index e865ba6..1278d22 100644
--- a/meta/recipes-support/icu/icu_51.2.bb
+++ b/meta/recipes-support/icu/icu_51.2.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://../license.html;md5=443a74288a72fad9069a74e7637192c1"
 PR = "r0"
 
 BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-51_2-src.tgz"
-SRC_URI = "${BASE_SRC_URI}"
+SRC_URI = "${BASE_SRC_URI} \
+           file://icu-pkgdata-large-cmd.patch \
+          "
 
 SRC_URI[md5sum] = "072e501b87065f3a0ca888f1b5165709"
 SRC_URI[sha256sum] = "deb027a05f1b3bec03298b96fb93b28c84e9683c22e6f94effa67fdc7bd704cc"
-- 
1.7.10.4


