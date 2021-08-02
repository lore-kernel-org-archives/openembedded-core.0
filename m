Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.17084.1627890833514922652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002136"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002136"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:32 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478655235"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:31 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 30/37] yocto-check-layer: improve missed dependencies
Date: Mon,  2 Aug 2021 15:52:17 +0800
Message-Id: <073637cbc99c0e6c05138f248856181154f33b70.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

The first 2 calls to add_layer_dependencies() are here to add all
dependencies for the 'layer under test' and the additional layers
provided by the users.

In both cases, we use misssing_dependencies boolean to indicate if any
dependency is missing. But we then never really use
missing_dependencies. Instead the script is calling
add_layer_dependencies() again (for both the layer under test, and the
additional layers) to detect if there are any missing dependency. As a
result, we are trying to add again all dependencies, and we can see
that from the traces:

INFO: Detected layers:
INFO: meta-aws: LayerType.SOFTWARE, /work/oe/sources/meta-aws
INFO: checklayer: Doesn't have conf/layer.conf file, so ignoring
INFO:
INFO: Setting up for meta-aws(LayerType.SOFTWARE), /work/oe/sources/meta-aws
INFO: Adding layer meta-python
INFO: Adding layer meta-oe
INFO: Adding layer meta-networking
-->
INFO: Adding layer meta-python
INFO: meta-python is already in /work/oe/poky/master/build-checklayer/conf/bblayers.conf
INFO: Adding layer meta-oe
INFO: meta-oe is already in /work/oe/poky/master/build-checklayer/conf/bblayers.conf
INFO: Adding layer meta-networking
INFO: meta-networking is already in /work/oe/poky/master/build-checklayer/conf/bblayers.conf
<--
INFO: Getting initial bitbake variables ...

The code appears more complex than it should, and we can simply
replace the complex if statement by using missing_dependencies, and
avoid duplicating the call to add_layer_dependencies().

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fceb84f7bc472731b8f96ee1ebf0f4485943226c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/yocto-check-layer | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index deba3cb4f8..8e94a03b11 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -160,9 +160,7 @@ def main():
                 if not add_layer_dependencies(bblayersconf, additional_layer, dep_layers, logger):
                     missing_dependencies = True
                     break
-        if not add_layer_dependencies(bblayersconf, layer, dep_layers, logger) or \
-           any(map(lambda additional_layer: not add_layer_dependencies(bblayersconf, additional_layer, dep_layers, logger),
-                   additional_layers)):
+        if missing_dependencies:
             logger.info('Skipping %s due to missing dependencies.' % layer['name'])
             results[layer['name']] = None
             results_status[layer['name']] = 'SKIPPED (Missing dependencies)'
-- 
2.31.1

