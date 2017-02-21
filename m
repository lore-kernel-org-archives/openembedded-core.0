Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 164F672FB8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:49:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 21 Feb 2017 06:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875887"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:49:04 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:53 +0200
Message-Id: <a4a3536699142cf504c1e0cb5bcba4111e52bd08.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 36/39] oe-selftest: no need to parse gpg output to determine the name of the signing key
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
X-List-Received-Date: Tue, 21 Feb 2017 14:49:04 -0000

The parsing fails on my machine, and we use a key with a hardcoded name,
and so can provide it directly.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/selftest/signing.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index 828dfccab42..884fb61287c 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -101,13 +101,7 @@ class Signing(oeSelfTest):
         self.add_command_to_tearDown('bitbake -c cleansstate %s' % test_recipe)
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


