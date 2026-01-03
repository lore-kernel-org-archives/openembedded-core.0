Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9992BFC6182
	for <webhook@archiver.kernel.org>; Sat,  3 Jan 2026 21:12:08 +0000 (UTC)
Received: from bee.birch.relay.mailchannels.net (bee.birch.relay.mailchannels.net [23.83.209.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32199.1767474721946902158
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Jan 2026 13:12:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=j1IBevgJ;
 spf=pass (domain: rootcommit.com, ip: 23.83.209.14, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1240C781651
	for <openembedded-core@lists.openembedded.org>; Sat, 03 Jan 2026 21:12:01 +0000 (UTC)
Received: from fr-int-smtpout26.hostinger.io (100-113-120-63.trex-nlb.outbound.svc.cluster.local [100.113.120.63])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3272F781881
	for <openembedded-core@lists.openembedded.org>; Sat, 03 Jan 2026 21:12:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1767474720;
	b=la8JysmM+XLZ1ygxcoMtmRa1SANQl2Lf99Gvvrr2i/uWxgwFEPRHUgQZwWHqYDadD2T7Ax
	rf/v112hMgSmk6o0n0UTX/DXeYDz9KrpvR14h6z7FtyxJNXNXFmxGjE5FWd3Ql32L6MO56
	06NaayAuvzJEKYCNiIkYWsi7YIbIuOFa+a3j9ygyKowCpKjicg2tWpfRA6WHSx0OKCmSV+
	iDNGkq4io075eVCeRu5dCPifmfR0z6Nd3u/w71OUvrckUwO9p6Of/RMKGwrzIQVhvrH/uT
	ztxQ2VqJKjINfjxF3CLKXjapJZ+V+P0VswDEAZaJFg7QJkIGiSZ0HsjZ6FSCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1767474720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=ZyAEV2cHA40injMOEQeZ+6tcZnirDbXqKcdWo9wkPME=;
	b=LU3NdxCTFi5PMxMTsI6XHz9UPmTKw8x8gqgoSvo0vNjSvpcHPwjOMbLEzidElEUObySu+r
	1HUFt/XijEdv+yG5CCt8UGSctpbOIjrXlzZ+YkBs7Hrg9Blum0RfIer2nMLdWB8usQd3Cj
	kFgilod4wJ0TCzejr6/g6yTlA4M2qcbeLQSBBf49irM6ynN0qrvxAjZPMwVzf2iRuyUNNC
	mp/S4FOOXgwvzM+cvHKs9mehRResFT1H926zcu0Kngpb/n50mruPghbFtrOlVBG/RYJNaP
	pYTQ3n0TLo6tFi2Y9mCVHIea3DISShuwvK9isMaRnv9fxQNvitB/S7AF/xGhAw==
ARC-Authentication-Results: i=1;
	rspamd-85db7f4c96-bqrz9;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Drop-Little: 2314b4ed6234f426_1767474720746_3351663487
X-MC-Loop-Signature: 1767474720746:3538055794
X-MC-Ingress-Time: 1767474720746
Received: from fr-int-smtpout26.hostinger.io (fr-int-smtpout26.hostinger.io
 [148.222.54.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.113.120.63 (trex/7.1.3);
	Sat, 03 Jan 2026 21:12:00 +0000
Received: from a8.lan (unknown [IPv6:2001:861:4450:d360:a56a:87e3:7fae:367e])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dkCtQ2SpQz1xnQ;
	Sat,  3 Jan 2026 21:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1767474718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZyAEV2cHA40injMOEQeZ+6tcZnirDbXqKcdWo9wkPME=;
	b=j1IBevgJpLdmcP8BbcjnK2G6l16C4CoS7OEabX0Hphctap4PVD27EQbXncQCFY3GfWTOjG
	CIYqM+dxj6UzcbTlBNhZ78QzAXOr+10p5SOEjU7aLbj5j1pGEgIdx9kxmugGY4z4NsPTx6
	3AmJZtv88YA4yYG4SfadywdzbPxgT64IhQNVKecfJjpgARNfx6GIYVPn9JJzfjepw/rEaN
	dHprtlwuEyicS1s9j+wzHo4OOZDs7OEkn2tgSoF/IAtpMUUWoMPwIvcEwaUkxR/kqBKbvW
	Rn+zvlNMIh1u499nuP15aKRBlFBo1Bjyg4YNsT24q8uvpXoH2TehTR2sM9n1ow==
From: michael.opdenacker@rootcommit.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: [PATCH 1/4] alsa-lib: upgrade 1.2.15 -> 1.2.15.1
Message-ID: <20260103211155.51433-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Date: Sat,  3 Jan 2026 21:11:58 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=6959861e a=j106YqD2ESRJk0lKD0wP4w==:617 a=xqWC_Br6kY4A:10 a=foHCeV_ZAAAA:8 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=7mOBRU54AAAA:8 a=i4Yt9rcHNdDZxvSGweQA:9 a=h8a9FgHX5U4dIE3jaWyr:22 a=NcxpMcIZDGm-g932nG_k:22 a=wa9RWnbW_A1YIeRBVszw:22
X-CM-Envelope: MS4xfIpIEgetZaFUNi41hg8LT8SRReNqnpOLgIkwDyw20iP8VCA5ZtwP6KwyYfuO90A00H07D4YCQG1n/BMqyN5udEWRg3wN2HR934KWEQ4nsQvjr6kyXBDK nmdlhajwaKaMllpkgJTDzAUStYF43/Rk6kIV26nHLtsguxbi6ZdImPJmHpvCMQJDRDc6bb4I8+AWgplmOEqA57S/XMC4dGaEKTxUCL0PRWdjH7coaTNPiBa3 Nh7JGoDIzBUdmWCfZ29y2kdCAsxRHYFfEkwncXwFq9WQ4AnRVTzSP7CEov7IJ1mlZdqM5qDxqjyDzqkW2ClZ1h7uITd4wBpBvC4DuHCkuWI=
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Jan 2026 21:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228849

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Upstream changes: various fixes
https://www.alsa-project.org/wiki/Changes_v1.2.15_v1.2.15.1

Remove no longer needed patch:
0001-ucm-use-closefrom-instead-of-close_range.patch

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 ...use-closefrom-instead-of-close_range.patch | 50 -------------------
 ...lsa-lib_1.2.15.bb =3D> alsa-lib_1.2.15.1.bb} |  5 +-
 2 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib-1.2.15/0001-ucm=
-use-closefrom-instead-of-close_range.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.15.bb =3D> alsa-lib_1.=
2.15.1.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib-1.2.15/0001-ucm-use-cl=
osefrom-instead-of-close_range.patch b/meta/recipes-multimedia/alsa/alsa-=
lib-1.2.15/0001-ucm-use-closefrom-instead-of-close_range.patch
deleted file mode 100644
index 815aca8019..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-lib-1.2.15/0001-ucm-use-closefrom=
-instead-of-close_range.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From a068cf08ad67447893b707cddfce31c9cafee643 Mon Sep 17 00:00:00 2001
-From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
-Date: Mon, 8 Dec 2025 23:46:17 -0500
-Subject: [PATCH] ucm: use closefrom instead of close_range
-
-From: Mike Gilbert <floppym@gentoo.org>
-
-closefrom is a library function with a fallback mechanism for when the
-kernel does not support the close_range syscall.
-
-Also check for the function properly instead of assuming it is available
-with _GNU_SOURCE defined.
-
-Closes: https://github.com/alsa-project/alsa-lib/pull/486
-Fixes: https://github.com/alsa-project/alsa-lib/issues/485
-Signed-off-by: Mike Gilbert <floppym@gentoo.org>
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-Upstream-Status: Backport [a068cf08ad67447893b707cddfce31c9cafee643]
----
- configure.ac       | 1 +
- src/ucm/ucm_exec.c | 4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 8f4bd0de..f4862f64 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -52,6 +52,7 @@ dnl Checks for library functions.
- AC_PROG_GCC_TRADITIONAL
- AC_CHECK_FUNCS([uselocale])
- AC_CHECK_FUNCS([eaccess])
-+AC_CHECK_DECLS([closefrom])
-=20
- dnl Enable largefile support
- AC_SYS_LARGEFILE
-diff --git a/src/ucm/ucm_exec.c b/src/ucm/ucm_exec.c
-index b5a22023..713039b4 100644
---- a/src/ucm/ucm_exec.c
-+++ b/src/ucm/ucm_exec.c
-@@ -259,8 +259,8 @@ int uc_mgr_exec(const char *prog)
-=20
- 		close(f);
-=20
--#if defined(_GNU_SOURCE)
--		close_range(3, maxfd, 0);
-+#if HAVE_DECL_CLOSEFROM
-+		closefrom(3);
- #else
- 		for (f =3D 3; f < maxfd; f++)
- 			close(f);
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb b/meta/recip=
es-multimedia/alsa/alsa-lib_1.2.15.1.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
index 6ecdeefa46..f3dfd3f35d 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
@@ -9,9 +9,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e=
631dd8edb7424769c7 \
                     file://src/socket.c;md5=3D285675b45e83f571c6a957fe4a=
b79c93;beginline=3D9;endline=3D24 \
                     "
=20
-SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
-           file://0001-ucm-use-closefrom-instead-of-close_range.patch"
-SRC_URI[sha256sum] =3D "83770841585e766a60c99fd23f8c574c22643ae0cb1f2d20=
b793c3d84eb95a8d"
+SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI[sha256sum] =3D "7f983ca89ca420872ca16e8a9f8f97fb63db6c1c6e2585b9=
1737a08bb03f566c"
=20
 inherit autotools pkgconfig
=20

