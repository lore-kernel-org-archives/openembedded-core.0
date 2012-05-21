Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJZq-0005c2-1l
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:34 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so5415613dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=AuZPAFa1x5Ex+2WcAB3zLwZXUCrpl9EaXJyJBoekPTk=;
	b=uT4O5zlAXH7zEQQgZPyTByyRS1KYHxzt4hQdNR7G4XEdb1S4htQrYbBiWY+gMb+Ah8
	q4hVnJ1NCXlHzoQL7AO8usGk8pazcv061Nid5309n2CqugrbMyxqpMXZ1JvLAcAkFK9r
	mqsW8dB0HEhQtgkEdBAbfjC7zcGgNrN+TUjfKeajHIbQ8MhRljuKPCDM03HdiwS/igcK
	EYOquuXdMUe6xcMesnZBHi6EbYyUFmTVVUu/nZQpZSKvNOZIv6PiRPCzJbt8gG6LZRm6
	9AgX1/XH6Bn3JgHf22tWhCck830YsrQTnNREz/F8wq8bHXmmHEQx6Ok6CsN8dma/xhsc
	Wj4A==
Received: by 10.68.225.230 with SMTP id rn6mr6889047pbc.70.1337571388991;
	Sun, 20 May 2012 20:36:28 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm21589703pbc.56.2012.05.20.20.36.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:38 -0700
Message-Id: <253f1f3aebd1a90c55efcc6d1f585204e7f3c371.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
References: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Subject: [PATCH 03/14] gcc-4.6, gcc-4.7: Add support for building mips64 cross compiler
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
X-List-Received-Date: Mon, 21 May 2012 03:46:34 -0000

Defaults to n64 ABI

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    1 +
 .../gcc/gcc-4.6/mips64-default-n64.patch           |   32 ++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 +
 .../gcc/gcc-4.7/mips64-default-n64.patch           |   19 ++++++++++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    4 ++
 5 files changed, 57 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/mips64-default-n64.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/mips64-default-n64.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 65bc65d..7a70a38 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -74,6 +74,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
 	   file://fortran-cross-compile-hack.patch \
 	   file://cpp-honour-sysroot.patch \
+	   file://mips64-default-n64.patch \
 	  "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/mips64-default-n64.patch b/meta/recipes-devtools/gcc/gcc-4.6/mips64-default-n64.patch
new file mode 100644
index 0000000..bf930ec
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6/mips64-default-n64.patch
@@ -0,0 +1,32 @@
+MIPS64 defaults to n32 ABI, this patch makes it
+so that it defaults to N64 ABI
+
+Upstream-Status: Inappropriate [OE config specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: gcc-4_6-branch/gcc/config.gcc
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config.gcc	2012-04-22 19:12:12.431061229 -0700
++++ gcc-4_6-branch/gcc/config.gcc	2012-04-22 19:13:36.307065289 -0700
+@@ -1882,7 +1882,7 @@
+ mips64*-*-linux* | mipsisa64*-*-linux*)
+ 	tm_file="dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h ${tm_file} mips/linux.h mips/linux64.h"
+ 	tmake_file="${tmake_file} mips/t-linux64 mips/t-libgcc-mips16"
+-	tm_defines="${tm_defines} MIPS_ABI_DEFAULT=ABI_N32"
++	tm_defines="${tm_defines} MIPS_ABI_DEFAULT=ABI_64"
+ 	case ${target} in
+ 		mips64el-st-linux-gnu)
+ 			tm_file="${tm_file} mips/st.h"
+Index: gcc-4_6-branch/gcc/config/mips/linux64.h
+===================================================================
+--- gcc-4_6-branch.orig/gcc/config/mips/linux64.h	2012-04-22 19:10:59.743057711 -0700
++++ gcc-4_6-branch/gcc/config/mips/linux64.h	2012-04-22 19:11:56.919060479 -0700
+@@ -26,7 +26,7 @@
+   BASE_DRIVER_SELF_SPECS, \
+   LINUX_DRIVER_SELF_SPECS \
+   " %{!EB:%{!EL:%(endian_spec)}}" \
+-  " %{!mabi=*: -mabi=n32}"
++  " %{!mabi=*: -mabi=64}"
+ 
+ #undef LIB_SPEC
+ #define LIB_SPEC "\
diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 8adeb8d..efd166c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -64,6 +64,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://fortran-cross-compile-hack.patch \
 	   file://libgcc-sjlj-check.patch \
 	   file://cpp-honor-sysroot.patch \
+	   file://mips64-default-n64.patch \
 	  "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/mips64-default-n64.patch b/meta/recipes-devtools/gcc/gcc-4.7/mips64-default-n64.patch
new file mode 100644
index 0000000..a42569e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/mips64-default-n64.patch
@@ -0,0 +1,19 @@
+MIPS64 defaults to n32 ABI, this patch makes it
+so that it defaults to N64 ABI
+
+Upstream-Status: Inappropriate [OE config specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: gcc-4_7-branch/gcc/config.gcc
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config.gcc	2012-04-22 19:30:21.000000000 -0700
++++ gcc-4_7-branch/gcc/config.gcc	2012-04-22 21:09:57.783403173 -0700
+@@ -1750,7 +1750,7 @@
+ mips64*-*-linux* | mipsisa64*-*-linux*)
+ 	tm_file="dbxelf.h elfos.h gnu-user.h linux.h glibc-stdint.h ${tm_file} mips/gnu-user.h mips/gnu-user64.h mips/linux64.h"
+ 	tmake_file="${tmake_file} mips/t-linux64"
+-	tm_defines="${tm_defines} MIPS_ABI_DEFAULT=ABI_N32"
++	tm_defines="${tm_defines} MIPS_ABI_DEFAULT=ABI_64"
+ 	case ${target} in
+ 		mips64el-st-linux-gnu)
+ 			tm_file="${tm_file} mips/st.h"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index a812b98..4d11ef4 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -49,6 +49,10 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', True) !=
 # Build uclibc compilers without cxa_atexit support
 EXTRA_OECONF_append_linux               = " --enable-__cxa_atexit"
 EXTRA_OECONF_append_libc-uclibc        = " --enable-__cxa_atexit"
+
+EXTRA_OECONF_append_mips64    = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
+EXTRA_OECONF_append_mips64el    = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
+
 EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
 CPPFLAGS = ""
 
-- 
1.7.5.4



