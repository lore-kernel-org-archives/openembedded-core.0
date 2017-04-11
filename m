Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE1977D20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 18:39:10 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id a103so13849708ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 11:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/PZ1kTLG7py+lneL9hoczjkQ8f/Dqjw8tydMmHn1UkQ=;
	b=iNufeMGC5npisA8LJ6VSQako8oqENQ9DbzOZrFc+x9zw8BmMXbF4XZju2zmOxuPAMT
	obPHTsXgXXdSQNgr4P9zImXVA8i3LY+ay+MdPvpUnQzb6uHDREw54Um+px0/uddhi1H5
	1s27YAak0Yl1HccSgJQsVRN39lxlTlXyNVYnkVGXYvv8bdppEPhVEkZPdbTKqx/bzIVA
	fZdRuAKFQlGPwoUxHKfcPpYlvvUSk27mNlJtfr4jEfeFOGJb3Y3jJOCoMDZVUD+dAa0z
	IesuT3p4yq/YPxE+lM4XB+gd0LuYLHsAF0xR83bLkwFdYQqWAmDIVd+HZrGTkLKXoZdA
	XnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/PZ1kTLG7py+lneL9hoczjkQ8f/Dqjw8tydMmHn1UkQ=;
	b=MT4CwPQQ+CVKEGxXbsxwa8/41KYLuL9bgbvhLQSB28shRSgfBo3irJQ6jDyhOZVELL
	t9o2DD3DM+g6+465PKWvGBwyUtwlRrHSAFrDlzRvb5rcjUS+GznTIVbj3S7pHPNHO4dl
	bPH0e750qUUy0K9eips7nCJ88ei/+twcdZ/GapmbavN7jm8+nMit/PDnbB2ucvFcNHYJ
	frmP57QBSXklWYdgWhpBWXmwT3TCGXtCHlrQaAUsIYZmUQ1O4peDYcS+omEF5TqodGsx
	WSA4ddVC7L1vKbVmTsYl6tWRYzECyeG6yljGRGK3SKa421WfVavYji8MZV9HAHo6x/dk
	7BSQ==
X-Gm-Message-State: AN3rC/7qPlEN0VU1i11KK2QGMMGMni6IU+qPHE3iIg40vOBw/Bd8LgG3U1rNDB7C1e3csRGt
X-Received: by 10.107.85.6 with SMTP id j6mr76203iob.165.1491935951559;
	Tue, 11 Apr 2017 11:39:11 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162]) by smtp.gmail.com with ESMTPSA id
	m63sm8260499ioa.15.2017.04.11.11.39.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 11:39:10 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 20:38:41 +0200
Message-Id: <ff38318297b94bbfd91ef1b845f6de82ea82604e.1491935802.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
References: <cover.cb646ccab623b83f4d64996b56617990d731e820.1491935802.git-series.patrick.ohly@intel.com>
Subject: [PATCH v4 6/8] yocto-compat-layer: add --additional-layers
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
X-List-Received-Date: Tue, 11 Apr 2017 18:39:10 -0000

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
   OE-core, but might break in combination with some other machines

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

