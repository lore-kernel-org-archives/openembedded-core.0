Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 45E317F986
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 23:23:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xA7NNZwT022632
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Nov 2019 15:23:36 -0800 (PST)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 7 Nov 2019 15:23:35 -0800
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Nov 2019 07:16:27 +0800
Message-ID: <20191107231627.18940-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH] systemd: Fix invalid argument of pstore log entry
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
X-List-Received-Date: Thu, 07 Nov 2019 23:23:35 -0000
Content-Type: text/plain

Fix "systemd-pstore: Failed to log pstore entry: Invalid argument"
by backporting 1b3156edd291e0882d80a695d035dd30521345d1 from upstream.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 .../systemd/0001-pstore-fix-use-after-free.patch   | 39 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_243.bb           |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-pstore-fix-use-after-free.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-pstore-fix-use-after-free.patch b/meta/recipes-core/systemd/systemd/0001-pstore-fix-use-after-free.patch
new file mode 100644
index 0000000000..fd147a18be
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-pstore-fix-use-after-free.patch
@@ -0,0 +1,39 @@
+From 1b3156edd291e0882d80a695d035dd30521345d1 Mon Sep 17 00:00:00 2001
+From: Michael Olbrich <m.olbrich@pengutronix.de>
+Date: Fri, 6 Sep 2019 15:04:01 +0200
+Subject: [PATCH] pstore: fix use after free
+
+The memory is still needed in the sd_journal_sendv() after the 'if' block.
+
+(cherry picked from commit 1e19f5ac0d680a63eccae7ef1fc6ce225dca0bbf)
+
+Upstream-Status: Backport
+
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ src/pstore/pstore.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pstore/pstore.c b/src/pstore/pstore.c
+index c760b3e899..8ffe523830 100644
+--- a/src/pstore/pstore.c
++++ b/src/pstore/pstore.c
+@@ -117,6 +117,7 @@ static int compare_pstore_entries(const void *_a, const void *_b) {
+ 
+ static int move_file(PStoreEntry *pe, const char *subdir) {
+         _cleanup_free_ char *ifd_path = NULL, *ofd_path = NULL;
++        _cleanup_free_ void *field = NULL;
+         const char *suffix, *message;
+         struct iovec iovec[2];
+         int n_iovec = 0, r;
+@@ -138,7 +139,6 @@ static int move_file(PStoreEntry *pe, const char *subdir) {
+         iovec[n_iovec++] = IOVEC_MAKE_STRING(message);
+ 
+         if (pe->content_size > 0) {
+-                _cleanup_free_ void *field = NULL;
+                 size_t field_size;
+ 
+                 field_size = strlen("FILE=") + pe->content_size;
+-- 
+2.14.4
+
diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
index 6e7f95693b..88069546a2 100644
--- a/meta/recipes-core/systemd/systemd_243.bb
+++ b/meta/recipes-core/systemd/systemd_243.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
            file://0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch \
            file://99-default.preset \
+           file://0001-pstore-fix-use-after-free.patch \
            "
 
 # patches needed by musl
-- 
2.14.4


