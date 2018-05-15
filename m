Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA67C75055
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 09:47:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4F9lHlT001779
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 02:47:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 15 May 2018 02:47:17 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 May 2018 17:17:01 +0800
Message-ID: <83c12add59f31d8dda60e02ab4d70510a287ec51.1526375750.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1526375750.git.kai.kang@windriver.com>
References: <cover.1526375750.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] diffstat: fix wrong evaluation of CC
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
X-List-Received-Date: Tue, 15 May 2018 09:47:17 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

diffstat checks variable CC. If options '-I', '-U' or '-D' is included
in CC, variable CC will be wrongly filtered and only such as
'mips64-wrsmllibn32-linux-gnun32-gcc' left. It shows warning message
during configure:

| checking $CC variable...broken
| configure: WARNING: your environment misuses the CC variable to hold CFLAGS/CPPFLAGS options

Disable such check for OE.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../diffstat/avoid-check-user-break-cc.patch       | 26 ++++++++++++++++++++++
 meta/recipes-devtools/diffstat/diffstat_1.61.bb    |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch

diff --git a/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch b/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
new file mode 100644
index 00000000000..2df2d001855
--- /dev/null
+++ b/meta/recipes-devtools/diffstat/diffstat/avoid-check-user-break-cc.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Inappropriate [oe specific]
+
+m4 function CF_CC_ENV_FLAGS checks whether variable CC contains options '-I', '-U'
+and '-D'. It is not suitable for oe that option such as '-D_FORTIFY_SOURCE=2' may
+be included in CC. And then CC will be wrongly filtered.
+
+So comment out CF_CC_ENV_FLAGS from function CF_PROG_CC.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ aclocal.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 420fe83..eb73ea9 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -1114,7 +1114,7 @@ CF_GCC_VERSION
+ CF_ACVERSION_CHECK(2.52,
+ 	[AC_PROG_CC_STDC],
+ 	[CF_ANSI_CC_REQD])
+-CF_CC_ENV_FLAGS
++dnl CF_CC_ENV_FLAGS
+ ])dnl
+ dnl ---------------------------------------------------------------------------
+ dnl CF_PROG_GROFF version: 2 updated: 2015/07/04 11:16:27
diff --git a/meta/recipes-devtools/diffstat/diffstat_1.61.bb b/meta/recipes-devtools/diffstat/diffstat_1.61.bb
index f8b7b06cf24..1a76e78c15c 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.61.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.61.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://install-sh;endline=42;md5=b3549726c1022bee09c174c72a0
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://run-ptest \
+           file://avoid-check-user-break-cc.patch \
 "
 
 SRC_URI[md5sum] = "c048a32d55d8bd6724f382baf41f325f"
-- 
2.14.1


