Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E21B67687B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:39:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 08 Sep 2015 03:39:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="800537285"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2015 03:39:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 11:39:15 +0100
Message-Id: <bef2eb255ffb3fef6575e9f2365f4318a8967812.1441706523.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 9/9] devtool: fix running from a different directory
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
X-List-Received-Date: Tue, 08 Sep 2015 10:39:46 -0000

Fixes the following error when running devtool from a directory other
than the build directory (or the SDK base path when using within the
extensible SDK):

  The BBPATH variable is not set and bitbake did not find a
  conf/bblayers.conf file in the expected location.
  Maybe you accidentally invoked bitbake from the wrong directory?

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/devtool b/scripts/devtool
index b9d3bb9..87df951 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -221,6 +221,9 @@ def main():
     if not config.read():
         return -1
 
+    # We need to be in this directory or we won't be able to initialise tinfoil
+    os.chdir(basepath)
+
     bitbake_subdir = config.get('General', 'bitbake_subdir', '')
     if bitbake_subdir:
         # Normally set for use within the SDK
-- 
2.1.0


