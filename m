Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1QnTNF-0007Zf-Iq
	for openembedded-core@lists.openembedded.org;
	Sun, 31 Jul 2011 12:35:57 +0200
Received: by wwi18 with SMTP id 18so4033755wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jul 2011 03:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=BKhmhikgI+Wdj9Y/YFONf2n6pot5KFBix/9KQuWxIpc=;
	b=U0o8xPIO7wTzXa37C1F+ubeWMhYa0Y5VpgtabY8b7yH2WEkgdbwLPeNGmDNG8wLPtj
	dGy3ePpbrbkEtaQ2HgGe4D5TtY3n7o1x1d58e6O4DgqnJ0sNU0j9sJneuByQF/pmUO+b
	We7bwZXLMpFYtPr8+tWQ7URErv4kVg+312wsc=
Received: by 10.227.55.82 with SMTP id t18mr3748434wbg.23.1312108298297;
	Sun, 31 Jul 2011 03:31:38 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id l68sm2594307weq.10.2011.07.31.03.31.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 31 Jul 2011 03:31:35 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 31 Jul 2011 14:31:23 +0400
Message-Id: <1312108283-11264-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH] eglibc: fix build for armv4 machines
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 31 Jul 2011 10:35:57 -0000

eglibc builds for arm-eabi unconditionally enables the libc-do-syscall.S
file, which contains thumb assembly. It's unused in arm-eabi-nothumb case,
so just ifdef the actual code.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 .../eglibc-fixup-arm-eabi-nothumb.patch            |   17 +++++++++++++++++
 .../eglibc-fixup-arm-eabi-nothumb.patch            |   17 +++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.12.bb            |    3 ++-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 ++-
 4 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.12/eglibc-fixup-arm-eabi-nothumb.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/eglibc-fixup-arm-eabi-nothumb.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.12/eglibc-fixup-arm-eabi-nothumb.patch b/meta/recipes-core/eglibc/eglibc-2.12/eglibc-fixup-arm-eabi-nothumb.patch
new file mode 100644
index 0000000..e189b23
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.12/eglibc-fixup-arm-eabi-nothumb.patch
@@ -0,0 +1,17 @@
+Index: libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
+===================================================================
+--- libc.orig/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S	2011-07-31 12:07:13.000000000 +0400
++++ libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S	2011-07-31 12:08:30.000000000 +0400
+@@ -25,6 +25,7 @@
+    ARM unwind tables for register to register moves, the actual opcodes
+    are not defined.  */
+ 
++#ifdef __thumb__
+ 	.thumb
+ 	.syntax unified
+ 	.hidden __libc_do_syscall
+@@ -41,3 +42,4 @@
+ 	pop	{r7, pc}
+ 	.fnend
+ END (__libc_do_syscall)
++#endif
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/eglibc-fixup-arm-eabi-nothumb.patch b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-fixup-arm-eabi-nothumb.patch
new file mode 100644
index 0000000..e189b23
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/eglibc-fixup-arm-eabi-nothumb.patch
@@ -0,0 +1,17 @@
+Index: libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
+===================================================================
+--- libc.orig/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S	2011-07-31 12:07:13.000000000 +0400
++++ libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S	2011-07-31 12:08:30.000000000 +0400
+@@ -25,6 +25,7 @@
+    ARM unwind tables for register to register moves, the actual opcodes
+    are not defined.  */
+ 
++#ifdef __thumb__
+ 	.thumb
+ 	.syntax unified
+ 	.hidden __libc_do_syscall
+@@ -41,3 +42,4 @@
+ 	pop	{r7, pc}
+ 	.fnend
+ END (__libc_do_syscall)
++#endif
diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index 1ada892..eb7d220 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -1,7 +1,7 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native"
-PR = "r20"
+PR = "r21"
 
 SRCREV = "14158"
 
@@ -11,6 +11,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://IO-acquire-lock-fix.patch \
            file://shorten-build-commands.patch \
            file://mips-rld-map-check.patch \
+           file://eglibc-fixup-arm-eabi-nothumb.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
 	  "
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 41fe7c7..e54692b 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "14157"
 
 DEPENDS += "gperf-native"
-PR = "r9"
+PR = "r10"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
@@ -13,6 +13,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://shorten-build-commands.patch \
            file://mips-rld-map-check.patch \
            file://stack-protector-test.patch \
+           file://eglibc-fixup-arm-eabi-nothumb.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
            file://glibc_bug_fix_12454.patch \
-- 
1.7.2.3



