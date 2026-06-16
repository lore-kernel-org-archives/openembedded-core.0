Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DA1CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 22:07:11 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2565.1781647628790952141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 15:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=QY+vXvEW;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=UVm0W6N6;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: marek.vasut@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gg1LK6ZK7z9tSP;
	Wed, 17 Jun 2026 00:07:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781647625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r+yA5s9Gc05uBGSegd0p80pMjK39xLhCkoqCsoLKVaI=;
	b=QY+vXvEWtx9Waj87s8jRCjEFnMQ3O3zxNKQOi4mwk8eNFOZ+PjRtf9qhzie7fQBsagQt8c
	uejsHf9gRaSwxtHLyOC0TQeifRSUpkaPtux+e6VLbW1T58lG2vFFIMmGqjXxWWaouiUoDY
	x/cIfVLWWL+lOmMbunESo3SLSnC+3xfzAW90jPfwFEggoumsug9pQJRE4MI+MxCnDAfcVi
	kmfdYy0be2ZebWOyQmMHyCGAwnpwCISBH0AiD6LzqG2rJXXk8xEJPX09Ri0rmDMF/fgHgX
	GQrGTH/kknIhATlJ13BAFMCp4xCXXZyPqyeC9Il3mwjxAJecoV8TRC1KZZq22w==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781647623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r+yA5s9Gc05uBGSegd0p80pMjK39xLhCkoqCsoLKVaI=;
	b=UVm0W6N6WBejj9A7owQw2tHAez71LoyXrnJWmqMe+Uox2hvQgCmIjvYcwUDM+qa+DX3Ibl
	Y3gN7sMBPBQGQNQQy5Al+io3F66kSvqRd6uSN9MVs4yrQlVZPBPeti84/OHuIMOcMH5JQ4
	ARG6xAbxPXFsXWAh9gILJ7fLu7VNokyiHCWVX4mPb9DMVCzWL9T7+IInUrxtYDSE20MqaT
	+REDgwU3TaKlvmuVAFpmVXk2BRLQXZmrE5+KYYvXC93fwa80aom1Pl/QCCEZfqTLjIQxI/
	CzoeNjvkh8oyR/Ky0hrJCyTEHKDwsXGcfQ8pYjGNVTEEpgdCMzpP9dJRqF8XSA==
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] kernel-fit-image.bbclass: Do not include kernel property in DTBO config subnodes
Date: Wed, 17 Jun 2026 00:06:38 +0200
Message-ID: <20260616220700.41516-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: 3uen1dx9g3fiy4yx6wso64t8sypcrkkq
X-MBO-RS-ID: 84750106738e921cfca
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 22:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238966

The OE 5.0 implementation of fitImage generation did not include the
kernel property in DTBO configuration node subnodes, while the current
OE 6.0 implementation does. The previous implementation was correct,
because kernel together with only a DTBO overlay can not form bootable
result. The kernel property should only be part of the configuration
subnode which includes both kernel and DTB. Fix this.

Fixes: 05d0c7342d76 ("kernel-fit-image.bbclass: add a new FIT image imple=
mentation")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
---
NOTE: This should ideally be added into OE 6.0 too
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


