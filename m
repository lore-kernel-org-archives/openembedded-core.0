Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE54BC5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 19:19:17 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.3671.1708715950109797586
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 11:19:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=JHMIPhiC;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id F262A240027
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 20:19:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708715948; bh=f1z7aKq3FPi8EYwE8uxJXgmKtHUSO0R/hDFL096vm1g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=JHMIPhiCwKsd1RkarFMDHVD5KVTahcMfTUJovsW2uXv7VQobD1POGeYfkkNtbcSfF
	 MyAv1kY2qa0xYhoRmYeIsFACKXZpqNBHKauYWSOpL8xFaga9CjIcvUgO89cuwBLhrN
	 bC85eGY0/6RVpoYJYsEmuvNCLRy052aWt/o4Rpd/k1D+q+v5jGRkKYSG0ivRxgD1lr
	 inrH+CqaX4cczlWL7yLLNLLy3pzy/z4cXQGpznjrky/G21W4gdwmZFdRRuCs65T68f
	 x3I+A//0y8iXRUnGmMwLPDur4a3WqhQpMwxDcwUbltxav0V5cavu3b4XoLmJDM9oU9
	 sYLUDuYMuO1Ng==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ThKZ31KCQz6tsf;
	Fri, 23 Feb 2024 20:19:06 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] libxml2: Upgrade 2.11.5 -> 2.12.5
Date: Fri, 23 Feb 2024 19:18:59 +0000
Message-Id: <20240223191859.6912-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 19:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196106

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Upgraded to address CVE-2024-25062

License-Update: hash.c was rewritten and now also has MIT license,
trio was totally removed, hence remove license checksum as well.
Files are not mentioned as exception in overall license any more,
therefore, checksum changed there as well.

Previous upgrades of libxml2 caused issues when building libsoup,
this in the meantime has been adressed via commit "9f57bfb74e280827"
("libsoup-2.4: Fix build with clang-17 and libxml2-2.12") already.

Changes:
- [CVE-2024-25062] xmlreader: Don't expand XIncludes when backtracking
- parser: Fix crash in xmlParseInNodeContext with HTML documents

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-core/libxml/libxml2/install-tests.patch      | 8 ++++----
 .../libxml/{libxml2_2.11.5.bb =3D> libxml2_2.12.5.bb}       | 8 +++-----
 2 files changed, 7 insertions(+), 9 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.11.5.bb =3D> libxml2_2.12.5.b=
b} (91%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/=
recipes-core/libxml/libxml2/install-tests.patch
index 14ccce5873..4bddf9f05e 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 3fc716357ce1372d9418dc86f24315b34d9808de Mon Sep 17 00:00:00 2001
+From 582af12c9e89cd3d7c93c63756acb6e8180a776c Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
 Subject: [PATCH] add yocto-specific install-ptest target
@@ -13,11 +13,11 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 10 insertions(+)
=20
 diff --git a/Makefile.am b/Makefile.am
-index 5bc4018..57d27af 100644
+index 0a49d37..1097c63 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -26,6 +26,16 @@ check_PROGRAMS =3D \
- 	testlimits \
+@@ -27,6 +27,16 @@ check_PROGRAMS =3D \
+ 	testparser \
  	testrecurse
 =20
 +ptestdir=3D$(libexecdir)
diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-co=
re/libxml/libxml2_2.12.5.bb
similarity index 91%
rename from meta/recipes-core/libxml/libxml2_2.11.5.bb
rename to meta/recipes-core/libxml/libxml2_2.12.5.bb
index 44336c25e1..01e23b21cc 100644
--- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.5.bb
@@ -4,10 +4,8 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libxml2"
 BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dlibxml2"
 SECTION =3D "libs"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D2044417e2e5006b65a8b9067b68=
3fcf1 \
-                    file://hash.c;beginline=3D6;endline=3D15;md5=3De77f7=
7b12cb69e203d8b4090a0eee879 \
-                    file://list.c;beginline=3D4;endline=3D13;md5=3Db9c25=
b021ccaf287e50060602d20f3a7 \
-                    file://trio.c;beginline=3D5;endline=3D14;md5=3Dcd4f6=
1e27f88c1d43df112966b1cd28f"
+LIC_FILES_CHKSUM =3D "file://Copyright;md5=3Dfec7ecfe714722b2bb0aaff7d20=
0c701 \
+                    file://list.c;beginline=3D4;endline=3D13;md5=3Db9c25=
b021ccaf287e50060602d20f3a7"
=20
 DEPENDS =3D "zlib virtual/libiconv"
=20
@@ -19,7 +17,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.=
tar;subdir=3D${BP};name=3Dtestt
            file://install-tests.patch \
            "
=20
-SRC_URI[archive.sha256sum] =3D "3727b078c360ec69fa869de14bd6f75d7ee8d369=
87b071e6928d4720a28df3a6"
+SRC_URI[archive.sha256sum] =3D "a972796696afd38073e0f59c283c3a2f5a560b52=
68b4babc391b286166526b21"
 SRC_URI[testtar.sha256sum] =3D "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e6=
9a2be4722379f08702ea7273"
=20
 # Disputed as a security issue, but fixed in d39f780
--=20
2.39.2


