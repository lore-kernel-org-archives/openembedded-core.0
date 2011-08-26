Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QwzPV-00023K-NB
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 18:37:38 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QwzKs-0005xH-At from Noor_Ahsan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 09:32:50 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 26 Aug 2011 18:32:49 +0200
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 21:31:55 +0500
Message-Id: <202943c6ed8beee1af8f9b3c1e58a36a7721c006.1314370503.git.noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1314370503.git.noor_ahsan@mentor.com>
References: <cover.1314370503.git.noor_ahsan@mentor.com>
In-Reply-To: <noor_ahsan@mentor.com>
References: <noor_ahsan@mentor.com>
X-OriginalArrivalTime: 26 Aug 2011 16:32:49.0367 (UTC)
	FILETIME=[CB378E70:01CC640D]
Subject: [meta-oe][PATCH 4/4] tiobench: Add version 0.3.3 (initial recipe)
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
X-List-Received-Date: Fri, 26 Aug 2011 16:37:38 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Imported from oe.dev commit id 821f47e170dddabaef3925fd62c5423210dcb363.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../tiobench-0.3.3/tiobench-makefile.patch         |   49 ++++++++++++++++++++
 .../recipes-benchmark/tiobench/tiobench_0.3.3.bb   |   25 ++++++++++
 2 files changed, 74 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/tiobench-makefile.patch
 create mode 100644 meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb

diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/tiobench-makefile.patch b/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/tiobench-makefile.patch
new file mode 100644
index 0000000..f820c7e
--- /dev/null
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench-0.3.3/tiobench-makefile.patch
@@ -0,0 +1,49 @@
+Adapt tiobench to OE
+Author: Ludovic Desroches <ludovic.desroches@atmel.com>
+
+Upstream-Status: Inappropriate [not author]
+
+Index: Makefile
+===================================================================
+--- a/Makefile	2011-05-26 07:48:46.341400974 +0200
++++ b/Makefile	2011-05-30 06:32:38.091401358 +0200
+@@ -1,8 +1,9 @@
+ # Makefile for tiotest
+ 
+-CC=gcc
++CC?=gcc
+ #CFLAGS=-O3 -fomit-frame-pointer -Wall
+ CFLAGS=-O2 -Wall
++LDFLAGS?=
+ 
+ #DEFINES=-DUSE_MMAP 
+ #-DUSE_MADVISE
+@@ -14,16 +15,16 @@
+ 
+ #DEFINES=
+ 
+-LINK=gcc
++LINK?=$(CC)
+ EXE=tiotest
+ PROJECT=tiobench
+ # do it once instead of each time referenced
+ VERSION=$(shell egrep "tiotest v[0-9]+.[0-9]+" tiotest.c | cut -d " " -f 7 | sed "s/v//g")
+ DISTNAME=$(PROJECT)-$(VERSION)
+ INSTALL=install
+-PREFIX=/usr/local
++PREFIX?=/usr/local
+ BINDIR=$(PREFIX)/bin
+-DOCDIR=/usr/local/doc/$(DISTNAME)
++DOCDIR=$(PREFIX)/share/doc/$(DISTNAME)
+ 
+ all: $(EXE)
+ 
+@@ -34,7 +35,7 @@
+ 	$(CC) -c $(CFLAGS) $(DEFINES) tiotest.c -o tiotest.o
+ 
+ $(EXE): tiotest.o crc32.o
+-	$(LINK) -o $(EXE) tiotest.o crc32.o -lpthread
++	$(LINK) -o $(EXE) tiotest.o crc32.o -lpthread $(LDFLAGS)
+ 	@echo
+ 	@echo "./tiobench.pl --help for usage options"
+ 	@echo
diff --git a/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
new file mode 100644
index 0000000..636e2d1
--- /dev/null
+++ b/meta-oe/recipes-benchmark/tiobench/tiobench_0.3.3.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Threaded I/O tester"
+HOMEPAGE = "http://sourceforge.net/projects/tiobench/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
+RDEPENDS = "\
+    perl \
+    perl-module-exporter-heavy \
+    perl-module-getopt-long \
+    perl-module-overload \
+    perl-module-strict \
+    "
+PR = "r0"
+
+SRC_URI = "\
+    http://sourceforge.net/projects/tiobench/files/tiobench/${PV}/${P}.tar.gz \
+    file://tiobench-makefile.patch \
+    "
+SRC_URI[md5sum] = "bf485bf820e693c79e6bd2a38702a128"
+SRC_URI[sha256sum] = "8ad011059a35ac70cdb5e3d3999ceee44a8e8e9078926844b0685b7ea9db2bcc"
+
+EXTRA_OEMAKE = "PREFIX=${D}/usr"
+
+do_install() {
+    oe_runmake install
+}
-- 
1.7.0.4



