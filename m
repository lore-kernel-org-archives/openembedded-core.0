Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4BCC433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 16:02:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5599.1643040138457423904
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 08:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22AB1D6E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 08:02:18 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C131A3F793
	for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 08:02:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] yocto-check-layer: add debug output for the layers that
 were found
Date: Mon, 24 Jan 2022 16:02:05 +0000
Message-Id: <20220124160205.3793644-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 16:02:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160880

When debugging weird yocto-check-layer output it is useful to know
what the tool found when looking for layers.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/yocto-check-layer | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 2445ad5e43f..393bee794f3 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -41,6 +41,12 @@ def test_layer(td, layer, test_software_layer_signatur=
es):
     tc.loadTests(CASES_PATHS)
     return tc.runTests()
=20
+def dump_layer_debug(layer):
+    logger.debug("Found additional layer %s (%s)" % (layer["name"], laye=
r["path"]))
+    collections =3D layer.get("collections", {})
+    if collections:
+        logger.debug("%s collections: %s" % (layer["name"], ", ".join(co=
llections)))
+
 def main():
     parser =3D argparse.ArgumentParser(
             description=3D"Yocto Project layer checking tool",
@@ -106,6 +112,13 @@ def main():
     else:
         dep_layers =3D layers
=20
+    logger.debug("Found additional layers:")
+    for l in additional_layers:
+        dump_layer_debug(l)
+    logger.debug("Found dependency layers:")
+    for l in dep_layers:
+        dump_layer_debug(l)
+
     logger.info("Detected layers:")
     for layer in layers:
         if layer['type'] =3D=3D LayerType.ERROR_BSP_DISTRO:
--=20
2.25.1


