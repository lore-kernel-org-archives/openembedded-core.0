Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qodok-0000t8-RU
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:57:11 +0200
Received: by gyg4 with SMTP id 4so250918gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2011 08:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=1s/yztxraBymWHMfud1vlW+s3JqbaSC8PfnTF2/xnZ8=;
	b=M6FCNgOnP3NCeGaXYupqim5Qaj5j6I2z0cAB4wPjYpfisPs6uD7MktG+vFZp60ujC2
	9WE6j08FaiPYYQ9Y5wqW2J+rK3CaSTE1K71yAckAtsoLrL14p0Pa+G8LeCzL9uFTT+j4
	uOzIf2U5jyOyEZfQ3+eWr2uOD9azefKqC6yU0=
Received: by 10.142.224.15 with SMTP id w15mr4820207wfg.159.1312386767396;
	Wed, 03 Aug 2011 08:52:47 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id m7sm1180226pbk.54.2011.08.03.08.52.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Aug 2011 08:52:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 08:54:18 -0700
Message-Id: <1312386858-14084-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] gcc: Fix setting of GLIBC_DYNAMIC_LINKER
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
X-List-Received-Date: Wed, 03 Aug 2011 15:57:11 -0000

From: Kumar Gala <galak@kernel.crashing.org>

The sed regex in do_configure_prepend was producing the following result:

 #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "/lib64/ld-linux-x86-64.so.2"

instead of removing the leading "/lib" or "/lib64".

Now we have it do:

 #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"

Additionally, with the regex fixed the manipulation of SYSTEMLIBS_DIR
needs to be removed.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   12 ++++++++----
 meta/recipes-devtools/gcc/gcc_4.5.1.bb             |    2 +-
 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb    |    2 +-
 4 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 6956677..7d8170c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r2"
+PR = "r3"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 9f5ba33..869d1b6 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -64,11 +64,15 @@ SYSTEMLIBS1 = "${target_libdir}/"
 do_configure_prepend () {
 	# Change the default dynamic linker path, only useful for SDK, other's value
 	# are not changed according to the SYSTEMLIBS_DIR
+	#
+	# We want something like the following:
+	# 	#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
+	# becomes
+	#	#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
+	#
 	sed -i ${S}/gcc/config/*/linux*.h -e \
-		's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 SYSTEMLIBS_DIR\2#'
+		's#\(GLIBC_DYNAMIC_LINKER[^ ]*\) \( *"/lib.*\)/\(.*\)#\1 SYSTEMLIBS_DIR "\3#'
 
-	SYSTEMLIBS_DIR=`dirname ${SYSTEMLIBS}`
-	[ "$SYSTEMLIBS_DIR" = "/" ] && SYSTEMLIBS_DIR=""
 	# teach gcc to find correct target includedir when checking libc ssp support
 	mkdir -p ${B}/gcc
 	echo "NATIVE_SYSTEM_HEADER_DIR = ${SYSTEMHEADERS}" > ${B}/gcc/t-oe
@@ -83,7 +87,7 @@ do_configure_prepend () {
 #ifndef STANDARD_STARTFILE_PREFIX_2
 #define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
 #endif
-#define SYSTEMLIBS_DIR "$SYSTEMLIBS_DIR"
+#define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
 #endif /* ! GCC_DEFAULTS_H */
 _EOF
 	mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
diff --git a/meta/recipes-devtools/gcc/gcc_4.5.1.bb b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
index 12e42c4..f036cb1 100644
--- a/meta/recipes-devtools/gcc/gcc_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/gcc_4.5.1.bb
@@ -1,4 +1,4 @@
-PR = "r7"
+PR = "r8"
 require gcc-${PV}.inc
 require gcc-configure-target.inc
 require gcc-package-target.inc
diff --git a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
index 2df12ef..9fd2b0a 100644
--- a/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
+++ b/meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb
@@ -1,4 +1,4 @@
-PR = "r4"
+PR = "r5"
 
 require gcc-${PV}.inc
 require gcc-configure-target.inc
-- 
1.7.4.1



