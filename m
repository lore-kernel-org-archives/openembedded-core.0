Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B88A6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:17:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBL6HHUJ025421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:17:17 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 20 Dec 2016 22:17:16 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Dec 2016 22:17:12 -0800
Message-ID: <6efb8d002491cd1e736b9126e09a5a63b4acd4d1.1482300982.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1482300982.git.liezhi.yang@windriver.com>
References: <cover.1482300982.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] hdparm: 9.48 -> 9.50
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
X-List-Received-Date: Wed, 21 Dec 2016 06:17:15 -0000
Content-Type: text/plain

Add 0001-Makefile-use-weak-assignment-for-LDFALGS.patch to fix issues like:
ERROR: hdparm-9.50-r0 do_package: QA Issue: File '/sbin/hdparm.hdparm' from hdparm was already stripped, this will prevent future debugging! [already-stripped]
ERROR: hdparm-9.50-r0 do_package: Fatal QA errors found, failing task.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...-Makefile-use-weak-assignment-for-LDFALGS.patch | 30 ++++++++++++++++++++++
 .../hdparm/{hdparm_9.48.bb => hdparm_9.50.bb}      |  8 +++---
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/hdparm/hdparm/0001-Makefile-use-weak-assignment-for-LDFALGS.patch
 rename meta/recipes-extended/hdparm/{hdparm_9.48.bb => hdparm_9.50.bb} (80%)

diff --git a/meta/recipes-extended/hdparm/hdparm/0001-Makefile-use-weak-assignment-for-LDFALGS.patch b/meta/recipes-extended/hdparm/hdparm/0001-Makefile-use-weak-assignment-for-LDFALGS.patch
new file mode 100644
index 00000000000..f74da5f18c9
--- /dev/null
+++ b/meta/recipes-extended/hdparm/hdparm/0001-Makefile-use-weak-assignment-for-LDFALGS.patch
@@ -0,0 +1,30 @@
+From 9532fbaade3b08cef936723a6a5adf191881edbf Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 19 Dec 2016 22:36:16 -0800
+Subject: [PATCH] Makefile: use weak assignment for LDFALGS
+
+So that it can use LDFLAGS from env vars.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 05a1f78..60b67d9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -15,7 +15,7 @@ STRIP ?= strip
+ 
+ CFLAGS := -O2 -W -Wall -Wbad-function-cast -Wcast-align -Wpointer-arith -Wcast-qual -Wshadow -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -fkeep-inline-functions -Wwrite-strings -Waggregate-return -Wnested-externs -Wtrigraphs $(CFLAGS)
+ 
+-LDFLAGS = -s
++LDFLAGS ?= -s
+ #LDFLAGS = -s -static
+ INSTALL = install
+ INSTALL_DATA = $(INSTALL) -m 644
+-- 
+2.10.2
+
diff --git a/meta/recipes-extended/hdparm/hdparm_9.48.bb b/meta/recipes-extended/hdparm/hdparm_9.50.bb
similarity index 80%
rename from meta/recipes-extended/hdparm/hdparm_9.48.bb
rename to meta/recipes-extended/hdparm/hdparm_9.50.bb
index cd85776cf8f..d1f10027cc9 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.48.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.50.bb
@@ -20,10 +20,12 @@ FILES_wiper = "${bindir}/wiper.sh"
 
 RDEPENDS_wiper = "bash gawk stat"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz "
+SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
+           file://0001-Makefile-use-weak-assignment-for-LDFALGS.patch \
+"
 
-SRC_URI[md5sum] = "213efdbe7471fad3408198918e164354"
-SRC_URI[sha256sum] = "ce97b4a71cb04146f54cf6f69787e7f97ddfda9836dc803b459d3b3df3a4fbee"
+SRC_URI[md5sum] = "d380062ad6c4b40076736efbb640f1f5"
+SRC_URI[sha256sum] = "0892b44bd817c251264a24f6ecbbb010958033e0395d2030f25f1c5608ac780e"
 
 EXTRA_OEMAKE = '-e MAKEFLAGS= STRIP="echo"'
 
-- 
2.11.0.rc2.dirty


