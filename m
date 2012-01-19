Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RnxwJ-0000ts-M7 for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 20:46:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JJcm1F010231
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 19:38:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09626-07 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 19:38:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JJceXS010225
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 19:38:41 GMT
Message-ID: <1327001920.23015.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jan 2012 19:38:40 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] gcc: Ensure that the shared source directory shared the same sstate hashes
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
X-List-Received-Date: Thu, 19 Jan 2012 19:46:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The fetch/unpack/patch/headerfix tasks are shared and hence their sstate hashes
should also match. Sadly this is not the case since:

a) gcc-runtime applies an additional patch
b) The do_headerfix task was missing from libgcc
c) The do_headerfix task is a shell task and hence depends
   on all exported variables which can vary between cross and target
   recipes.

To fix this, the patch moves the patch to the common code, adds
the headerfix task to a common include file and disabled shell
dependencies on the do_headerfix task since its clear in this case
we don't need thsoe dependencies since we just call sed.

With this patch applied, all these recipes now share common sstate checksums.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 4bbb2d2..a76fa0b 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -73,6 +73,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://pr47551.patch \
 	   file://gcc-arm-set-cost.patch \
 	   file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
+	   file://fortran-cross-compile-hack.patch \
 	  "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index fe112d9..ed41b0f 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -88,3 +88,20 @@ python workshared_clean () {
 	bb.note("Removing " + dir)
 	oe.path.remove(dir)
 }
+
+do_headerfix () {
+	# Change the default dynamic linker path, in case $base_liddir is non-standard
+	# (e.g. in multilib or sdk cases)
+	#
+	# We want something like the following:
+	# 	#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
+	# becomes
+	#	#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
+	#
+	sed -i ${S}/gcc/config/*/linux*.h -e \
+		's#\(GLIBC_DYNAMIC_LINKER[^ ]*\) \( *"/lib.*\)/\(.*\)#\1 SYSTEMLIBS_DIR "\3#'
+}
+
+addtask headerfix after do_unpack before do_patch
+
+do_headerfix[vardepvalue] = "PATH"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index d014980..c4b6ac1 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -62,21 +62,6 @@ SYSTEMHEADERS = "${target_includedir}"
 SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
 
-do_headerfix () {
-	# Change the default dynamic linker path, in case $base_liddir is non-standard
-	# (e.g. in multilib or sdk cases)
-	#
-	# We want something like the following:
-	# 	#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld-linux-x86-64.so.2"
-	# becomes
-	#	#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
-	#
-	sed -i ${S}/gcc/config/*/linux*.h -e \
-		's#\(GLIBC_DYNAMIC_LINKER[^ ]*\) \( *"/lib.*\)/\(.*\)#\1 SYSTEMLIBS_DIR "\3#'
-}
-
-addtask headerfix after do_unpack before do_patch
-
 do_configure_prepend () {
 	# teach gcc to find correct target includedir when checking libc ssp support
 	mkdir -p ${B}/gcc
diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.6.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.6.bb
index 568b5af..97468db 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_4.6.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.6.bb
@@ -2,8 +2,6 @@ require gcc-${PV}.inc
 require gcc-configure-runtime.inc
 require gcc-package-runtime.inc
 
-SRC_URI_append = "file://fortran-cross-compile-hack.patch"
-
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
 EXTRA_OECONF += "--disable-libunwind-exceptions"




