Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABB0C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:28:35 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.11067.1643192913397144680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:28:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=Z9w7cda5;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AAC828069C;
	Wed, 26 Jan 2022 11:28:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643192910;
	bh=gJrSbpLhhzR2/iBYzZMzUnhaFro2SulgzWI6mYH4XF8=;
	h=From:To:Cc:Subject:Date:From;
	b=Z9w7cda5fYjd7sfKN+p4ZMgNLmOzjZ/UEfBSswiqAwbJ9mqf4kuQQtpL704oGZnPR
	 kInDKFhlYwJLrlfIB/4Mh0Hy7mZVVYUfd5XUMaQRif98muU5TfPIrOO7/2xQK+uN1J
	 +GlKjmjsSziI/mDlh33YIn2MAORfbOTqH9Pb8g55ePHua2VfnEnbHozQ5ZWjpyA46A
	 tj+1MbBb+JytrzDLOpnSGmGocR1IhzDMLMvuBQMycXw/LlNU/fZ2PsfmODn3T1O2ob
	 PF3qM1S9/uvIq+Jv5hCJe7OrEMEorJIpSjU1xIKPJw8FaGyLaWW1DbUZZo3FlAAFQl
	 SRgDp8BuqUqKw==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Claudius Heine <ch@denx.de>
Subject: [OE-core][RFC PATCH 00/12] Update to gstreamer 1.20 for kirkstone
Date: Wed, 26 Jan 2022 11:28:02 +0100
Message-Id: <20220126102814.4173943-1-ch@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:28:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160965

Hi,

since the release of gstreamer 1.20 is getting close, and it might make s=
ense to
include it into the kirkstone release. I prepared preliminary update patc=
hset
for it.

Gstreamer changed to use monorepos with 1.20 so I went ahead I changed al=
l
recipes to use one SRC_URI from `gstreamer1.0-source.inc`. Currently I ju=
st use
a tarball from a unrelease commit id, but that will be changed to the cor=
rect
one, after gstreamer is released.

I have some ideas which could be implemented with this change, but I want=
ed
feedback for this first:
 - remove the version from the filename, and define the PV in the
   `gstreamer1.0-source.inc`, this might make future updates easier.
 - put all recipes together into one recipe, which provides packages for =
all
   subprojects, this improves build time and makes maintenance easier, bu=
t also
   breaks downstream bbappends.

Any feedback on this is welcome.

kind regards,
Claudius

Claudius Heine (12):
  gstreamer1.0: 1.18.5 -> 1.20.0
  gstreamer1.0-plugins-base: 1.18.5 -> 1.20.0
  gstreamer1.0-plugins-good: 1.18.5 -> 1.20.0
  gstreamer1.0-plugins-bad: 1.18.5 -> 1.20.0
  gstreamer1.0-plugins-ugly: 1.18.5 -> 1.20.0
  gstreamer1.0-libav: 1.18.5 -> 1.20.0
  gstreamer1.0-python: 1.18.5 -> 1.20.0
  gstreamer1.0-omx: 1.18.5 -> 1.20.0
  gstreamer1.0-vaapi: 1.18.5 -> 1.20.0
  gstreamer1.0-rtsp-server: 1.18.5 -> 1.20.0
  gst-examples: 1.18.5 -> 1.20.0
  gst-devtools: 1.18.5 -> 1.20.0

 ...ct-has-a-different-signature-on-musl.patch |   8 +-
 ...tools_1.18.5.bb =3D> gst-devtools_1.20.0.bb} |   9 +-
 ...001-Make-player-examples-installable.patch |  22 +-
 ...mples_1.18.5.bb =3D> gst-examples_1.20.0.bb} |  11 +-
 ...st-libav-fix-build-with-ffmpeg-5.0.0.patch | 346 ------------------
 ...1.18.5.bb =3D> gstreamer1.0-libav_1.20.0.bb} |   9 +-
 ...x_1.18.5.bb =3D> gstreamer1.0-omx_1.20.0.bb} |   6 +-
 ...ialized-warnings-when-compiling-with.patch |   8 +-
 ...-avoid-including-sys-poll.h-directly.patch |   8 +-
 ...-sentinals-for-gst_structure_get-etc.patch |  24 +-
 ...issing-opencv-data-dir-in-yocto-buil.patch |  25 +-
 .../0005-msdk-fix-includedir-path.patch       |  26 +-
 ....bb =3D> gstreamer1.0-plugins-bad_1.20.0.bb} |  20 +-
 ...et-caps-from-src-pad-when-query-caps.patch |  10 +-
 ...parse-enhance-SSA-text-lines-parsing.patch |  10 +-
 ...iv-fb-Make-sure-config.h-is-included.patch |   8 +-
 ...004-glimagesink-Downrank-to-marginal.patch |  32 --
 ...bb =3D> gstreamer1.0-plugins-base_1.20.0.bb} |  17 +-
 ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |  12 +-
 ...bb =3D> gstreamer1.0-plugins-good_1.20.0.bb} |   9 +-
 ...bb =3D> gstreamer1.0-plugins-ugly_1.20.0.bb} |  10 +-
 ....18.5.bb =3D> gstreamer1.0-python_1.20.0.bb} |   7 +-
 ....bb =3D> gstreamer1.0-rtsp-server_1.20.0.bb} |   8 +-
 .../gstreamer/gstreamer1.0-source.inc         |   5 +
 ...1.18.5.bb =3D> gstreamer1.0-vaapi_1.20.0.bb} |   5 +-
 ...der.c-when-env-var-is-set-do-not-fal.patch |  69 ----
 ...pect-the-idententaion-used-in-meson.patch} |  14 +-
 ...002-Remove-unused-valgrind-detection.patch | 112 ------
 ...s-add-support-for-install-the-tests.patch} |  67 ++--
 ...-use-too-strict-timeout-for-validati.patch |  32 --
 ...-use-a-dictionaries-for-environment.patch} |  28 +-
 ...er-script-to-run-the-installed_tests.patch |  72 ++++
 ...-the-environment-for-installed_tests.patch |  58 ---
 ...er1.0_1.18.5.bb =3D> gstreamer1.0_1.20.0.bb} |  25 +-
 34 files changed, 267 insertions(+), 865 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.18.5.bb =3D> gs=
t-devtools_1.20.0.bb} (83%)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.18.5.bb =3D> gs=
t-examples_1.20.0.bb} (82%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/=
0001-gst-libav-fix-build-with-ffmpeg-5.0.0.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.18.5.bb =3D=
> gstreamer1.0-libav_1.20.0.bb} (66%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.18.5.bb =3D=
> gstreamer1.0-omx_1.20.0.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.=
5.bb =3D> gstreamer1.0-plugins-bad_1.20.0.bb} (91%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-base/0004-glimagesink-Downrank-to-marginal.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.18=
.5.bb =3D> gstreamer1.0-plugins-base_1.20.0.bb} (85%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.18=
.5.bb =3D> gstreamer1.0-plugins-good_1.20.0.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18=
.5.bb =3D> gstreamer1.0-plugins-ugly_1.20.0.bb} (82%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.5.bb =
=3D> gstreamer1.0-python_1.20.0.bb} (79%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.=
5.bb =3D> gstreamer1.0-rtsp-server_1.20.0.bb} (70%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-source=
.inc
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.18.5.bb =3D=
> gstreamer1.0-vaapi_1.20.0.bb} (90%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-g=
st-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0004-tests-respec=
t-the-idententaion-used-in-meson.patch =3D> 0001-tests-respect-the-idente=
ntaion-used-in-meson.patch} (71%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-R=
emove-unused-valgrind-detection.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0005-tests-add-su=
pport-for-install-the-tests.patch =3D> 0002-tests-add-support-for-install=
-the-tests.patch} (65%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-t=
ests-seek-Don-t-use-too-strict-timeout-for-validati.patch
 rename meta/recipes-multimedia/gstreamer/gstreamer1.0/{0006-tests-use-a-=
dictionaries-for-environment.patch =3D> 0003-tests-use-a-dictionaries-for=
-environment.patch} (61%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0004-t=
ests-add-helper-script-to-run-the-installed_tests.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0007-t=
ests-install-the-environment-for-installed_tests.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.18.5.bb =3D> gs=
treamer1.0_1.20.0.bb} (72%)


base-commit: a179485351a0563d12a2fef3e49971122255ed80
--=20
2.34.1


