Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.34639.1620052602095814023
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 07:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ws8KK2T5/uxWzEliq8Ypdw5RzCiVcH7Gpra+G6Cz+/z8YaJcrjxJ4YPj33o/Rt+6fOf80ucFhI
 hUqtq4W6Ywmg==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="197849550"
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; 
   d="scan'208";a="197849550"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2021 07:36:48 -0700
IronPort-SDR: gU1l1bWsR9goRcdswPOmJ5SS89n30JIAVkur1ruLln14FJSw7pjmKO7kro+iazpR9l8wr8DECF
 MUmi24oaIITA==
X-IronPort-AV: E=Sophos;i="5.82,270,1613462400"; 
   d="scan'208";a="405697156"
Received: from semohdyu-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.72.206])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2021 07:36:47 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 5/6] yocto-check-layer: Avoid bug when iterating and autoadding dependencies
Date: Mon,  3 May 2021 22:36:33 +0800
Message-Id: <079aba1a6fdf1d4b034c2e32c952cd2c30b861ff.1620052258.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620052258.git.anuj.mittal@intel.com>
References: <cover.1620052258.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If iterating a layer with multiple components and auto-adding dependencies
the tests can break since layers are never removed and order isn't guaranteed
to account for that.

Fix this by resetting the layer list back to the original list each time
before auto-adding the dependencies in each case.

This fixes scanning of meta-openembedded in particular where the sublayers
may not be added in order of minimal dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf1b467dacf345379cd5d84a1c9b3b0d844d5c91)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/yocto-check-layer | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index b7c83c8b54..deba3cb4f8 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -138,6 +138,9 @@ def main():
                 layer['type'] == LayerType.ERROR_BSP_DISTRO:
             continue
 
+        # Reset to a clean backup copy for each run
+        shutil.copyfile(bblayersconf + '.backup', bblayersconf)
+
         if check_bblayers(bblayersconf, layer['path'], logger):
             logger.info("%s already in %s. To capture initial signatures, layer under test should not present "
                "in BBLAYERS. Please remove %s from BBLAYERS." % (layer['name'], bblayersconf, layer['name']))
-- 
2.30.2

