Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id C1C1D77BF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:57:24 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id l7so4707807ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 07:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cGfuejcrJYUY3KWWwA2xTJVbJw0+8whOQMoshkSDpQs=;
	b=U3NEQfQ7NXZrt/gVTG2ctuOXaOjzoDR/X4s1IC+2ckNVeVB0WGs3tP+jqNnkH/pnck
	bUs+QlFj02KxLiS808JUMzs9O1aNWl78cudVqUhFKAkNzSCyhDcUJekWuTcIsEeF52iY
	wK7rObuGmYf+5U+bnt7gJOcn9jqJK7PbAd9yqmTuPc+BIUPApHte5pHcmhMEYRpGeUiJ
	GWY5PF6Kexz5zbaBk0rGT2qKh0Hf+fF3hOzkV8aE/v9oQJ5mMBwnuqWHKi2AtuXetuus
	zGvAbT1/QV/ITUQ+EHokURL4FpczjCq3VlPVuePyfkXDiU6fWj5RaAcap5g8JSwW92bE
	1ZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cGfuejcrJYUY3KWWwA2xTJVbJw0+8whOQMoshkSDpQs=;
	b=QBCWRLSb4Blg8crumk/zhRFo/67bUJzfuq65GOswzyP4ZuEvM/LWvNn0qkdb7P8Dr2
	bN7Zk8U580ojFP9SaHcNF/4yD4/epIqHvKtkH1qt/OSuwwZQ+swBuUpdKkHrSrDj5OBY
	VanQq0OJTD5CJKcu73fsFG2x3z/GM0QY/Gx3RbNuUIfg9SLk+0j4ROg6WutuKZ4xwo0k
	uTntFvgNHi1ip561AfveYHofAPiCKoT2N0/tnXfUzJF1PHZ6wMcMVH3dU92tvgH66u9x
	GZYPsOBZ5Ntz4flMPKNwELyXoI9KR4X7nb3DRlCE6Pi231dfXlP3Ypd6AapCuypSrBAD
	/cxw==
X-Gm-Message-State: AFeK/H0ddjBPrOc6zCTrahVaOt9R6MvDLIMQO2V+fTTO6Sr/tt80wpwtumuDrgHVHGDnO11x
X-Received: by 10.107.180.200 with SMTP id d191mr54907103iof.42.1491922644848; 
	Tue, 11 Apr 2017 07:57:24 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162])
	by smtp.gmail.com with ESMTPSA id 71sm8025298iof.29.2017.04.11.07.57.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 07:57:23 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 16:56:59 +0200
Message-Id: <42b00137ff59e190f83f08ce670c6f0cd73e7e3b.1491922350.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
References: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 6/8] yocto-compat-layer: add --additional-layers
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
X-List-Received-Date: Tue, 11 Apr 2017 14:57:25 -0000

The new --addditional-layers parameter takes a list of layer
directories and adds them to the build configuration before starting
testing. The resulting base configuration then more closely matches
a full distro.

This is relevant in two cases:
1. some layers like meta-freescale dynamically enable more recipes
   in their layer.conf depending on which other layers are active,
   so testing only against OE-core might miss problems which occur
   only when also some other layers are active
2. BSP layers might be fine in combination with machines from
   OE-core, but might break in combination to some other machines

As before, test_signatures only warns about signature changes
introduced by the layer which is under testing, and not those changes
introduced by the additional layers.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/yocto-compat-layer.py | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index 2ebddb6..daf3a6a 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -49,6 +49,8 @@ def main():
             help='File to output log (optional)', action='store')
     parser.add_argument('--dependency', nargs="+",
             help='Layers to process for dependencies', action='store')
+    parser.add_argument('--additional-layers', nargs="+",
+            help='List of additional layers to add during testing', action='store')
     parser.add_argument('-n', '--no-auto', help='Disable auto layer discovery',
             action='store_true')
     parser.add_argument('-d', '--debug', help='Enable debug output',
@@ -82,6 +84,10 @@ def main():
     if not layers:
         logger.error("Fail to detect layers")
         return 1
+    if args.additional_layers:
+        additional_layers = detect_layers(args.additional_layers, args.no_auto)
+    else:
+        additional_layers = []
     if args.dependency:
         dep_layers = detect_layers(args.dependency, args.no_auto)
         dep_layers = dep_layers + layers
@@ -128,13 +134,29 @@ def main():
 
         shutil.copyfile(bblayersconf + '.backup', bblayersconf)
 
-        if not add_layer_dependencies(bblayersconf, layer, dep_layers, logger):
+        missing_dependencies = not add_layer_dependencies(bblayersconf, layer, dep_layers, logger)
+        if not missing_dependencies:
+            for additional_layer in additional_layers:
+                if not add_layer_dependencies(bblayersconf, additional_layer, dep_layers, logger):
+                    missing_dependencies = True
+                    break
+        if not add_layer_dependencies(bblayersconf, layer, dep_layers, logger) or \
+           any(map(lambda additional_layer: not add_layer_dependencies(bblayersconf, additional_layer, dep_layers, logger),
+                   additional_layers)):
             logger.info('Skipping %s due to missing dependencies.' % layer['name'])
             results[layer['name']] = None
             results_status[layer['name']] = 'SKIPPED (Missing dependencies)'
             layers_tested = layers_tested + 1
             continue
 
+        if any(map(lambda additional_layer: not add_layer(bblayersconf, additional_layer, dep_layers, logger),
+                   additional_layers)):
+            logger.info('Skipping %s due to missing additional layers.' % layer['name'])
+            results[layer['name']] = None
+            results_status[layer['name']] = 'SKIPPED (Missing additional layers)'
+            layers_tested = layers_tested + 1
+            continue
+
         logger.info('Getting initial bitbake variables ...')
         td['bbvars'] = get_bb_vars()
         logger.info('Getting initial signatures ...')
-- 
git-series 0.9.1

