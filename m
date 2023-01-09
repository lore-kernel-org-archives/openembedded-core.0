Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FA5C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 13:35:38 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.71558.1673271330446883667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 05:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout05.t-online.de (Postfix) with SMTP id 3D03429D8
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jan 2023 14:34:48 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.169.211]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pEsIY-1tC8KP0; Mon, 9 Jan 2023 14:34:46 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] librsvg: enable vapi build
Date: Mon,  9 Jan 2023 14:34:37 +0100
Message-Id: <20230109133437.84684-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673271286-177E998D-B7648238/0/0 CLEAN NORMAL
X-TOI-MSGID: 07633935-78ff-49f2-aaf0-915c52eb0372
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 13:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175683

Otherwise gnome-chess will fail like this:

| error: Package `librsvg-2.0' not found in specified Vala API directorie=
s or GObject-Introspection GIR directories
| Compilation failed: 1 error(s), 0 warning(s)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-gnome/librsvg/librsvg_2.54.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.54.5.bb
index fc52ae61c5..b2e93a2684 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
@@ -42,6 +42,8 @@ do_configure[postfuncs] +=3D "cargo_common_do_configure=
"
=20
 inherit rust-target-config
=20
+EXTRA_OECONF:class-target =3D "--enable-vala"
+
 # rust-cross writes the target linker binary into target json definition=
 without any flags.
 # This breaks here because the linker isn't going to work without at lea=
st knowing where
 # the sysroot is. So copy the json to workdir, and patch in the path to =
wrapper from rust class
--=20
2.34.1


