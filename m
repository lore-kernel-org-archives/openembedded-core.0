Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id DDE1671AD5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 13:14:36 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v3JDEM1J005583
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 15:14:22 +0200
Received: from dev.sbt.siemens.com ([163.242.52.173])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v3JDELE1015663;
	Wed, 19 Apr 2017 15:14:21 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 6B70E3E72;
	Wed, 19 Apr 2017 15:14:21 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 15:13:55 +0200
Message-Id: <1492607635-31569-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [morty] glibc: Security fix CVE-2016-6323
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
X-List-Received-Date: Wed, 19 Apr 2017 13:14:37 -0000

arm: mark __startcontext as .cantunwind, GNU

CVE: CVE-2016-6323
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-core/glibc/glibc/CVE-2016-6323.patch | 39 +++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.24.bb             |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-6323.patch

diff --git a/meta/recipes-core/glibc/glibc/CVE-2016-6323.patch b/meta/recipes-core/glibc/glibc/CVE-2016-6323.patch
new file mode 100644
index 0000000..f9b9fa5
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/CVE-2016-6323.patch
@@ -0,0 +1,39 @@
+glibc-2.24: Fix CVE-2016-6323
+
+[No upstream tracking] -- https://sourceware.org/bugzilla/show_bug.cgi?id=20435
+
+arm: mark __startcontext as .cantunwind, GNU
+
+Glibc bug where the makecontext function would create
+an execution context which is incompatible with the unwinder,
+causing it to hang when the generation of a backtrace is attempted.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=9e2ff6c9cc54c0b4402b8d49e4abe7000fde7617]
+CVE: CVE-2016-6323
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
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
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index f5a21b2..bce06c7 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -37,6 +37,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0026-build_local_scope.patch \
+           file://CVE-2016-6323.patch \
 "
 
 SRC_URI += "\
-- 
2.1.4


