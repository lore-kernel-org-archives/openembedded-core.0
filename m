Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1C8C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 07:44:11 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15770.1782805445541474150
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 00:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=L6Gz5yEf;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=TgQFntTI;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152, mailfrom: marek.vasut@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gqFX320cnz9vbN;
	Tue, 30 Jun 2026 09:44:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782805443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=apFnutvRd3YFX/lW3BXrc4tQCTMd6kf2bF21dEBTKaQ=;
	b=L6Gz5yEfmNpa9q4ZoH3tWAuTbTWA0+AiKJGvoAcU/bhgy05XT+CZGcfrzePaZihdYfpQxH
	QzB2RJnZNkSo9EZKS3A+EZIQ31pwAX02+ACThxQd+bqKgY8wBygDsXTDkJrTp5g7P6iUe2
	oO9k6jvk8DxLQtpiG1y/Y/FeWuQpAS9A2cTNyzC1Ktw8oyDOIRQbsE86Xv3rznYrXTnNoK
	P/TxXQ+Bd9aI3mgg+Cn7VHbgDkuyeQB2SN4ExBQwwjoLXw3GIPKKqM5VJce+EYVG2ANQiv
	Yp8djzAPk2yOQEO70fvyYVFXlboCZa0CK0G3SX9yMpLH0T6MFUHJbGERR/X1BA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=TgQFntTI;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782805441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=apFnutvRd3YFX/lW3BXrc4tQCTMd6kf2bF21dEBTKaQ=;
	b=TgQFntTIy/ckiYXklXSVdSwF0PJN9rcDXkG+DdWSC7fCDhlcMUJZ22ytTUCUu6Eje2Qc6o
	QnCsz084oD2q3z/QWFWNIg+exybZgiNMIxf0JUVrGVdUUDfQKmtVvF2NbNTX2m/OIHikiT
	eAlI+wAH2ZMiqjl6T81Ua0ViulJi8gRPedv46vKzfo+wN5SgdGcQR8EFtClTKcxl94fDhd
	mhz+OD+86NuBjmvyxE0FqrfDq5pQ5ZWoGLCQwamQtmxRIpiKsQdu8VZdLdOSlff2tATfRn
	nYuzV972kQuYwZUtXugg5/E+4Hpgv1h3Fw6KdD6h6UfgM3/z1R4JG/GE76y9FA==
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [wrynose][PATCH] kernel-fit-image.bbclass: Do not include kernel property in DTBO config subnodes
Date: Tue, 30 Jun 2026 09:43:19 +0200
Message-ID: <20260630074356.10265-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 2fae49d1232f47cd578
X-MBO-RS-META: oij4qmnq9xypcacak83xss5aofseyqhm
X-Rspamd-Queue-Id: 4gqFX320cnz9vbN
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 07:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239861

The OE 5.0 implementation of fitImage generation did not include the
kernel property in DTBO configuration node subnodes, while the current
OE 6.0 implementation does. The previous implementation was correct,
because kernel together with only a DTBO overlay can not form bootable
result. The kernel property should only be part of the configuration
subnode which includes both kernel and DTB. Fix this.

Fixes: 05d0c7342d76 ("kernel-fit-image.bbclass: add a new FIT image imple=
mentation")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 06ed34005957a6afb88270603df5e545941546b0)
---
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/fitimage.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index 881d0eae0ab..d7e21171ab9 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -425,8 +425,13 @@ class ItsNodeRootKernel(ItsNode):
         opt_props =3D {}
         conf_desc =3D []
         sign_entries =3D []
+        include_kernel =3D 1
=20
-        if self._kernel:
+        # DTBO configuration sections do not include kernel property
+        if dtb and os.path.splitext(dtb.name)[1] =3D=3D ".dtbo":
+            include_kernel =3D 0
+
+        if self._kernel and include_kernel:
             conf_desc.append("Linux kernel")
             opt_props["kernel"] =3D self._kernel.name
             if self._sign_enable:
--=20
2.53.0


