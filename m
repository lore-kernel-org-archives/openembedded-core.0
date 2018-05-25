Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A31674D86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 02:40:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4P2dm7I026190
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 19:40:03 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 May 2018 19:39:37 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2018 10:48:09 +0800
Message-ID: <4893e074cd36c261a85873c89076c35a577889de.1527216285.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527216285.git.liezhi.yang@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/24] lsof: fix LSOF_CCV in version.h
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
X-List-Received-Date: Fri, 25 May 2018 02:40:12 -0000
Content-Type: text/plain

From: Jian Liu <jian.liu@windriver.com>

When using cross compiler to build the package "lsof" on a host,
the value of LSOF_CCV in version.h genegrated by the Makefile
is the version of the compiler on the host while it should be
the version of cross compiler.

On Ubuntu host before fixed:
  #define LSOF_CCV        "4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) "

After fixed:
  #define   LSOF_CCV        "4.9.1 (GCC) "

Signed-off-by: Jian Liu <jian.liu@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../files/Configure-fix-LSOF_CCV-assignment.patch  | 31 ++++++++++++++++++++++
 meta/recipes-extended/lsof/lsof_4.89.bb            |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/lsof/files/Configure-fix-LSOF_CCV-assignment.patch

diff --git a/meta/recipes-extended/lsof/files/Configure-fix-LSOF_CCV-assignment.patch b/meta/recipes-extended/lsof/files/Configure-fix-LSOF_CCV-assignment.patch
new file mode 100644
index 0000000..a182925
--- /dev/null
+++ b/meta/recipes-extended/lsof/files/Configure-fix-LSOF_CCV-assignment.patch
@@ -0,0 +1,31 @@
+From c197389c9d8ccdbfcfe1dc31da6b4ce69b90ecf6 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Thu, 23 Oct 2014 03:43:27 -0400
+Subject: [PATCH] Configure: fix LSOF_CCV assignment
+
+Allow to use specified LSOF_CC to get the version of linux compiler.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ Configure |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Configure b/Configure
+index 29c1292..e5a199f 100755
+--- a/Configure
++++ b/Configure
+@@ -2705,8 +2705,8 @@ LOCKF_OWNER4
+     if test "X$LSOF_CC" = "X"	# {
+     then
+       LSOF_CC=cc
+-      LSOF_CCV=`$LSOF_CC -v 2>&1 | sed -n 's/.*version \(.*\)/\1/p'`
+     fi	# }
++    LSOF_CCV=`$LSOF_CC -v 2>&1 | sed -n 's/.*version \(.*\)/\1/p'`
+     if test "X$LINUX_CONF_CC" = "X"	# {
+     then
+       LINUX_CONF_CC=$LSOF_CC
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/lsof/lsof_4.89.bb b/meta/recipes-extended/lsof/lsof_4.89.bb
index 14546db..52b40dc 100644
--- a/meta/recipes-extended/lsof/lsof_4.89.bb
+++ b/meta/recipes-extended/lsof/lsof_4.89.bb
@@ -13,7 +13,8 @@ LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429
 
 SRC_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2 \
            file://lsof-remove-host-information.patch \
-          "
+           file://Configure-fix-LSOF_CCV-assignment.patch \
+"
 
 SRC_URI[md5sum] = "1b9cd34f3fb86856a125abbf2be3a386"
 SRC_URI[sha256sum] = "81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a360a3718"
@@ -40,6 +41,7 @@ python do_unpack () {
 export LSOF_INCLUDE = "${STAGING_INCDIR}"
 
 do_configure () {
+	export LSOF_CC="${CC}"
 	export LSOF_AR="${AR} cr"
 	export LSOF_RANLIB="${RANLIB}"
 	if [ "x${GLIBCVERSION}" != "x" ]; then
-- 
2.7.4


