Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B3D8D7199D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 19:01:33 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 04 Jan 2017 11:01:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,317,1477983600"; d="scan'208";a="45737568"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 04 Jan 2017 11:01:33 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 2F6166A4006;
	Wed,  4 Jan 2017 11:00:40 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 20:48:17 +0200
Message-Id: <1483555698-27838-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] populate_sdk_ext: fix working with uninative sstate
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
X-List-Received-Date: Wed, 04 Jan 2017 19:01:35 -0000

Mapped uninative sstate directories to make ext SDK installer to
use them when it's run on systems with gcc version different from
gcc version used to build installer.

[YOCTO #10832]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 0812eea..fc9cc22 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -308,7 +308,10 @@ python copy_buildsystem () {
             f.write('BB_SETSCENE_ENFORCE_WHITELIST = "%:* *:do_shared_workdir *:do_rm_work"\n\n')
 
             # Hide the config information from bitbake output (since it's fixed within the SDK)
-            f.write('BUILDCFG_HEADER = ""\n')
+            f.write('BUILDCFG_HEADER = ""\n\n')
+
+            # Map gcc-dependent uninative sstate cache for installer usage
+            f.write('SSTATE_MIRRORS = "file://universal/(.*) file://universal-4.9/\\1\\nfile://universal-4.9/(.*) file://universal-4.8/\\1"\n\n')
 
             # Allow additional config through sdk-extra.conf
             fn = bb.cookerdata.findConfigFile('sdk-extra.conf', d)
-- 
2.1.4


