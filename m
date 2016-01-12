Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E6E7A6011F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 18:48:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 12 Jan 2016 10:48:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,558,1449561600"; d="scan'208";a="879952888"
Received: from rusilaw-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.174])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2016 10:48:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 07:47:45 +1300
Message-Id: <0fa14d75f9861a513bddc8091546117642d49218.1452624350.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452624350.git.paul.eggleton@linux.intel.com>
References: <cover.1452624350.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452624350.git.paul.eggleton@linux.intel.com>
References: <cover.1452624350.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] classes/populate_sdk_ext: support auto.conf
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
X-List-Received-Date: Tue, 12 Jan 2016 18:48:23 -0000

If auto.conf exists in the user's configuration we need to also run it
through the same filter and write the result into the ext SDK, or we
risk missing configuration applied on an autobuilder.

Fixes [YOCTO #8904].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 984f538..69e13ab 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -169,6 +169,19 @@ python copy_buildsystem () {
 
         f.write('require conf/locked-sigs.inc\n')
 
+    if os.path.exists(builddir + '/conf/auto.conf'):
+        with open(builddir + '/conf/auto.conf', 'r') as f:
+            oldlines = f.readlines()
+        (updated, newlines) = bb.utils.edit_metadata(oldlines, varlist, handle_var)
+        with open(baseoutpath + '/conf/auto.conf', 'w') as f:
+            f.write('# WARNING: this configuration has been automatically generated and in\n')
+            f.write('# most cases should not be edited. If you need more flexibility than\n')
+            f.write('# this configuration provides, it is strongly suggested that you set\n')
+            f.write('# up a proper instance of the full build system and use that instead.\n\n')
+            for line in newlines:
+                if line.strip() and not line.startswith('#'):
+                    f.write(line)
+
     sigfile = d.getVar('WORKDIR', True) + '/locked-sigs.inc'
     oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
 
-- 
2.5.0


