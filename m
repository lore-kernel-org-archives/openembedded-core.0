Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 980206AC48
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 01:35:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r621ZD45015197
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jul 2013 18:35:13 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 1 Jul 2013 18:35:13 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jul 2013 09:35:11 +0800
Message-ID: <8a9a790c7b1ad1c392c524482a4ecb293b093c6f.1372727248.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372727248.git.rongqing.li@windriver.com>
References: <cover.1372727248.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sysstat: backport a patch to fix a parallel building error
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
X-List-Received-Date: Tue, 02 Jul 2013 01:35:12 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 ...-Makefile-to-allow-for-parallel-execution.patch |   34 ++++++++++++++++++++
 meta/recipes-extended/sysstat/sysstat.inc          |    3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysstat/files/0001-Update-Makefile-to-allow-for-parallel-execution.patch

diff --git a/meta/recipes-extended/sysstat/files/0001-Update-Makefile-to-allow-for-parallel-execution.patch b/meta/recipes-extended/sysstat/files/0001-Update-Makefile-to-allow-for-parallel-execution.patch
new file mode 100644
index 0000000..c82b19c
--- /dev/null
+++ b/meta/recipes-extended/sysstat/files/0001-Update-Makefile-to-allow-for-parallel-execution.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Backport
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+
+From eb44730094a68f4d37d95ddc3480a5972619b43f Mon Sep 17 00:00:00 2001
+From: Sebastien GODARD <sysstat@orange.fr.fake>
+Date: Sat, 22 Jun 2013 14:08:40 +0200
+Subject: [PATCH] Update Makefile to allow for parallel execution
+
+Rewrite rule for librdstats.a in Makefile to prevent possible file
+corruption when using make -j.
+
+Signed-off-by: Sebastien GODARD <sysstat@orange.fr.fake>
+---
+ Makefile.in |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index f8e6159..159cacf 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -202,7 +202,9 @@ sadf_misc.o: sadf_misc.c sadf.h sa.h
+ libsyscom.a: common.o ioconf.o
+ 	$(AR) rvs $@ $?
+ 
+-librdstats.a: librdstats.a(rd_stats.o count.o)
++# Ditto
++librdstats.a: rd_stats.o count.o
++	$(AR) rvs $@ $?
+ 
+ librdsensors.a: librdsensors.a(rd_sensors.o)
+ 
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 263cbd2..ac3c89b 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -5,7 +5,8 @@ LICENSE = "GPLv2+"
 SECTION = "console/utils"
 
 SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz \
-		   file://99_sysstat"
+		   file://99_sysstat \
+		   file://0001-Update-Makefile-to-allow-for-parallel-execution.patch "
 
 inherit autotools gettext
 
-- 
1.7.10.4


