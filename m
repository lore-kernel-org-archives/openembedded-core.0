Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD15C25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 11:45:44 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.17659.1716291936262083105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 04:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=fWez4/aT;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id DA0EE87E0D;
	Tue, 21 May 2024 13:45:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1716291934;
	bh=xEPdOtMmKQ8znahVb8Y0WXKR4KUH1rjujXct1PDv6Ts=;
	h=From:To:Cc:Subject:Date:From;
	b=fWez4/aTN4tEkqfiqeRtDvBgCvZWoJS3zjXkxch+nG/BeasIS5+hT6a+sps9KMy6F
	 yNTvj19TdDoeJcprCoYoZS22L8axq/bdwQqK/bBm3v/7ZJL/Mcfs1h5rX5al5/M1uC
	 Q+h/hlcHRbHoGFo5iP/0/yqmxhoxhmxNuapTrGzIgJ4YUTSSYp6fyXBSza3BfBSgG1
	 yvsdMul4eOU3ycOHgKRP7CRflcCY28XZ8c40h16SUNXLTG9cO6t609Pglnhf+3G/+y
	 aqA8p0oIAqJa03B0jLKLcK28wAz22i+QZE/yT9aGKD/aSu75BqDgRzaAMA2g5iPTEq
	 U01VKkQxgFHAg==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Marek Vasut <marex@denx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] gstreamer1.0-plugins-good: Include qttools-native during the build with qt5 PACKAGECONFIG
Date: Tue, 21 May 2024 13:44:48 +0200
Message-ID: <20240521114523.13147-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 11:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199631

The qttools provide 'lrelease' tool, which is checked by recent
versions of meson build system. Unless the qttools are available
in sysroot, meson will fail to detect qt5 installation at build
time and the gstreamer build will fail. Fix this by including
the qttools-native.

Signed-off-by: Marek Vasut <marex@denx.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ae2ca4af54695003638da38f8548aa8573d18201)
---
 .../gstreamer/gstreamer1.0-plugins-good_1.22.11.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_=
1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_=
1.22.11.bb
index edd8609b7c..85143aa1b9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11=
.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.11=
.bb
@@ -52,7 +52,7 @@ PACKAGECONFIG[libpng]     =3D "-Dpng=3Denabled,-Dpng=3D=
disabled,libpng"
 PACKAGECONFIG[libv4l2]    =3D "-Dv4l2-libv4l2=3Denabled,-Dv4l2-libv4l2=3D=
disabled,v4l-utils"
 PACKAGECONFIG[mpg123]     =3D "-Dmpg123=3Denabled,-Dmpg123=3Ddisabled,mp=
g123"
 PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddisabled,puls=
eaudio"
-PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbase q=
tdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
+PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbase q=
tdeclarative qtbase-native qttools-native ${QT5WAYLANDDEPENDS}"
 PACKAGECONFIG[soup2]      =3D "-Dsoup=3Denabled,,libsoup-2.4,,,soup3"
 PACKAGECONFIG[soup3]      =3D "-Dsoup=3Denabled,,libsoup,,,soup2"
 PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Ddisabled,spee=
x"
--=20
2.43.0


