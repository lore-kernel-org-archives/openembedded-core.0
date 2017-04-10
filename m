Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AAA4972F3C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 11:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491822828; x=1523358828; h=from:to:subject:date:message-id;
	bh=mKK+Wg/6O7VBKrYV562uLjVAKu/B/gCUHsnhs4jBLJk=;
	b=MU45Xfm97/neo37XFzu1cs+S+S1CyadTPk7JAbuIr7Fh0pl4zHELFX+m
	s5boRbyVSsZXwXpidlabtWb2dUrRlA==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2017 04:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,182,1488873600"; d="scan'208";a="1117717635"
Received: from unknown (HELO jlock-mobl1.ger.corp.intel.com) ([10.252.7.77])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2017 04:13:44 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 12:13:39 +0100
Message-Id: <20170410111339.16177-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] oeqa/sdk/cases/buildcpio: enable use of cached cpio from DL_DIR
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
X-List-Received-Date: Mon, 10 Apr 2017 11:13:46 -0000

All build project test cases will try to copy the requested source
artefacts from DL_DIR before fetching. This testcase is referencing bzipped
tarball whereas the recipe fetches a gzipped tarball.

Switch to fetching the gzipped tarball in the test case so that we're able
to use a cached tarball from DL_DIR

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildcpio.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
index 11d629a..333dc7c 100644
--- a/meta/lib/oeqa/sdk/cases/buildcpio.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -10,7 +10,7 @@ class BuildCpioTest(OESDKTestCase):
         dl_dir = self.td.get('DL_DIR', None)
 
         self.project = SDKBuildProject(self.tc.sdk_dir + "/cpio/", self.tc.sdk_env,
-                        "https://ftp.gnu.org/gnu/cpio/cpio-2.12.tar.bz2",
+                        "https://ftp.gnu.org/gnu/cpio/cpio-2.12.tar.gz",
                         self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
 
-- 
2.9.3


