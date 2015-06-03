Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E8C5F75716
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 18:08:57 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 03 Jun 2015 11:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,548,1427785200"; d="scan'208";a="581512588"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga003.jf.intel.com with ESMTP; 03 Jun 2015 11:09:00 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Wed,  3 Jun 2015 11:07:26 -0700
Message-Id: <1433354849-16843-5-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433354849-16843-1-git-send-email-juro.bystricky@intel.com>
References: <1433354849-16843-1-git-send-email-juro.bystricky@intel.com>
Subject: [PATCH 4/7] sanity.bbclass: Prevent 'vdi' and 'live' to be built together
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
X-List-Received-Date: Wed, 03 Jun 2015 18:08:58 -0000

Same reason and check as for vmdk.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 32e9b82..c0c06e7 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -825,6 +825,11 @@ def check_sanity_everybuild(status, d):
     if 'vmdk' in d.getVar('IMAGE_FSTYPES', True) and 'live' in d.getVar('IMAGE_FSTYPES', True):
         status.addresult("Error, IMAGE_FSTYPES vmdk and live can't be built together\n")
 
+    # Check vdi and live can't be built together.
+    if 'vdi' in d.getVar('IMAGE_FSTYPES', True) and 'live' in d.getVar('IMAGE_FSTYPES', True):
+        status.addresult("Error, IMAGE_FSTYPES vdi and live can't be built together\n")
+
+
 def check_sanity(sanity_data):
     class SanityStatus(object):
         def __init__(self):
-- 
1.9.1


