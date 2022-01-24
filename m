Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE81FC433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 15:43:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5235.1643038981557639013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 07:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F00D6D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 07:43:00 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 058E33F766
	for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 07:42:59 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] yocto-check-layer: add debug output for the layers that were
 found
Date: Mon, 24 Jan 2022 15:42:56 +0000
Message-Id: <20220124154256.3791133-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 15:43:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160879

When debugging weird yocto-check-layer output it is useful to know
what the tool found when looking for layers.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/yocto-check-layer | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 2445ad5e43f..c637aad3950 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -106,6 +106,11 @@ def main():
     else:
         dep_layers =3D layers
=20
+    for l in additional_layers:
+        logger.debug("Found additional layer %s (%s)" % (l["name"], l["p=
ath"]))
+    for l in dep_layers:
+        logger.debug("Found dependency layer %s (%s)" % (l["name"], l["p=
ath"]))
+
     logger.info("Detected layers:")
     for layer in layers:
         if layer['type'] =3D=3D LayerType.ERROR_BSP_DISTRO:
--=20
2.25.1


