Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Rml7M-0005g7-Se
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 12:52:53 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jan 2012 03:45:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="107539331"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jan 2012 03:45:15 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2012 19:43:10 +0800
Message-Id: <2588490b8b8424c96da2824c604929baeb1c5c16.1326714004.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1326714004.git.lianhao.lu@intel.com>
References: <cover.1326714004.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] gcc-common.inc: Added shared source support for basichash.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jan 2012 11:52:53 -0000

[YOCTO #1555]
Adding new mechanism to allow multiple gcc related recipes sharing the
same src directory when using the basichash as the signature handler.

Using the same stamp file for multiple gcc related recipes to share the
same src directory is no longer working when using the basichash
signature.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc |   56 ++++++++++++++++++++++++++++++
 1 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index fe112d9..4f8e18f 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -63,6 +63,62 @@ do_unpack[stamp-base] = "${SS}"
 do_headerfix[stamp-base] = "${SS}"
 do_patch[stamp-base] = "${SS}"
 
+# Shared source for basichash
+def check_shared_taskdone(d, task):
+    import os.path, bb.utils
+    basedir = d.getVar('SW', True)
+    bb.utils.mkdirhier(basedir)
+    fn = os.path.join(basedir, "%s.done" % (task))
+    return os.path.exists(fn)
+
+def mark_shared_taskdone(d, task):
+    import os.path, bb.utils
+    basedir = d.getVar('SW', True)
+    bb.utils.mkdirhier(basedir)
+    fn = os.path.join(basedir, "%s.done" % (task))
+    f = open(fn, "w")
+    f.close()
+
+do_fetch[lockfiles] = "${SW}.fetch.lock"
+do_unpack[lockfiles] = "${SW}.unpack.lock"
+do_headerfix[lockfiles] = "${SW}.headerfix.lock"
+do_patch[lockfiles] = "${SW}.patch.lock"
+
+python do_fetch_prepend() {
+	if check_shared_taskdone(d, 'fetch'):
+		return
+}
+python do_fetch_append() {
+	mark_shared_taskdone(d, 'fetch')
+}
+
+python do_unpack_prepend() {
+	if check_shared_taskdone(d, 'unpack'):
+		return
+}
+python do_unpack_append() {
+	mark_shared_taskdone(d, 'unpack')
+}
+
+python do_patch_prepend() {
+	if check_shared_taskdone(d, 'patch'):
+		return
+}
+python do_patch_append() {
+	mark_shared_taskdone(d, 'patch')
+}
+
+do_headerfix_prepend() {
+	if [ -e "${SW}/headerfix.done" ]; then
+		return 0
+	fi
+}
+
+do_headerfix_append() {
+	mkdir -p "${SW}"
+	touch "${SW}/headerfix.done"
+}
+
 # SW means Shared Work directory
 SW = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
 WORKDIR_task-unpack = "${SW}"
-- 
1.7.0.4



