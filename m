Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 Jul 2014 08:21:56 UTC
Received: from root.phytec.de (mail.phytec.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 9774065EDB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 08:21:56 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 31B0CBF0E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 10:14:49 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072810144885-2711 ;
	Mon, 28 Jul 2014 10:14:48 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jul 2014 10:14:44 +0200
Message-Id: <1406535284-12222-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 8.5.3FP6|November
	21, 2013) at 28.07.2014 10:14:48,
	Serialize by Router on Idefix/Phytec(Release 8.5.3FP6|November 21,
	2013) at 28.07.2014 10:14:49
Subject: [PATCH] cml1: correct diffconfig output format
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
X-List-Received-Date: Mon, 28 Jul 2014 08:21:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

If used with some packages using kconfig mechanism, the diffconfig
command generates wrong output format. Diff provides all options to
format the output correctly. This method formats as intended, is more
robust and works with the merge=5Fconfig.h script from yocto-kernel-tools.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta/classes/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 34c0c4e..0d4b10b 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -58,7 +58,7 @@ python do=5Fdiffconfig() {
         bb.fatal("No config files found. Did you do menuconfig ?\n%s" % e)
=20
     if isdiff:
-        statement =3D 'diff -Nurp ' + configorig + ' ' + config + '| sed -=
n "s/^\+//p" >' + fragment
+        statement =3D 'diff --unchanged-line-format=3D --old-line-format=
=3D --new-line-format=3D"%L"' + configorig + ' ' + config + '>' + fragment
         subprocess.call(statement, shell=3DTrue)
=20
         shutil.copy(configorig, config)
--=20
1.9.1


