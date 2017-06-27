Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7FDD577F7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 15:34:00 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id m68so15697141ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 08:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2g/nKlSd19N+Uupdb4ocLvZuCU6ZtspOALaGwLNV88U=;
	b=wtGEftaKd+yJRvdjdT0UMZE+ykQQm+Ei4GYoOfYa7YOVDM0chXaziqXW7upwz+aRoq
	2U3LB1fgxExcjYElGSrq3Y7cQ1bxTqk0H48spMkkahFh/nn1KzwNrAbAkhRaWzIVmef0
	v903YwLD53L2V2i/o9qxDX8qD7asysHzGi5roXNF/Y7x1KGhoQOII8xPAUVrUtMaeBQ2
	ywncT49mWG1NdRodiShRhv2gU52QB2VSlEQXlP0O56ofQG1s0HoVy0tSrJniEaAMXpzh
	uemTbbByCbzK7hfmySZXHlnCoDUREih7vH+8+6KaXRmTsGSirLTKtm3+U78IbsmfEFFq
	QhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2g/nKlSd19N+Uupdb4ocLvZuCU6ZtspOALaGwLNV88U=;
	b=dKbTG+TDBD9RmyMGfV2rBkmhbl4Dy97pCCpzT6dM/zxBnBolvkVspDl9GzKpQtmtbU
	EJEsK47TyBm7Ff81dHPw7tRy6Upg8BdCdQr6+4+24UVcpNmEilX65RH3emRXPzJ4kNG+
	0YLyFnNevTWclWviVkstmmfbx8otfCA+39hy5hVJ4+20q2/rputaAMGw4gpFiN+Df+CE
	kR/yc0NRJVsGunQcGVEsDYp/wmt3Oc785r4DKHX8HDP8mGDq76VcQjD2ROTmT7if+QVf
	eWanuij4hMUiQ5wEc7ABUDtdLi6fgRtfS38oFbr6jBwxaGcm1S23CNQRzPaORJPrE600
	ugFQ==
X-Gm-Message-State: AKS2vOwoWYyrG3MgFRjKpJ2iJV04J1ZmcovOwf3sbq2LAkLlGHnubTfY
	OqKsJmBUa1EBWFxvv+g=
X-Received: by 10.36.34.132 with SMTP id o126mr3033646ito.67.1498577641985;
	Tue, 27 Jun 2017 08:34:01 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FB9F.dip0.t-ipconnect.de.
	[93.232.251.159]) by smtp.gmail.com with ESMTPSA id
	f40sm1702550ioj.19.2017.06.27.08.33.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jun 2017 08:34:00 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 17:33:40 +0200
Message-Id: <2312c1a18a7a4154d99028405f5f865be42fa7a5.1498577501.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
References: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 3/6] yocto-compat-layer.py: apply test_signatures to all layers
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
X-List-Received-Date: Tue, 27 Jun 2017 15:34:01 -0000

Software layers were previously allowed to change signatures, but
that's not desired for those layers either. The rule that a layer
which is "Yocto Compatible 2.0" must not change signatures unless
explicitly requested holds for all kinds of layers.

However, as this is something that software layers might not be able
to do right away, testing for signature changes in software layers can
be disabled. It's on by default, as that was Richard's
recommendation. Whether that should change needs further discussion as
part of finalizing "Yocto Compatible 2.0".

As it might still change, the tool now has both a with/without
parameter so that users of the tool can choose the desired behavior
without being affected by future changes to the default.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/cases/common.py |  5 +++--
 scripts/lib/compatlayer/context.py      |  3 ++-
 scripts/yocto-compat-layer.py           | 12 +++++++++---
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
index 2dfcbb1..a1cdbab 100644
--- a/scripts/lib/compatlayer/cases/common.py
+++ b/scripts/lib/compatlayer/cases/common.py
@@ -27,8 +27,9 @@ class CommonCompatLayer(OECompatLayerTestCase):
                       'bitbake -e')
 
     def test_signatures(self):
-        if self.tc.layer['type'] == LayerType.SOFTWARE:
-            raise unittest.SkipTest("Layer %s isn't BSP or DISTRO one." \
+        if self.tc.layer['type'] == LayerType.SOFTWARE and \
+           not self.tc.test_software_layer_signatures:
+            raise unittest.SkipTest("Not testing for signature changes in a software layer %s." \
                      % self.tc.layer['name'])
 
         # task -> (old signature, new signature)
diff --git a/scripts/lib/compatlayer/context.py b/scripts/lib/compatlayer/context.py
index 4932238..7811d4a 100644
--- a/scripts/lib/compatlayer/context.py
+++ b/scripts/lib/compatlayer/context.py
@@ -9,6 +9,7 @@ import re
 from oeqa.core.context import OETestContext
 
 class CompatLayerTestContext(OETestContext):
-    def __init__(self, td=None, logger=None, layer=None):
+    def __init__(self, td=None, logger=None, layer=None, test_software_layer_signatures=True):
         super(CompatLayerTestContext, self).__init__(td, logger)
         self.layer = layer
+        self.test_software_layer_signatures = test_software_layer_signatures
diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index 30c55a9..a16974f 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -30,12 +30,12 @@ CASES_PATHS = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
                 'lib', 'compatlayer', 'cases')]
 logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
-def test_layer_compatibility(td, layer):
+def test_layer_compatibility(td, layer, test_software_layer_signatures):
     from compatlayer.context import CompatLayerTestContext
     logger.info("Starting to analyze: %s" % layer['name'])
     logger.info("----------------------------------------------------------------------")
 
-    tc = CompatLayerTestContext(td=td, logger=logger, layer=layer)
+    tc = CompatLayerTestContext(td=td, logger=logger, layer=layer, test_software_layer_signatures=test_software_layer_signatures)
     tc.loadTests(CASES_PATHS)
     return tc.runTests()
 
@@ -53,6 +53,12 @@ def main():
             help='List of MACHINEs to be used during testing', action='store')
     parser.add_argument('--additional-layers', nargs="+",
             help='List of additional layers to add during testing', action='store')
+    group = parser.add_mutually_exclusive_group()
+    group.add_argument('--with-software-layer-signature-check', action='store_true', dest='test_software_layer_signatures',
+                       default=True,
+                       help='check that software layers do not change signatures (on by default)')
+    group.add_argument('--without-software-layer-signature-check', action='store_false', dest='test_software_layer_signatures',
+                       help='disable signature checking for software layers')
     parser.add_argument('-n', '--no-auto', help='Disable auto layer discovery',
             action='store_true')
     parser.add_argument('-d', '--debug', help='Enable debug output',
@@ -173,7 +179,7 @@ def main():
             layers_tested = layers_tested + 1
             continue
 
-        result = test_layer_compatibility(td, layer)
+        result = test_layer_compatibility(td, layer, args.test_software_layer_signatures)
         results[layer['name']] = result
         results_status[layer['name']] = 'PASS' if results[layer['name']].wasSuccessful() else 'FAIL'
         layers_tested = layers_tested + 1
-- 
git-series 0.9.1

