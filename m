Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E742AEB64DC
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 12:31:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.31275.1688387456328478380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jul 2023 05:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABE8E2F4;
	Mon,  3 Jul 2023 05:31:38 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 83C1E3F73F;
	Mon,  3 Jul 2023 05:30:55 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] cups: upgrade to 2.4.6
Date: Mon,  3 Jul 2023 13:30:48 +0100
Message-Id: <20230703123049.525813-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 12:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183801

From: Ross Burton <ross.burton@arm.com>

This resolves CVE-2023-34241.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 -
 .../cups/cups/CVE-2023-32324.patch            | 36 -------------------
 .../cups/{cups_2.4.2.bb =3D> cups_2.4.6.bb}     |  2 +-
 3 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.patch
 rename meta/recipes-extended/cups/{cups_2.4.2.bb =3D> cups_2.4.6.bb} (51=
%)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index d77758fd3f4..da320b10855 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,7 +15,6 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-${=
PV}-source.tar.gz \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
-           file://CVE-2023-32324.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-32324.patch b/meta/=
recipes-extended/cups/cups/CVE-2023-32324.patch
deleted file mode 100644
index 40b89c98998..00000000000
--- a/meta/recipes-extended/cups/cups/CVE-2023-32324.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 07cbffd11107eed3aaf1c64e35552aec20f792da Mon Sep 17 00:00:00 2001
-From: Zdenek Dohnal <zdohnal@redhat.com>
-Date: Thu, 1 Jun 2023 12:04:00 +0200
-Subject: [PATCH] cups/string.c: Return if `size` is 0 (fixes CVE-2023-32=
324)
-
-CVE: CVE-2023-32324
-Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/f=
d8bc2d32589]
-
-(cherry picked from commit fd8bc2d32589d1fd91fe1c0521be2a7c0462109e)
-Signed-off-by: Sanjay Chitroda <schitrod@cisco.com>
----
- cups/string.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/cups/string.c b/cups/string.c
-index 93cdad19..6ef58515 100644
---- a/cups/string.c
-+++ b/cups/string.c
-@@ -1,6 +1,7 @@
- /*
-  * String functions for CUPS.
-  *
-+ * Copyright =C2=A9 2023 by OpenPrinting.
-  * Copyright =C2=A9=C2=A02007-2019 by Apple Inc.
-  * Copyright =C2=A9=C2=A01997-2007 by Easy Software Products.
-  *
-@@ -730,6 +731,9 @@ _cups_strlcpy(char       *dst,		/* O - Destination s=
tring */
-   size_t	srclen;			/* Length of source string */
-=20
-=20
-+  if (size =3D=3D 0)
-+    return (0);
-+
-  /*
-   * Figure out how much room is needed...
-   */
diff --git a/meta/recipes-extended/cups/cups_2.4.2.bb b/meta/recipes-exte=
nded/cups/cups_2.4.6.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.2.bb
rename to meta/recipes-extended/cups/cups_2.4.6.bb
index f5ca749bacb..58029fdbd4d 100644
--- a/meta/recipes-extended/cups/cups_2.4.2.bb
+++ b/meta/recipes-extended/cups/cups_2.4.6.bb
@@ -2,4 +2,4 @@ require cups.inc
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
=20
-SRC_URI[sha256sum] =3D "f03ccb40b087d1e30940a40e0141dcbba263f39974c20eb9=
f2521066c9c6c908"
+SRC_URI[sha256sum] =3D "58e970cf1955e1cc87d0847c32526d9c2ccee335e5f0e388=
2b283138ba0e7262"
--=20
2.34.1


