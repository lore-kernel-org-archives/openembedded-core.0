Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3F238781F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 15:05:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Oct 2017 08:05:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,371,1503385200"; 
   d="scan'208";a="1153182"
Received: from jlock-mobl3.ger.corp.intel.com ([10.252.27.30])
	by orsmga001.jf.intel.com with ESMTP; 17 Oct 2017 08:05:11 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Oct 2017 16:05:06 +0100
Message-Id: <20171017150506.17803-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] devtool: ensure temp directory is created
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
X-List-Received-Date: Tue, 17 Oct 2017 15:05:13 -0000

We often see nightly-oe-selftest on the Yocto Project Autobuilder fail in
test_devtool_modify_native with:

     'devtool modify apt-native -x /tmp/devtoolqahlptvsfq/apt-native' returned
     non-zero exit status 1

and the following traceback:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/scripts/devtool", line 331, in <module>
    ret = main()
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/scripts/devtool", line 318, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/scripts/lib/devtool/standard.py", line 714, in modify
    initial_rev = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/scripts/lib/devtool/standard.py", line 545, in _extract_source
    with open(os.path.join(tempdir, 'initial_rev'), 'r') as f:

Ensure the tempdir is created before we try and create any files there.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/lib/devtool/standard.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index beea0d4c274..38197251b42 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -494,6 +494,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
     tempbasedir = d.getVar('WORKDIR')
     bb.utils.mkdirhier(tempbasedir)
     tempdir = tempfile.mkdtemp(prefix='devtooltmp-', dir=tempbasedir)
+    bb.utils.mkdirhier(tempdir)
     try:
         tinfoil.logger.setLevel(logging.WARNING)
 
-- 
2.13.6


