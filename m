Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B336D612E5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 21:30:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB2LUn70029650
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Dec 2015 13:30:49 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 2 Dec 2015 13:30:48 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Dec 2015 15:30:45 -0600
Message-ID: <1449091845-168695-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449091845-168695-1-git-send-email-mark.hatle@windriver.com>
References: <1449091845-168695-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [v2 PATCH 2/2] rpm: fix file conflicts for MIPS64 N32
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
X-List-Received-Date: Wed, 02 Dec 2015 21:30:50 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

The following error can occur:
  smart install libc6-2.22-r0.1@lib32_mips32r2octeon3 libc6-dbg-2.22-r0.1@lib32_mips32r2octeon3
error: file /sbin/ldconfig conflicts between attempted installs of libc6-2.22-r0.1.lib32_mips32r2octeon3 and libc6-2.22-r0.1.octeon3_n32
error: file /sbin/.debug/ldconfig conflicts between attempted installs of libc6-dbg-2.22-r0.1.lib32_mips32r2octeon3 and libc6-dbg-2.22-r0.1.octeon3_n32

This was because:
transactions_color = 001 (ELF32) & 010 (ELF64) & 100 (ELF32 N32 MIPS64)
FColor = Current file color (001) & transaction_color (111)
oFcolor = Previous file color (100) & transaction_color (111)

There are two places where the conflict comparisons occur.  In both places
the 'else' clause was too restrictive (opposite of the 'positive' clause).
This caused the system to only permit a binary comparison - "new preferred" or
"old preferred".  It did not permissing "neither preferred".  By removing the
else comparison the system will now perform a 'last-in-wins' resolution when
"neither is preferred".

Note, if _transaction_color is 3, MIPS64 N32 will be skipped (pretend as
installed).

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 ...ction.c-fix-file-conflicts-for-mips64-N32.patch | 52 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch b/meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
new file mode 100644
index 0000000..ed5d8a7
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
@@ -0,0 +1,52 @@
+From 67ec7531e6297200eaa97ef917d49b0a75876cb4 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 2 Dec 2015 00:56:07 -0800
+Subject: [PATCH] lib/transaction.c: fix file conflicts for MIPS64 N32
+
+The following error can occur:
+  smart install libc6-2.22-r0.1@lib32_mips32r2octeon3 libc6-dbg-2.22-r0.1@lib32_mips32r2octeon3
+error: file /sbin/ldconfig conflicts between attempted installs of libc6-2.22-r0.1.lib32_mips32r2octeon3 and libc6-2.22-r0.1.octeon3_n32
+error: file /sbin/.debug/ldconfig conflicts between attempted installs of libc6-dbg-2.22-r0.1.lib32_mips32r2octeon3 and libc6-dbg-2.22-r0.1.octeon3_n32
+
+This was because:
+transactions_color = 001 (ELF32) & 010 (ELF64) & 100 (ELF32 N32 MIPS64)
+FColor = Current file color (001) & transaction_color (111)
+oFcolor = Previous file color (100) & transaction_color (111)
+
+There are two places where the conflict comparisons occur.  In both places
+the 'else' clause was too restrictive (opposite of the 'positive' clause).
+This caused the system to only permit a binary comparison - "new preferred" or
+"old preferred".  It did not permissing "neither preferred".  By removing the
+else comparison the system will now perform a 'last-in-wins' resolution when
+"neither is preferred".
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+---
+ lib/transaction.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: rpm-5.4.14/lib/transaction.c
+===================================================================
+--- rpm-5.4.14.orig/lib/transaction.c
++++ rpm-5.4.14/lib/transaction.c
+@@ -154,7 +154,7 @@ static int handleInstInstalledFile(const
+ 		fi->actions[fx] = FA_SKIPCOLOR;
+ #endif
+ 		rConflicts = 0;
+-	    } else if (FColor & prefcolor) {
++	    } else {
+ #ifdef	REFERENCE
+ 		rpmfsSetAction(fs, fx, FA_CREATE);
+ #else
+@@ -420,7 +420,7 @@ assert(otherFi != NULL);
+ 			fi->actions[i] = FA_SKIPCOLOR;
+ 			rConflicts = 0;
+ 		    } else
+-		    if (FColor == 0 && oFColor == 0) {
++		    {
+ 			/* ... otherwise, do both, last in wins. */
+ 			otherFi->actions[otherFileNum] = FA_CREATE;
+ 			fi->actions[i] = FA_CREATE;
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index e22d208..09baac0 100644
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
2.5.0


