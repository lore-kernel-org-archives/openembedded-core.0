Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6DDC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 09:07:23 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.19860.1644224834864333556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 01:07:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=jF+MtQjI;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644224843; x=1675760843;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TOWEjF7yI1x4bSLc0J4bacm+S+TfvC/d6IBUEZ2pKT4=;
  b=jF+MtQjI1mWVnsvccGkVTyvUhIK3sNo64/x3oClUMkaLsWvc4dI35/bw
   fROhrokVpVgoRdsrss5URoaP5GEsQR/iAAJVQbInUW74wWhNH5HUBAoRX
   8wzdTpAvRjxD4sblGDmuD/Ea3e7WLyIG74q/EB2Q5vks1jEPOcIH9xvLM
   jxmihS6sOw1m92JGDJ78qCp6s/xwRTtT6tX2YIAGr71apOlcS10ZK7X2R
   52vJLaFSLHZZtFvc/5nqqJ2qjr1NZ00OK5C6BYL3IsXVsNp0BFyIH7xjK
   FdpLVfpPADDPaK47rPJ9b/edfFkSrEbNF9aLW/Q7feRSnw77sk9r/+HJL
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="309420842"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="309420842"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="499140467"
Received: from xgoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.138.138])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:21 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/12] yocto-check-layer: add debug output for the
 layers that were found
Date: Mon,  7 Feb 2022 17:06:59 +0800
Message-Id: 
 <606924b7bc751741c58aaf2ba60639612b113fcd.1644224643.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644224643.git.anuj.mittal@intel.com>
References: <cover.1644224643.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 09:07:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161451

From: Ross Burton <ross@burtonini.com>

When debugging weird yocto-check-layer output it is useful to know
what the tool found when looking for layers.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 711e2d4d7baf36f8497741c14268d7f72d0db016)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
(cherry picked from commit 6ff05fe05a23d4355c3a33a03350dea025133689)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/yocto-check-layer | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 6975b09502..00a16d18fc 100755
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


