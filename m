Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id DE17C731AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 07:30:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 29 Aug 2016 00:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,595,1464678000"; d="scan'208";a="754567556"
Received: from aupadhy1-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.181.46])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2016 00:29:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 19:27:59 +1200
Message-Id: <9c568e925942778edeb8b3dfd7f2c3c470a7621f.1472455666.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1472455666.git.paul.eggleton@linux.intel.com>
References: <cover.1472455666.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1472455666.git.paul.eggleton@linux.intel.com>
References: <cover.1472455666.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] oe-selftest: devtool: fix test after recent change
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
X-List-Received-Date: Mon, 29 Aug 2016 07:30:02 -0000

OE-Core commit d3057cba0b01484712fcee3c52373c143608a436 fixed handling
of wildcard bbappends, which means that this test's expectations about
the bbappend file name are no longer met. devtool finish is meant to use
wildcard bbappends so fix the test accordingly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 08fe8df..e992dcf 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -1331,7 +1331,9 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('git status --porcelain .', cwd=recipedir)
         if result.output.strip():
             self.fail('Recipe directory for %s contains the following unexpected changes after finish:\n%s' % (recipe, result.output.strip()))
-        appendfile = os.path.join(appenddir, os.path.splitext(os.path.basename(oldrecipefile))[0] + '.bbappend')
+        recipefn = os.path.splitext(os.path.basename(oldrecipefile))[0]
+        recipefn = recipefn.split('_')[0] + '_%'
+        appendfile = os.path.join(appenddir, recipefn + '.bbappend')
         self.assertTrue(os.path.exists(appendfile), 'bbappend %s should have been created but wasn\'t' % appendfile)
         newdir = os.path.join(appenddir, recipe)
         files = os.listdir(newdir)
-- 
2.5.5


