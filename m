Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 53783776C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:25:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988223"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:25:57 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:24:07 +0200
Message-Id: <801770b32bde18cbae5f061c34120f1a5444a51c.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 28/44] selftest: do not perform a full build in test_continue
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
X-List-Received-Date: Fri, 10 Mar 2017 11:25:56 -0000

This was fetching and building the toolchain and everything else
against empty download dir and sstate cache, and so was enormously slow.
The test does not need that, it only checks that one fetch task fails and
another succeeds when using bitbake's -k option.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 4d9eec130ad..09e3d0d8461 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -222,7 +222,7 @@ INHERIT_remove = \"report-error\"
         self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
         self.write_recipeinc('man',"\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n" )
         runCmd('bitbake -c cleanall man xcursor-transparent-theme')
-        result = runCmd('bitbake man xcursor-transparent-theme -k', ignore_status=True)
+        result = runCmd('bitbake -c unpack -k man xcursor-transparent-theme', ignore_status=True)
         errorpos = result.output.find('ERROR: Function failed: do_fail_task')
         manver = re.search("NOTE: recipe xcursor-transparent-theme-(.*?): task do_unpack: Started", result.output)
         continuepos = result.output.find('NOTE: recipe xcursor-transparent-theme-%s: task do_unpack: Started' % manver.group(1))
-- 
2.11.0


