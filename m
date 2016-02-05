Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 22DF0773A2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 14:00:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Feb 2016 06:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,400,1449561600"; d="scan'208";a="906234858"
Received: from mwoodwar-mobl8.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.19.30])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2016 06:00:30 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 16:00:24 +0200
Message-Id: <1454680824-26075-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1454680824-26075-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1454680824-26075-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/3] package signing: do sanity checking in an event handler
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
X-List-Received-Date: Fri, 05 Feb 2016 14:00:30 -0000

This way, one does not get a ton of identical error messages. But, only
one error message before all the recipes are parsed.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/sign_package_feed.bbclass | 26 ++++++++++++++++----------
 meta/classes/sign_rpm.bbclass          | 26 ++++++++++++++++----------
 2 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index 3f6ff2d..5170562 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -22,18 +22,24 @@ PACKAGE_FEED_SIGN = '1'
 PACKAGE_FEED_GPG_BACKEND ?= 'local'
 
 
-python () {
+addhandler sign_package_feed_eventhandler
+sign_package_feed_eventhandler[eventmask] = "bb.event.SanityCheck"
+python sign_package_feed_eventhandler() {
     # Check sanity of config
-    from oe.gpg_sign import get_signer_class
-    signer = get_signer_class(d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
-    err_msg = signer.check_sanity(d,
-                                  d.getVar('PACKAGE_FEED_GPG_NAME', True),
-                                  d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
-    if err_msg:
-        raise_sanity_error(err_msg %{'keyid': 'PACKAGE_FEED_GPG_NAME',
-                                     'passphrase_file': 'PACKAGE_FEED_GPG_PASSPHRASE_FILE'},
-                           d)
+    if bb.event.getName(e) == "SanityCheck":
+        from oe.gpg_sign import get_signer_class
+        d = e.data
+        signer = get_signer_class(d.getVar('PACKAGE_FEED_GPG_BACKEND', True))
+        err_msg = signer.check_sanity(d,
+                                      d.getVar('PACKAGE_FEED_GPG_NAME', True),
+                                      d.getVar('PACKAGE_FEED_GPG_PASSPHRASE_FILE', True))
+        if err_msg:
+            raise_sanity_error(err_msg %{'keyid': 'PACKAGE_FEED_GPG_NAME',
+                                         'passphrase_file': 'PACKAGE_FEED_GPG_PASSPHRASE_FILE'},
+                               d)
+}
 
+python () {
     # Set expected location of the public key
     d.setVar('PACKAGE_FEED_GPG_PUBKEY',
              os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index 79dc517..47a8378 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -21,18 +21,24 @@ RPM_SIGN_PACKAGES='1'
 RPM_GPG_BACKEND ?= 'local'
 
 
-python () {
+addhandler sign_rpm_eventhandler
+sign_rpm_eventhandler[eventmask] = "bb.event.SanityCheck"
+python sign_rpm_eventhandler() {
     # Check sanity of config
-    from oe.gpg_sign import get_signer_class
-    signer = get_signer_class(d.getVar('RPM_GPG_BACKEND', True))
-    err_msg = signer.check_sanity(d,
-                                  d.getVar('RPM_GPG_NAME', True),
-                                  d.getVar('RPM_GPG_PASSPHRASE_FILE', True))
-    if err_msg:
-        raise_sanity_error(err_msg %{'keyid': 'RPM_GPG_NAME',
-                                     'passphrase_file': 'RPM_GPG_PASSPHRASE_FILE'},
-                           d)
+    if bb.event.getName(e) == "SanityCheck":
+        from oe.gpg_sign import get_signer_class
+        d = e.data
+        signer = get_signer_class(d.getVar('RPM_GPG_BACKEND', True))
+        err_msg = signer.check_sanity(d,
+                                      d.getVar('RPM_GPG_NAME', True),
+                                      d.getVar('RPM_GPG_PASSPHRASE_FILE', True))
+        if err_msg:
+            raise_sanity_error(err_msg %{'keyid': 'RPM_GPG_NAME',
+                                         'passphrase_file': 'RPM_GPG_PASSPHRASE_FILE'},
+                               d)
+}
 
+python () {
     # Set the expected location of the public key
     d.setVar('RPM_GPG_PUBKEY', os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
                                             'RPM-GPG-PUBKEY'))
-- 
2.6.2


