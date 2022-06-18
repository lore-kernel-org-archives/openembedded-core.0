Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760D0C433EF
	for <webhook@archiver.kernel.org>; Sat, 18 Jun 2022 17:53:20 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web12.11537.1655574792373563456
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jun 2022 10:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17,
 mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout02.t-online.de (Postfix) with SMTP id DED276632
	for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jun 2022 19:53:09 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.46.54]) by fwd70.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o2cdB-1CpVAH0; Sat, 18 Jun 2022 19:53:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oecore][PATCH] bc: add missing bison-native dependency
Date: Sat, 18 Jun 2022 19:52:58 +0200
Message-Id: <20220618175258.4655-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1655574789-0143FF0B-1DC26D50/0/0 CLEAN NORMAL
X-TOI-MSGID: 5ebfbe9a-d965-4258-b3be-fa6c939fe859
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jun 2022 17:53:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167030

this fixes an error i encountered building for raspberrypi4 32bit:

prefix-map=3D/home/flk/build/poky/build-raspi/tmp/work/cortexa7t2hf-neon-=
vfpv4-poky-linux-gnueabi/bc/1.07.1-r0/recipe-sysroot-native=3D  -Wall -fu=
nsigned-char -c -o warranty.o ../../bc-1.07.1/bc/warranty.c
| ../../bc-1.07.1/ylwrap: line 176: yacc: command not found
| make[2]: *** [Makefile:429: bc.c] Error 127

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-extended/bc/bc_1.07.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extende=
d/bc/bc_1.07.1.bb
index 1bec76bb2a..67453de822 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673=
463ab874e80d47fae504 \
                     file://lib/number.c;endline=3D20;md5=3Dcf43068cc88f8=
37731dc53240456cfaf"
=20
 SECTION =3D "base"
-DEPENDS =3D "flex-native"
+DEPENDS =3D "flex-native bison-native"
=20
 SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://no-gen-libmath.patch \
--=20
2.25.1


