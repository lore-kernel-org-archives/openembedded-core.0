Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9048A778A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 04:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489983392; x=1521519392;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tmy8WBWVDTUZktGxkDY6vWB4W74kGTWjgpaecyvVi6U=;
	b=IG5sTcSguG4jq+auyjJoNQ0ATmpH+0C94LxkOeLMIRjuqYggdbxC5dw7
	QS5f1n61OSm2q1xrmO0sFOBGik3Y7w==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2017 21:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,191,1486454400"; d="scan'208";a="238130031"
Received: from cloy-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.161.201])
	by fmsmga004.fm.intel.com with ESMTP; 19 Mar 2017 21:16:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 17:16:19 +1300
Message-Id: <a73b834c249d63e028ad6afd15a14c7cb7cf00b9.1489983267.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1489983267.git.paul.eggleton@linux.intel.com>
References: <cover.1489983267.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] oe-selftest: tinfoil: add tests for recently enabled datastore operations
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
X-List-Received-Date: Mon, 20 Mar 2017 04:16:31 -0000

A recent patch to bitbake fixes these datastore operations so that they
actually affect the server end, so we should test that they work.

(For full disclosure, some of these tests would probably pass without
those fixes, since the operation would be done on the client side
instead - but we are at least exercising the code paths.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/tinfoil.py | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/meta/lib/oeqa/selftest/tinfoil.py b/meta/lib/oeqa/selftest/tinfoil.py
index 38ec7a3..73a0c3b 100644
--- a/meta/lib/oeqa/selftest/tinfoil.py
+++ b/meta/lib/oeqa/selftest/tinfoil.py
@@ -153,3 +153,38 @@ class TinfoilTests(oeSelfTest):
             value = tinfoil.run_command('getVariable', 'TESTVAR')
             self.assertEqual(value, 'specialvalue', 'Value set using config_data.setVar() is not reflected in config_data.getVar()')
 
+    def test_datastore_operations(self):
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=True)
+            # Test setVarFlag() / getVarFlag()
+            tinfoil.config_data.setVarFlag('TESTVAR', 'flagname', 'flagval')
+            value = tinfoil.config_data.getVarFlag('TESTVAR', 'flagname')
+            self.assertEqual(value, 'flagval', 'Value set using config_data.setVarFlag() is not reflected in config_data.getVarFlag()')
+            # Test delVarFlag()
+            tinfoil.config_data.setVarFlag('TESTVAR', 'otherflag', 'othervalue')
+            tinfoil.config_data.delVarFlag('TESTVAR', 'flagname')
+            value = tinfoil.config_data.getVarFlag('TESTVAR', 'flagname')
+            self.assertEqual(value, None, 'Varflag deleted using config_data.delVarFlag() is not reflected in config_data.getVarFlag()')
+            value = tinfoil.config_data.getVarFlag('TESTVAR', 'otherflag')
+            self.assertEqual(value, 'othervalue', 'Varflag deleted using config_data.delVarFlag() caused unrelated flag to be removed')
+            # Test delVar()
+            tinfoil.config_data.setVar('TESTVAR', 'varvalue')
+            value = tinfoil.config_data.getVar('TESTVAR')
+            self.assertEqual(value, 'varvalue', 'Value set using config_data.setVar() is not reflected in config_data.getVar()')
+            tinfoil.config_data.delVar('TESTVAR')
+            value = tinfoil.config_data.getVar('TESTVAR')
+            self.assertEqual(value, None, 'Variable deleted using config_data.delVar() appears to still have a value')
+            # Test renameVar()
+            tinfoil.config_data.setVar('TESTVAROLD', 'origvalue')
+            tinfoil.config_data.renameVar('TESTVAROLD', 'TESTVARNEW')
+            value = tinfoil.config_data.getVar('TESTVAROLD')
+            self.assertEqual(value, None, 'Variable renamed using config_data.renameVar() still seems to exist')
+            value = tinfoil.config_data.getVar('TESTVARNEW')
+            self.assertEqual(value, 'origvalue', 'Variable renamed using config_data.renameVar() does not appear with new name')
+            # Test overrides
+            tinfoil.config_data.setVar('TESTVAR', 'original')
+            tinfoil.config_data.setVar('TESTVAR_overrideone', 'one')
+            tinfoil.config_data.setVar('TESTVAR_overridetwo', 'two')
+            tinfoil.config_data.appendVar('OVERRIDES', ':overrideone')
+            value = tinfoil.config_data.getVar('TESTVAR')
+            self.assertEqual(value, 'one', 'Variable overrides not functioning correctly')
-- 
2.9.3


