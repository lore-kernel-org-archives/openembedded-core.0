Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E0E567C7A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 06:42:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x8R6gqoI002485
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 23:42:52 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 26 Sep 2019 23:42:52 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Sep 2019 14:42:51 +0800
Message-ID: <20190927064251.3046-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] systemd: fix NFS regression
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
X-List-Received-Date: Fri, 27 Sep 2019 06:42:52 -0000
Content-Type: text/plain

Currently systemd cannot boot correctly on NFS. This is because
the code uses readdir which returns DT_UNKNOWN instead of DT_LNK
on NFS. So consider DT_UNKNOWN to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ider-symlink-on-filesystems-like-NFS.patch | 42 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_243.bb      |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch b/meta/recipes-core/systemd/systemd/0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch
new file mode 100644
index 0000000000..ba20a0bb46
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch
@@ -0,0 +1,42 @@
+From d0122c077d2d8fd0fd29b463c501e7ddf9177ff3 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 24 Sep 2019 17:04:50 +0800
+Subject: [PATCH] unit-file.c: consider symlink on filesystems like NFS
+
+Some filesystems do not fully support readdir, according to the manual,
+so we should also consider DT_UNKNOWN to correctly handle symlinks.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/13637]
+---
+ src/shared/unit-file.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/shared/unit-file.c b/src/shared/unit-file.c
+index 4a5f23e6c1..8373103000 100644
+--- a/src/shared/unit-file.c
++++ b/src/shared/unit-file.c
+@@ -247,6 +247,7 @@ int unit_file_build_name_map(
+                         _cleanup_free_ char *_filename_free = NULL, *simplified = NULL;
+                         const char *suffix, *dst = NULL;
+                         bool valid_unit_name;
++                        struct stat sb;
+ 
+                         valid_unit_name = unit_name_is_valid(de->d_name, UNIT_NAME_ANY);
+ 
+@@ -279,7 +280,10 @@ int unit_file_build_name_map(
+                         if (hashmap_contains(ids, de->d_name))
+                                 continue;
+ 
+-                        if (de->d_type == DT_LNK) {
++                        if (de->d_type == DT_LNK ||
++                            (de->d_type == DT_UNKNOWN &&
++                             lstat(filename, &sb) == 0 &&
++                             (sb.st_mode & S_IFMT) == S_IFLNK)) {
+                                 /* We don't explicitly check for alias loops here. unit_ids_map_get() which
+                                  * limits the number of hops should be used to access the map. */
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
index 0148c37e45..1ef4cd142e 100644
--- a/meta/recipes-core/systemd/systemd_243.bb
+++ b/meta/recipes-core/systemd/systemd_243.bb
@@ -22,6 +22,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0004-rules-whitelist-hd-devices.patch \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
+           file://0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch \
            file://99-default.preset \
            "
 
-- 
2.17.1


