Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 666F8600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 12:32:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4JCW2tr029942
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 05:32:02 -0700 (PDT)
Received: from LRQ.corp.ad.wrs.com (128.224.162.136) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 19 May 2015 05:32:02 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 May 2015 20:32:01 +0800
Message-ID: <1432038721-22139-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH][v3] sqlite3: upgrade to 3.8.10
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
X-List-Received-Date: Tue, 19 May 2015 12:32:05 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

upgrade to include CVE fixes:
    CVE-2015-3414
    CVE-2015-3415
    CVE-2015-3416

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../files/0001-using-the-dynamic-library.patch     | 30 ++++++++++++++++++++++
 .../{sqlite3_3.8.7.4.bb => sqlite3_3.8.10.0.bb}    |  8 +++---
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.8.7.4.bb => sqlite3_3.8.10.0.bb} (64%)

diff --git a/meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch b/meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch
new file mode 100644
index 0000000..e3bfd5f
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch
@@ -0,0 +1,30 @@
+[PATCH] using the dynamic library
+
+Upstream-Status:  Inappropriate [configuration]
+
+building statically-linked sqlite3 failed since sqlite3.o is generated in 
+different dir, even if link successes, the size of sqlite3 is become larger,
+so use the dynamic link, ref: http://patchwork.openembedded.org/patch/93293/
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 88bc23d..fe50f20 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -7,7 +7,8 @@ libsqlite3_la_LDFLAGS = -no-undefined -version-info 8:6:8
+ 
+ bin_PROGRAMS = sqlite3
+ sqlite3_SOURCES = shell.c sqlite3.h
+-sqlite3_LDADD = sqlite3.$(OBJEXT) @READLINE_LIBS@
++sqlite3_LDADD = @READLINE_LIBS@ libsqlite3.la
++
+ 
+ include_HEADERS = sqlite3.h sqlite3ext.h
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.8.7.4.bb b/meta/recipes-support/sqlite/sqlite3_3.8.10.0.bb
similarity index 64%
rename from meta/recipes-support/sqlite/sqlite3_3.8.7.4.bb
rename to meta/recipes-support/sqlite/sqlite3_3.8.10.0.bb
index 4c73d30..d7f72d9 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.8.7.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.8.10.0.bb
@@ -8,10 +8,12 @@ def sqlite_download_version(d):
 
 PE = "3"
 SQLITE_PV = "${@sqlite_download_version(d)}"
-SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2015/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           file://0001-using-the-dynamic-library.patch \
+"
 
-SRC_URI[md5sum] = "33bb8db0038317ce1b0480ca1185c7ba"
-SRC_URI[sha256sum] = "86370f139405fdfe03334fd618171a74e50f589f17ccbe5933361ed1f58359ec"
+SRC_URI[md5sum] = "04d0311ef70818e8d914c1dc383eddff"
+SRC_URI[sha256sum] = "c4b8f9eefbdf0b9bef2044bdc3510c8a3f3b0ddb0489661fb433034187f5a428"
 
 S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
-- 
2.1.4


