Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id F20E4789CF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 12:34:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2018 05:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,365,1526367600"; d="scan'208";a="55642268"
Received: from spalapa-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.249.34.182])
	by fmsmga008.fm.intel.com with ESMTP; 17 Jul 2018 05:34:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 14:34:17 +0200
Message-Id: <212fd0ba0ad72026eece1babee9d4c3aa0ac4dbf.1531830833.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1531830833.git.paul.eggleton@linux.intel.com>
References: <cover.1531830833.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] oe-run-native: ensure arguments get quoted
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
X-List-Received-Date: Tue, 17 Jul 2018 12:34:28 -0000

If you pass quoted arguments to oe-run-native, they need to be passed
as-is to the underlying tool. Putting quotes around $@ ensures each
argument is quoted individually.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-run-native | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-run-native b/scripts/oe-run-native
index 1131122e685..bbdd1d8c1a8 100755
--- a/scripts/oe-run-native
+++ b/scripts/oe-run-native
@@ -60,7 +60,7 @@ tool_find=`/usr/bin/which $tool 2>/dev/null`
 
 if [ -n "$tool_find" ] ; then
     # add old path to allow usage of host tools
-    PATH=$PATH:$OLD_PATH $@
+    PATH=$PATH:$OLD_PATH "$@"
 else
     echo "Error: Unable to find '$tool' in $PATH"
     echo "Error: Have you run 'bitbake $native_recipe -caddto_recipe_sysroot'?"
-- 
2.17.1


