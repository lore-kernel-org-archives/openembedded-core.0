Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C995CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 07:10:24 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.12242.1760944214903796418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 00:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=C55/K7+k;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F3A5FC0AFD0
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:09:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B527606D5;
	Mon, 20 Oct 2025 07:10:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4CC2E102F23A5;
	Mon, 20 Oct 2025 09:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760944212; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=pU/1sDKg+yBB8FfyJE96QL3xOn14wsA1gyISLErxGCw=;
	b=C55/K7+kLomBXSp6L17i9rkoZMNq/qGGkNtj0uO0m8v1siPm1yTdgIuNQ4zjX14+7NzkYT
	ey+EmrvTRuf21UtmnjovHlPUbE5fajXJfxjgxwrZC3EzX9gHEodtL/xJ8oAwnkQM+j19qn
	zgg1IcoDX1cPPA7qyfHNdmrRBO6Dzz74rwQ/VTmvnfbyn8GUlhXMkLbggYlEn85peWA1nd
	fUt6ZWJU2Nwy+Uj7X/OyHcKlj4R518p6ri9q85SQF1/yJBZeDvZVTsixR9R8oJFkAf8XKx
	KSt0W4v5jgioUMy7P/7ZKefZcG41Lzf2d7ojcRI5D3bJ4vjC5tYXzUkSNzh+2Q==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [scarthgap v2 02/11] spdx30_tasks: fix FetchData attribute in add_download_files
Date: Mon, 20 Oct 2025 09:09:42 +0200
Message-ID: <20251020070952.942165-3-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
References: <20251020070952.942165-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225100

From: "Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>

The add_download_files() function incorrectly accessed fd.name, which
does not exist on FetchData objects.

Change to use fd.names[0] to correctly retrieve the first filename.

This fixes AttributeError during SPDX document generation.

Signed-off-by: Kamel Bouhara (Schneider Electric) <kamel.bouhara@bootlin.=
com>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 52329760b6..f6e6e545dc 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -405,7 +405,7 @@ def add_download_files(d, objset):
                     name=3Dfile_name,
                     software_primaryPurpose=3Dprimary_purpose,
                     software_downloadLocation=3Doe.spdx_common.fetch_dat=
a_to_uri(
-                        fd, fd.name
+                        fd, fd.names[0]
                     ),
                 )
             )
--=20
2.43.0


