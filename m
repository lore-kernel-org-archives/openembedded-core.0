Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B7E0271C27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 19:28:34 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP; 12 Jan 2017 11:28:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,219,1477983600"; d="scan'208";a="52325254"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga005.jf.intel.com with ESMTP; 12 Jan 2017 11:28:24 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 11:24:46 -0800
Message-Id: <1484249086-36492-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] sanity.bbclass: Improved error message
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
X-List-Received-Date: Thu, 12 Jan 2017 19:28:34 -0000

When a non-existing MACHINE is specified, sanity check issues
the following message:

    Please set a valid MACHINE in your local.conf or environment

However, MACHINE can also be set in multiconfig .conf file(s).
Hence we may have several different MACHINE settings within one
(multiconfig) build, so the present error message is fairly
ambiguous.

This patch remedies this by explicitly naming the offending MACHINE and
adding conf/multiconfig/*.conf to the list of places where this erroneous
MACHINE definition could have originated.

    Invalid MACHINE=xyz. Please set a valid MACHINE in your local.conf, conf/multiconfig/*.conf or environment

[YOCTO#10810]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c876dc6..8477d38 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -823,7 +823,7 @@ def check_sanity_everybuild(status, d):
     machinevalid = True
     if d.getVar('MACHINE'):
         if not check_conf_exists("conf/machine/${MACHINE}.conf", d):
-            status.addresult('Please set a valid MACHINE in your local.conf or environment\n')
+            status.addresult('Invalid MACHINE=%s. Please set a valid MACHINE in your local.conf, conf/multiconfig/*.conf or environment\n' % (d.getVar('MACHINE')))
             machinevalid = False
         else:
             status.addresult(check_sanity_validmachine(d))
-- 
2.7.4


