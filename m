Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1195876F9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520229"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:21:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:18 +0100
Message-Id: <443ff1a82529214c534dbd078da86a77e2ae91d6.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/27] classes/populate_sdk_ext: drop work-config.inc
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:12 -0000

This is not actually used for anything - I thought that we would need to
use it within devtool to set global configuration, but we're able to do
everything we need within the bbappends it creates, which also saves on
parse time. If we're not going to use work-config.inc let's just drop it
completely.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 5 -----
 scripts/lib/devtool/sdk.py            | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 947ec74..c244d93 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -165,7 +165,6 @@ python copy_buildsystem () {
                 f.write(line.strip() + '\n')
 
         f.write('require conf/locked-sigs.inc\n')
-        f.write('require conf/work-config.inc\n')
 
     sigfile = d.getVar('WORKDIR', True) + '/locked-sigs.inc'
     oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
@@ -185,10 +184,6 @@ python copy_buildsystem () {
                                                    d.getVar('SSTATE_DIR', True),
                                                    sstate_out, d,
                                                    fixedlsbstring)
-
-    # Create a dummy config file for additional settings
-    with open(baseoutpath + '/conf/work-config.inc', 'w') as f:
-        pass
 }
 
 def extsdk_get_buildtools_filename(d):
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 2f416b3..7a842af 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -170,7 +170,7 @@ def sdk_update(args, config, basepath, workspace):
             logger.error("Updating meta data via git failed")
             return ret
         logger.debug("Updating conf files ...")
-        conf_files = ['local.conf', 'bblayers.conf', 'devtool.conf', 'work-config.inc', 'locked-sigs.inc']
+        conf_files = ['local.conf', 'bblayers.conf', 'devtool.conf', 'locked-sigs.inc']
         for conf in conf_files:
             ret = subprocess.call("wget -q -O - %s/conf/%s > conf/%s" % (args.updateserver, conf, conf), shell=True)
             if ret != 0:
-- 
2.1.0


