Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2386C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 07:44:30 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15773.1782805469833954663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 00:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=i48yQ52X;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=n36PGYgl;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152, mailfrom: marek.vasut@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gqFXW5tdkz9vJ5;
	Tue, 30 Jun 2026 09:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782805467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7OKapaOCX8Zyr3DQVGynSewWs3iyqzlJWhYWa6PnkT8=;
	b=i48yQ52XI8ouIRECcwiZ7aPSmm0TIdzXpiFQhIXllTFgMIHZ5DpQx9e9f2Wk1/qgwlyce6
	KVO9Tr0EvSEWIsk8tF0cuuyghS06VPpbTlNnn0f1eE58IPUd3gMYsZ4vBwXOl90rmLyURA
	AHT0IvyiWalzbfK7lB99GM1jEpfErdUnb6MpslpzZ5KhJSe6JzrWX3xWrxKHRABu2CXq2v
	jE3Qw1oTalbRSBerPjTHRWc7Ib4uv2Qll4OfQltTLvO+lguq88vG1H12CIMt8S8hHcCPxe
	GaDTtc36/+WvY8akbH8rxY+UfGFFyr7Ub7CnZ9RzoKJXShrorlZP3vvi/cH7Ow==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782805466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7OKapaOCX8Zyr3DQVGynSewWs3iyqzlJWhYWa6PnkT8=;
	b=n36PGYglJrflZRn6P4FWm0gnEd44T1i/lqhXLHA/uRB6yYlOffnU3f4aEjU5XGQQfz+ozM
	BW5wBcEOLCNysJtSMmgkE5H6WRS7q/a8TJbk86ftqlkThoyMs5BkkfJJ2lKeyZYI4TmmUL
	7iOt0q9+WKXWwukVj8rZaWoQiFP7t/rSw7hjLgvIKNYWMHwvWFhLUalIN0YjLz0n5aLMXD
	eOXR4Q6yMrWSWduJLZpLLiz/7CjP4zeGgHDr4MVCxe2oA+dYxrktsoJCY5PckHQU0oehE/
	1TxbvAmaG8cswe91YCwJbeNJBKNKxHI+aeeCHYz7OVcymsFEN2iNSbTKGnXnTA==
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [wrynose][PATCH] kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED = "1"
Date: Tue, 30 Jun 2026 09:44:03 +0200
Message-ID: <20260630074423.10306-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 34d891fdcb50e418664
X-MBO-RS-META: reynugxj7iydoo5fs4csqsjqwkic4h6q
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 07:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239862

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4297b94c3728cd2e320d75b68c508e12ab127719)
---
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
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


