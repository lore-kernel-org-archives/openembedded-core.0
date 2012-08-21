Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3f1E-00060B-0u
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 05:20:40 +0200
Received: by dajt11 with SMTP id t11so2214665daj.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 20:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=SbdVyZrvVF3nbF2GVqd7FS23zTAaw6BveVcRHEjea5k=;
	b=cynWmTABynY70Vlqir9O+ZFqHahfUim8x9wP9puILY67RBG0Z7muMSyj8s+loulBCR
	uaSGXS03qbSoWQR2Tvq+dbnM8gXALNBgIIY/l24Z2+CQGYHVvIE+W3IM7EwaHtKp13f8
	6zQRzY4z6RFJigJCjJXIJfX713a1TGJHr+cl9/xCFA5Y6whtW0lVidCpJ/XYPDQtsS4i
	/oWXVpNDBSBZ/+u3dL2hXJK94Pwy+PFotqZu/dJdhUfzVUi8ZNm8rqdZpBm+CiNl5Hqj
	+QuGImYvyOemBDrBwB5PGjDlQj4rBpWDPnaBdH/Tk8H4Tlu125bVpkespVMW7PmvdoG3
	4wAA==
Received: by 10.66.76.130 with SMTP id k2mr34488839paw.19.1345518515808;
	Mon, 20 Aug 2012 20:08:35 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nv6sm429804pbc.42.2012.08.20.20.08.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 20:08:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2012 20:07:56 -0700
Message-Id: <24d1377f59190fadc94f8c9478a1ad78c2130bc3.1345518098.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
References: <7dacdb4ffd32fe781e4cd0c54b428cf86b96b693.1345518098.git.raj.khem@gmail.com>
In-Reply-To: <cover.1345518098.git.raj.khem@gmail.com>
References: <cover.1345518098.git.raj.khem@gmail.com>
Subject: [PATCH 6/9] uclibc: Use gcc-cross-initial as staging compiler
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
X-List-Received-Date: Tue, 21 Aug 2012 03:20:40 -0000

Do not build fake shared libraries during uclibc-initial phase

Let uclibc depend on gcc-cross-initial instead of gcc-cross-intermediate
thereby set stage to remove gcc-cross-intermediate

Let uclibc depend on uclibc-initial so that boostrap sysroot
gets populated properly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb |   10 +++-------
 meta/recipes-core/uclibc/uclibc-initial_git.bb    |   10 +++-------
 meta/recipes-core/uclibc/uclibc_0.9.33.bb         |    7 ++++---
 meta/recipes-core/uclibc/uclibc_git.bb            |    7 ++++---
 4 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb b/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
index 51afab2..211d530 100644
--- a/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
+++ b/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
@@ -15,19 +15,15 @@ do_install() {
 	# Install initial headers into the cross dir
 	make PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
 		install_headers install_startfiles
-	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
-		-o lib/libc.so
-	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
-		-o lib/libm.so
-	install -d ${D}${libdir}
-	install -m 755 lib/lib[cm].so ${D}${libdir}
-	# add links to linux-libc-headers: gcc-{cross,crossdk}-intermediate need this.
+
+        # add links to linux-libc-headers: final uclibc build need this.
         for t in linux asm asm-generic; do
                 if [ -d ${D}${includedir}/$t ]; then
                     rm -rf ${D}${includedir}/$t
                 fi
                 ln -sf ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
         done
+
 }
 do_compile() {
 	:
diff --git a/meta/recipes-core/uclibc/uclibc-initial_git.bb b/meta/recipes-core/uclibc/uclibc-initial_git.bb
index 2226d25..6fd7529 100644
--- a/meta/recipes-core/uclibc/uclibc-initial_git.bb
+++ b/meta/recipes-core/uclibc/uclibc-initial_git.bb
@@ -15,19 +15,15 @@ do_install() {
 	# Install initial headers into the cross dir
 	make PREFIX=${D} DEVEL_PREFIX=${prefix}/ RUNTIME_PREFIX=/ \
 		install_headers install_startfiles
-	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
-		-o lib/libc.so
-	${CC} -nostdlib -nostartfiles -shared -x c /dev/null \
-		-o lib/libm.so
-	install -d ${D}${libdir}
-	install -m 755 lib/lib[cm].so ${D}${libdir}
-	# add links to linux-libc-headers: gcc-{cross,crossdk}-intermediate need this.
+
+        # add links to linux-libc-headers: final uclibc build need this.
         for t in linux asm asm-generic; do
                 if [ -d ${D}${includedir}/$t ]; then
                     rm -rf ${D}${includedir}/$t
                 fi
                 ln -sf ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
         done
+
 }
 do_compile() {
 	:
diff --git a/meta/recipes-core/uclibc/uclibc_0.9.33.bb b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
index c863896..8deedd3 100644
--- a/meta/recipes-core/uclibc/uclibc_0.9.33.bb
+++ b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
@@ -4,11 +4,12 @@ require uclibc.inc
 require uclibc-package.inc
 require uclibc-${PV}.inc
 
-STAGINGCC = "gcc-cross-intermediate"
-STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-intermediate"
+STAGINGCC = "gcc-cross-initial"
+STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-initial"
 
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
-           virtual/${TARGET_PREFIX}gcc-intermediate \
+           virtual/${TARGET_PREFIX}gcc-initial \
+           virtual/${TARGET_PREFIX}libc-initial \
            linux-libc-headers ncurses-native"
 
 PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index 4e5b830..2a60947 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -4,13 +4,14 @@ require uclibc.inc
 require uclibc-package.inc
 require uclibc-git.inc
 
-STAGINGCC = "gcc-cross-intermediate"
-STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-intermediate"
+STAGINGCC = "gcc-cross-initial"
+STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-initial"
 
 PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
-           virtual/${TARGET_PREFIX}gcc-intermediate \
+           virtual/${TARGET_PREFIX}gcc-initial \
+           virtual/${TARGET_PREFIX}libc-initial \
            linux-libc-headers ncurses-native"
 
 RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
-- 
1.7.9.5



