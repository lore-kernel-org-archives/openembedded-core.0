Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FD8C6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 21:36:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.115067.1680644193183009510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 14:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=DQYJZjiH;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 992808003E;
	Tue,  4 Apr 2023 23:36:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1680644190;
	bh=FpGhELS9aAI6gz64+6YHlsGQaQjSVyO7tcg6fEveyu0=;
	h=From:To:Cc:Subject:Date:From;
	b=DQYJZjiHOiv+MT3XS74tlXQHBepoQYAU1mOft+deFxX+UK0F/EomQ+WdrC9yUj3zm
	 NNJCDfd6wYhBH9XGBa82X+pfC5TRxHQMepngzsKlrmIriaot8j4BUO0nKLM3g7UCaX
	 P/LlrFKu6nN+WuK4VpOjpZgw3yA/Hxy0rvblktkIwfiGNZsQLG9Ock7lmukICvVE4p
	 2zhPAL7GpFWpTpqJUOgC2eEG7wco8F7uoMs1FuPU8f+BjnUWWT696vPDlp7oH9q+ln
	 xGSl1Q0wecilJoh3HkiXJZTr/M9FNA6h1OgVff8YdrZcZ0SSVnGX7q9OfDzkdzlMCy
	 AnbmI6viBdKWA==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] yocto-check-layer: scan additional layers for tested layer dependencies
Date: Tue,  4 Apr 2023 23:36:05 +0200
Message-Id: <20230404213605.170461-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 21:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179710

In case a LAYERDEPENDS of a tested layer contains a dependency which is
present in additional layers, such dependency does not get pulled into
the layer test as a dependency be default and instead of YCL stops and
reports it cannot find dependent layers.

An example of this is a layer with LAYERDEPENDS =3D " core openembedded-c=
ore "
and then by running YCL on such layer using the following invocation:
$ yocto-check-layer -d --additional-layers ../meta-openembedded/ -- ../me=
ta-board-distro
...
ERROR: Layer meta-board-distro depends on openembedded-layer and isn't fo=
und.
...

The fix here adds all layers in the --additional-layers list into layers
which are searched for dependencies of the tested layer. That way, even
layers present in additional-layers list are searched and possibly used
as dependencies for the layer check.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/yocto-check-layer | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 67cc71950f..fbb715c0af 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -144,7 +144,7 @@ def main():
     if not args.no_auto_dependency:
         depends =3D []
         for layer in layers:
-            layer_depends =3D get_layer_dependencies(layer, dep_layers, =
logger)
+            layer_depends =3D get_layer_dependencies(layer, dep_layers +=
 additional_layers, logger)
             if layer_depends:
                 for d in layer_depends:
                     if d not in depends:
@@ -188,7 +188,7 @@ def main():
         missing_dependencies =3D not add_layer_dependencies(bblayersconf=
, layer, dep_layers, logger)
         if not missing_dependencies:
             for additional_layer in additional_layers:
-                if not add_layer_dependencies(bblayersconf, additional_l=
ayer, dep_layers, logger):
+                if not add_layer_dependencies(bblayersconf, additional_l=
ayer, dep_layers + additional_layers, logger):
                     missing_dependencies =3D True
                     break
         if missing_dependencies:
--=20
2.39.2


