Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2AE718E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 17:17:03 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id et14so27601790pad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 09:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rViaxi8Zqax6GgSxFEfS4lvXiXSipmYqj7udlavOGAI=;
	b=cmtTJAc7gR7SsNCtL9uVk2NyiTsGrOkhv/rO/NKpCOiy8Jga5jNM3se5uErkB7hW4S
	Kr0BFNiXQk81/ImoCgNebz6Q0Twey30iAisRJS/aEa89YnQa+rNdZywiuze7O4h9kKUa
	XpiKKAGzFn0c38Q44kbJyVP2OZYyLsNRvMBAsxJKl0cluS+iB/cHU8M8MTKycvanOZ3d
	/qj8nOvdR9I6bNhgeFnQOjjRJOILZilNCuo9J6CwctSM4ky93BcsPLSF5Vrun5LIlAKk
	kj4m/ztrG9/INT5bV2IMJUJbxGjF0akwxZOlIze0awomF2OgoSPpJmYdZdopa+jW0Zmv
	bgfQ==
X-Received: by 10.70.100.202 with SMTP id fa10mr7428150pdb.131.1422465424069; 
	Wed, 28 Jan 2015 09:17:04 -0800 (PST)
Received: from haswell.localdomain (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id qm7sm5280013pbc.46.2015.01.28.09.17.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Jan 2015 09:17:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 09:20:38 -0800
Message-Id: <1422465638-28313-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.2.2
Subject: [PATCH 3/5 V2] pigz: Upgrade to 2.3.3
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
X-List-Received-Date: Wed, 28 Jan 2015 17:17:07 -0000

Fix build issues due to libz being required but
is specified before use.

Change-Id: I1f26c8e656b330a4b5f1eeffee7ac13500fa98d0
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/pigz/pigz.inc                | 24 +++++++-------
 meta/recipes-extended/pigz/pigz/link-order.patch   | 38 ++++++++++++++++++++++
 .../pigz/{pigz_2.3.1.bb => pigz_2.3.3.bb}          |  6 ++--
 3 files changed, 54 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-extended/pigz/pigz/link-order.patch
 rename meta/recipes-extended/pigz/{pigz_2.3.1.bb => pigz_2.3.3.bb} (51%)

diff --git a/meta/recipes-extended/pigz/pigz.inc b/meta/recipes-extended/pigz/pigz.inc
index d313f2f..b5caa95 100644
--- a/meta/recipes-extended/pigz/pigz.inc
+++ b/meta/recipes-extended/pigz/pigz.inc
@@ -7,23 +7,23 @@ HOMEPAGE = "http://zlib.net/pigz/"
 SECTION = "console/utils"
 LICENSE = "Zlib & Apache-2.0"
 
-SRC_URI = "http://zlib.net/pigz/pigz-${PV}.tar.gz"
+SRC_URI = "http://zlib.net/${BPN}/${BP}.tar.gz"
 
 PROVIDES_class-native += "gzip-native"
 
 DEPENDS = "zlib"
 
-do_install () {
-	if [ "${CLASSOVERRIDE}" = "class-target" ] ; then
-		# Install files into /bin (FHS), which is typical place for gzip
-	        install -d ${D}${base_bindir}	        
-		install ${B}/pigz ${D}${base_bindir}/gzip
-	        install ${B}/unpigz ${D}${base_bindir}/gunzip
-	else
-	        install -d ${D}${bindir}
-	        install ${B}/pigz ${D}${bindir}/gzip
-	        install ${B}/unpigz ${D}${bindir}/gunzip
-	fi
+do_install_class-target() {
+	# Install files into /bin (FHS), which is typical place for gzip
+	install -d ${D}${base_bindir}
+	install ${B}/pigz ${D}${base_bindir}/gzip
+	install ${B}/unpigz ${D}${base_bindir}/gunzip
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install ${B}/pigz ${D}${bindir}/gzip
+	install ${B}/unpigz ${D}${bindir}/gunzip
 }
 
 ALTERNATIVE_${PN} = "gzip gunzip"
diff --git a/meta/recipes-extended/pigz/pigz/link-order.patch b/meta/recipes-extended/pigz/pigz/link-order.patch
new file mode 100644
index 0000000..4becc0e
--- /dev/null
+++ b/meta/recipes-extended/pigz/pigz/link-order.patch
@@ -0,0 +1,38 @@
+This patch avoids underlinking issues since we pass -lz via LDFLAGS but it appears
+before pigz.o which needs symbols from libz however due to order linker happily discards libz
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: pigz-2.3.3/Makefile
+===================================================================
+--- pigz-2.3.3.orig/Makefile	2015-01-19 20:12:31.000000000 -0800
++++ pigz-2.3.3/Makefile	2015-01-28 09:11:50.266669184 -0800
+@@ -5,7 +5,7 @@
+ # use gcc and gmake on Solaris
+ 
+ pigz: pigz.o yarn.o try.o ${ZOPFLI}deflate.o ${ZOPFLI}blocksplitter.o ${ZOPFLI}tree.o ${ZOPFLI}lz77.o ${ZOPFLI}cache.o ${ZOPFLI}hash.o ${ZOPFLI}util.o ${ZOPFLI}squeeze.o ${ZOPFLI}katajainen.o
+-	$(CC) $(LDFLAGS) -o pigz $^ -lpthread -lm
++	$(CC) -o pigz $^ $(LDFLAGS) -lz -lpthread -lm
+ 	ln -f pigz unpigz
+ 
+ pigz.o: pigz.c yarn.h try.h ${ZOPFLI}deflate.h ${ZOPFLI}util.h
+@@ -35,7 +35,7 @@
+ dev: pigz pigzt pigzn
+ 
+ pigzt: pigzt.o yarnt.o try.o ${ZOPFLI}deflate.o ${ZOPFLI}blocksplitter.o ${ZOPFLI}tree.o ${ZOPFLI}lz77.o ${ZOPFLI}cache.o ${ZOPFLI}hash.o ${ZOPFLI}util.o ${ZOPFLI}squeeze.o ${ZOPFLI}katajainen.o
+-	$(CC) $(LDFLAGS) -o pigzt $^ -lpthread -lm
++	$(CC) -o pigzt $^ $(LDFLAGS) -lz -lpthread -lm
+ 
+ pigzt.o: pigz.c yarn.h try.h
+ 	$(CC) $(CFLAGS) -DDEBUG -g -c -o pigzt.o pigz.c
+@@ -44,7 +44,7 @@
+ 	$(CC) $(CFLAGS) -DDEBUG -g -c -o yarnt.o yarn.c
+ 
+ pigzn: pigzn.o tryn.o ${ZOPFLI}deflate.o ${ZOPFLI}blocksplitter.o ${ZOPFLI}tree.o ${ZOPFLI}lz77.o ${ZOPFLI}cache.o ${ZOPFLI}hash.o ${ZOPFLI}util.o ${ZOPFLI}squeeze.o ${ZOPFLI}katajainen.o
+-	$(CC) $(LDFLAGS) -o pigzn $^ -lm
++	$(CC) -o pigzn $^ $(LDFLAGS) -lz -lm
+ 
+ pigzn.o: pigz.c try.h
+ 	$(CC) $(CFLAGS) -DDEBUG -DNOTHREAD -g -c -o pigzn.o pigz.c
diff --git a/meta/recipes-extended/pigz/pigz_2.3.1.bb b/meta/recipes-extended/pigz/pigz_2.3.3.bb
similarity index 51%
rename from meta/recipes-extended/pigz/pigz_2.3.1.bb
rename to meta/recipes-extended/pigz/pigz_2.3.3.bb
index cd5508d..080be2b 100644
--- a/meta/recipes-extended/pigz/pigz_2.3.1.bb
+++ b/meta/recipes-extended/pigz/pigz_2.3.3.bb
@@ -1,8 +1,10 @@
 require pigz.inc
 LIC_FILES_CHKSUM = "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
 
-SRC_URI[md5sum] = "e803f8bc0770c7a5e96dccb1d2dd2aab"
-SRC_URI[sha256sum] = "629b0ce5422a3978f31742bf8275d0be2f84987140d18f390f1e3b4e46e0af54"
+SRC_URI += "file://link-order.patch"
+
+SRC_URI[md5sum] = "01d7a16cce77929cc1a78aa1bdfb68cb"
+SRC_URI[sha256sum] = "4e8b67b432ce7907575a549f3e1cac4709781ba0f6b48afea9f59369846b509c"
 
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
-- 
2.1.1


