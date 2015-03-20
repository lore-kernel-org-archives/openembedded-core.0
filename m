Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1C07473A76
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 14:17:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2015 07:16:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,437,1422950400"; d="scan'208";a="668155822"
Received: from swold-mobl.zpn.intel.com (HELO swold-mobl.amr.corp.intel.com)
	([10.219.16.120])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2015 07:16:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2015 08:16:36 -0600
Message-Id: <1426860996-8715-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Cc: Caner Altinbasak <caner.altinbasak@gmail.com>
Subject: [PATCH] util-linux-native: Fixed conflicts with shadow-native and ncurses-native
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
X-List-Received-Date: Fri, 20 Mar 2015 14:17:03 -0000

From: Caner Altinbasak <caner.altinbasak@gmail.com>

    util-linux-native provides /bin/reset and /sbin/nologin. shadow-native
    provides /sbin/nologin and ncurses-native provides /bin/reset. This
    creates a conlict.

    [YOCTO #7484]

    This commit fixes the conflict by deleting the /bin/reset and
    /sbin/nologin from util-linux-native installation.

    Signed-off-by: Caner Altinbasak <caner.altinbasak@gmail.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4cca897..10b14b3 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -163,6 +163,12 @@ do_install () {
 	rm -f ${D}${bindir}/chkdupexe
 }
 
+# reset and nologin causes a conflict with ncurses-native and shadow-native
+do_install_append_class-native () {
+	rm -f ${D}${base_bindir}/reset
+	rm -f ${D}${base_sbindir}/nologin
+}
+
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
-- 
2.1.0


