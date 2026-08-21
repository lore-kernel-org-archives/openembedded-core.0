Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90944C5DF89
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 12:27:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6282.1787315228770215347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 05:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bng6A8JX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C9B14E41319
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 12:27:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6AFE604AA
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 12:27:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D32E11C77081;
	Fri, 21 Aug 2026 14:27:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787315222; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N8ZHgTC8TShE2BjXGFnaOiBriJw0NrY6qaPfg6PxgrA=;
	b=bng6A8JXfThQxadKNWBuzInUpDxZB4CdAdGDk1u7KfM0prY7ASS6YogiCA2+y/u6UvR6+/
	dFffAMJEdlVrBjDkUNf9r8BSxsfGP1HB9YDvzN0F61rrsVdpL1B6W/g3KyvM3r+8xcdYXr
	vSoS8LoaDTMXOj7HaZa7kgdURmn7Fm4bViGMbI/OBK/AcE+olAj+xTcBj6atu/eE8Yp6bk
	IIkgLZ7xUKPMUDKnBlQ7K7w/DaJdT2lN7lJNqgO8inN6avnlNMdTaq31udARuYsXvU5RPw
	nhTQAHQ7aTpTmQ8oYuxy+eZakEQ41t6AcqYTMVaPbvvDbPhm3RtvnhaBd8upaA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 21 Aug 2026 14:26:32 +0200
Subject: [PATCH 2/3] lib/bbconfigbuild/configfragments.py: match Available
 and Enabled built-in fragment lists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-sbom-cve-check-fragment-desc-v1-2-e06feb747b07@bootlin.com>
References: <20260821-sbom-cve-check-fragment-desc-v1-0-e06feb747b07@bootlin.com>
In-Reply-To: <20260821-sbom-cve-check-fragment-desc-v1-0-e06feb747b07@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=G3zRlpZ35Sp47tBRVOtd2zwII0w99argvySv+qqox1c=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqiEQL4thvvFWdcyroAWSJm/SocL3hauJXaE8dh
 Gh/X08WFb6JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaohECwAKCRDRgEFAKaOo
 NpjvD/0RH649sqC6oy/rS5iDLa+zPySTl5nxgTOMESnUpKQFm3PenWW1anr0T1IPzuNszFUYUDx
 riPUNSeaT+vZz6WBiCae3cW/qNEX6DHWoqtQeT9ssX6l8hCW93qiRG7VJ3CVT8ilmSl2ijtO7DW
 mUqGRtu0p48s33M3cP7R1H/oMVLWgzul46kzeMHVCeWrxp/Efg0BeMmQrJLSu365Vx7fvgxadnA
 y7yonUzTlXcQXB6cDhQi6xbjfH0Omgx7Dpdprm+GcW58H5yvr65h5ASgAwkL4XPw71SzYDtC50C
 L+sGQNZTSBGgF8AA8FDdlcCzzi/E+onsf0elp3Pw43xCFmluN2L+D3k/jnWNDzuNstuuqRU7xHB
 LFI2viwGIn7N3Ftm8WmDPpL9O47x0Q75EstJe0egYk80NGpq9sb+s/GutXgJ+qhOgp0ZTfxKfF6
 AyFzO84ic2jLAdy1QVOz/WfGJXQCKa5lEzEdH157d39x5SaBPNwQ/37p+WfdVbgmGlvKnw4wtus
 jk/JXyCHLSGAuiLuAgezkHbMwntFDxP6iRQpx+5qt+Gz7PfW2Y7PaR5xZRNFloTXPQq5MyqcmgE
 WG6QY+Cu+fAakG2NpOOr38+q3rabt6sjiZUlJLYbbdmu7wubkAE7WW9RNGtMMtW8CQhVxHnxGhm
 PkXozb8lIL1aFvA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 12:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243936

Make the output of "Available built-in fragments" and "Enabled built-in
fragments" use the same output format:

  Available built-in fragments:
  machine/...     Sets MACHINE = "..."

  Enabled built-in fragments:
  machine/qemuarm64       Sets MACHINE = "qemuarm64"

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 meta/lib/bbconfigbuild/configfragments.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
index 47605f3ddb..ccc1d8b610 100644
--- a/meta/lib/bbconfigbuild/configfragments.py
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -66,7 +66,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
             print('Available built-in fragments:')
             builtin_dict = {i[0]:i[1] for i in [f.split(':') for f in builtin]}
             for prefix,var in builtin_dict.items():
-                print('{}/...\tSets {} = ...'.format(prefix, var))
+                print('{}/...\tSets {} = "..."'.format(prefix, var))
             print('')
             enabled_builtin_fragments = [f for f in enabled if self.builtin_fragment_exists(f)]
             print('Enabled built-in fragments:')

-- 
2.55.0


