Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FD2C02194
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 19:05:24 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.70475.1738523122423859342
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Feb 2025 11:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout12.t-online.de (Postfix) with SMTP id ED29BF76
	for <openembedded-core@lists.openembedded.org>; Sun,  2 Feb 2025 20:04:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.16]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tefH1-0jmMoz0; Sun, 2 Feb 2025 20:04:51 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] xorg-minimal-fonts: dont try to install builddir
Date: Sun,  2 Feb 2025 20:05:19 +0100
Message-ID: <20250202190519.1087168-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1738523091-E0FF6939-4321C5F6/0/0 CLEAN NORMAL
X-TOI-MSGID: 4faf7057-83ac-4357-b49c-79491ccb8d75
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Feb 2025 19:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210622

With current master branch I see an error in do_install:
| DEBUG: Executing shell function do_install
| install: omitting directory '/home/flk/poky/build/tmp/work/all-poky-lin=
ux/xorg-minimal-fonts/1.0/misc/xorg-minimal-fonts-1.0-build'
| WARNING: /home/flk/poky/build/tmp/work/all-poky-linux/xorg-minimal-font=
s/1.0/temp/run.do_install.112196:151 exit 1 from 'install -m 0644 /home/f=
lk/poky/build/tmp/work/all-poky-linux/xorg-minimal-fonts/1.0/misc/* /home=
/flk/poky/build/tmp/work/all-poky-linux/xorg-minimal-fonts/1.0/image//usr=
/share/fonts/X11/misc/'
| WARNING: Backtrace (BB generated script):
| 	#1: do_install, /home/flk/poky/build/tmp/work/all-poky-linux/xorg-mini=
mal-fonts/1.0/temp/run.do_install.112196, line 151
| 	#2: main, /home/flk/poky/build/tmp/work/all-poky-linux/xorg-minimal-fo=
nts/1.0/temp/run.do_install.112196, line 159
ERROR: Task (/home/flk/poky/meta/recipes-graphics/xorg-font/xorg-minimal-=
fonts.bb:do_install) failed with exit code '1'

Fix the problem by specifying more precisely what is to be installed

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta=
/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index d32ef77447..e51e3fbc3a 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -27,7 +27,9 @@ RDEPENDS:${PN} +=3D "font-alias"
=20
 do_install() {
 	install -d ${D}/${datadir}/fonts/X11/misc
-	install -m 0644 ${S}/* ${D}/${datadir}/fonts/X11/misc/
+	for file in ${S}/*.gz ${S}/fonts.dir; do
+		install -m 0644 "$file" ${D}/${datadir}/fonts/X11/misc/
+	done
 	# Pick a date/time as otherwise it would be the git checkout/modify tim=
e
 	touch -d @1613559011 ${D}/${datadir}/fonts/X11/misc/*
 	install -d ${D}/${libdir}/X11
--=20
2.47.1


