Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6752377E99
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 21:45:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 17 Jul 2017 14:45:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="1152467608"
Received: from unknown (HELO alimonb-mobl1.zpn.intel.com) ([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2017 14:45:25 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 16:45:23 -0500
Message-Id: <9ba5a1c2e15c5922288de2af25524c90eef8eebc.1500327589.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv3 15/30] oeqa/selftest/case: Support bitbake memres mode in per build directory
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
X-List-Received-Date: Mon, 17 Jul 2017 21:45:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If BBSERVER is set on the environment the bitbake is set to be used
as a memres, so starts an bitbake server per TestClass.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/case.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index c6f2d184ea3..d98a3760415 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -97,6 +97,12 @@ class OESelftestTestCase(OETestCase):
             cls.runCmd("git init; git add *; git commit -a -m 'initial'",
                             cwd=cls.testlayer_path)
 
+            if cls._use_own_builddir and 'BBSERVER' in os.environ:
+                env = os.environ.copy()
+                del env['BBSERVER']
+                result = cls.runCmd('bitbake --server-only -t xmlrpc -B localhost:-1',
+                        env=env)
+
             # XXX: sometimes meta-selftest isn't on bblayers at first backup
             try:
                 cls.runCmd("bitbake-layers remove-layer %s" % cls.orig_testlayer_path)
@@ -119,6 +125,9 @@ class OESelftestTestCase(OETestCase):
 
     @classmethod
     def tearDownClass(cls):
+        if cls._use_own_builddir and 'BBSERVER' in os.environ:
+            cls.runCmd('bitbake --kill-server')
+
         cls.remove_include()
         cls.remove_inc_files()
         super(OESelftestTestCase, cls).tearDownClass()
-- 
2.11.0


