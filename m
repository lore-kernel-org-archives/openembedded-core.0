Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 711BE71A99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 06:19:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAH6JhaS021298
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 22:19:43 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 16 Nov 2016 22:19:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2016 22:19:35 -0800
Message-ID: <1ce7dbfb44b9669e9e4515d8b1b585d75baae66d.1479363545.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1479363545.git.liezhi.yang@windriver.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] oeqa/oetest.py: add hasLockedSig()
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
X-List-Received-Date: Thu, 17 Nov 2016 06:19:41 -0000
Content-Type: text/plain

It checks whether there is a "recipe:do_populate_sysroot:" in
locked-sigs.inc, which will help to determine whether the testcase will
run or not.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/oetest.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 95d3bf7..d12381d 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -171,6 +171,12 @@ class oeSDKExtTest(oeSDKTest):
         return subprocess.check_output(". %s > /dev/null;"\
             " %s;" % (self.tc.sdkenv, cmd), stderr=subprocess.STDOUT, shell=True, env=env).decode("utf-8")
 
+    @classmethod
+    def hasLockedSig(self, recipe):
+        if re.search(" " + recipe + ":do_populate_sysroot:", oeTest.tc.locked_sigs):
+            return True
+        return False
+
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information
     # First element of the list the is current frame, caller is 1
@@ -708,6 +714,13 @@ class SDKExtTestContext(SDKTestContext):
         self.sdkextfilesdir = os.path.join(os.path.dirname(os.path.abspath(
             oeqa.sdkext.__file__)), "files")
 
+        self.locked_sig_file = os.path.join(self.sdktestdir, "tc/conf/locked-sigs.inc")
+        if os.path.exists(self.locked_sig_file):
+            with open(self.locked_sig_file) as f:
+                self.locked_sigs = f.read()
+        else:
+            bb.fatal("%s not found. Did you build the ext sdk image?\n%s" % e)
+
     def _get_test_namespace(self):
         if self.cm:
             return "sdk"
-- 
2.10.2


