Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 7B08560102
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 10:37:20 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v3LAbGme022045
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:37:16 +0200
Received: from dev.sbt.siemens.com ([163.242.52.173])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v3LAbGaR003977;
	Fri, 21 Apr 2017 12:37:16 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id A9E943E73;
	Fri, 21 Apr 2017 12:37:15 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 12:37:03 +0200
Message-Id: <1492771023-8995-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][krogoth] glibc: Security fix CVE-2016-6323
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
X-List-Received-Date: Fri, 21 Apr 2017 10:37:25 -0000

arm: mark __startcontext as .cantunwind, GNU

CVE: CVE-2016-6323
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-core/glibc/glibc/CVE-2016-6323.patch | 39 +++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.23.bb             |  1 +
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
diff --git a/meta/recipes-core/glibc/glibc_2.23.bb b/meta/recipes-core/glibc/glibc_2.23.bb
index 85b5215..3844587 100644
--- a/meta/recipes-core/glibc/glibc_2.23.bb
+++ b/meta/recipes-core/glibc/glibc_2.23.bb
@@ -41,6 +41,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://CVE-2016-1234.patch \
            file://CVE-2016-3075.patch \
            file://CVE-2016-5417.patch \
+           file://CVE-2016-6323.patch \
 "
 
 SRC_URI += "\
-- 
2.1.4


