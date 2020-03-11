Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0067A60707
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 13:49:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 02BDnZuO024044
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 06:49:35 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.487.0; Wed, 11 Mar 2020 06:49:35 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2020 21:49:33 +0800
Message-ID: <1583934573-94011-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] babeltrace2: initialize the other_entry pointer
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
X-List-Received-Date: Wed, 11 Mar 2020 13:49:35 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

When add below line to local.conf to enable debug build:

DEBUG_BUILD = "1"

There comes below failure when run "bitbake babeltrace2"
| ../../../../../git/src/plugins/ctf/fs-src/fs.c: In function 'ds_index_insert_ds_index_entry_sorted':
| ../../../../../git/src/plugins/ctf/fs-src/fs.c:702:5: error: 'other_entry' may be used uninitialized in this function [-Werror=maybe-uninitialized]
|   702 |    !ds_index_entries_equal(entry, other_entry)) {

So initialize the other_entry pointer to fix the above error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-fs.c-initialize-other_entry.patch         | 33 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-fs.c-initialize-other_entry.patch

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-fs.c-initialize-other_entry.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-fs.c-initialize-other_entry.patch
new file mode 100644
index 0000000..b56b3bd
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-fs.c-initialize-other_entry.patch
@@ -0,0 +1,33 @@
+From 42dae692b9057d03ce9a0651f061472e9dd90130 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 11 Mar 2020 08:44:42 +0000
+Subject: [PATCH] fs.c: initialize the other_entry variable
+
+Initialize the pointer other_entry to fix the below error:
+| ../../../../../git/src/plugins/ctf/fs-src/fs.c: In function 'ds_index_insert_ds_index_entry_sorted':
+| ../../../../../git/src/plugins/ctf/fs-src/fs.c:702:5: error: 'other_entry' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+|   702 |    !ds_index_entries_equal(entry, other_entry)) {
+
+Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2020-March/029549.html]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/plugins/ctf/fs-src/fs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/plugins/ctf/fs-src/fs.c b/src/plugins/ctf/fs-src/fs.c
+index e87523a3..a6b5315f 100644
+--- a/src/plugins/ctf/fs-src/fs.c
++++ b/src/plugins/ctf/fs-src/fs.c
+@@ -680,7 +680,7 @@ void ds_index_insert_ds_index_entry_sorted(
+ 	struct ctf_fs_ds_index_entry *entry)
+ {
+ 	guint i;
+-	struct ctf_fs_ds_index_entry *other_entry;
++	struct ctf_fs_ds_index_entry *other_entry = NULL;
+ 
+ 	/* Find the spot where to insert this index entry. */
+ 	for (i = 0; i < index->entries->len; i++) {
+-- 
+2.24.1
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
index 16953d6..c027d8b 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
@@ -10,6 +10,7 @@ DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0 \
 	   file://run-ptest \
 	   file://0001-tests-do-not-run-test-applications-from-.libs.patch \
+	   file://0001-fs.c-initialize-other_entry.patch \
 	  "
 SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
-- 
2.7.4


