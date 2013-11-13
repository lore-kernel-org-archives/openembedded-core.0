Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 5D22C6D98B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 14:32:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 13 Nov 2013 06:33:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,693,1378882800"; d="scan'208";a="426920126"
Received: from junemccl-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.116])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2013 06:32:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2013 14:32:40 +0000
Message-Id: <22a0ccd54622f1893f965c5efe7ed3d1ddb3e61a.1384353075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1384353075.git.paul.eggleton@linux.intel.com>
References: <cover.1384353075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/11] classes/sanity: validate SDKMACHINE value
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
X-List-Received-Date: Wed, 13 Nov 2013 14:33:00 -0000

If SDKMACHINE is set then check that a configuration file matching it
actually exists, otherwise the user won't know that they've set it
incorrectly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 83378b0..6807a23 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -625,6 +625,11 @@ def check_sanity_everybuild(status, d):
     if machinevalid:
         status.addresult(check_toolchain(d))
 
+    # Check that the SDKMACHINE is valid, if it is set
+    if d.getVar('SDKMACHINE', True):
+        if not check_conf_exists("conf/machine-sdk/${SDKMACHINE}.conf", d):
+            status.addresult('Specified SDKMACHINE value is not valid\n')
+
     check_supported_distro(d)
 
     # Check if DISPLAY is set if TEST_IMAGE is set
-- 
1.8.1.2


