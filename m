Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C12CCFA1D
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:15:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11168.1762521321751495445
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 05:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Jup9124u;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5919D1A1921
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Nov 2025 13:15:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 30EEF606A6;
	Fri,  7 Nov 2025 13:15:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FD07118525CD;
	Fri,  7 Nov 2025 14:15:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762521319; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=eWgtoRjWSAaoBvj6m3LYbGt+GNTun5g+YxTitHTXhpo=;
	b=Jup9124uMzFDUWQfK6J5bfK6uKvLp0ZD3ndjVGnFyITGElhM8gtZFfbh85oZsM9gAD9UN6
	0CeRybHEWEy1QQb1Q2sdYDTXi2rcw2Q0qLMQWy05FycxbMT+li5XatQVTdYSwuFMHfNVoo
	9cTarwoFe5NIhLgXNdkf88cc8WjgwQsv1kWPKQnps54zcwU3mKA4NsF0toWCauth7n2HoF
	1jiuWCF89PHyQ7cFJQYfyWA/2Bc6O9LT1NqwTZNIrkTLyLuN79KoMYCNa5BIUUcg6Kkiby
	ROJVykUqEoKMixd7clfj+IxJ7RnYbbi755EgxLHW2h4k1R/nVLykg4jbUoi6CQ==
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	thomas.petazzoni@bootlin.com,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	mathieu.dubois-briand@bootlin.com,
	antonin.godard@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v4 09/17] selftest/spdx: Fix for SPDX_VERSION addition
Date: Fri,  7 Nov 2025 14:14:43 +0100
Message-ID: <20251107131502.3857600-10-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
References: <20251107131502.3857600-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 13:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226045

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update the test for the addition of SPDX_VERSION to the deploy path.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 055e8c21908127722abad9e992d6408d8697a119)
---
 meta/lib/oeqa/selftest/cases/spdx.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
index 05fc4e390b..7685a81e7f 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -25,10 +25,11 @@ INHERIT +=3D "create-spdx"
=20
         deploy_dir =3D get_bb_var("DEPLOY_DIR")
         machine_var =3D get_bb_var("MACHINE")
+        spdx_version =3D get_bb_var("SPDX_VERSION")
         # qemux86-64 creates the directory qemux86_64
         machine_dir =3D machine_var.replace("-", "_")
=20
-        full_file_path =3D os.path.join(deploy_dir, "spdx", machine_dir,=
 high_level_dir, spdx_file)
+        full_file_path =3D os.path.join(deploy_dir, "spdx", spdx_version=
, machine_dir, high_level_dir, spdx_file)
=20
         try:
             os.remove(full_file_path)
--=20
2.43.0


