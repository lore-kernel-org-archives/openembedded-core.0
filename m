Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 588D060290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 00:41:18 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jul 2016 17:41:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,402,1464678000"; d="scan'208";a="850960978"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga003.jf.intel.com with ESMTP; 21 Jul 2016 17:41:19 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2016 16:34:39 +0000
Message-Id: <03768f31db8bb4e635c2beff4e0edcd2bb9bec08.1469118752.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1469118752.git.mariano.lopez@linux.intel.com>
References: <cover.1469118752.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] oetest.py: Remove check for __init__.py
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
X-List-Received-Date: Fri, 22 Jul 2016 00:41:20 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

When using "auto" in TEST_SUITES there is a check
for __init__.py in the <layer>/lib/oeqa/runtime/
directory in all the layers in BBLAYERS.

This check was needed because the way that python 2
import the modules, now that bitbake uses python 3
there is no need these __init__.py files, moreover
these files won't allow to import tests from other
layers.

This patch removes the check.

[YOCTO #9996]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/oetest.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index e63ca56..b64a343 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -265,8 +265,6 @@ class TestContext(object):
 
         if "auto" in self.testsuites:
             def add_auto_list(path):
-                if not os.path.exists(os.path.join(path, '__init__.py')):
-                    bb.fatal('Tests directory %s exists but is missing __init__.py' % path)
                 files = sorted([f for f in os.listdir(path) if f.endswith('.py') and not f.startswith('_')])
                 for f in files:
                     module = 'oeqa.' + type + '.' + f[:-3]
-- 
2.6.6


