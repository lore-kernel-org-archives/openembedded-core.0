Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068F3C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 00:09:56 +0000 (UTC)
Received: from tulikuusama2.dnainternet.net (tulikuusama2.dnainternet.net [83.102.40.151])
 by mx.groups.io with SMTP id smtpd.web09.2317.1667866185474115197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 16:09:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: parse error for token &{10 18 spfd.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 83.102.40.151, mailfrom: niko.mauno@vaisala.com)
Received: from localhost (localhost [127.0.0.1])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 34E0B2B01D;
	Tue,  8 Nov 2022 02:09:43 +0200 (EET)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from tulikuusama2.dnainternet.net ([83.102.40.151])
	by localhost (tulikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id tgTgh5FmDZmZ; Tue,  8 Nov 2022 02:09:43 +0200 (EET)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id F2A5B2B018;
	Tue,  8 Nov 2022 02:09:42 +0200 (EET)
Received: from localhost.localdomain (82-181-238-66.bb.dnainternet.fi [82.181.238.66])
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTP id D537F3BAF;
	Tue,  8 Nov 2022 02:09:39 +0200 (EET)
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Cc: Niko Mauno <niko.mauno@vaisala.com>
Subject: [RFC PATCH 3/3] pulseaudio: Disable 64 bit time with 32 bit glibc
Date: Tue,  8 Nov 2022 02:08:28 +0200
Message-Id: <20221108000828.42824-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221108000828.42824-1-niko.mauno@vaisala.com>
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 00:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172941

For now add exemption in order to avoid following kind of failures
during do_compile()

  | ../pulseaudio-16.1/src/modules/bluetooth/bt-codec-cvsd.c:55:22: warni=
ng: format '%lu' expects argument of type 'long unsigned int', but argume=
nt 6 has type 'size_t' {aka 'unsigned int'} [-Wformat=3D]
  |    55 |         pa_log_debug("Got invalid block size: %lu, rounding d=
own", block_size);
  |       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~  ~~~~~~~~~~
  |       |                                                              =
      |
  |       |                                                              =
      size_t {aka unsigned int}

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb b/meta=
/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
index 64002cd1cc..ee4f8c7ed3 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb
@@ -8,3 +8,6 @@ SRC_URI =3D "http://freedesktop.org/software/pulseaudio/r=
eleases/${BP}.tar.xz \
            "
 SRC_URI[sha256sum] =3D "8eef32ce91d47979f95fd9a935e738cd7eb7463430dabc72=
863251751e504ae4"
 UPSTREAM_CHECK_REGEX =3D "pulseaudio-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
+
+# Compiling 64 bit time for 32 bit host is broken
+GLIBC_64BIT_TIME_CPPFLAGS =3D ""
--=20
2.36.1


