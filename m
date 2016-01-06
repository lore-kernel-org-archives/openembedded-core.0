Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C352E731E6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:16:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2016 03:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,528,1444719600"; d="scan'208";a="875594337"
Received: from ngochun1-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2016 03:16:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 00:15:46 +1300
Message-Id: <3e85ba58822744c2577cfac3440f2882a28b66b4.1452078721.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/14] devtool: sdk-update: fix metadata update step
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
X-List-Received-Date: Wed, 06 Jan 2016 11:16:57 -0000

* Clone the correct path - we need .git on the end
* Pull from the specified path instead of expecting a remote to be set
* up in the repo already (it isn't by default)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/sdk.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index afe52cf..daa3e4e 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -156,11 +156,11 @@ def sdk_update(args, config, basepath, workspace):
         logger.debug("Updating meta data via git ...")
         # Try using 'git pull', if failed, use 'git clone'
         if os.path.exists(os.path.join(basepath, 'layers/.git')):
-            ret = subprocess.call("cd layers && git pull", shell=True)
+            ret = subprocess.call("cd layers && git pull %s/layers/.git" % updateserver, shell=True)
         else:
             ret = -1
         if ret != 0:
-            ret = subprocess.call("rm -rf layers && git clone %s/layers" % updateserver, shell=True)
+            ret = subprocess.call("rm -rf layers && git clone %s/layers/.git" % updateserver, shell=True)
         if ret != 0:
             logger.error("Updating meta data via git failed")
             return ret
-- 
2.5.0


