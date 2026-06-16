Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425E5CD98D2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 21:50:01 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2225.1781646592093950523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 14:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=celdD5eA;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=HPpnKdq8;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: marek.vasut@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gg0yP3cPXz9v0M;
	Tue, 16 Jun 2026 23:49:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781646589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sdn6m+O3bPHDscqssdF3kFWDmXWGv7PvHgK9tcL8pJQ=;
	b=celdD5eA0j3Vc0qI1f0FfaYrvl61Hv3+JukmfpmoS+ip83wYXPNumeC1EL25UQZ9qlO61l
	MLSzacMjtMVaYUCJKnkD+GzG1uFbB7tuZqKTAg1zQ/kuoOTruI2qy71rNhPHAADGaVnhFb
	IvySgWCSvC8gj0ENhf+qU3rKHWtNb2YUTq8rwDjshnFIE1CAM/ebFF/9YZSqo+ZurS6BAY
	pBRVc4Vxqal40mtKC0FRz3+Uc3F0+DbrT6GiWa8/UfaEwreU9lW6lDzgrBs0AgXw6qUd9F
	VDDCgM5z4vXuGp0nCXZduhD5LggJpfV2OslVHb9AW3RNghmOF7jwa5ASwABmdg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781646587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sdn6m+O3bPHDscqssdF3kFWDmXWGv7PvHgK9tcL8pJQ=;
	b=HPpnKdq8E0LEam+jbEBblbOt9vfc5/5VDF7lqNxCFddjjnJFYsUZ7/ymIBnX6RRYosIDiV
	C7SHUPpvSePhTC1dlOwx0PYbeG1H8T8j75raVG7sGjX5isFMRyZYtRyUiNvQu6esN9IC3H
	JdAnRVxATvs8+ttzeH52hA0Op971Z0By47vW0+o6SdzDDF+9IajMkkTr4YQPRpk7qEZvRz
	fqBpDnwybX1Wsb6RE6qANwF9kfeXmsF26JlSWlDSVYVdYWM4wJusFy8YGnqsiQB8UM66rj
	eAShrha6q16czfwHc38RpoeBNPBI3HRK7oN9h10yZSe2cz/U2L7b8cIZo7kQog==
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] kernel-fit-image.bbclass: Fix operation with KERNEL_DTBVENDORED = "1"
Date: Tue, 16 Jun 2026 23:49:24 +0200
Message-ID: <20260616214945.40714-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: 6wox3de11qie8b1u3t6qb69fx51ii53i
X-MBO-RS-ID: 10e3e9bb282f51af76d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 21:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238964

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
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
---
NOTE: This should ideally be added into OE 6.0 too
---
 meta/classes-recipe/kernel-fit-image.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-=
recipe/kernel-fit-image.bbclass
index ae8f3c66883..7bdb367151a 100644
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
+            if d.getVar('KERNEL_DTBVENDORED') =3D=3D "1":
+                conf_name =3D dtb.replace('/', '_')
+            else:
+                conf_name =3D dtb_name
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


