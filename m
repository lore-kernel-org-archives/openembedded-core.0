Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D5E1A77122
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 11:57:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Oct 2015 04:57:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,688,1437462000"; d="scan'208";a="812530236"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2015 04:57:41 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 14:57:34 +0300
Message-Id: <1444996657-4301-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1444996657-4301-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1444996657-4301-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/5] Add new bbclass for package feed signing
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
X-List-Received-Date: Fri, 16 Oct 2015 11:57:42 -0000

After this change signed package feeds should be enabled by adding
INERIT += "sign_package_feed"
instead of definining PACKAGE_FEED_SIGN="1".

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sign_package_feed.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta/classes/sign_package_feed.bbclass

diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
new file mode 100644
index 0000000..8877d90
--- /dev/null
+++ b/meta/classes/sign_package_feed.bbclass
@@ -0,0 +1,24 @@
+# Class for signing package feeds
+#
+# Related configuration variables that will be used after this class is
+# iherited:
+# PACKAGE_FEED_PASSPHRASE_FILE
+#           Path to a file containing the passphrase of the signing key.
+# PACKAGE_FEED_GPG_NAME
+#           Name of the key to sign with. May be key id or key name.
+# GPG_BIN
+#           Optional variable for specifying the gpg binary/wrapper to use for
+#           signing.
+# GPG_PATH
+#           Optional variable for specifying the gnupg "home" directory:
+#
+inherit sanity
+
+PACKAGE_FEED_SIGN = '1'
+
+python () {
+    # Check sanity of configuration
+    for var in ('PACKAGE_FEED_GPG_NAME', 'PACKAGE_FEED_GPG_PASSPHRASE_FILE'):
+        if not d.getVar(var, True):
+            raise_sanity_error("You need to define %s in the config" % var, d)
+}
-- 
2.1.4


