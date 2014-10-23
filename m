Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EDC8865C91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 08:21:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9N8LGJR019481
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 01:21:16 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 23 Oct 2014 01:21:14 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Oct 2014 04:21:07 -0400
Message-ID: <2da6c976e5a7c4a648cc6f32bf66e50464db5373.1414052350.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1414052350.git.wenzong.fan@windriver.com>
References: <cover.1414052350.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 v2] lsof: fix LSOF_CCV in version.h
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
X-List-Received-Date: Thu, 23 Oct 2014 08:21:19 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

When using cross compiler to build the package "lsof" on a host,
the value of LSOF_CCV in version.h genegrated by the Makefile
is the version of the compiler on the host while it should be
the version of cross compiler.

On Ubuntu host before fixed:
  #define LSOF_CCV        "4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5) "

After fixed:
  #define	LSOF_CCV	"4.9.1 (GCC) "

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../files/Configure-fix-LSOF_CCV-assignment.patch  |   31 ++++++++++++++++++++
 meta/recipes-extended/lsof/lsof_4.87.bb            |    5 +++-
 2 files changed, 35 insertions(+), 1 deletion(-)
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
diff --git a/meta/recipes-extended/lsof/lsof_4.87.bb b/meta/recipes-extended/lsof/lsof_4.87.bb
index e7a1eb2..6d1c0d0 100644
--- a/meta/recipes-extended/lsof/lsof_4.87.bb
+++ b/meta/recipes-extended/lsof/lsof_4.87.bb
@@ -4,7 +4,9 @@ Its name stands for LiSt Open Files, and it does just that."
 SECTION = "devel"
 LICENSE = "BSD"
 
-SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
+SRC_URI = "ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2 \
+           file://Configure-fix-LSOF_CCV-assignment.patch \
+          "
 
 SRC_URI[md5sum] = "80e2a76d0e05826db910ec88e631296c"
 SRC_URI[sha256sum] = "dfdd3709d82bc79ccdf3e404b84aafa9aede5948642a824ecaefd0aac589da2c"
@@ -28,6 +30,7 @@ LSOF_OS_libc-glibc = "linux"
 export LSOF_INCLUDE = "${STAGING_INCDIR}"
 
 do_configure () {
+	export LSOF_CC="${CC}"
 	export LSOF_AR="${AR} cr"
 	export LSOF_RANLIB="${RANLIB}"
         if [ "x${GLIBCVERSION}" != "x" ];then
-- 
1.7.9.5


