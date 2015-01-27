Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5C4BC72646
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 06:52:35 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so17021217pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 22:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hdY+ZbHsd3aOuiZb3kY7mmFGxCy4onpuc+MSlqVcK+U=;
	b=uvlmOBQ2wfqFKuCcCVIhVgM20VRtyx8qhc4CthmMdO27kUGnRFfiPv6N/4Q/AJKoAp
	4OU8e2KVmGv1Aazeg5gj2AFkToo/rHbM1wJGhcciKK7M0qiaXp9AeslOZEdv92dDth/G
	L23pwJF/ALmM7RG8YNqidYcKNlU3be7ZeoHRuWCCUXGmZezVGguWOoi1NHrkTvfM1YsQ
	joyIfHwcsbjafNTnX0BqmiO7b4CWp0aPQpa89DiZF4uLSNF/atBQTVvowYytD8RVUiFc
	Y1eL5jUMwKS8k2oJBaouQvClw/ylUtOvE94hknmduzQrB7mhdvXoKCRoKhU/t37bLjkZ
	B2aQ==
X-Received: by 10.67.11.16 with SMTP id ee16mr39853116pad.128.1422341556201;
	Mon, 26 Jan 2015 22:52:36 -0800 (PST)
Received: from haswell.localdomain (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id mz7sm533112pdb.3.2015.01.26.22.52.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Jan 2015 22:52:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jan 2015 22:56:11 -0800
Message-Id: <1422341773-12634-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.2.2
In-Reply-To: <1422341773-12634-1-git-send-email-raj.khem@gmail.com>
References: <1422341773-12634-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/5] pigz: Upgrade to 2.3.3
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
X-List-Received-Date: Tue, 27 Jan 2015 06:52:38 -0000

Fix build issues due to libz being required but
is specified before use.

Change-Id: I1f26c8e656b330a4b5f1eeffee7ac13500fa98d0
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/pigz/pigz.inc              | 24 +++++++--------
 meta/recipes-extended/pigz/pigz/link-order.patch | 38 ++++++++++++++++++++++++
 meta/recipes-extended/pigz/pigz_2.3.1.bb         | 10 -------
 meta/recipes-extended/pigz/pigz_2.3.3.bb         | 14 +++++++++
 4 files changed, 64 insertions(+), 22 deletions(-)
 create mode 100644 meta/recipes-extended/pigz/pigz/link-order.patch
 delete mode 100644 meta/recipes-extended/pigz/pigz_2.3.1.bb
 create mode 100644 meta/recipes-extended/pigz/pigz_2.3.3.bb

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
index 0000000..53c8a3e
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
++++ pigz-2.3.3/Makefile	2015-01-25 12:21:38.762669184 -0800
+@@ -5,7 +5,7 @@
+ # use gcc and gmake on Solaris
+ 
+ pigz: pigz.o yarn.o try.o ${ZOPFLI}deflate.o ${ZOPFLI}blocksplitter.o ${ZOPFLI}tree.o ${ZOPFLI}lz77.o ${ZOPFLI}cache.o ${ZOPFLI}hash.o ${ZOPFLI}util.o ${ZOPFLI}squeeze.o ${ZOPFLI}katajainen.o
+-	$(CC) $(LDFLAGS) -o pigz $^ -lpthread -lm
++	$(CC) -o pigz $^ $(LDFLAGS) -lpthread -lm
+ 	ln -f pigz unpigz
+ 
+ pigz.o: pigz.c yarn.h try.h ${ZOPFLI}deflate.h ${ZOPFLI}util.h
+@@ -35,7 +35,7 @@
+ dev: pigz pigzt pigzn
+ 
+ pigzt: pigzt.o yarnt.o try.o ${ZOPFLI}deflate.o ${ZOPFLI}blocksplitter.o ${ZOPFLI}tree.o ${ZOPFLI}lz77.o ${ZOPFLI}cache.o ${ZOPFLI}hash.o ${ZOPFLI}util.o ${ZOPFLI}squeeze.o ${ZOPFLI}katajainen.o
+-	$(CC) $(LDFLAGS) -o pigzt $^ -lpthread -lm
++	$(CC) -o pigzt $^ $(LDFLAGS) -lpthread -lm
+ 
+ pigzt.o: pigz.c yarn.h try.h
+ 	$(CC) $(CFLAGS) -DDEBUG -g -c -o pigzt.o pigz.c
+@@ -44,7 +44,7 @@
+ 	$(CC) $(CFLAGS) -DDEBUG -g -c -o yarnt.o yarn.c
+ 
+ pigzn: pigzn.o tryn.o ${ZOPFLI}deflate.o ${ZOPFLI}blocksplitter.o ${ZOPFLI}tree.o ${ZOPFLI}lz77.o ${ZOPFLI}cache.o ${ZOPFLI}hash.o ${ZOPFLI}util.o ${ZOPFLI}squeeze.o ${ZOPFLI}katajainen.o
+-	$(CC) $(LDFLAGS) -o pigzn $^ -lm
++	$(CC) -o pigzn $^ $(LDFLAGS) -lm
+ 
+ pigzn.o: pigz.c try.h
+ 	$(CC) $(CFLAGS) -DDEBUG -DNOTHREAD -g -c -o pigzn.o pigz.c
diff --git a/meta/recipes-extended/pigz/pigz_2.3.1.bb b/meta/recipes-extended/pigz/pigz_2.3.1.bb
deleted file mode 100644
index cd5508d..0000000
--- a/meta/recipes-extended/pigz/pigz_2.3.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require pigz.inc
-LIC_FILES_CHKSUM = "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
-
-SRC_URI[md5sum] = "e803f8bc0770c7a5e96dccb1d2dd2aab"
-SRC_URI[sha256sum] = "629b0ce5422a3978f31742bf8275d0be2f84987140d18f390f1e3b4e46e0af54"
-
-NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
-
-BBCLASSEXTEND = "native nativesdk"
-
diff --git a/meta/recipes-extended/pigz/pigz_2.3.3.bb b/meta/recipes-extended/pigz/pigz_2.3.3.bb
new file mode 100644
index 0000000..188a9a5
--- /dev/null
+++ b/meta/recipes-extended/pigz/pigz_2.3.3.bb
@@ -0,0 +1,14 @@
+require pigz.inc
+LIC_FILES_CHKSUM = "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95"
+
+SRC_URI += "file://link-order.patch"
+
+SRC_URI[md5sum] = "01d7a16cce77929cc1a78aa1bdfb68cb"
+SRC_URI[sha256sum] = "4e8b67b432ce7907575a549f3e1cac4709781ba0f6b48afea9f59369846b509c"
+
+BUILD_LDFLAGS += "-lz"
+
+NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
2.1.1


