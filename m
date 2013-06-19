Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7BE3601AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 12:04:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5JC4m52024974
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 05:04:48 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 19 Jun 2013 05:04:48 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2013 19:57:15 +0800
Message-ID: <0d5da14c6631e43e0734df35984e2c3d8c1d93b9.1371642926.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1371642926.git.kai.kang@windriver.com>
References: <cover.1371642926.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 1/3] openjade-native: fix build failure
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
X-List-Received-Date: Wed, 19 Jun 2013 12:04:47 -0000
Content-Type: text/plain

Fix openjade-native build failure when build directory name contains the
characters ".a".

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../openjade/openjade-1.3.2/fix-regex.patch        |   32 ++++++++++++++++++++
 .../openjade/openjade-native_1.3.2.bb              |    3 +-
 2 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/fix-regex.patch

diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/fix-regex.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/fix-regex.patch
new file mode 100644
index 0000000..6b40afd
--- /dev/null
+++ b/meta/recipes-devtools/openjade/openjade-1.3.2/fix-regex.patch
@@ -0,0 +1,32 @@
+From 55f6fd8f1958aa36584eefeecce782a505963c88 Mon Sep 17 00:00:00 2001
+From: benvm <benvm@yow-gmoffatt-lx2.wrs.com>
+Date: Wed, 9 Jan 2013 12:14:06 -0500
+Subject: [PATCH] Fix Makefile regular expression
+
+This patch modifies a regular expression within a Makefile to stop builds
+from failing in the case where the path contains the characters ".a".
+
+Upstream-Status: Submitted
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ Makefile.prog.in |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile.prog.in b/Makefile.prog.in
+index 76310c9..44c3534 100644
+--- a/Makefile.prog.in
++++ b/Makefile.prog.in
+@@ -12,7 +12,7 @@ LINKFLAGS = @LINKFLAGS@
+ 
+ ALL_LIBS = $(XLIBS) $(LIBS)
+ Makefile.lt:
+-	echo 'LT_LIBS='`echo $(ALL_LIBS)|sed 's/\.a/.la/g'` >Makefile.lt
++	echo 'LT_LIBS='`echo $(ALL_LIBS) | sed 's/\.a\s/\.la /g' | sed s/\.a$$/\.la/` > Makefile.lt
+ 
+ PROG:=$(shell echo "$(PROG)" | sed '@program_transform_name@')
+ 
+-- 
+1.7.0.4
+
diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
index 266210d..8af0b52 100644
--- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
+++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
@@ -16,7 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
            file://makefile.patch \
            file://msggen.pl.patch \
            file://reautoconf.patch \
-	   file://user-declared-default-constructor.patch"
+	   file://user-declared-default-constructor.patch \
+           file://fix-regex.patch"
 
 SRC_URI[md5sum] = "7df692e3186109cc00db6825b777201e"
 SRC_URI[sha256sum] = "1d2d7996cc94f9b87d0c51cf0e028070ac177c4123ecbfd7ac1cb8d0b7d322d1"
-- 
1.7.5.4


