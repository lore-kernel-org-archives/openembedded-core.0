Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF690CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 16:27:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1518.1762187225989774134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 08:27:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=dBBuTuel;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8CB451A1851;
	Mon,  3 Nov 2025 16:27:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 63BD060628;
	Mon,  3 Nov 2025 16:27:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A02110B501AA;
	Mon,  3 Nov 2025 17:27:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762187223; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=pU/1sDKg+yBB8FfyJE96QL3xOn14wsA1gyISLErxGCw=;
	b=dBBuTuelucHCk9zRELJ5LR6Vkq8myNaZX8RvLAGHcQnXQLE5IV1+jpgLjAapFbPimH8/jd
	2W1dS20roLrqwBpWHzyXirHRvKGzaWCoU6sCiR/9Q5Epz+YWsxqySOpo1E92Fuw6cRgfWm
	W8x3yUVM8hDJZH8ToESo/CDb+NpwFnHQNo9cz5fMoyJtsoJWP8hkz+XK7QkP8xoA/nx8Mh
	WZn11OrTZMoygxDfkmAidXgyqS4SUxgQK8EExTwgp/SwxQBx1vXzUIiPxzJkrX6kRlR3AU
	bG/rbsWbRK2saJdkeESgOdpsPjHfhvEoJKGmWug+rjBfVvXhdTe7TfvQ1w0Oyw==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	"Kamel Bouhara (Schneider Electric)" <kamel.bouhara@bootlin.com>
Subject: [scarthgap v3 02/16] spdx30_tasks: fix FetchData attribute in add_download_files
Date: Mon,  3 Nov 2025 17:26:28 +0100
Message-ID: <20251103162654.1714239-3-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
References: <20251103162654.1714239-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 16:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225669

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


