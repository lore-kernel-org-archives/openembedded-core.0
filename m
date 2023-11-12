Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D34C4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 01:36:18 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.8494.1699752974425009738
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 17:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id 5CE5B2054C
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 02:35:50 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.92]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1zO9-49SS1Z0; Sun, 12 Nov 2023 02:35:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] cups: Upgrade 2.4.6 -> 2.4.7
Date: Sun, 12 Nov 2023 02:36:17 +0100
Message-ID: <20231112013617.24303-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699752949-44F7E877-550BAC3D/0/0 CLEAN NORMAL
X-TOI-MSGID: fea75e29-0861-4132-9000-57e38fc7353d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 01:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190442

Changes in CUPS v2.4.7 (2023-09-20)
-----------------------------------

- CVE-2023-4504 - Fixed Heap-based buffer overflow when reading Postscrip=
t
  in PPD files
- Added OpenSSL support for cupsHashData (Issue #762)
- Fixed delays in lpd backend (Issue #741)
- Fixed extensive logging in scheduler (Issue #604)
- Fixed hanging of `lpstat` on IBM AIX (Issue #773)
- Fixed hanging of `lpstat` on Solaris (Issue #156)
- Fixed printing to stderr if we can't open cups-files.conf (Issue #777)
- Fixed purging job files via `cancel -x` (Issue #742)
- Fixed RFC 1179 port reserving behavior in LPD backend (Issue #743)
- Fixed a bug in the PPD command interpretation code (Issue #768)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-extended/cups/cups.inc           |  1 -
 .../cups/cups/CVE-2023-4504.patch             | 42 -------------------
 .../cups/{cups_2.4.6.bb =3D> cups_2.4.7.bb}     |  2 +-
 3 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch
 rename meta/recipes-extended/cups/{cups_2.4.6.bb =3D> cups_2.4.7.bb} (51=
%)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index fa32c38549..36feaddcf8 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,7 +15,6 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/cups-${=
PV}-source.tar.gz \
            file://0004-cups-fix-multilib-install-file-conflicts.patch \
            file://volatiles.99_cups \
            file://cups-volatiles.conf \
-           file://CVE-2023-4504.patch \
            "
=20
 GITHUB_BASE_URI =3D "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch b/meta/r=
ecipes-extended/cups/cups/CVE-2023-4504.patch
deleted file mode 100644
index e52e43a209..0000000000
--- a/meta/recipes-extended/cups/cups/CVE-2023-4504.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-CVE: CVE-2023-4504
-Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/2=
431caddb7e6a87f04ac90b5c6366ad268b6ff31 ]
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
-
-From 2431caddb7e6a87f04ac90b5c6366ad268b6ff31 Mon Sep 17 00:00:00 2001
-From: Zdenek Dohnal <zdohnal@redhat.com>
-Date: Wed, 20 Sep 2023 14:45:17 +0200
-Subject: [PATCH] raster-interpret.c: Fix CVE-2023-4504
-
-We didn't check for end of buffer if it looks there is an escaped
-character - check for NULL terminator there and if found, return NULL
-as return value and in `ptr`, because a lone backslash is not
-a valid PostScript character.
----
- cups/raster-interpret.c | 14 +++++++++++++-
- 1 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/cups/raster-interpret.c b/cups/raster-interpret.c
-index 6fcf731b5..b8655c8c6 100644
---- a/cups/raster-interpret.c
-+++ b/cups/raster-interpret.c
-@@ -1116,7 +1116,19 @@ scan_ps(_cups_ps_stack_t *st,		/* I  - Stack */
-=20
- 	    cur ++;
-=20
--            if (*cur =3D=3D 'b')
-+	   /*
-+	    * Return NULL if we reached NULL terminator, a lone backslash
-+	    * is not a valid character in PostScript.
-+	    */
-+
-+	    if (!*cur)
-+	    {
-+	      *ptr =3D NULL;
-+
-+	      return (NULL);
-+	    }
-+
-+	    if (*cur =3D=3D 'b')
- 	      *valptr++ =3D '\b';
- 	    else if (*cur =3D=3D 'f')
- 	      *valptr++ =3D '\f';
diff --git a/meta/recipes-extended/cups/cups_2.4.6.bb b/meta/recipes-exte=
nded/cups/cups_2.4.7.bb
similarity index 51%
rename from meta/recipes-extended/cups/cups_2.4.6.bb
rename to meta/recipes-extended/cups/cups_2.4.7.bb
index 58029fdbd4..f4b0282e4c 100644
--- a/meta/recipes-extended/cups/cups_2.4.6.bb
+++ b/meta/recipes-extended/cups/cups_2.4.7.bb
@@ -2,4 +2,4 @@ require cups.inc
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
=20
-SRC_URI[sha256sum] =3D "58e970cf1955e1cc87d0847c32526d9c2ccee335e5f0e388=
2b283138ba0e7262"
+SRC_URI[sha256sum] =3D "dd54228dd903526428ce7e37961afaed230ad310788141da=
75cebaa08362cf6c"
--=20
2.42.0


