Return-Path: <stefan.tauner@artech.at>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BBDCD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 12:15:24 +0000 (UTC)
Received: from out07.mymailwall.com (out07.mymailwall.com [91.212.136.3])
 by mx.groups.io with SMTP id smtpd.web11.49654.1695039318936783643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 05:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: artech.at, ip: 91.212.136.3, mailfrom: stefan.tauner@artech.at)
X-MyMailWallStatus: Email scanned(2281534560)
Received: from mail.artech.at (EHLO mail.artech.at) [91.112.220.99]
	by relay.mymailwall.com with ESMTP TLS id 26521 2281534560; Mon, 18 Sep 2023 14:15:16 +0200
Received: from tauner-t14s.local (192.168.0.251) by SRV09.ARTech.local
 (192.168.0.89) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.23; Mon, 18 Sep
 2023 14:15:15 +0200
From: Stefan Tauner <stefan.tauner@artech.at>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gdb: fix RDEPENDS for PACKAGECONFIG[tui]
Date: Mon, 18 Sep 2023 14:15:15 +0200
Message-ID: <20230918121515.623164-1-stefan.tauner@artech.at>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.0.251]
X-ClientProxiedBy: SRV09.ARTech.local (192.168.0.89) To SRV09.ARTech.local
 (192.168.0.89)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 12:15:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187828

TUI mode needs terminfo at runtime, which is required to be
explicitly stated in the respective PACKAGECONFIG variable.

Without this change /etc/terminfo/ might be missing, which
leads to a runtime error when trying to use tui, e.g.:
(gdb) tui enable
Cannot enable the TUI: error opening terminal [TERM=3Dxterm-256color]

Signed-off-by: Stefan Tauner <stefan.tauner@artech.at>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

I ran into this when running a very minimal Kirkstone image. I presume
this is still an issue but someone should definitely look into it since
I am quite new to bitbake/Yocto and have no means to test it with a
current version.

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtoo=
ls/gdb/gdb-common.inc
index 925b0c2f80..0f392357fe 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -35,8 +35,7 @@ PACKAGECONFIG ??=3D "readline ${@bb.utils.filter('DISTRO_=
FEATURES', 'debuginfod',
 PACKAGECONFIG[readline] =3D "--with-system-readline,--without-system-readl=
ine,readline"
 PACKAGECONFIG[python] =3D "--with-python=3D${WORKDIR}/python,--without-pyt=
hon,python3,python3 python3-codecs"
 PACKAGECONFIG[babeltrace] =3D "--with-babeltrace,--without-babeltrace,babe=
ltrace"
-# ncurses is already a hard DEPENDS, but would be added here if it weren't
-PACKAGECONFIG[tui] =3D "--enable-tui,--disable-tui"
+PACKAGECONFIG[tui] =3D "--enable-tui,--disable-tui,,ncurses-terminfo-base"
 PACKAGECONFIG[xz] =3D "--with-lzma --with-liblzma-prefix=3D${STAGING_DIR_H=
OST},--without-lzma,xz"
 PACKAGECONFIG[debuginfod] =3D "--with-debuginfod, --without-debuginfod, el=
futils"

--
Kind regards, Stefan Tauner




FN 181686 k. HG Wien, UID-Nr. ATU 47056901, zertifiziert nach ISO 9001:2015=
 (Nr. AT-04036/0), ISO/TS 22163:2017 (IR-00009/0) und ISO 27001:2013 (Nr. I=
-00619/0)
Der Inhalt dieser E-Mail ist vertraulich und ausschlie=DFlich f=FCr den bez=
eichneten Adressaten bestimmt. Wenn Sie nicht der vorgesehene Adressat dies=
er E-Mail oder dessen Vertreter sein sollten, so beachten Sie bitte, dass j=
ede Form der Kenntnisnahme, Ver=F6ffentlichung, Vervielf=E4ltigung oder Wei=
tergabe des Inhaltes dieser E-Mail unzul=E4ssig ist. Wir bitten Sie, sich i=
n diesem Fall mit dem Absender der E-Mail in Verbindung zu setzen und die E=
-Mail zu vernichten. F=FCr =DCbermittlungsfehler oder sonstige Irrt=FCmer b=
ei der =DCbermittlung besteht keine Haftung.
This e-mail is intended solely for the person to whom it is addressed and m=
ay contain confidential or legally privileged information. Access to this e=
-mail by anyone else is unauthorized. If an addressing or transmission erro=
r has misdirected this e-mail, please notify the author by replying to this=
 e-mail and destroy this e-mail and any attachments. E-mail may be suscepti=
ble to data corruption, interception, unauthorized amendment, viruses and d=
elays or the consequences thereof. If you are not the intended recipient, b=
e advised that you have received this e-mail in error and that any use, dis=
semination, forwarding, printing or copying of this e-mail is strictly proh=
ibited.


