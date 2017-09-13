Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F0AE1786CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:58:20 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Sep 2017 13:58:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,389,1500966000"; d="scan'208";a="128470718"
Received: from babarret-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.243])
	by orsmga004.jf.intel.com with ESMTP; 13 Sep 2017 13:58:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Sep 2017 08:57:44 +1200
Message-Id: <b7b1380d733f237049296801a665978263edc918.1505336248.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1505336248.git.paul.eggleton@linux.intel.com>
References: <cover.1505336248.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] oe-selftest: devtool: fix test_devtool_add hanging on some machines
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
X-List-Received-Date: Wed, 13 Sep 2017 20:58:21 -0000

The code in scriptutils which implements the logic for running the
editor used by devtool edit-recipe looks at the VISUAL environment
variable before EDITOR, and thus if VISUAL is set in the environment it
will override the EDITOR value we are setting here, the editor (usually
vim) launches and there's nothing to stop it running forever short of
manually killing it. Set VISUAL instead to fix this.

Apparently VISUAL is in fact the variable we should really be preferring
here - I don't think I knew that but somehow I got it right in the code,
just not in the test. Here are the details for the curious:

  https://unix.stackexchange.com/questions/4859/visual-vs-editor-whats-the-difference

Fixes [YOCTO #12074].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index d5d0918..1dfef59 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -216,7 +216,7 @@ class DevtoolTests(DevtoolBase):
         result = runCmd('devtool -q find-recipe %s' % pn)
         self.assertEqual(recipepath, result.output.strip())
         # Test devtool edit-recipe
-        result = runCmd('EDITOR="echo 123" devtool -q edit-recipe %s' % pn)
+        result = runCmd('VISUAL="echo 123" devtool -q edit-recipe %s' % pn)
         self.assertEqual('123 %s' % recipepath, result.output.strip())
         # Clean up anything in the workdir/sysroot/sstate cache (have to do this *after* devtool add since the recipe only exists then)
         bitbake('%s -c cleansstate' % pn)
-- 
2.9.5


