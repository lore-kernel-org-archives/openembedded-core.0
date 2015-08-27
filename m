Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phycard.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA6760043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:46:38 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 880D8A00226
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 16:48:35 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015082716463729-152809 ;
	Thu, 27 Aug 2015 16:46:37 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 16:46:37 +0200
Message-Id: <1440686797-24415-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 27.08.2015 16:46:37,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 27.08.2015 16:46:37
Subject: [PATCH] libvorbis: remove legacy options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Aug 2015 14:46:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Those code fragments date back to ancient times. EXTRA=5FOECONF is not
required anymore and we should give gcc another try to do it right.
Testing on cortex-a8 with thumb and -O2 reveals a performance boost of
82 percent during encoding in comparison to -O0. -O4 gives another 7
percent.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
- this requires patch 0fe770ef9817319bb82 from master-next. It is
  already for version 1.3.5

 meta/recipes-multimedia/libvorbis/libvorbis=5F1.3.5.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis=5F1.3.5.bb b/meta/=
recipes-multimedia/libvorbis/libvorbis=5F1.3.5.bb
index b7a0667..636e0f3 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis=5F1.3.5.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis=5F1.3.5.bb
@@ -15,10 +15,3 @@ SRC=5FURI[md5sum] =3D "28cb28097c07a735d6af56e598e1c90f"
 SRC=5FURI[sha256sum] =3D "54f94a9527ff0a88477be0a71c0bab09a4c3febe0ed878b2=
4824906cd4b0e1d1"
=20
 inherit autotools pkgconfig
-
-# vorbisfile.c reveals a problem in the gcc register spilling for the
-# thumb instruction set...
-FULL=5FOPTIMIZATION=5Fthumb =3D "-O0"
-
-EXTRA=5FOECONF =3D "--with-ogg-libraries=3D${STAGING=5FLIBDIR} \
-                --with-ogg-includes=3D${STAGING=5FINCDIR}"
--=20
1.9.1


