Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QPpyB-0002m0-7z
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 07:52:23 +0200
Received: by pzk36 with SMTP id 36so663220pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 22:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=I9ZvKqh6+FKdVbWv2b/XzqfHwKISsI6XYRm1cFCabo8=;
	b=bTljBqVqE85FD2g9FYV19dIv4cXrUMi7n4ykMxn6cpuIdA3ko6iswiUCF7EHKMth26
	FsxG+dmlmW3gPZMJIi5+pQuGben6yruv7h640WyoJTKYwSIXUhlsZSGhN1kNAIJXKJ2j
	CAUw7SZkDRoqmhshJmTLBwHy8MI93FYMLiyMQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=glW7+iKSaStgwahFeyJQg0MXMWmyeY43KFydfedtaxRdWx6QXukqDPpL5coMKrnQlT
	Z7lkhtegqAD4t+LpJAeiTmGMiO6Xg8YvllWqsemjHmC0QW0JUzcV85Xm8S+nh9m0vd8E
	J3Pe5UTGaThqQkvmyl0p9flLYGX6DDUk9HKRk=
Received: by 10.68.29.100 with SMTP id j4mr710287pbh.197.1306475358058;
	Thu, 26 May 2011 22:49:18 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id x1sm237666pbb.34.2011.05.26.22.49.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 22:49:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 May 2011 22:49:10 -0700
Message-Id: <6148af9a1476623e4df7e5965de787c8b73792c0.1306475241.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1306475241.git.raj.khem@gmail.com>
References: <cover.1306475241.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] uclibc_git.bb: Fix compilation on arm when using thumb instruction set
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
X-List-Received-Date: Fri, 27 May 2011 05:52:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch    |   33 ++++++++++++++++++++
 .../uclibc-git/compile-arm-fork-with-O2.patch      |   21 ++++++++++++
 meta/recipes-core/uclibc/uclibc_git.bb             |    4 ++-
 3 files changed, 57 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch b/meta/recipes-core/uclibc/uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch
new file mode 100644
index 0000000..edcb4e3
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch
@@ -0,0 +1,33 @@
+UCLIBC_EXTRA_CFLAGS is currently added before the OPTIMIZATION flags
+and OPTIMIZATION is chosen to be Os by default. But in OE we pass the optimisation
+flags through UCLIBC_EXTRA_CFLAGS but they are not effective since -Os is
+specified at last. So we need to change the order of these option flags
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+diff --git a/Rules.mak b/Rules.mak
+index 65fe47c..eca7f40 100644
+--- a/Rules.mak
++++ b/Rules.mak
+@@ -585,9 +574,6 @@ CFLAGS := -include $(top_srcdir)include/libc-symbols.h \
+ 	-nostdinc -I$(top_builddir)include -I$(top_srcdir)include -I. \
+ 	-I$(top_srcdir)libc/sysdeps/linux \
+ 	-I$(top_srcdir)libc/sysdeps/linux/$(TARGET_ARCH)
+-ifneq ($(strip $(UCLIBC_EXTRA_CFLAGS)),"")
+-CFLAGS += $(call qstrip,$(UCLIBC_EXTRA_CFLAGS))
+-endif
+ 
+ # We need this to be checked within libc-symbols.h
+ ifneq ($(HAVE_SHARED),y)
+@@ -633,6 +619,9 @@ LDFLAGS += -Wl,-s
+ else
+ STRIPTOOL := true -Stripping_disabled
+ endif
++ifneq ($(strip $(UCLIBC_EXTRA_CFLAGS)),"")
++CFLAGS += $(call qstrip,$(UCLIBC_EXTRA_CFLAGS))
++endif
+ 
+ ifeq ($(DOMULTI),y)
+ # we try to compile all sources at once into an object (IMA), but
diff --git a/meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch b/meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch
new file mode 100644
index 0000000..429f27d
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/compile-arm-fork-with-O2.patch
@@ -0,0 +1,21 @@
+When compiling in thumb mode for arm with -Os gcc gives up since it can not find registers
+to spill. So we use -O2 option for compiling fork.c It may be addressable is gcc.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
+index 329d8a9..41e3646 100644
+--- a/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
++++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arm/Makefile.arch
+@@ -30,3 +30,9 @@ CFLAGS-OMIT-libc-lowlevellock.c = -DNOT_IN_libc -DIS_IN_libpthread
+ # This macro should be alternatively implemented in THUMB
+ # assembly.
+ ASFLAGS-vfork.S = -marm
++
++# For arm fork.c does not compile with -Os when in compiling
++# in thumb1 mode
++ifeq ($(COMPILE_IN_THUMB_MODE),y)
++CFLAGS-fork.c = -O2
++endif
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index 18619cd..3d5f7a7 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -2,7 +2,7 @@ SRCREV="71d63ed75648da9b0b71afabb9c60aaad792c55c"
 
 require uclibc.inc
 PV = "0.9.31+0.9.32rc3"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 #recent versions uclibc require real kernel headers
@@ -27,5 +27,7 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://argp-support.patch \
 	file://argp-headers.patch \
 	file://remove_attribute_optimize_Os.patch \
+	file://uclibc-git/append_UCLIBC_EXTRA_CFLAGS.patch \
+	file://compile-arm-fork-with-O2.patch \
 	"
 S = "${WORKDIR}/git"
-- 
1.7.4.1



