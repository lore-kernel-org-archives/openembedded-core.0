Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 92862777C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 15:16:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 10 Mar 2017 07:16:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,141,1486454400"; d="scan'208";a="234596920"
Received: from pequod.jf.intel.com ([10.54.74.23])
	by fmsmga004.fm.intel.com with ESMTP; 10 Mar 2017 07:16:49 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 07:15:52 -0800
Message-Id: <20170310151552.47901-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] uninative: remove unneeded call to sparse copy
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
X-List-Received-Date: Fri, 10 Mar 2017 15:16:48 -0000

As of this commit:

39f5a05152aa0c3503735e18dd3b4c066b284107

patchelf no longer inflates file sizes. Since the files are no longer
inflated by patchelf, we can skip using cp with the --sparse option.
More details as to how patchelf has changed are available in that
commit log.

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/classes/uninative.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 0d1063a13c..ee4ab20c17 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -122,7 +122,4 @@ python uninative_changeinterp () {
                 continue
 
             subprocess.check_output(("patchelf-uninative", "--set-interpreter", d.getVar("UNINATIVE_LOADER"), f), stderr=subprocess.STDOUT)
-            subprocess.check_output(("cp", "--sparse=always", f, f + ".sparse"), stderr=subprocess.STDOUT)
-            os.unlink(f)
-            os.rename(f + ".sparse", f)
 }
-- 
2.12.0


