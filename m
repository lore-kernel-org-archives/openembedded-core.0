Return-Path: <Mikhail_Durnev@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 659946E881
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 07:39:20 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1W83GT-0000Sd-0k from Mikhail_Durnev@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jan 2014 23:39:21 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 27 Jan 2014 23:39:21 -0800
Received: from workstation.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Mon, 27 Jan 2014 23:38:33 -0800
From: <Mikhail_Durnev@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jan 2014 18:39:09 +1100
Message-ID: <1390894749-8639-1-git-send-email-Mikhail_Durnev@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginalArrivalTime: 28 Jan 2014 07:39:21.0094 (UTC)
	FILETIME=[0ECB3260:01CF1BFC]
Subject: [PATCH] unzip: Pass LDFLAGS to the linker
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
X-List-Received-Date: Tue, 28 Jan 2014 07:39:21 -0000
Content-Type: text/plain

From: Mikhail Durnev <Mikhail_Durnev@mentor.com>

Change Makefile to use LDFLAGS

Signed-off-by: Mikhail Durnev <Mikhail_Durnev@mentor.com>
---
 .../unzip/unzip/define-ldflags.patch               |   16 ++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb           |    5 +++--
 2 files changed, 19 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/unzip/unzip/define-ldflags.patch

diff --git a/meta/recipes-extended/unzip/unzip/define-ldflags.patch b/meta/recipes-extended/unzip/unzip/define-ldflags.patch
new file mode 100644
index 0000000..a3e5178
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/define-ldflags.patch
@@ -0,0 +1,16 @@
+Pass LDFLAGS to the linker 
+
+Signed-off-by: Mikhail Durnev <Mikhail_Durnev@mentor.com>
+
+diff -Naur old/unix/configure new/unix/configure
+--- old/unix/configure	2014-01-13 21:59:27.000000000 +1100
++++ new/unix/configure	2014-01-14 16:36:02.000000000 +1100
+@@ -16,7 +16,7 @@
+ CFLAGSR=${CFLAGS}
+ IZ_BZIP2=${3}
+ CFLAGS="${CFLAGS} -I. -DUNIX"
+-LFLAGS1=""
++LFLAGS1=${LDFLAGS}
+ LFLAGS2=""
+ LN="ln -s"
+ 
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 584802a..33c20f8 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -4,10 +4,11 @@ SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94caec5a51ef55ef711ee4e8b1c69e29"
 PE = "1"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
-	file://avoid-strip.patch"
+	file://avoid-strip.patch \
+	file://define-ldflags.patch"
 
 SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
 SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
-- 
1.7.9.5


