Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phycard.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id E0B6A76886
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 15:28:08 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 44965A0045B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 17:24:14 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015081017222256-138125 ;
	Mon, 10 Aug 2015 17:22:22 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Aug 2015 17:22:22 +0200
Message-Id: <1439220142-3388-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 10.08.2015 17:22:22,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 10.08.2015 17:22:22
Subject: [PATCH] cml1.bbclass: make menuconfig task configurable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Aug 2015 15:28:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Menuconfig is sometimes not the most convenient way to configure a
kernel, as the default color scheme can be hard to read. This variable
gives you access to the MENUCONFIG=5FCOLOR variable or lets you select
nconfig, e.g. by setting it in your local.conf:

KCONFIG=5FCONFIG=5FCOMMAND =3D "MENUCONFIG=5FCOLOR=3Dmono menuconfig"
or
KCONFIG=5FCONFIG=5FCOMMAND =3D "nconfig"

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta/classes/cml1.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 43acfd5..95cf584 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -16,6 +16,7 @@ CROSS=5FCURSES=5FLIB =3D "-lncurses -ltinfo"
 CROSS=5FCURSES=5FINC =3D '-DCURSES=5FLOC=3D"<curses.h>"'
 TERMINFO =3D "${STAGING=5FDATADIR=5FNATIVE}/terminfo"
=20
+KCONFIG=5FCONFIG=5FCOMMAND ??=3D "menuconfig"
 python do=5Fmenuconfig() {
     import shutil
=20
@@ -25,7 +26,7 @@ python do=5Fmenuconfig() {
     except OSError:
         mtime =3D 0
=20
-    oe=5Fterminal("${SHELL} -c \"make menuconfig; if [ \$? -ne 0 ]; then e=
cho 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"=
", '${PN} Configuration', d)
+    oe=5Fterminal("${SHELL} -c \"make ${KCONFIG=5FCONFIG=5FCOMMAND}; if [ =
\$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue=
... '; read r; fi\"", '${PN} Configuration', d)
=20
     # FIXME this check can be removed when the minimum bitbake version has=
 been bumped
     if hasattr(bb.build, 'write=5Ftaint'):
--=20
1.9.1


