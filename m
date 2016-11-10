Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 95EFA60103
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 07:08:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTP id uAA78T1K009891
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2016 23:08:29 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 9 Nov 2016 23:08:28 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2016 15:01:24 +0800
Message-ID: <439d773a9b9d5275345bd85af7d2074b2916e913.1478760924.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478760924.git.kai.kang@windriver.com>
References: <cover.1478760924.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] glibc: fix CVE-2016-6323
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
X-List-Received-Date: Thu, 10 Nov 2016 07:08:27 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2016-6323 of glibc. And remove the section of
file ChangeLog which can't be applied.

Ref:
https://sourceware.org/bugzilla/show_bug.cgi?id=20435

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...k-__startcontext-as-.cantunwind-bug-20435.patch | 46 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb              |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0027-arm-mark-__startcontext-as-.cantunwind-bug-20435.patch

diff --git a/meta/recipes-core/glibc/glibc/0027-arm-mark-__startcontext-as-.cantunwind-bug-20435.patch b/meta/recipes-core/glibc/glibc/0027-arm-mark-__startcontext-as-.cantunwind-bug-20435.patch
new file mode 100644
index 0000000..95067d3
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0027-arm-mark-__startcontext-as-.cantunwind-bug-20435.patch
@@ -0,0 +1,46 @@
+Backport patch to fix CVE-2016-6323 for glibc. And remove the section of
+ChangeLog which can't be applied.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=9e2ff6c]
+CVE: CVE-2016-6323
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From 9e2ff6c9cc54c0b4402b8d49e4abe7000fde7617 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Mon, 8 Aug 2016 09:29:18 +0200
+Subject: [PATCH] arm: mark __startcontext as .cantunwind (bug 20435)
+
+__startcontext marks the bottom of the call stack of the contexts created
+by makecontext.
+---
+ ChangeLog                                | 6 ++++++
+ sysdeps/unix/sysv/linux/arm/setcontext.S | 7 +++++++
+ 2 files changed, 13 insertions(+)
+
+diff --git a/sysdeps/unix/sysv/linux/arm/setcontext.S b/sysdeps/unix/sysv/linux/arm/setcontext.S
+index 603e508..d1f168f 100644
+--- a/sysdeps/unix/sysv/linux/arm/setcontext.S
++++ b/sysdeps/unix/sysv/linux/arm/setcontext.S
+@@ -86,12 +86,19 @@ weak_alias(__setcontext, setcontext)
+ 
+ 	/* Called when a makecontext() context returns.  Start the
+ 	   context in R4 or fall through to exit().  */
++	/* Unwind descriptors are looked up based on PC - 2, so we have to
++	   make sure to mark the instruction preceding the __startcontext
++	   label as .cantunwind.  */
++	.fnstart
++	.cantunwind
++	nop
+ ENTRY(__startcontext)
+ 	movs    r0, r4
+ 	bne     PLTJMP(__setcontext)
+ 
+ 	@ New context was 0 - exit
+ 	b       PLTJMP(HIDDEN_JUMPTARGET(exit))
++	.fnend
+ END(__startcontext)
+ 
+ #ifdef PIC
+-- 
+2.10.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index f5a21b2..475c133 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -37,6 +37,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0026-build_local_scope.patch \
+           file://0027-arm-mark-__startcontext-as-.cantunwind-bug-20435.patch \
 "
 
 SRC_URI += "\
-- 
2.10.1


