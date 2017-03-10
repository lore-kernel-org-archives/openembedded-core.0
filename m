Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A5D7677657
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:26:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:26:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988239"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:26:01 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:24:11 +0200
Message-Id: <7d3c05d6c1ba5702f3f3b59e56ca74c8a4f50da1.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 32/44] oe-selftest: no need to parse gpg output to determine the name of the signing key
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
X-List-Received-Date: Fri, 10 Mar 2017 11:26:01 -0000

The parsing fails on my machine, and we use a key with a hardcoded name,
and so can provide it directly.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/selftest/signing.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index a9b135aab44..38b2fca8cf9 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -103,13 +103,7 @@ class Signing(oeSelfTest):
         self.add_command_to_tearDown('bitbake -c clean %s' % test_recipe)
         self.add_command_to_tearDown('rm -rf %s' % sstatedir)
 
-        # Determine the pub key signature
-        ret = runCmd('gpg --homedir %s --list-keys' % self.gpg_dir)
-        pub_key = re.search(r'^pub\s+\S+/(\S+)\s+', ret.output, re.M)
-        self.assertIsNotNone(pub_key, 'Failed to determine the public key signature.')
-        pub_key = pub_key.group(1)
-
-        feature = 'SSTATE_SIG_KEY ?= "%s"\n' % pub_key
+        feature = 'SSTATE_SIG_KEY ?= "testuser"\n'
         feature += 'SSTATE_SIG_PASSPHRASE ?= "test123"\n'
         feature += 'SSTATE_VERIFY_SIG ?= "1"\n'
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
-- 
2.11.0


