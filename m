Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB6A26E4CC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 10:37:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s34AbQu2019748
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Apr 2014 03:37:26 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 4 Apr 2014 03:37:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Apr 2014 18:44:09 +0800
Message-ID: <bb5a276942d5bbbc69086a52abd6a21b44978bd1.1396608025.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1396608025.git.liezhi.yang@windriver.com>
References: <cover.1396608025.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux: fix parallel build issue
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
X-List-Received-Date: Fri, 04 Apr 2014 10:37:27 -0000
Content-Type: text/plain

The rule SETARCH_MAN_LINKS is used for the files under the sys-utils
dir, for example:

echo ".so man8/setarch.8" > sys-utils/linux32.8

but it depends on nothing so that the sys-utils dir may not exist, we
can create the sys-utils dir to fix problem.

[YOCTO #6115]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../util-linux/util-linux/fix-parallel-build.patch | 35 ++++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.24.1.bb  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/fix-parallel-build.patch

diff --git a/meta/recipes-core/util-linux/util-linux/fix-parallel-build.patch b/meta/recipes-core/util-linux/util-linux/fix-parallel-build.patch
new file mode 100644
index 0000000..adb271c
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/fix-parallel-build.patch
@@ -0,0 +1,35 @@
+From 774f55f9dd22c01e4041a183d8dff14811f29114 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Fri, 4 Apr 2014 17:33:04 +0800
+Subject: [PATCH] sys-utils/Makemodule.am: fix parallel build issue
+
+The rule SETARCH_MAN_LINKS is used for the files under the sys-utils
+dir, for example:
+
+echo ".so man8/setarch.8" > sys-utils/linux32.8
+
+but it depends on nothing so that the sys-utils dir may not exist, we
+can create the sys-utils dir to fix problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ sys-utils/Makemodule.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sys-utils/Makemodule.am b/sys-utils/Makemodule.am
+index 6265282..62ead37 100644
+--- a/sys-utils/Makemodule.am
++++ b/sys-utils/Makemodule.am
+@@ -124,6 +124,7 @@ man_MANS += $(SETARCH_MAN_LINKS)
+ CLEANFILES += $(SETARCH_MAN_LINKS)
+ 
+ $(SETARCH_MAN_LINKS):
++	$(MKDIR_P) sys-utils
+ 	$(AM_V_GEN)echo ".so man8/setarch.8" > $@
+ 
+ install-exec-hook-setarch:
+-- 
+1.8.2.1
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.24.1.bb b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
index ab80ab6..8b6a1ce 100644
--- a/meta/recipes-core/util-linux/util-linux_2.24.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://uclibc-__progname-conflict.patch \
             file://configure-sbindir.patch \
             file://fix-configure.patch \
+            file://fix-parallel-build.patch \
             ${OLDHOST} \
 "
 
-- 
1.8.3.1


