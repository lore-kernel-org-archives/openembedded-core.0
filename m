Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ADEC56A5AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 14:21:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Jul 2013 07:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,974,1363158000"; d="scan'208";a="363552930"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.225])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jul 2013 07:21:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 15:21:17 +0100
Message-Id: <1372688477-27863-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH] lttng-modules: allow building without tracepoints enabled in kernel
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
X-List-Received-Date: Mon, 01 Jul 2013 14:21:32 -0000

Avoid a QA failure and instead produce a sensible warning message if no
modules were built.

Fixes [YOCTO #4791].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-kernel/lttng/lttng-modules_2.1.1.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.1.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.1.1.bb
index 700c4c5..0bbaa81 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.1.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.1.1.bb
@@ -22,3 +22,14 @@ export KERNEL_SRC="${STAGING_KERNEL_DIR}"
 
 
 S = "${WORKDIR}/git"
+
+do_install_append() {
+	# Delete empty directories to avoid QA failures if no modules were built
+	find ${D}/lib -depth -type d -empty -exec rmdir {} \;
+}
+
+python do_package_prepend() {
+    if not os.path.exists(os.path.join(d.getVar('D', True), 'lib/modules')):
+        bb.warn("%s: no modules were created; this may be due to CONFIG_TRACEPOINTS not being enabled in your kernel." % d.getVar('PN', True))
+}
+
-- 
1.8.1.2


