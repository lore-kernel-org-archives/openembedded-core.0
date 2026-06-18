Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFA0CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 19:04:51 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26798.1781809484893331565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 12:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=CNQDDt26;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=W5f5e5yl;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: marek.vasut@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gh9By1sspz9tRX;
	Thu, 18 Jun 2026 21:04:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781809482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ygz278mKsm2T2hwmbAR2zyzRP0P1A61ktC8wNFE5YEM=;
	b=CNQDDt264dA5BvX1/nCdhwAgXwmjf4OGwr6VdzzG/WFNjDRekw6LcsnB6jqs7xILvP6NAG
	9z55U1QN2rNo8UwLlcOc6bMrBiU1dyf6wMsqT8sfjrhPsOLB8Vw+qKQTuJKZJ90LLkiS3P
	coxCuz26sNIn5mFcynONOG0Wp8ELCkhX48b4TfA9tz41aTH7EMua3NUtS+FNd6LtBAYwmh
	G9Nvl9Ag6GOtF6eQzve7ycE+QMxx7JcJPJRHo0WFi7HaaQ2ukBFDjmwTGy2+UeVGrXnF7o
	E3YMgMd+mNMBoAbvdTKP/tULqadxd5pJqvSq6I7m0D5p2jv4ru/xXaniOSt3RQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=W5f5e5yl;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781809480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ygz278mKsm2T2hwmbAR2zyzRP0P1A61ktC8wNFE5YEM=;
	b=W5f5e5ylzvzMSIxFsSgTVgjnkCiY8Zi4AXBD6kj9IfaIJPyvdj3SHnFlOIbkTPpaIqwAGM
	6PFlWaovVh8IEvd38zT9PQWDcIFcETw+uMrTPJ0nmNzwSeoKttqlziQUA/kKLcFtZDMGkE
	DbHc6UoEzIMp2T5UrsSIBskQlSi2Demng0CLioQy7zy6boXjA9kNNWcm4a/idyfDhRsKzf
	LAxpcyxlkcCtRnpCBuDhdNr3UmyWHzgGiOxkEI0WU+wLX8A/MF+FUzLzDMTMRidXcv2TKc
	p8ZgHlBLveAZ6CzNiXwE6pTQErP4D3jFFI0jmDMr6ngl0T+Mw+SQTV0DiP9UpA==
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2] kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED = "1"
Date: Thu, 18 Jun 2026 21:04:21 +0200
Message-ID: <20260618190437.31203-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: df7270c9df253225c06
X-MBO-RS-META: um1wa7gw6teidz3wf9ogjyqtnoaiio1z
X-Rspamd-Queue-Id: 4gh9By1sspz9tRX
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 19:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239099

In the case KERNEL_DTBVENDORED =3D "1" , the fitImage configuration
subnode names used to contain the vendor prefix in OE 5.0 , e.g.:
"
$ mkimage  -l fitImage
...
 Configuration 0 (conf-freescale_imx8mn-board.dtb)
                       ^^^^^^^^^^
...
"

With OE 6.0 this is no longer the case and KERNEL_DTBVENDORED =3D "1"
and KERNEL_DTBVENDORED =3D "0" behave exactly the same way:
"
$ mkimage  -l fitImage
...
 Configuration 0 (conf-imx8mn-board.dtb)
...
"

Users depend on the correct configuration subnode names as those
are used in the U-Boot "bootm" command when booting fitImages.

Fix this by converting each entry in the KERNEL_DEVICETREE list
into the configuration subnode name by replacing all of its path
separators with underscores.

Fixes: 05d0c7342d76 ("kernel-fit-image.bbclass: add a new FIT image imple=
mentation")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
---
NOTE: This should ideally be added into OE 6.0 too
---
V2: Invert the conditional to handle case where KERNEL_DTBVENDORED
    is not defined, and to pass oe fitImage selftest
---
 meta/classes-recipe/kernel-fit-image.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-=
recipe/kernel-fit-image.bbclass
index ae8f3c66883..448a88ccb11 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -94,6 +94,13 @@ python do_compile() {
         for dtb in kernel_devicetree.split():
             # In deploy_dir the DTBs are without sub-directories also wi=
th KERNEL_DTBVENDORED =3D "1"
             dtb_name =3D os.path.basename(dtb)
+            # With vendored DTs, use the DT name as listed in KERNEL_DEV=
ICETREE
+            # and replace any path separators with underscores, this beh=
aves the
+            # same way as KERNEL_DTBVENDORED =3D "1" did in OE 5.0 and o=
lder.
+            if d.getVar('KERNEL_DTBVENDORED') !=3D "1":
+                conf_name =3D dtb_name
+            else:
+                conf_name =3D dtb.replace('/', '_')
=20
             # Skip DTB if it's also provided in EXTERNAL_KERNEL_DEVICETR=
EE directory
             if external_kernel_devicetree:
@@ -103,7 +110,7 @@ python do_compile() {
=20
             # Copy the dtb or dtbo file into the FIT image assembly dire=
ctory
             shutil.copyfile(os.path.join(kernel_deploydir, dtb_name), dt=
b_name)
-            root_node.fitimage_emit_section_dtb(dtb_name, dtb_name,
+            root_node.fitimage_emit_section_dtb(conf_name, dtb_name,
                 d.getVar("UBOOT_DTB_LOADADDRESS"), d.getVar("UBOOT_DTBO_=
LOADADDRESS"))
=20
     if external_kernel_devicetree:
--=20
2.53.0


