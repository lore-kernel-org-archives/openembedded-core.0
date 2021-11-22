Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9306C433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 11:41:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.5386.1637581259948777370
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 03:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D6E61042
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 03:40:58 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37BBF3F73B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 03:40:58 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gmp: fix CVE-2021-43618
Date: Mon, 22 Nov 2021 11:40:56 +0000
Message-Id: <20211122114056.242209-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 11:41:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158561

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gmp/gmp/cve-2021-43618.patch              | 27 +++++++++++++++++++
 meta/recipes-support/gmp/gmp_6.2.1.bb         |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp/cve-2021-43618.patch

diff --git a/meta/recipes-support/gmp/gmp/cve-2021-43618.patch b/meta/rec=
ipes-support/gmp/gmp/cve-2021-43618.patch
new file mode 100644
index 0000000000..095fb21eaa
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp/cve-2021-43618.patch
@@ -0,0 +1,27 @@
+CVE: CVE-2021-43618
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
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
diff --git a/meta/recipes-support/gmp/gmp_6.2.1.bb b/meta/recipes-support=
/gmp/gmp_6.2.1.bb
index d5996abd00..e61582afdf 100644
--- a/meta/recipes-support/gmp/gmp_6.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_6.2.1.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "https://gmplib.org/download/${BPN}/${BP}${=
REVISION}.tar.bz2 \
            file://use-includedir.patch \
            file://0001-Append-the-user-provided-flags-to-the-auto-detect=
ed-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.p=
atch \
+           file://cve-2021-43618.patch \
            "
 SRC_URI[md5sum] =3D "28971fc21cf028042d4897f02fd355ea"
 SRC_URI[sha256sum] =3D "eae9326beb4158c386e39a356818031bd28f3124cf915f8c=
5b1dc4c7a36b4d7c"
--=20
2.25.1


