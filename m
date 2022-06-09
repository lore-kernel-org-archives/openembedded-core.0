Return-Path: <ml@embed.me.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169BEC43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 14:17:43 +0000 (UTC)
Received: from outbound.soverin.net (outbound.soverin.net [185.233.34.21])
 by mx.groups.io with SMTP id smtpd.web11.13901.1654784261309679458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 07:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@embed.me.uk header.s=soverin
 header.b=JIEBnLMS;
 spf=pass (domain: embed.me.uk, ip: 185.233.34.21, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (c04smtp-lb01.int.sover.in [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 4LJmQC3HFvzR1
	for <openembedded-core@lists.openembedded.org>;
 Thu,  9 Jun 2022 14:17:39 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [10.10.4.99]) by soverin.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=embed.me.uk;
	s=soverin; t=1654784259;
	bh=RuXvqb4XZmqogoOXpZ3iJgCpPx/y36UxiM0rJv8X/iY=;
	h=From:To:Cc:Subject:Date:From;
	b=JIEBnLMSzFcE3/MFUGvJV7jp6yNxwajxA8lbLrWyt6qD7QJN68Go4IsTx2qo62yEY
	 NM5lQOJYOwXYWXkldnSHB/Cgk9xNxj7IKn3E/DFhSfFBHKR9oX7KJbUtLDN5Ccmrzw
	 E68/uWhatHmMsDKNN4bONGpKJNTzCfndkmmGCZXaXmzxfwvrR+bPQXMqg/DFy293Wr
	 4C8G4OT68kXZBGun0kbVquT4HB/t7Czz31QzmrU6hze6cRqpTu+3wS2dDoQ+uTv5Ls
	 mVM+CbGqiv/OrLNctZGAJC84YBr+TS65yXW91HYmwop16rYpA9NAsx7rWO3+QgirHM
	 A/hUS4K2V0NIg==
From: Jack Mitchell <ml@embed.me.uk>
To: openembedded-core@lists.openembedded.org
Cc: Jack Mitchell <ml@embed.me.uk>
Subject: [PATCH] meson.bbclass: add cython binary to cross/native toolchain
 config
Date: Thu,  9 Jun 2022 15:17:32 +0100
Message-Id: <20220609141732.1425018-1-ml@embed.me.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 14:17:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166781

This allows building Cython based Python modules with the native
meson support which has been present since meson version 0.59.

https://mesonbuild.com/Cython.html

Signed-off-by: Jack Mitchell <ml@embed.me.uk>
---
 meta/classes/meson.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index b265e6659f..546cd0476f 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -59,6 +59,7 @@ do_write_config() {
 [binaries]
 c =3D ${@meson_array('CC', d)}
 cpp =3D ${@meson_array('CXX', d)}
+cython =3D 'cython3'
 ar =3D ${@meson_array('AR', d)}
 nm =3D ${@meson_array('NM', d)}
 strip =3D ${@meson_array('STRIP', d)}
@@ -98,6 +99,7 @@ EOF
 [binaries]
 c =3D ${@meson_array('BUILD_CC', d)}
 cpp =3D ${@meson_array('BUILD_CXX', d)}
+cython =3D 'cython3'
 ar =3D ${@meson_array('BUILD_AR', d)}
 nm =3D ${@meson_array('BUILD_NM', d)}
 strip =3D ${@meson_array('BUILD_STRIP', d)}
--=20
2.36.1


