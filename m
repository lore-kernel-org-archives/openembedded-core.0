Received: from co1ehsobe004.messaging.microsoft.com ([216.32.180.187]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SoeBt-0007J6-MS
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 19:25:38 +0200
Received: from mail140-co1-R.bigfish.com (10.243.78.248) by
	CO1EHSOBE008.bigfish.com (10.243.66.71) with Microsoft SMTP Server id
	14.1.225.23; Tue, 10 Jul 2012 17:12:06 +0000
Received: from mail140-co1 (localhost [127.0.0.1])	by
	mail140-co1-R.bigfish.com (Postfix) with ESMTP id 3AD37780108	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 17:12:06 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail140-co1 (localhost.localdomain [127.0.0.1]) by mail140-co1
	(MessageSwitch) id 1341940323401362_21527;
	Tue, 10 Jul 2012 17:12:03 +0000 (UTC)
Received: from CO1EHSMHS021.bigfish.com (unknown [10.243.78.253])	by
	mail140-co1.bigfish.com (Postfix) with ESMTP id 56EDFD00044	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 17:12:03 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS021.bigfish.com
	(10.243.66.31) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 10 Jul 2012 17:12:03 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Tue, 10 Jul 2012 12:14:21 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6AHELU5018307 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 10:14:21 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 12:14:20 -0500
Message-ID: <1341940460-5784-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] rpm_5.4.9.bb: fix builds on systems with older libc
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
X-List-Received-Date: Tue, 10 Jul 2012 17:25:38 -0000
Content-Type: text/plain

| dbconvert.o: In function `rpmdb_convert':
| /local/jenkins/jobs/yocto-upstream/workspace/label/master/machine/p4080ds/poky/master/tmp/work/x86_64-linux/rpm-native-5.4.9-r45/rpm-5.4.9/tools/dbconvert.c:126: warning: the use of `tempnam' is dangerous, better use `mkstemp'
| dbconvert.o: In function `main':
| dbconvert.c:(.text+0x923): undefined reference to `htobe32'
| dbconvert.c:(.text+0xaa4): undefined reference to `htole32'
| dbconvert.c:(.text+0xac9): undefined reference to `htole32'

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-devtools/rpm/rpm/dbconvert.patch |   27 +++++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb        |    3 ++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/dbconvert.patch

diff --git a/meta/recipes-devtools/rpm/rpm/dbconvert.patch b/meta/recipes-devtools/rpm/rpm/dbconvert.patch
new file mode 100644
index 0000000..27dba8c
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/dbconvert.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Not applicable
+
+Hack to prevent unneeded demo app from building on older libc
+where it will break the build
+
+Index: rpm-5.4.9/tools/Makefile.am
+===================================================================
+--- rpm-5.4.9.orig/tools/Makefile.am
++++ rpm-5.4.9/tools/Makefile.am
+@@ -24,7 +24,7 @@ AM_CFLAGS = $(OPENMP_CFLAGS)
+ 
+ EXTRA_DIST =	hashtab.h bsdiff.1 bspatch.1 dotgraph.hh
+ 
+-EXTRA_PROGRAMS = augtool cudftool dbconvert debugedit \
++EXTRA_PROGRAMS = augtool cudftool debugedit \
+ 	nix-build nix-channel nix-collect-garbage nix-copy-closure \
+ 	nix-env nix-hash nix-install-package nix-instantiate \
+ 	nix-log2xml nix-prefetch-url nix-pull nix-push nix-store nix-worker \
+@@ -60,7 +60,7 @@ pkgbin_PROGRAMS =	\
+ 	rpmcache rpmdigest rpmrepo rpmspecdump \
+ 	rpmcmp rpmdeps rpmdeps-oecore sqlite3 @WITH_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@
+ if WITH_DB
+-pkgbin_PROGRAMS +=	dbconvert
++pkgbin_PROGRAMS +=	
+ endif
+ dist_man_MANS =		rpmgrep.1
+ 
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 6ef1aae..e276cc3 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file"
-PR = "r45"
+PR = "r46"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -75,6 +75,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://uclibc-support.patch \
 	   file://rpmatch.patch \
 	   file://fstack-protector-configure-check.patch \
+	   file://dbconvert.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.10




