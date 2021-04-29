Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2365.1619671281658268226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 21:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: S8+w4GmH1n28w1K5hZ1ORiSa5NEupiQiPm6Pswkk9K3R0WEAFNYb83dH0TKBhN1Em1SeESa8Ul
 DthntElm0fTQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="282258297"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="282258297"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:26 -0700
IronPort-SDR: heQCgpSqMkxFUFDO7wPjdGpb1ZUg9OumA9ZShyXklScH8/a9FySKBNcXAbFnjd/0y5LGZlvWME
 ikVy7ye3M5FA==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="423883643"
Received: from ytakikit-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.43.188])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:25 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/10] yocto-check-layer: Avoid bug when iterating and autoadding dependencies
Date: Thu, 29 Apr 2021 12:41:00 +0800
Message-Id: <280596107b2744de63e6f34007324e5e2c857758.1619667368.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619667368.git.anuj.mittal@intel.com>
References: <cover.1619667368.git.anuj.mittal@intel.com>
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

