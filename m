Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A385E77341
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 14:00:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Feb 2016 06:00:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,400,1449561600"; d="scan'208";a="906234846"
Received: from mwoodwar-mobl8.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.19.30])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2016 06:00:29 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 16:00:23 +0200
Message-Id: <1454680824-26075-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1454680824-26075-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1454680824-26075-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/3] oe/gpg_sign: check for python-pexpect when using local signing
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
X-List-Received-Date: Fri, 05 Feb 2016 14:00:29 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/gpg_sign.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 8832ea9..ea35564 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -17,13 +17,17 @@ class LocalSigner(object):
     @classmethod
     def check_sanity(cls, d, keyid, passphrase_file):
         """(Pre-)check the sanity of a configuration"""
-        msg = ""
+        msgs = []
+        try:
+            import pexpect
+        except ImportError:
+            msgs.append("Please install python-pexpect that is needed by lcocal gpg signing.")
         missing_vars = ['%(keyid)s'] if not keyid else []
         if not passphrase_file:
             missing_vars.append('%(passphrase_file)s')
         if missing_vars:
-            msg += "You need to define " + ' and '.join(missing_vars) + " in the config."
-        return msg
+            msgs.append("You need to define " + ' and '.join(missing_vars) + " in the config.")
+        return ' '.join(msgs)
 
     def export_pubkey(self, output_file):
         """Export GPG public key to a file"""
-- 
2.6.2


