Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236D2C43458
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 21:48:29 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.122364.1783201701939298289
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jul 2026 14:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=pGDk9r2c;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171, mailfrom: marek.vasut@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gt44L04MDz9tkP;
	Sat,  4 Jul 2026 23:48:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783201698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Np/n+/R242C9Euh+kV9Hu3kv0RG/2n8pI/NehiS7roY=;
	b=pGDk9r2c2KaUHx/MnjinQZbo+6TYJOHngafq6pzikS+jfkGHbYOfh/lc9zlm2f19JT/0Ni
	xq1eU50gZmZsu1bwZ28VmwFdOawUSyShbzbuDK2IXhYoopfSQO+RRtjQzwcrWo0soJhYAx
	yIWT/UNPN01dWncrNvdXxgVWKTTmqv0TNXJedoCELP/0zoc48IjdoUFuEMBC9dCddfuF87
	l48PBL8BVxOZfEFrR29FTNZt2TJGdch9uoWb+YjYYMjJx9wxPSrDYwsYDFNZPk6401pDmg
	Q9GRgmr0KO4RDza5jwdkhGXWggRRyufp2KrtC/fu/1oaW0hO09omkeE9s8qe4A==
From: Marek Vasut <marek.vasut@mailbox.org>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [wrynose][PATCH] oe-selftest: fitimage: Do not expect kernel property in DTBO config subnodes
Date: Sat,  4 Jul 2026 23:47:57 +0200
Message-ID: <20260704214812.365483-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: 6cqpdzjidmcm473m75dz1f1bhfxgur4n
X-MBO-RS-ID: 17b6d31a44323efc3fe
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jul 2026 21:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240134

From: Adrian Freihofer <adrian.freihofer@siemens.com>

A DTBO overlay together with only a kernel cannot form a bootable result,
so DTBO configuration subnodes should not include the kernel property.
Update _get_req_its_fields() accordingly: skip appending
'kernel =3D "kernel-1"' for .dtbo files, aligning it with
_get_req_sections() which already handles this correctly.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 85e0408a81bdca0411a8625061e5e343c05f92d9)
---
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/sel=
ftest/cases/fitimage.py
index 3541c07520a..e8435fb43c1 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -659,7 +659,9 @@ class KernelFitImageBase(FitImageTestCase):
         dtb_files, dtb_symlinks =3D FitImageTestCase._get_dtb_files(bb_v=
ars)
         if dtb_files:
             for dtb in dtb_files:
-                its_field_check.append('kernel =3D "kernel-1";')
+                # DTBO overlay configs do not include a kernel property
+                if not dtb.endswith('.dtbo'):
+                    its_field_check.append('kernel =3D "kernel-1";')
                 its_field_check.append('fdt =3D "fdt-%s";' % dtb)
             for dtb in dtb_symlinks:
                 its_field_check.append('kernel =3D "kernel-1";')
--=20
2.53.0


