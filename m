Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28BE0C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 14:13:11 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web08.9481.1643983972820228964
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 06:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=gGnu0vx/;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643983990; x=1675519990;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oas/kyI2J/tbVwm/PtOefjSSv7M1hNxHyJBQe6zs4Hc=;
  b=gGnu0vx/+VQ13D652tjHKLkYnDA0ls13mi/dN7FD9hkdmPUJqQI1zvce
   7/OwfZTSSRZ3BvxzwRJ1uOr6rpuksJFGnwXKmNSlytnLztWFLppYQWGlt
   K7NDrFKITL/7aNA2eQcGtjPpnAG2ILYmlgQ0DcHlPGtL6cHlLIuode2qb
   0BBM6iRVDZaYhH1ALGk3+omHyu5b2uYFiJ1RqRuC/nHD+K47+IJXJ5Uqs
   BorUZBPrlbqcpFh+qcsu2I8SgA0meLyjmnqzFUlK4hRQglOMlw9avOsy0
   4BwWCGhA5JWViRFZBIBm53mvUF3MoPskwbOuHWe3Am6oow52ickIQA6Ye
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="248321641"
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="248321641"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,342,1635231600";
   d="scan'208";a="566750097"
Received: from raajloka-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.235.116])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 06:13:08 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 12/17] yocto-check-layer: add debug output for the
 layers that were found
Date: Fri,  4 Feb 2022 22:12:38 +0800
Message-Id: 
 <6ff05fe05a23d4355c3a33a03350dea025133689.1643983711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643983711.git.anuj.mittal@intel.com>
References: <cover.1643983711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 14:13:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161359

From: Ross Burton <ross@burtonini.com>

When debugging weird yocto-check-layer output it is useful to know
what the tool found when looking for layers.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 711e2d4d7baf36f8497741c14268d7f72d0db016)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/yocto-check-layer | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 2445ad5e43..f3cf139d8a 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -41,6 +41,12 @@ def test_layer(td, layer, test_software_layer_signatures):
     tc.loadTests(CASES_PATHS)
     return tc.runTests()
 
+def dump_layer_debug(layer):
+    logger.debug("Found layer %s (%s)" % (layer["name"], layer["path"]))
+    collections = layer.get("collections", {})
+    if collections:
+        logger.debug("%s collections: %s" % (layer["name"], ", ".join(collections)))
+
 def main():
     parser = argparse.ArgumentParser(
             description="Yocto Project layer checking tool",
@@ -106,6 +112,13 @@ def main():
     else:
         dep_layers = layers
 
+    logger.debug("Found additional layers:")
+    for l in additional_layers:
+        dump_layer_debug(l)
+    logger.debug("Found dependency layers:")
+    for l in dep_layers:
+        dump_layer_debug(l)
+
     logger.info("Detected layers:")
     for layer in layers:
         if layer['type'] == LayerType.ERROR_BSP_DISTRO:
-- 
2.34.1


