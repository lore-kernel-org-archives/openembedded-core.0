Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82E586FF7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 05:20:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2I5KaR8021120
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 22:20:36 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.210) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 17 Mar 2016 22:20:35 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Mar 2016 13:20:47 +0800
Message-ID: <e952463596d8e51bfec386848dc5b29c1e943b4b.1458278395.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458278395.git.Qi.Chen@windriver.com>
References: <cover.1458278395.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpm: fix error when 'lua' is enabled
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
X-List-Received-Date: Fri, 18 Mar 2016 05:20:36 -0000
Content-Type: text/plain

Fix the following compilation error when 'lua' is enabled in PACKAGECONFIG.

  | gcc: error: lib21.c: No such file or directory
  | gcc: fatal error: no input files

Modify FILES for dev package to avoid installed-not-shipped error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../rpm-fix-lua-tests-compilation-failure.patch    | 43 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  2 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-lua-tests-compilation-failure.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-fix-lua-tests-compilation-failure.patch b/meta/recipes-devtools/rpm/rpm/rpm-fix-lua-tests-compilation-failure.patch
new file mode 100644
index 0000000..1a08243
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-fix-lua-tests-compilation-failure.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Pending
+
+Subject: lua: fix to build test libs correctly
+
+This patch fixes errors like below.
+
+  | gcc: error: lib21.c: No such file or directory
+  | gcc: fatal error: no input files
+
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ lua/tests/libs/Makefile.am | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lua/tests/libs/Makefile.am b/lua/tests/libs/Makefile.am
+index 19d1a0b..1e5de72 100644
+--- a/lua/tests/libs/Makefile.am
++++ b/lua/tests/libs/Makefile.am
+@@ -28,16 +28,16 @@ clean:
+ 	rm -f lib1.so lib11.so lib2.so lib21.so lib2-v2.so
+ 
+ lib1.so: lib1.c
+-	$(CC) $(CFLAGS) -o lib1.so lib1.c
++	$(CC) $(CFLAGS) -o lib1.so $(top_srcdir)/lua/tests/libs/lib1.c
+ 
+ lib11.so: lib11.c
+-	$(CC) $(CFLAGS) -o lib11.so lib11.c
++	$(CC) $(CFLAGS) -o lib11.so $(top_srcdir)/lua/tests/libs/lib11.c
+ 
+ lib2.so: lib2.c
+-	$(CC) $(CFLAGS) -o lib2.so lib2.c
++	$(CC) $(CFLAGS) -o lib2.so $(top_srcdir)/lua/tests/libs/lib2.c
+ 
+ lib21.so: lib21.c
+-	$(CC) $(CFLAGS) -o lib21.so lib21.c
++	$(CC) $(CFLAGS) -o lib21.so $(top_srcdir)/lua/tests/libs/lib21.c
+ 
+ lib2-v2.so: lib2.so
+ 	mv lib2.so ./lib2-v2.so
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 5fea53f..eba043e 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -113,6 +113,7 @@ SRC_URI += " \
 	   file://rpm-python-tagname.patch \
 	   file://rpm-python-AddErase.patch \
 	   file://rpm-rpmpgp-popt.patch \
+	   file://rpm-fix-lua-tests-compilation-failure.patch \
 "
 
 # OE specific changes
@@ -494,6 +495,7 @@ FILES_${PN}-dev = "${includedir}/rpm \
 		${libdir}/rpm/lib/liblua.la \
 		${libdir}/pkgconfig/rpm.pc \
 		${libdir}/rpm/rpmdb_loadcvt \
+		${libdir}/rpm/include \
 		"
 
 FILES_${PN}-staticdev = " \
-- 
1.9.1


