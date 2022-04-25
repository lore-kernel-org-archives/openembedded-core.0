Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C19C63702
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by mx.groups.io with SMTP id smtpd.web08.30892.1650899285097683884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org
 header.s=mail20150812 header.b=SqM2xaNt;
 spf=pass (domain: mailbox.org, ip: 80.241.56.152,
 mailfrom: crg7475@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Kn7g62LN3z9sWN
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 17:08:02 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812;
	t=1650899282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d5oC6zBQMorQENBV1DtS0RWwUYkrClhQ8k7kHtMggJ8=;
	b=SqM2xaNtblJOh082nVv/AVWq6L9zrcS9KM8s+UYf2HgtA9BjSWAonv53xI5rTswux9j8oP
	jtHYvT/zogLRm0mxvj9X5m+MXXwF0zg1o9fCOhn63gVoLzcRAXoSkIpdqe4tPLD+okPWAt
	SNqrkkvWulUh65vlqxJt5wrRGX/w+nIOq+0N1GEoX8Hl72u6qL/o0Pttm5xIoV962Dvq9L
	rIXrxZ3SjoK8yWygfn1vi4Hm4f9l3x85/4iDVQYV3Jc+Ozq0UaKGapzme2h5MVmgAEmL0L
	19vD/V/SjqWq8F7vLh3ZyKsATo235RRGpl1Zn7gOPnqO9lKqT/E3j23JBC+h2g==
To: openembedded-core@lists.openembedded.org
Subject: [master][kirkstone][PATCH] gstreamer1.0-plugins-good: Fix libsoup
 dependency
Date: Mon, 25 Apr 2022 17:01:03 +0200
Message-Id: <20220425150104.1001838-1-crg7475@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: 850adb7b5600013a76c
X-MBO-RS-META: mng76e6foyg5coen8knxb5duo9ho5uxt
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164825

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.20.1.bb          | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_=
1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1=
.20.1.bb
index 08ff5a0bb5..1f61d9a10e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.=
bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.=
bb
@@ -49,7 +49,12 @@ PACKAGECONFIG[libv4l2]    =3D "-Dv4l2-libv4l2=3Denable=
d,-Dv4l2-libv4l2=3Ddisabled,v4l-
 PACKAGECONFIG[mpg123]     =3D "-Dmpg123=3Denabled,-Dmpg123=3Ddisabled,mp=
g123"
 PACKAGECONFIG[pulseaudio] =3D "-Dpulse=3Denabled,-Dpulse=3Ddisabled,puls=
eaudio"
 PACKAGECONFIG[qt5]        =3D "-Dqt5=3Denabled,-Dqt5=3Ddisabled,qtbase q=
tdeclarative qtbase-native ${QT5WAYLANDDEPENDS}"
-PACKAGECONFIG[soup]       =3D "-Dsoup=3Denabled,-Dsoup=3Ddisabled,libsou=
p-2.4"
+# Starting with version 1.20, the GStreamer soup plugin loads libsoup wi=
th dlopen()
+# instead of linking to it. And instead of using the default libsoup C h=
eaders, it
+# uses its own stub header. Consequently, objdump will not show the libs=
oup .so as
+# a dependency, and libsoup won't be added to an image. Fix this by sett=
ing libsoup
+# as RDEPEND instead of DEPEND.
+PACKAGECONFIG[soup]       =3D "-Dsoup=3Denabled,-Dsoup=3Ddisabled,,libso=
up-2.4"
 PACKAGECONFIG[speex]      =3D "-Dspeex=3Denabled,-Dspeex=3Ddisabled,spee=
x"
 PACKAGECONFIG[rpi]        =3D "-Drpicamsrc=3Denabled,-Drpicamsrc=3Ddisab=
led,userland"
 PACKAGECONFIG[taglib]     =3D "-Dtaglib=3Denabled,-Dtaglib=3Ddisabled,ta=
glib"
--=20
2.32.0


