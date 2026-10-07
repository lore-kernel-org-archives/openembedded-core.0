Return-Path: <joerg.vehlow@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D79CA5FFF
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 05:57:15 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2024.1791352631763651815
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 22:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=VJBGDslb;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=VJBGDslb;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: joerg.vehlow@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1791352629;
	bh=zhWfdz+EPwggI8WUIGVWLNE9oWDnpgusBENTxSYddxc=;
	h=From:To:Cc:Subject:Date:From;
	b=VJBGDslbOtS115gDRi2qMGtq+xXxErM3WBVF03IMoH/YTGzSE4iIfLlGAkdXHKGIB
	 w/fs8g/0TOYN2fiobJopt9JqTTSOZdgB2TKPSCDejD4aJNEJGgXqCDp+5hZdgti/cV
	 FbLCmIzxFauVRU6yC7C7Zq4M873/DQ0XQ576bFXVfBRwQert0LyizxTQ/JZioNwi8D
	 uON1UKdEWgQaVzEy1zQZwHVNZ4KZuVj1r3VAGMTeJumSaMob01fogZhanpBjEFsPwO
	 R9RdfYP1Xro2xLWItm17hQA8Y1dymSn2JTSutbzlDPQr5jriikg9YEYP/k9iUbpHbM
	 OmcWfjQWFJ1HA==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id 6BC645F871;
	Wed, 07 Oct 2026 07:57:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1791352629;
	bh=zhWfdz+EPwggI8WUIGVWLNE9oWDnpgusBENTxSYddxc=;
	h=From:To:Cc:Subject:Date:From;
	b=VJBGDslbOtS115gDRi2qMGtq+xXxErM3WBVF03IMoH/YTGzSE4iIfLlGAkdXHKGIB
	 w/fs8g/0TOYN2fiobJopt9JqTTSOZdgB2TKPSCDejD4aJNEJGgXqCDp+5hZdgti/cV
	 FbLCmIzxFauVRU6yC7C7Zq4M873/DQ0XQ576bFXVfBRwQert0LyizxTQ/JZioNwi8D
	 uON1UKdEWgQaVzEy1zQZwHVNZ4KZuVj1r3VAGMTeJumSaMob01fogZhanpBjEFsPwO
	 R9RdfYP1Xro2xLWItm17hQA8Y1dymSn2JTSutbzlDPQr5jriikg9YEYP/k9iUbpHbM
	 OmcWfjQWFJ1HA==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 554865F7E1;
	Wed, 07 Oct 2026 07:57:09 +0200 (CEST)
From: Joerg Vehlow <joerg.vehlow@emlix.com>
To: openembedded-core@lists.openembedded.org
Cc: denis@denix.org,
	richard.purdie@linuxfoundation.org,
	Joerg Vehlow <joerg.vehlow@emlix.com>
Subject: [PATCH] libgcc: fix build for baremetal
Date: Wed,  7 Oct 2026 07:57:06 +0200
Message-ID: <20261007055706.1493585-1-joerg.vehlow@emlix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 05:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247368

By removing the erroneous EXTRA_OECONF override in 020d5f0, gcc-cross is =
now configured with correct sysroot flags, which removes the hosts includ=
e directory from the internal paths.
This in turn leads to libgcc not finding libc headers (as it should) and =
breaks libgcc build.
In order to fix this, libgcc must be built almost like libgcc-initial.

Signed-off-by: Joerg Vehlow <joerg.vehlow@emlix.com>
---
 meta/recipes-devtools/gcc/libgcc.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools=
/gcc/libgcc.inc
index e92dadf021..93e217f567 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -37,6 +37,16 @@ LICENSE:${PN}-dev =3D "GPL-3.0-or-later WITH GCC-excep=
tion-3.1"
 LICENSE:${PN}-dbg =3D "GPL-3.0-or-later WITH GCC-exception-3.1"
 LICENSE:${PN}-src =3D "GPL-3.0-or-later WITH GCC-exception-3.1"
=20
+# On baremetal there is no libc:
+# configure need limits.h for its sanity check
+# libc dependencies have to be patched out just like in libgcc-initial
+do_configure:prepend:libc-baremetal () {
+	install -d ${STAGING_INCDIR}
+	touch ${STAGING_INCDIR}/limits.h
+	sed -i -e 's#INHIBIT_LIBC_CFLAGS =3D.*#INHIBIT_LIBC_CFLAGS =3D -Dinhibi=
t_libc#' ${B}/gcc/libgcc.mvars
+	sed -i -e 's#inhibit_libc =3D false#inhibit_libc =3D true#' ${B}/gcc/Ma=
kefile
+}
+
 FILES:${PN}-dev =3D "\
     ${base_libdir}/libgcc*.so \
     ${@oe.utils.conditional('BASETARGET_SYS', '${TARGET_SYS}', '', '${li=
bdir}/${BASETARGET_SYS}', d)} \

