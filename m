Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0A62784F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 01:45:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAU1jqoK014253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 17:45:52 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 29 Nov 2017 17:45:51 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Nov 2017 09:45:15 +0800
Message-ID: <917550ac335cd0af547d301f41605d8de6678d19.1512006081.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1512006081.git.liezhi.yang@windriver.com>
References: <cover.1512006081.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] sqlite3: use 1024 for MAX_PATHNAM
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
X-List-Received-Date: Thu, 30 Nov 2017 01:45:51 -0000
Content-Type: text/plain

The 512 is a little small when len(TMPDIR) == 410, it would be failed when
do_rootfs, use 1024 to fix problem:

Fixed when len(TMPDIR) == 410:
$ bitbake core-image-minimal
[snip]
"tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/lib/python3.5/site-packages/dnf/yum/history.py", line 799, in _get_cursor
    self._conn = sqlite.connect(self._db_file)
sqlite3.OperationalError: unable to open database file

[YOCTO #12374]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-sqlite3.c-use-1024-MAX_PATHNAME.patch     | 37 ++++++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.21.0.bb      |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/0001-sqlite3.c-use-1024-MAX_PATHNAME.patch

diff --git a/meta/recipes-support/sqlite/files/0001-sqlite3.c-use-1024-MAX_PATHNAME.patch b/meta/recipes-support/sqlite/files/0001-sqlite3.c-use-1024-MAX_PATHNAME.patch
new file mode 100644
index 0000000..f000477
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/0001-sqlite3.c-use-1024-MAX_PATHNAME.patch
@@ -0,0 +1,37 @@
+From 9f63bdd623a851c6f4af6d1259161d5d47d94bb3 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 22 Nov 2017 15:23:24 +0800
+Subject: [PATCH] sqlite3.c: use 1024 for MAX_PATHNAME
+
+The 512 is a little small when build in deep directory, e.g., it would be
+failed to run when oe-core's TMPDIR == 410, use 1024 to fix problem.
+
+Fixed:
+[snip]
+"/usr/lib/python3.5/site-packages/dnf/yum/history.py", line 799, in _get_cursor
+    self._conn = sqlite.connect(self._db_file)
+sqlite3.OperationalError: unable to open database file
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ sqlite3.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sqlite3.c b/sqlite3.c
+index 4ec1271..31edaf8 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -30379,7 +30379,7 @@ SQLITE_PRIVATE const char *sqlite3OpcodeName(int i){
+ /*
+ ** Maximum supported path-length.
+ */
+-#define MAX_PATHNAME 512
++#define MAX_PATHNAME 1024
+ 
+ /*
+ ** Maximum supported symbolic links
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/sqlite/sqlite3_3.21.0.bb b/meta/recipes-support/sqlite/sqlite3_3.21.0.bb
index 1d51733..33f41e5 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.21.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.21.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 
 SRC_URI = "\
   http://www.sqlite.org/2017/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+  file://0001-sqlite3.c-use-1024-MAX_PATHNAME.patch \
   "
 SRC_URI[md5sum] = "7913de4c3126ba3c24689cb7a199ea31"
 SRC_URI[sha256sum] = "d7dd516775005ad87a57f428b6f86afd206cb341722927f104d3f0cf65fbbbe3"
-- 
2.7.4


