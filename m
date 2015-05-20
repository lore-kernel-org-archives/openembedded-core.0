Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F3B1B72440
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 19:12:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 20 May 2015 12:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,465,1427785200"; d="scan'208";a="729191458"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga002.fm.intel.com with ESMTP; 20 May 2015 12:11:08 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 22:11:06 +0300
Message-Id: <b41f206dac24302bf08d49b30cd945763b83b5fa.1432147061.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1432147061.git.jussi.kukkonen@intel.com>
References: <cover.1432147061.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/2] sanity.bbclass: import subprocess in correct function
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
X-List-Received-Date: Wed, 20 May 2015 19:12:04 -0000

check_sanity() no longer needs the subprocess module but
sanity_handle_abichanges() does use subprocess.call().

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/classes/sanity.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index fc8c980..839f7ce 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -491,6 +491,8 @@ def sanity_handle_abichanges(status, d):
     #
     # Check the 'ABI' of TMPDIR
     #
+    import subprocess
+
     current_abi = d.getVar('OELAYOUT_ABI', True)
     abifile = d.getVar('SANITY_ABIFILE', True)
     if os.path.exists(abifile):
@@ -824,8 +826,6 @@ def check_sanity_everybuild(status, d):
         status.addresult("Error, IMAGE_FSTYPES vmdk and live can't be built together\n")
 
 def check_sanity(sanity_data):
-    import subprocess
-
     class SanityStatus(object):
         def __init__(self):
             self.messages = ""
-- 
2.1.4


