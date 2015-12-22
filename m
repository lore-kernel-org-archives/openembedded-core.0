Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6C65F73187
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 03:19:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 21 Dec 2015 19:19:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="866907942"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2015 19:19:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 16:19:16 +1300
Message-Id: <22b5ef3b4be4ac0a8d370d97b9a700c70eabdc26.1450754300.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450754300.git.paul.eggleton@linux.intel.com>
References: <cover.1450754300.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450754300.git.paul.eggleton@linux.intel.com>
References: <cover.1450754300.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] classes/populate_sdk_ext: hide build configuration in devtool build* output
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
X-List-Received-Date: Tue, 22 Dec 2015 03:19:47 -0000

The configuration of the build system within the extensible SDK is
fixed, so there's not a lot of point in showing it; plus it just gets in
the way of the output that's interesting to the user in this context. So
let's hide it within the extensible SDK.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 3d64e48..a824ca4 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -152,6 +152,9 @@ python copy_buildsystem () {
         # Ensure locked sstate cache objects are re-used without error
         f.write('SIGGEN_LOCKEDSIGS_CHECK_LEVEL = "warn"\n\n')
 
+        # Hide the config information from bitbake output (since it's fixed within the SDK)
+        f.write('BUILDCFG_HEADER = ""\n')
+
         # If you define a sdk_extraconf() function then it can contain additional config
         extraconf = (d.getVar('sdk_extraconf', True) or '').strip()
         if extraconf:
-- 
2.5.0


