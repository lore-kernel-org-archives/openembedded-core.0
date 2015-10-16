Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 650E577134
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 06:36:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9G6aHAt000432
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 23:36:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 15 Oct 2015 23:36:16 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Oct 2015 14:28:11 +0800
Message-ID: <4c72e029f4dc45b1581055634e05977659ecb782.1444976827.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1444976827.git.kai.kang@windriver.com>
References: <cover.1444976827.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sqlite: 3.8.10.2 -> 3.9.0
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
X-List-Received-Date: Fri, 16 Oct 2015 06:36:17 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade sqlite from 3.8.10.2 to 3.9.0.

* update python function to get right SRC_URI
* drop 0001-using-the-dynamic-library.patch which use dynamic library
  that it is done that way in new version

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../files/0001-using-the-dynamic-library.patch     | 30 ----------------------
 .../{sqlite3_3.8.10.2.bb => sqlite3_3.9.0.bb}      | 10 ++++----
 2 files changed, 5 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.8.10.2.bb => sqlite3_3.9.0.bb} (72%)

diff --git a/meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch b/meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch
deleted file mode 100644
index e3bfd5f..0000000
--- a/meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-[PATCH] using the dynamic library
-
-Upstream-Status:  Inappropriate [configuration]
-
-building statically-linked sqlite3 failed since sqlite3.o is generated in 
-different dir, even if link successes, the size of sqlite3 is become larger,
-so use the dynamic link, ref: http://patchwork.openembedded.org/patch/93293/
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- Makefile.am | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 88bc23d..fe50f20 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -7,7 +7,8 @@ libsqlite3_la_LDFLAGS = -no-undefined -version-info 8:6:8
- 
- bin_PROGRAMS = sqlite3
- sqlite3_SOURCES = shell.c sqlite3.h
--sqlite3_LDADD = sqlite3.$(OBJEXT) @READLINE_LIBS@
-+sqlite3_LDADD = @READLINE_LIBS@ libsqlite3.la
-+
- 
- include_HEADERS = sqlite3.h sqlite3ext.h
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-support/sqlite/sqlite3_3.8.10.2.bb b/meta/recipes-support/sqlite/sqlite3_3.9.0.bb
similarity index 72%
rename from meta/recipes-support/sqlite/sqlite3_3.8.10.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.9.0.bb
index c72ad50..50531ba 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.8.10.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.9.0.bb
@@ -4,16 +4,16 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b357
 
 def sqlite_download_version(d):
     pvsplit = d.getVar('PV', True).split('.')
+    if len(pvsplit) < 4:
+        pvsplit.append('0')
     return pvsplit[0] + ''.join([part.rjust(2,'0') for part in pvsplit[1:]])
 
 PE = "3"
 SQLITE_PV = "${@sqlite_download_version(d)}"
-SRC_URI = "http://www.sqlite.org/2015/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-           file://0001-using-the-dynamic-library.patch \
-"
+SRC_URI = "http://www.sqlite.org/2015/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 
-SRC_URI[md5sum] = "a18bfc015cd49a1e7a961b7b77bc3b37"
-SRC_URI[sha256sum] = "8382e55a4e7d853c93038562ca3dd00307937fccf1c6b65ddd813e503a56d626"
+SRC_URI[md5sum] = "cd0f883b2ddfc29e8e1bbbbd8e85f555"
+SRC_URI[sha256sum] = "a324143f4cc35cd7e9605a0a8dec9f9e4861d0be8305f3642e7d05008b77e60d"
 
 S = "${WORKDIR}/sqlite-autoconf-${SQLITE_PV}"
 
-- 
2.6.1


