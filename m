Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAB8C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 20:31:34 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.1926.1699907491720202792
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 12:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout07.t-online.de (Postfix) with SMTP id BE0A31F138
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 21:31:29 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.200]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r2daj-2L5DrF0; Mon, 13 Nov 2023 21:31:29 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv3] cups: Upgrade 2.4.6 -> 2.4.7
Date: Mon, 13 Nov 2023 21:31:57 +0100
Message-ID: <20231113203157.74231-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699907489-3D7F9877-12F5A5A6/0/0 CLEAN NORMAL
X-TOI-MSGID: b3d7e887-b8dc-4cb8-92b4-4089a1379151
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 20:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190486

- enable tls by default to fix:
| hash.c:16:12: fatal error: gnutls/crypto.h: No such file or directory
|    16 | #  include <gnutls/crypto.h>

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
 meta/recipes-extended/cups/cups.inc           |  8 ++--
 .../cups/cups/CVE-2023-4504.patch             | 42 -------------------
 .../cups/{cups_2.4.6.bb =3D> cups_2.4.7.bb}     |  2 +-
 3 files changed, 6 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups/CVE-2023-4504.patch
 rename meta/recipes-extended/cups/{cups_2.4.6.bb =3D> cups_2.4.7.bb} (51=
%)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/=
cups/cups.inc
index fa32c38549..ff5f55e62a 100644
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
@@ -38,10 +37,13 @@ GROUPADD_PARAM:${PN} =3D "--system lpadmin"
 SYSTEMD_SERVICE:${PN} =3D "cups.socket cups.path cups.service cups-lpd.s=
ocket"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf',=
 'avahi', '', d)} \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', =
d)}"
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', =
d)} \
+                   openssl \
+"
 PACKAGECONFIG[avahi] =3D "--with-dnssd=3Davahi,--with-dnssd=3Dno,avahi"
 PACKAGECONFIG[acl] =3D "--enable-acl,--disable-acl,acl"
-PACKAGECONFIG[gnutls] =3D "--with-tls=3Dgnutls,--with-tls=3Dno,gnutls"
+PACKAGECONFIG[gnutls] =3D "--with-tls=3Dgnutls,,gnutls,,,openssl"
+PACKAGECONFIG[openssl] =3D "--with-tls=3Dopenssl,,openssl,,,gnutls"
 PACKAGECONFIG[pam] =3D "--enable-pam --with-pam-module=3Dunix, --disable=
-pam, libpam"
 PACKAGECONFIG[systemd] =3D "--with-systemd=3D${systemd_system_unitdir},-=
-without-systemd,systemd"
 PACKAGECONFIG[xinetd] =3D "--with-xinetd=3D${sysconfdir}/xinetd.d,--with=
out-xinetd,xinetd"
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


