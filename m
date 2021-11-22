Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049F2C433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 11:46:35 +0000 (UTC)
Received: from forward106j.mail.yandex.net (forward106j.mail.yandex.net
 [5.45.198.249])
 by mx.groups.io with SMTP id smtpd.web12.5435.1637581591891205122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 03:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=QDaApAn1;
 spf=pass (domain: zhukoff.net, ip: 5.45.198.249, mailfrom: pavel@zhukoff.net)
Received: from iva6-d2c82ec8bc26.qloud-c.yandex.net
 (iva6-d2c82ec8bc26.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:610c:0:640:d2c8:2ec8])
	by forward106j.mail.yandex.net (Yandex) with ESMTP id C667F136A494;
	Mon, 22 Nov 2021 14:46:21 +0300 (MSK)
Received: from iva4-50c21cb1cb18.qloud-c.yandex.net
 (iva4-50c21cb1cb18.qloud-c.yandex.net [2a02:6b8:c0c:1510:0:640:50c2:1cb1])
	by iva6-d2c82ec8bc26.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 WhqKtOEcxq-kLC4Fc4E;
	Mon, 22 Nov 2021 14:46:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1637581581;
	bh=5vGg2UsY4jNNRtuZprW8NXx924g3rbd/tgVZZYSfpJo=;
	h=Date:Subject:To:From:Message-Id:Cc;
	b=QDaApAn1+yPiFNMaDx5cIlzbYaHdLS15hggSFt/BtG1jOlIPNCXy2j1GRoACtWyoG
	 e3/4B8ZwM7npvFDe0hIBLgGj0hN/e1yOp6EiOIP+m9k+spBrb4u74H6Z3mldRgVav/
	 IFfz/JiInL3BWvCpsynPWB9LRHxbUAvRXmWLZBzU=
Authentication-Results: iva6-d2c82ec8bc26.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by iva4-50c21cb1cb18.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id
 FZCbNvfmbl-kKwKrQuo;
	Mon, 22 Nov 2021 14:46:20 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 2
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>,
	pavel@zhukoff.net
Subject: [PATCH] Add security fix for CVE-2021-43618
Date: Mon, 22 Nov 2021 12:44:43 +0100
Message-Id: <20211122114442.20032-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 11:46:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158562

From: Pavel Zhukov <pavel.zhukov@huawei.com>

Fix mpz/inp_raw.c integer overflow and resultant buffer overflow via craf=
ted input,
leading to a segmentation fault on 32-bit platforms.

References: https://gmplib.org/repo/gmp-6.2/rev/561a9c25298e
References: https://gmplib.org/list-archives/gmp-bugs/2021-September/0050=
77.html
References: https://bugs.debian.org/994405

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../gmp/gmp/CVE-2021-43618.patch              | 25 +++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.2.1.bb         |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp/CVE-2021-43618.patch

diff --git a/meta/recipes-support/gmp/gmp/CVE-2021-43618.patch b/meta/rec=
ipes-support/gmp/gmp/CVE-2021-43618.patch
new file mode 100644
index 0000000000..f741972439
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/CVE-2021-43618.patch
@@ -0,0 +1,25 @@
+
+# HG changeset patch
+# User Marco Bodrato <bodrato@mail.dm.unipi.it>
+# Date 1634836009 -7200
+# Node ID 561a9c25298e17bb01896801ff353546c6923dbd
+# Parent  e1fd9db13b475209a864577237ea4b9105b3e96e
+mpz/inp_raw.c: Avoid bit size overflows
+
+diff -r e1fd9db13b47 -r 561a9c25298e mpz/inp_raw.c
+--- a/mpz/inp_raw.c	Tue Dec 22 23:49:51 2020 +0100
++++ b/mpz/inp_raw.c	Thu Oct 21 19:06:49 2021 +0200
+@@ -88,8 +88,11 @@
+=20
+   abs_csize =3D ABS (csize);
+=20
++  if (UNLIKELY (abs_csize > ~(mp_bitcnt_t) 0 / 8))
++    return 0; /* Bit size overflows */
++
+   /* round up to a multiple of limbs */
+-  abs_xsize =3D BITS_TO_LIMBS (abs_csize*8);
++  abs_xsize =3D BITS_TO_LIMBS ((mp_bitcnt_t) abs_csize * 8);
+=20
+   if (abs_xsize !=3D 0)
+     {
+
diff --git a/meta/recipes-support/gmp/gmp_6.2.1.bb b/meta/recipes-support=
/gmp/gmp_6.2.1.bb
index d5996abd00..7c12a97228 100644
--- a/meta/recipes-support/gmp/gmp_6.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_6.2.1.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "https://gmplib.org/download/${BPN}/${BP}${=
REVISION}.tar.bz2 \
            file://use-includedir.patch \
            file://0001-Append-the-user-provided-flags-to-the-auto-detect=
ed-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.p=
atch \
+           file://CVE-2021-43618.patch \
            "
 SRC_URI[md5sum] =3D "28971fc21cf028042d4897f02fd355ea"
 SRC_URI[sha256sum] =3D "eae9326beb4158c386e39a356818031bd28f3124cf915f8c=
5b1dc4c7a36b4d7c"
--=20
2.32.0


