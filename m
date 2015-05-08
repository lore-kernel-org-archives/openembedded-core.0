Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 182F473C81
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 08:07:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4887Tv2027310
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 May 2015 01:07:29 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Fri, 8 May 2015 01:07:29 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 May 2015 16:03:14 +0800
Message-ID: <1431072194-18536-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] sqlite3: upgrade to 3.8.10
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
X-List-Received-Date: Fri, 08 May 2015 08:07:31 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../sqlite/files/0001-Add-the-dependence.patch     | 24 ++++++++++++++++++++++
 .../{sqlite3_3.8.7.4.bb => sqlite3_3.8.10.0.bb}    |  8 +++++---
 2 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/files/0001-Add-the-dependence.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.8.7.4.bb => sqlite3_3.8.10.0.bb} (65%)

diff --git a/meta/recipes-support/sqlite/files/0001-Add-the-dependence.patch b/meta/recipes-support/sqlite/files/0001-Add-the-dependence.patch
new file mode 100644
index 0000000..dc86a3f
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/0001-Add-the-dependence.patch
@@ -0,0 +1,24 @@
+[PATCH] Add the dependence for sqlite3 on libsqlite3
+
+Upstream-Status: Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 88bc23d..a1cdb2a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -8,6 +8,7 @@ libsqlite3_la_LDFLAGS = -no-undefined -version-info 8:6:8
+ bin_PROGRAMS = sqlite3
+ sqlite3_SOURCES = shell.c sqlite3.h
+ sqlite3_LDADD = sqlite3.$(OBJEXT) @READLINE_LIBS@
++sqlite3_DEPENDENCIES = $(top_builddir)/libsqlite3.la
+ 
+ include_HEADERS = sqlite3.h sqlite3ext.h
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.8.7.4.bb b/meta/recipes-support/sqlite/sqlite3_3.8.10.0.bb
similarity index 65%
rename from meta/recipes-support/sqlite/sqlite3_3.8.7.4.bb
rename to meta/recipes-support/sqlite/sqlite3_3.8.10.0.bb
index 4c73d30..51f41ea 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.8.7.4.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.8.10.0.bb
@@ -8,10 +8,12 @@ def sqlite_download_version(d):
 
 PE = "3"
 SQLITE_PV = "${@sqlite_download_version(d)}"
-SRC_URI = "http://www.sqlite.org/2014/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2015/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           file://0001-Add-the-dependence.patch \
+"
 
-SRC_URI[md5sum] = "33bb8db0038317ce1b0480ca1185c7ba"
-SRC_URI[sha256sum] = "86370f139405fdfe03334fd618171a74e50f589f17ccbe5933361ed1f58359ec"
+SRC_URI[md5sum] = "04d0311ef70818e8d914c1dc383eddff"
+SRC_URI[sha256sum] = "c4b8f9eefbdf0b9bef2044bdc3510c8a3f3b0ddb0489661fb433034187f5a428"
 
 S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
-- 
1.9.1


