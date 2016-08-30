Return-Path: <mikko.ylinen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5238B606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 05:38:47 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 29 Aug 2016 22:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,254,1470726000"; 
   d="scan'208";a="2627891"
Received: from tungchin-suna.ccr.corp.intel.com (HELO
	summit.ger.corp.intel.com) ([10.252.6.144])
	by orsmga004.jf.intel.com with ESMTP; 29 Aug 2016 22:38:46 -0700
From: Mikko Ylinen <mikko.ylinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 08:38:45 +0300
Message-Id: <20160830053845.21004-1-mikko.ylinen@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] image_types: check COMPRESS_DEPENDS for backwards compatibility
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
X-List-Received-Date: Tue, 30 Aug 2016 05:38:50 -0000

To complete the transition/renaming to chained image type CONVERSION
while maintaining bacwards compatibility to COMPRESS(ION), make sure also
COMPRESS_DEPENDS is checked. Without this, the dependencies for legacy
COMPRESSIONTYPES do not get built.

Signed-off-by: Mikko Ylinen <mikko.ylinen@intel.com>
---
 meta/classes/image_types.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 2e852af..21e2ff9 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -30,6 +30,7 @@ def imagetypes_getdepends(d):
             adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends, True) , deps)
         for ctype in resttypes:
             adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype, True), deps)
+            adddep(d.getVar("COMPRESS_DEPENDS_%s" % ctype, True), deps)
 
     # Sort the set so that ordering is consistant
     return " ".join(sorted(deps))
-- 
2.9.3

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


