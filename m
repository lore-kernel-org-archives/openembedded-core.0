Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EE93F6025E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 16:41:33 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 24 Jan 2017 08:41:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="34831176"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga002.jf.intel.com with ESMTP; 24 Jan 2017 08:41:33 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 08:37:37 +0000
Message-Id: <f375139dfac77be3c12335a6a302582368ceeb13.1485247027.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1485247027.git.mariano.lopez@linux.intel.com>
References: <cover.1485247027.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] package_ipk.bbclass: Add check for empty lines in DESCRIPTION
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
X-List-Received-Date: Tue, 24 Jan 2017 16:41:34 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

opkg uses empty lines as separator for next package and if an ipk
file was packaged with empty lines in DESCRIPTION opkg won't be
able to handle such ipk file, this happens at execution time.

This commit will add a check for empty lines in DESCRIPTION when
generating to ipk package to avoid this issue.

[YOCTO #10677]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/package_ipk.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index a76b235..a8a4ddc 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -32,6 +32,13 @@ python do_package_ipk () {
         bb.error("Variables incorrectly set, unable to package")
         return
 
+    # opkg won't allow empty lines in package's description at execution
+    # time, so is better to fail at build time instead when trying to install.
+    description = d.getVar('DESCRIPTION').encode('UTF-8', 'ignore')
+    description = description.decode('unicode_escape')
+    if ([line for line in description.splitlines() if not line.strip()]):
+        bb.fatal("opkg won't allow empty lines in DESCRIPTION")
+
     packages = d.getVar('PACKAGES')
     if not packages or packages == '':
         bb.debug(1, "No packages; nothing to do")
-- 
2.6.6


