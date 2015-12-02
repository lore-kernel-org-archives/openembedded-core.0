Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93367605FF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 13:33:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB2DX0AY031232
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Dec 2015 05:33:00 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 2 Dec 2015 05:33:00 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Dec 2015 05:32:58 -0800
Message-ID: <3c0e2c74e4a3b791b699bd236ceedefae2bb25c2.1449063064.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1449063064.git.liezhi.yang@windriver.com>
References: <cover.1449063064.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] rpm: fix file conflicts for MIPS64 N32
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
X-List-Received-Date: Wed, 02 Dec 2015 13:33:00 -0000
Content-Type: text/plain

Fixed:
1) set %_transaction_color 7 in lib/rpm/macros to install MIPS64 N32
2) smart install libc6-2.22-r0.1@lib32_mips32r2octeon3 libc6-dbg-2.22-r0.1@lib32_mips32r2octeon3
error: file /sbin/ldconfig conflicts between attempted installs of libc6-2.22-r0.1.lib32_mips32r2octeon3 and libc6-2.22-r0.1.octeon3_n32
error: file /sbin/.debug/ldconfig conflicts between attempted installs of libc6-dbg-2.22-r0.1.lib32_mips32r2octeon3 and libc6-dbg-2.22-r0.1.octeon3_n32

This was because when elf file is MIPS64 N32:
FColor = 0x100 & 111 = 100
Now 100 != 0 then error happened, the similar to oFColor. Check whether
FColor == 4 will fix the problem.

Note, if _transaction_color is 3, MIPS64 N32 will be skipped (pretend as
installed).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...ction.c-fix-file-conflicts-for-mips64-N32.patch |   43 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch b/meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
new file mode 100644
index 0000000..150afcf
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
@@ -0,0 +1,43 @@
+From 67ec7531e6297200eaa97ef917d49b0a75876cb4 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 2 Dec 2015 00:56:07 -0800
+Subject: [PATCH] lib/transaction.c: fix file conflicts for MIPS64 N32
+
+Fixed:
+1) set %_transaction_color 7 in lib/rpm/macros to install MIPS64 N32
+2) smart install libc6-2.22-r0.1@lib32_mips32r2octeon3 libc6-dbg-2.22-r0.1@lib32_mips32r2octeon3
+error: file /sbin/ldconfig conflicts between attempted installs of libc6-2.22-r0.1.lib32_mips32r2octeon3 and libc6-2.22-r0.1.octeon3_n32
+error: file /sbin/.debug/ldconfig conflicts between attempted installs of libc6-dbg-2.22-r0.1.lib32_mips32r2octeon3 and libc6-dbg-2.22-r0.1.octeon3_n32
+
+This was because when elf file is MIPS64 N32:
+FColor = 0x100 & 111 = 100
+Now 100 != 0 then error happened, the similar to oFColor. Check whether
+FColor == 4 will fix the problem.
+
+Note, if _transaction_color is 3, MIPS64 N32 will be skipped (pretend as
+installed).
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ lib/transaction.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/transaction.c b/lib/transaction.c
+index fa60006..c4d84bb 100644
+--- a/lib/transaction.c
++++ b/lib/transaction.c
+@@ -420,7 +420,8 @@ assert(otherFi != NULL);
+ 			fi->actions[i] = FA_SKIPCOLOR;
+ 			rConflicts = 0;
+ 		    } else
+-		    if (FColor == 0 && oFColor == 0) {
++		    /* ... 4 is for MIPS64 N32, and prefcolor != 4 goes here. ... */
++		    if ((FColor == 0 && oFColor == 0) || FColor == 4 || oFColor == 4) {
+ 			/* ... otherwise, do both, last in wins. */
+ 			otherFi->actions[otherFileNum] = FA_CREATE;
+ 			fi->actions[i] = FA_CREATE;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index b0e67c5..56f36bf 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -102,6 +102,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://configure.ac-check-for-both-gpg2-and-gpg.patch \
 	   file://0001-define-EM_AARCH64.patch \
 	   file://rpm-rpmfc.c-fix-for-N32-MIPS64.patch \
+	   file://rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.7.9.5


