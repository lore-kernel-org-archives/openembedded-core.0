Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3f18-0005r3-4s
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 05:20:34 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so8863245pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 20:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=c7oauj3kADhHnCJMkPJQaAr0yBK5GZyBDDUMxfkjl8I=;
	b=t3kyx4ezUiqLMLaxL7viAln/afKbfDPfPUqcmttYbDOZ67VqhUjio0phSu0P9IY//9
	wd1qtwaDQY0miZD6il13E82un51HB/wXsnUMyAbSZTXw7wUtx6+dbmWm/PD5GyoLsDi4
	hHFJgOT7i55065YTH5scGi/BKto16eg6LMc4rAJViNDjlViFL/L1U/1Ss+vkaBWHuJrJ
	kQPFPNisc51acQkicGOOp/eyn8KbuIPdHJj/fiSwZaC0kTrDqgWq6LrASTQ9oPO/5cnz
	KVEvPISVwKN09mquRzWyW3V22J17+gPcornLEjUIrwQnL03+6i7YiUctH6Syu9BxtjeX
	bYUQ==
Received: by 10.66.77.168 with SMTP id t8mr34533460paw.28.1345518512885;
	Mon, 20 Aug 2012 20:08:32 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nv6sm429804pbc.42.2012.08.20.20.08.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 20:08:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 20:07:54 -0700
Message-Id: <694c6ef0fb25a0c9de0dc381ad38cc238d25c102.1345518098.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
In-Reply-To: <cover.1345518098.git.raj.khem@gmail.com>
References: <cover.1345518098.git.raj.khem@gmail.com>
Subject: [PATCH 4/9] eglibc: Fix eglibc-initial and let eglibc depend on it
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 03:20:34 -0000

eglibc-initial does not need to install fake shared libs
anymore so drop it.

eglibc now should depend on eglibc-initial so that bootstrap
sysroot gets populated properly.

Drop references to gcc intermediate from glibc testing
scripts.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/eglibc/eglibc-initial.inc |   16 +++++++---------
 meta/recipes-core/eglibc/eglibc-testing.inc |    2 +-
 meta/recipes-core/eglibc/eglibc.inc         |   11 +++++++----
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-core/eglibc/eglibc-initial.inc
index 1020e40..3b99ac2 100644
--- a/meta/recipes-core/eglibc/eglibc-initial.inc
+++ b/meta/recipes-core/eglibc/eglibc-initial.inc
@@ -32,6 +32,9 @@ do_install () {
        install-bootstrap-headers=yes install-headers
 
        oe_runmake csu/subdir_lib
+       mkdir -p ${D}${libdir}/
+       install -m 644 csu/crt[1in].o ${D}${libdir}
+
        # Two headers -- stubs.h and features.h -- aren't installed by install-headers,
        # so do them by hand.  We can tolerate an empty stubs.h for the moment.
        # See e.g. http://gcc.gnu.org/ml/gcc/2002-01/msg00900.html
@@ -42,15 +45,10 @@ do_install () {
        if [ -e ${B}/bits/stdio_lim.h ]; then
                cp ${B}/bits/stdio_lim.h  ${D}${includedir}/bits/
        fi
-       mkdir -p ${D}${libdir}/
-       install -m 644 csu/crt[1in].o ${D}${libdir}
-       ${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
-               -o ${D}${libdir}/libc.so
-
-	# add links to linux-libc-headers: gcc-{cross,crossdk}-intermediate need this.
-	for t in linux asm asm-generic; do
-		ln -s ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
-	done
+       # add links to linux-libc-headers: final eglibc build need this.
+       for t in linux asm asm-generic; do
+               ln -s ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
+       done
 }
 
 do_install_locale() {
diff --git a/meta/recipes-core/eglibc/eglibc-testing.inc b/meta/recipes-core/eglibc/eglibc-testing.inc
index a5ce773..ab3ec15 100644
--- a/meta/recipes-core/eglibc/eglibc-testing.inc
+++ b/meta/recipes-core/eglibc/eglibc-testing.inc
@@ -37,7 +37,7 @@ do_compile_append () {
 	sed -i -e "s/\-tcbootstrap//g" ${B}/${HOST_PREFIX}testeglibc
 
 	# use the final cross-gcc to test since some tests need libstdc++
-	sed -i -e "s/^PATH=.*\.gcc-cross-intermediate\:/PATH=/g" ${B}/${HOST_PREFIX}testeglibc
+	sed -i -e "s/^PATH=.*\.gcc-cross-initial\:/PATH=/g" ${B}/${HOST_PREFIX}testeglibc
 
 	# append execution part script
 cat >> ${B}/${HOST_PREFIX}testeglibc << STOP
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 51061bc..02f3c7a 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -2,8 +2,8 @@ require eglibc-common.inc
 require eglibc-ld.inc
 require eglibc-testing.inc
 
-STAGINGCC = "gcc-cross-intermediate"
-STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-intermediate"
+STAGINGCC = "gcc-cross-initial"
+STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-initial"
 PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
@@ -22,7 +22,7 @@ siteconfig_do_siteconfig_gencache_prepend = " \
 "
 
 # nptl needs unwind support in gcc, which can't be built without glibc.
-DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial"
 # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
 #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
 PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
@@ -33,7 +33,10 @@ require eglibc-options.inc
 LEAD_SONAME = "libc.so"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_KSH=${base_bindir}/bash \
-                       ac_cv_path_BASH_SHELL=${base_bindir}/bash"
+                       ac_cv_path_BASH_SHELL=${base_bindir}/bash \
+		       libc_cv_ssp=no \
+		       "
+
 GLIBC_EXTRA_OECONF ?= ""
 GLIBC_EXTRA_OECONF_virtclass-nativesdk = ""
 INHIBIT_DEFAULT_DEPS = "1"
-- 
1.7.9.5



