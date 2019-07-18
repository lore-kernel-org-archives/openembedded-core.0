Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id BCFC07EEAB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 02:16:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2019 19:16:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,276,1559545200"; d="scan'208";a="169720369"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.220])
	by fmsmga007.fm.intel.com with ESMTP; 17 Jul 2019 19:16:12 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 10:16:03 +0800
Message-Id: <20190718021606.3560-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718021606.3560-1-anuj.mittal@intel.com>
References: <20190718021606.3560-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] qemu: fix CVE-2019-12155
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
X-List-Received-Date: Thu, 18 Jul 2019 02:16:12 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2019-12155.patch            | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index dfe17eed8b..7f0b3a7a73 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -24,6 +24,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0010-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
            file://0013-target-arm-Fix-vector-operation-segfault.patch \
+	   file://CVE-2019-12155.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch
new file mode 100644
index 0000000000..c49a5e9a2a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch
@@ -0,0 +1,35 @@
+From d52680fc932efb8a2f334cc6993e705ed1e31e99 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 25 Apr 2019 12:05:34 +0530
+Subject: [PATCH] qxl: check release info object
+
+When releasing spice resources in release_resource() routine,
+if release info object 'ext.info' is null, it leads to null
+pointer dereference. Add check to avoid it.
+
+Reported-by: Bugs SysSec <bugs-syssec@rub.de>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-id: 20190425063534.32747-1-ppandit@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2019-12155
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ hw/display/qxl.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/hw/display/qxl.c b/hw/display/qxl.c
+index c8ce5781e03..632923add23 100644
+--- a/hw/display/qxl.c
++++ b/hw/display/qxl.c
+@@ -777,6 +777,9 @@ static void interface_release_resource(QXLInstance *sin,
+     QXLReleaseRing *ring;
+     uint64_t *item, id;
+ 
++    if (!ext.info) {
++        return;
++    }
+     if (ext.group_id == MEMSLOT_GROUP_HOST) {
+         /* host group -> vga mode update request */
+         QXLCommandExt *cmdext = (void *)(intptr_t)(ext.info->id);
-- 
2.20.1


