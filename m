Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BA5CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:15:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11084.1762521312957292269
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 05:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Nd6YWU0H;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9A0194E41596
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Nov 2025 13:15:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71A30606A6;
	Fri,  7 Nov 2025 13:15:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 819BC118525B1;
	Fri,  7 Nov 2025 14:15:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762521310; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=pU/1sDKg+yBB8FfyJE96QL3xOn14wsA1gyISLErxGCw=;
	b=Nd6YWU0HfILEz+g3NVW7mwLdDSA2aHCgvJNKX09yyIGOcmnaf8x0Sdk+zp/PJQN6Keknxh
	2L1KuNQrVk9OVIpSN5xCcgtkxhTTA6IDyNWC/sFMV0Ylu3nwjnsDPnRsEYuIEP1425YAG9
	qYDIuHNH0GSo9zxlIWvuEqn3s8xKuAUHZISOyLQsCnYDxQJ9KObAavneas6gLQdHD+yhMt
	v/hlXmj4IEz3EL2MRjMt/UqiyAaQ/nhZDPqEj+Lp6rGdf/4SertJCeH9G/8S6ATS3f9znY
	ago+jOx8Nvg/U71FsraP5WYT47UchQSNWVgZh96z1fdMuAtAxxx6+hMsbb6KtA==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [scarthgap v4 02/17] spdx30_tasks: fix FetchData attribute in add_download_files
Date: Fri,  7 Nov 2025 14:14:36 +0100
Message-ID: <20251107131502.3857600-3-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226038

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


