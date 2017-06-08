Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DFF917827E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:32:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 09:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="271875655"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2017 09:32:04 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 11:32:01 -0500
Message-Id: <3ef7aa0e28e5b02af7e45b06c1569c55533a35de.1496939387.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496939387.git.anibal.limon@linux.intel.com>
References: <cover.1496939387.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1496939387.git.anibal.limon@linux.intel.com>
References: <cover.1496939387.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] devtool/standard: Fix lock in _prep_extract_operation
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
X-List-Received-Date: Thu, 08 Jun 2017 16:32:08 -0000
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
index 2ecef99..7e342e7 100644
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


