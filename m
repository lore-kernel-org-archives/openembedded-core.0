Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3D67972F21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 20:36:17 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 11 May 2017 13:36:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,325,1491289200"; d="scan'208";a="86546687"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.129])
	by orsmga004.jf.intel.com with ESMTP; 11 May 2017 13:36:18 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 May 2017 15:36:32 -0500
Message-Id: <1494534992-28733-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] devtool/standard: Fix lock in _prep_extract_operation
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
X-List-Received-Date: Thu, 11 May 2017 20:36:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If for any reason the parse_recipe fail in extract command
the process gets locked because Cooker is expecting the
finish event by tinfoil.

For example:

$ devtool extract remake /tmp/remake

ERROR: remake is unavailable:
  remake was skipped: PREFERRED_PROVIDER_virtual/make set to make, not remake

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 5ff1e23..5fa1317 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -436,6 +436,7 @@ def _prep_extract_operation(config, basepath, recipename, tinfoil=None):
 
     rd = parse_recipe(config, tinfoil, recipename, True)
     if not rd:
+        tinfoil.shutdown()
         return None
 
     if bb.data.inherits_class('kernel-yocto', rd):
-- 
2.1.4


