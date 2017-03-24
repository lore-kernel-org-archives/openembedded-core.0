Return-Path: <tobias.hagelborn@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECAB771DC7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 07:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DC45C18133
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:08:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id sRAR-0+h7mw7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:08:22 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id E001A1835D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:08:22 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD2841E09C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:08:22 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1CEA1E09B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:08:22 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:08:22 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id B613E1C6B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 08:08:22 +0100 (CET)
Received: from lnxtobiasha.se.axis.com (10.0.5.60) by XBOX02.axis.com
	(10.0.5.16) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 24 Mar 2017 08:08:22 +0100
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Mar 2017 08:07:16 +0100
Message-ID: <1490339237-2618-2-git-send-email-tobiasha@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1490339237-2618-1-git-send-email-tobiasha@axis.com>
References: <1490339237-2618-1-git-send-email-tobiasha@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Cc: Tobias Hagelborn <tobiasha@axis.com>
Subject: [PATCH 1/2] srctree.bbclass: Download sourcecode and make it searchable
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
X-List-Received-Date: Fri, 24 Mar 2017 07:08:23 -0000
Content-Type: text/plain

This class is used to create a symlink to the source in ${S} in a
separate directory structure. ${SECTION} is used, if available, for
naming the path.

Intended for 'devtool srctree <recipe>' to set up a tree with the
source for all specified recipes and their dependencies to be able
to do a more convenient local search in source code.

Example:

nfs-utils (console/network) maps to ->
   console/
     network/
       nfs-utils

Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
---
 meta/classes/srctree.bbclass | 92 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 meta/classes/srctree.bbclass

diff --git a/meta/classes/srctree.bbclass b/meta/classes/srctree.bbclass
new file mode 100644
index 0000000..53df3c6
--- /dev/null
+++ b/meta/classes/srctree.bbclass
@@ -0,0 +1,92 @@
+# Create symlinks to source (${S}) in a separate directory structure.
+#
+# Copyright (C) 2016-2017 Axis Communications AB
+# Author: Tobias Hagelborn <tobias.hagelborn@axis.com>
+#
+# Released under the MIT license (see COPYING.MIT for the terms)
+#
+# This class is used to create a symlink to the source in ${S} in a
+# separate directory structure. ${SECTION} is used, if available, for
+# naming the path.
+#
+# Intended for 'devtool srctree <recipe>' to set up a tree with the
+# source for all specified recipes and their dependencies to be able
+# to do a more convenient local search in source code.
+#
+# Example:
+#
+# nfs-utils (console/network) maps to ->
+#   console/
+#     network/
+#       nfs-utils
+
+# Use the following to extend the srctree class with custom functions
+SRCTREE_EXTENSION ?= ""
+
+inherit ${SRCTREE_EXTENSION}
+
+# Default PN sub-path function
+def srctree_get_path(d):
+    section = d.getVar("SECTION", True)
+    if section:
+        return section.split()[0]
+    else:
+        d.getVar("BPN", True)
+
+# Configurable browsable source tree root
+SRCTREE_DIR ?= "${TOPDIR}/src"
+
+# Path within ${SRCTREE_DIR} for the current PN. Can be overridden in
+# a custom class via ${SRCTREE_EXTENSION} or set to a fixed value.
+# Example: SRCTREE_PN_PATH = "${PN}"
+SRCTREE_PN_PATH ?= "${@srctree_get_path(d)}"
+SYM_S = "${SRCTREE_DIR}/${SRCTREE_PN_PATH}"
+
+create_srctree_readme() {
+	readme="${SRCTREE_DIR}/README"
+
+	[ -e "$readme" ] || cat >"$readme" <<EOF
+This directory contains a directory tree for source code browsing.
+
+IMPORTANT:
+
+ * The source tree is intended for CODE BROWSING ONLY.
+ * The tree contains symbolic links directly to the source as used by BitBake.
+ * Any CHANGES made to the source code MAY BE REMOVED by BitBake AT ANY TIME.
+ * BitBake will NOT automatically rebuild packages due to code changes made
+   directly in the source tree (which you should not do in the first place).
+ * The source tree will NOT reflect changes made to recipes or, e.g., by
+   running "devtool modify -x <recipe>" until "devtool srctree" is re-executed.
+EOF
+}
+
+do_srctree[nostamp] = "1"
+do_srctree[dirs] = "${SRCTREE_DIR}"
+addtask srctree after do_patch
+do_srctree() {
+	if [ "${S}" = "${WORKDIR}" ]; then
+		[ "${SRCTREE_VERBOSE}" != 1 ] ||
+			bbwarn "Not setting up a link for '${SRCTREE_PN_PATH}' (since $""{S} = $""{WORKDIR})"
+		return
+	fi
+
+	# Ignore all cases where S is not properly set up for any reason
+	if [ ! -d "${S}" ]; then
+		[ "${SRCTREE_VERBOSE}" != 1 ] ||
+			bbwarn "No source available for ${PN}";
+		return
+	fi
+
+	mkdir -p $(dirname "${SYM_S}")
+	ln -sfn ${S} ${SYM_S}
+
+	create_srctree_readme
+}
+
+addtask srctree_all after do_srctree
+do_srctree_all[recrdeptask] = "do_srctree_all do_srctree"
+do_srctree_all[recideptask] = "do_${BB_DEFAULT_TASK}"
+do_srctree_all[doc] = "Setup source tree recursivly"
+do_srctree_all() {
+	:
+}
-- 
2.1.4


