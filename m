Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EB9B3731CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 14:16:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 10 Feb 2016 06:16:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,426,1449561600"; d="scan'208";a="650101514"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2016 06:16:01 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 16:15:55 +0200
Message-Id: <1455113759-3692-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1455113759-3692-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1455113759-3692-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/5] oe/gpg_sign: add verify() method
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
X-List-Received-Date: Wed, 10 Feb 2016 14:16:05 -0000

A new method for verifying detached signatures.

[YOCTO #9006]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/gpg_sign.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
index 821787e..a4f310e 100644
--- a/meta/lib/oe/gpg_sign.py
+++ b/meta/lib/oe/gpg_sign.py
@@ -65,6 +65,16 @@ class LocalSigner(object):
             raise bb.build.FuncFailed("Failed to create signature for '%s': %s" %
                                       (input_file, output))
 
+    def verify(self, sig_file):
+        """Verify signature"""
+        cmd = self.gpg_bin + " --verify "
+        if self.gpg_path:
+            cmd += "--homedir %s " % self.gpg_path
+        cmd += sig_file
+        status, _ = oe.utils.getstatusoutput(cmd)
+        ret = False if status else True
+        return ret
+
 
 def get_signer(d, backend, keyid, passphrase_file):
     """Get signer object for the specified backend"""
-- 
2.6.2


