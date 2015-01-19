Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25ECD72BF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 07:11:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0J7BXlb017755
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 23:11:33 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 18 Jan 2015 23:11:32 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Jan 2015 23:11:30 -0800
Message-ID: <d528e603f1479ccd375d2405e0d86f754438469c.1421651378.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421651378.git.liezhi.yang@windriver.com>
References: <cover.1421651378.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] gnutls: fix sed command
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
X-List-Received-Date: Mon, 19 Jan 2015 07:11:38 -0000
Content-Type: text/plain

The "sed 's/.bak//g'" matchs "bitbake", which would cause strange errors
when the S contains "bitbake", fix to "sed 's/\.bak$//'`"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnutls/configure.ac-fix-sed-command.patch      |   31 ++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.3.11.bb       |    1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch

diff --git a/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch b/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
new file mode 100644
index 0000000..44a9934
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
@@ -0,0 +1,31 @@
+From eb93aa7b986c84da60a3db40afb29d1a70c50223 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sat, 17 Jan 2015 17:02:15 +0000
+Subject: [PATCH] configure.ac: fix sed command
+
+The "sed 's/.bak//g'" matchs "bitbake", which would cause strange errors
+when the S contains "bitbake", fix to "sed 's/\.bak$//'`"
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c6818a0..1c4582d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -466,7 +466,7 @@ if test "$NEED_LIBOPTS_DIR" = "true";then
+ 	dnl replace libopts-generated files with distributed backups, if present
+ 	missing_baks=
+ 	for i in ${srcdir}/src/*-args.c.bak ${srcdir}/src/*-args.h.bak; do
+-		nam=`echo $i|sed 's/.bak//g'`
++		nam=`echo $i|sed 's/\.bak$//'`
+ 		if test -f $i;then
+ 			cp -f $i $nam
+ 		else
+-- 
+2.0.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.3.11.bb b/meta/recipes-support/gnutls/gnutls_3.3.11.bb
index 1cf3a74..7ad462a 100644
--- a/meta/recipes-support/gnutls/gnutls_3.3.11.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.3.11.bb
@@ -3,6 +3,7 @@ require gnutls.inc
 PR = "r1"
 
 SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
+            file://configure.ac-fix-sed-command.patch \
            "
 SRC_URI[md5sum] = "b657e3010c10cae2244e7ce79ee3d446"
 SRC_URI[sha256sum] = "aef28d629b6ba824bd435f9b23506525e657e3746d4aa021296b13cbaaa6ae71"
-- 
1.7.9.5


