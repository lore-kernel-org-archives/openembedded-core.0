Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 79D296AC3C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 05:14:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 20 Mar 2016 22:14:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,369,1455004800"; d="scan'208";a="938122164"
Received: from edeshpan-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.136.133])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2016 22:14:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 18:14:03 +1300
Message-Id: <82cde97c51940dc35f4cf196c7693bb6d0183122.1458537176.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1458537176.git.paul.eggleton@linux.intel.com>
References: <cover.1458537176.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/9] devtool: configure-help: fix error if do_configure not already run
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
X-List-Received-Date: Mon, 21 Mar 2016 05:14:30 -0000

The code here for running do_configure if it hadn't already been run was
using the wrong string substitution parameters; fix it and test it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/utilcmds.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/utilcmds.py b/scripts/lib/devtool/utilcmds.py
index 905d6d2..b761a80 100644
--- a/scripts/lib/devtool/utilcmds.py
+++ b/scripts/lib/devtool/utilcmds.py
@@ -86,7 +86,7 @@ def configure_help(args, config, basepath, workspace):
         logger.info('Running do_configure to generate configure script')
         try:
             stdout, _ = exec_build_env_command(config.init_path, basepath,
-                                               'bitbake -c configure %s' % msg, args.recipename,
+                                               'bitbake -c configure %s' % args.recipename,
                                                stderr=subprocess.STDOUT)
         except bb.process.ExecutionError:
             pass
-- 
2.5.5


