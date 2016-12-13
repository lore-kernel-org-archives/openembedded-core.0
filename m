Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C602971B86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:10:27 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 23:10:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="41885911"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 23:10:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 20:09:43 +1300
Message-Id: <6755735121ae740ca8c2074c4ce7273c5fce9a5a.1481612135.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481612135.git.paul.eggleton@linux.intel.com>
References: <cover.1481612135.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/14] devtool: extract: disable basehash mismatch errors
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
X-List-Received-Date: Tue, 13 Dec 2016 07:10:27 -0000

Using the setVariable commands here followed by buildFile will result in
"basehash mismatch" errors, and that's expected since we are deviating
*at runtime* from what was previously seen by changing these variable
values. Set BB_HASH_IGNORE_MISMATCH to turn off the errors.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index fbd8a71..c52b006 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -497,6 +497,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
         tinfoil.config_data.setVar('T', os.path.join(tempdir, 'temp'))
         tinfoil.config_data.setVar('BUILDCFG_FUNCS', '')
         tinfoil.config_data.setVar('BUILDCFG_HEADER', '')
+        tinfoil.config_data.setVar('BB_HASH_IGNORE_MISMATCH', '1')
 
         tinfoil.set_event_mask(['bb.event.BuildStarted',
                                 'bb.event.BuildCompleted',
-- 
2.5.5


