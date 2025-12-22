Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD153E67810
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 17:43:53 +0000 (UTC)
Received: from elephant.ash.relay.mailchannels.net (elephant.ash.relay.mailchannels.net [23.83.222.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85013.1766425431157175087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 09:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=pigd3jUC;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.57, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6C48954281A
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:50 +0000 (UTC)
Received: from fr-int-smtpout24.hostinger.io (100-108-123-205.trex-nlb.outbound.svc.cluster.local [100.108.123.205])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 9A79C541C89
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1766425429;
	b=p/FS0AI2/SxuzdlLtq8bKWPdHd5jJMyoN5mtYtZ4rjn964PlzCxkV2EmF3aaBF2CM/Am/P
	u2ozT9UmEiURI4+OWHhARlcC+mpMoBWmdeHvJpYlXCJXKPD5aH0HzPRs2avswPSslBNbVl
	LR1k71yvvT66pzjYH5URK1sYw/nRVNUh7wL0asDbmS9GA7fnSJP/K3Qb2MEPgchtooKNHH
	xj4h82K2uXWBldKvrYUGO+/z8PDRdCGeQ7ZsuXiGR0JjiAysE/nvjBymLOqDCKtScfI5fh
	16GpWUcA7JYujQgxG+ddhC35UJtpMEm5ddB8xFozNozOWbt6aSEI7BWqOS27kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1766425429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=HP4Ub3FxQffFHaj2tV0y3K6VNKa5I6jdMVNSWIEbSbg=;
	b=HRjJ1iPpNI36s0Ho1BE1JCJePnxQ7iObAk36xDYa+zFBwg3G/mutMhiaz+U7ekTHBL6pDz
	lYDe6vD0eTiVzwyeTKaaf/X5a5bfoOypP9eYRz/VAAdCW9q8PVTk9/4jLznqhg+xwQLGdS
	XINwWGh7wN+v+fytEDx83AVA14xinbWt9r+hrNW67dT3BrdJ/s0fFtkNasc9E8L3daN6pz
	5ja1+s6760upwv9TzpIK17xC9e38d1NKN2T2Np+erecWxwWSLvq83BHD9dTdPQgzrOVN9D
	d5Dy9WAKQ4U7uY+fFcCegG5M1xloWIqO+ox4uTlwmpE+4tRi872fT7mEpDVw+g==
ARC-Authentication-Results: i=1;
	rspamd-55cdcc6c54-rz657;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Power-Thread: 6d0c199f06d2f47e_1766425430319_2060809237
X-MC-Loop-Signature: 1766425430319:3191640701
X-MC-Ingress-Time: 1766425430315
Received: from fr-int-smtpout24.hostinger.io (fr-int-smtpout24.hostinger.io
 [148.222.54.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.123.205 (trex/7.1.3);
	Mon, 22 Dec 2025 17:43:50 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:7586:fd48:8d48:80a0])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dZlqk5WfMz1y2H;
	Mon, 22 Dec 2025 17:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1766425426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HP4Ub3FxQffFHaj2tV0y3K6VNKa5I6jdMVNSWIEbSbg=;
	b=pigd3jUCxahxzMRcHt7VVuDXetrQvnmkQom3oAuvMcgfKXZJ0gLT6tF0La8OM1emkJu+ph
	EYHLQuiWNSKF1kU/dixZLEWL+8ldAAXYOkaaQImemGHmDfLMFylc08JOFZ6Itaxee8RiWr
	pMRoy0NZ+uZ39o8+5idsKh2NIN0oYTWM1ptZLXv2a+k12L9Sa4g8XMuHQVKA4/Xv/258Sx
	jZADf2qNhGuFKTUfYP6w7jCkQnQm5qp1+lC71j5pS7qj9sFgWVz/kIw9uLrvhUf4g+5Aow
	DWhCIbrGXse7m3HHh6x5cHLkdwZzkupn8fRKFdWnY4n4UM/iNeP15h64969SbQ==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH v3 2/5] alsa-utils: upgrade 1.2.14 -> 1.2.15
Message-ID: <20251222174336.1794730-3-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251222174336.1794730-1-michael.opdenacker@rootcommit.com>
References: <20251222174336.1794730-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Mon, 22 Dec 2025 17:43:46 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=DJTd4DNb c=1 sm=1 tr=0 ts=69498352 a=myaG3V0YOm9nx1Em8mk9ug==:617 a=xqWC_Br6kY4A:10 a=NEAV23lmAAAA:8 a=foHCeV_ZAAAA:8 a=d70CFdQeAAAA:8 a=cmWlzMUdAAAA:8 a=dH4SncJJTOH0aEAj5-sA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22 a=93ApFmx_MQ_BoSUK457J:22
X-CM-Envelope: MS4xfPm7UZZw0RWEWVPCxya1fQpP0g32XTQwpvq9uNeJyGfo4ClDdWGtfB6wqHeci0aCL3h9XJsuB2cXPu5Zoqhmdf7jMUxr/H1qlonZMmGQJhlxECDf/oQa zJgquBH9jGqflpkXR/0T6woz/WiP4u9wyiB5/ozMZmK2HHoQpPgf0DQrHkjoqWgpQ+ruAATGPANHDmhB3IMZvokr+EpwwRr1XZj8hxx2m4p1ypTVnk6UELCi 1E4s+QZxwEcDI7aOvQMsaQkleSAoL/umw9si5WosoQic1cPmgsPuUKdttP+yZjBqcqPhUhteHRucNTzv7wwpI7uiqS8dJCZr5wQ0OSmBNIol/9VZIJTxpYIZ tIwre65v
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228318

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Include a fix from upstream fixing a build issue:
https://github.com/alsa-project/alsa-utils/commit/10587067fcf5b05e7fa5a84=
c38238dbffd079c4f

Upstream changes:
https://www.alsa-project.org/wiki/Changes_v1.2.14_v1.2.15#alsa-utils

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 ...sactl-fix-build-when-in-subdirectory.patch | 29 +++++++++++++++++++
 ...a-utils_1.2.14.bb =3D> alsa-utils_1.2.15.bb} |  5 ++--
 2 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-a=
lsactl-fix-build-when-in-subdirectory.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.14.bb =3D> alsa-util=
s_1.2.15.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-alsactl-=
fix-build-when-in-subdirectory.patch b/meta/recipes-multimedia/alsa/alsa-=
utils-1.2.15/0001-alsactl-fix-build-when-in-subdirectory.patch
new file mode 100644
index 0000000000..d1c6b3d830
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils-1.2.15/0001-alsactl-fix-bui=
ld-when-in-subdirectory.patch
@@ -0,0 +1,29 @@
+From 10587067fcf5b05e7fa5a84c38238dbffd079c4f Mon Sep 17 00:00:00 2001
+From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
+Date: Mon, 8 Dec 2025 11:12:34 +0000
+Subject: [PATCH] alsactl: fix build when in subdirectory
+
+From: Rudi Heitbaum <rudi@heitbaum.com>
+
+create the conf directory as part of the edit recipe
+
+Closes: https://github.com/alsa-project/alsa-utils/pull/311
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+Upstream-Status: Backport [10587067fcf5b05e7fa5a84c38238dbffd079c4f]
+---
+ alsactl/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
+index 48b7c7a..c8729e0 100644
+--- a/alsactl/Makefile.am
++++ b/alsactl/Makefile.am
+@@ -47,6 +47,7 @@ endif
+ edit =3D \
+ 	extratest=3D$$(echo ' $(ALSACTL_UDEV_EXTRATEST)' | sed -e 's/__/ /g' -=
e 's/^ $$//'); \
+ 	args=3D$$(echo ' $(ALSACTL_UDEV_ARGS)' | sed -e 's/__/ /g' -e 's/^ $$/=
/'); \
++	mkdir -p conf; \
+ 	$(SED) -r -e 's,@sbindir\@,$(sbindir),g' \
+ 		  -e 's,@mydatadir\@,$(mydatadir),g' \
+ 		  -e 's,@daemonswitch\@,$(ALSACTL_DAEMONSWITCH),g' \
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb b/meta/rec=
ipes-multimedia/alsa/alsa-utils_1.2.15.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
index 3cbb9b464b..09b3de81f4 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
@@ -24,8 +24,9 @@ PACKAGECONFIG[udev] =3D "--with-udev-rules-dir=3D`pkg-c=
onfig --variable=3Dudevdir udev
 PACKAGECONFIG[manpages] =3D "--enable-xmlto, --disable-xmlto, xmlto-nati=
ve docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
=20
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2"
-SRC_URI[sha256sum] =3D "0794c74d33fed943e7c50609c13089e409312b6c403d6ae8=
984fc429c0960741"
+SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2 \
+	   file://0001-alsactl-fix-build-when-in-subdirectory.patch"
+SRC_URI[sha256sum] =3D "d3183d2ed2d69e9143c5beb97036267c3fdabfe8bfbea8bc=
6863f17b1f0b568e"
=20
 # On build machines with python-docutils (not python3-docutils !!) insta=
lled
 # rst2man (not rst2man.py) is detected and compile fails with

