Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C4FC433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 20:40:34 +0000 (UTC)
Received: from mailout03.rmx.de (mailout03.rmx.de [94.199.88.101])
 by mx.groups.io with SMTP id smtpd.web08.899.1633725629936376727
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 13:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arri.de, ip: 94.199.88.101, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout03.rmx.de (Postfix) with ESMTPS id 4HR0SV1dw9zlnSV;
	Fri,  8 Oct 2021 22:40:26 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 4HR0ST29V2z30gX;
	Fri,  8 Oct 2021 22:40:25 +0200 (CEST)
Received: from N95HX1G2.arri.de (192.168.54.43) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 8 Oct
 2021 22:40:24 +0200
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>, Khem Raj <raj.khem@gmail.com>,
	"Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [OE-Core][dunfell][PATCH] binutils: Fix a missing break in case
 statement
Date: Fri, 8 Oct 2021 22:40:07 +0200
Message-ID: <20211008204007.26225-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.54.43]
X-RMX-ID: 20211008-224025-DWRmfKYxktQJ-0@out01.hq
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 20:40:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156784

This was missed during patch forward porting
its only effective when printing options

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-system-directories-when-cross-linki.patch | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-o=
f-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binut=
ils/binutils/0009-warn-for-uses-of-system-directories-when-cross-linki.pa=
tch
index 11a8110d40..88cce49e46 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-syste=
m-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-warn-for-uses-of-syste=
m-directories-when-cross-linki.patch
@@ -1,4 +1,4 @@
-From 7b24f81e04c9d00d96de7dbd250beade6d2c6e44 Mon Sep 17 00:00:00 2001
+From 12b658c0fe5771d16067baef933b7f34ed455def Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
 Subject: [PATCH] warn for uses of system directories when cross linking
@@ -59,8 +59,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/ldfile.c     | 17 +++++++++++++++++
  ld/ldlex.h      |  2 ++
  ld/ldmain.c     |  2 ++
- ld/lexsup.c     | 15 +++++++++++++++
- 9 files changed, 85 insertions(+)
+ ld/lexsup.c     | 16 ++++++++++++++++
+ 9 files changed, 86 insertions(+)
=20
 diff --git a/ld/config.in b/ld/config.in
 index d93c9b0830..5da2742bea 100644
@@ -77,10 +77,10 @@ index d93c9b0830..5da2742bea 100644
  #undef EXTRA_SHLIB_EXTENSION
 =20
 diff --git a/ld/configure b/ld/configure
-index 811134a503..f8c17c19ae 100755
+index f432f4637d..a9da3c115e 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -826,6 +826,7 @@ with_lib_path
+@@ -830,6 +830,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -88,7 +88,7 @@ index 811134a503..f8c17c19ae 100755
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1491,6 +1492,8 @@ Optional Features:
+@@ -1495,6 +1496,8 @@ Optional Features:
    --disable-largefile     omit support for large files
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word s=
izes)
@@ -97,7 +97,7 @@ index 811134a503..f8c17c19ae 100755
    --enable-gold[=3DARG]     build gold [ARG=3D{default,yes,no}]
    --enable-got=3D<type>     GOT handling scheme (target, single, negati=
ve,
                            multigot)
-@@ -15788,6 +15791,19 @@ fi
+@@ -16624,6 +16627,19 @@ fi
 =20
 =20
 =20
@@ -222,10 +222,10 @@ index 5287f19a7f..55096e4fc9 100644
 =20
  /* The initial parser states.  */
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index da1ad17763..12d0b07d8a 100644
+index c4af10f4e9..95b56b2d2d 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -274,6 +274,8 @@ main (int argc, char **argv)
+@@ -273,6 +273,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch =3D TRUE;
    command_line.warn_search_mismatch =3D TRUE;
    command_line.check_section_addresses =3D -1;
@@ -235,7 +235,7 @@ index da1ad17763..12d0b07d8a 100644
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 3d15cc491d..0e8b4f2b7a 100644
+index 3d15cc491d..6478821443 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
 @@ -550,6 +550,14 @@ static const struct ld_option ld_options[] =3D
@@ -253,10 +253,10 @@ index 3d15cc491d..0e8b4f2b7a 100644
  };
 =20
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1603,6 +1611,13 @@ parse_args (unsigned argc, char **argv)
-=20
+@@ -1604,6 +1612,14 @@ parse_args (unsigned argc, char **argv)
  	case OPTION_PRINT_MAP_DISCARDED:
  	  config.print_map_discarded =3D TRUE;
+ 	  break;
 +
 +	case OPTION_NO_POISON_SYSTEM_DIRECTORIES:
 +	  command_line.poison_system_directories =3D FALSE;
@@ -264,6 +264,6 @@ index 3d15cc491d..0e8b4f2b7a 100644
 +
 +	case OPTION_ERROR_POISON_SYSTEM_DIRECTORIES:
 +	  command_line.error_poison_system_directories =3D TRUE;
- 	  break;
++	  break;
  	}
      }
--=20
Christian Eggers
Embedded software developer

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRA 57918
Persoenlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregistern=
ummer: HRB 54477
Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter Traunin=
ger; Markus Zeiler


