Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.rapiddevelopmentkit.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 52DAC7321C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 13:15:39 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 71129A003C9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 15:15:41 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016080515153987-23545 ;
	Fri, 5 Aug 2016 15:15:39 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 5 Aug 2016 15:15:35 +0200
Message-Id: <1470402935-5261-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 05.08.2016 15:15:39,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 05.08.2016 15:15:39
X-TNEFEvaluated: 1
Subject: [PATCH] alsa-utils: fix installed-vs-shipped for bat
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
X-List-Received-Date: Fri, 05 Aug 2016 13:15:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The bat PACKAGECONFIG does not install the test script correctly. Fix
this by following the packaging used for the other bash scripts. While
at it, fix some tabs.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta/recipes-multimedia/alsa/alsa-utils-scripts=5F1.1.1.bb | 4 ++++
 meta/recipes-multimedia/alsa/alsa-utils=5F1.1.1.bb         | 7 ++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts=5F1.1.1.bb b/m=
eta/recipes-multimedia/alsa/alsa-utils-scripts=5F1.1.1.bb
index a98f9b9..4e28fef 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils-scripts=5F1.1.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils-scripts=5F1.1.1.bb
@@ -10,6 +10,7 @@ RDEPENDS=5F${PN} +=3D "bash"
=20
 FILES=5F${PN} =3D "${sbindir}/alsaconf \
                ${sbindir}/alsa-info.sh \
+               ${sbindir}/alsabat-test.sh \
               "
=20
 S =3D "${WORKDIR}/alsa-utils-${PV}"
@@ -18,4 +19,7 @@ do=5Finstall() {
 	install -d ${D}${sbindir}
 	install -m 0755 ${B}/alsaconf/alsaconf ${D}${sbindir}/
 	install -m 0755 ${S}/alsa-info/alsa-info.sh ${D}${sbindir}/
+	if ${@bb.utils.contains('PACKAGECONFIG', 'bat', 'false', 'true', d)}; then
+		install -m 0755 ${S}/bat/alsabat-test.sh ${D}${sbindir}/
+	fi
 }
diff --git a/meta/recipes-multimedia/alsa/alsa-utils=5F1.1.1.bb b/meta/reci=
pes-multimedia/alsa/alsa-utils=5F1.1.1.bb
index 08c4646..ab07fa8 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils=5F1.1.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils=5F1.1.1.bb
@@ -99,10 +99,11 @@ do=5Finstall() {
 	# See alsa-utils-scripts=5F${PV}.bb
 	rm ${D}${sbindir}/alsaconf
 	rm ${D}${sbindir}/alsa-info.sh
+	rm ${D}${sbindir}/alsabat-test.sh
=20
 	if ${@bb.utils.contains('PACKAGECONFIG', 'udev', 'false', 'true', d)}; th=
en
-	   # This is where alsa-utils will install its rules if we don't tell it =
anything else.
-	   rm -rf ${D}/lib/udev
-	   rmdir --ignore-fail-on-non-empty ${D}/lib
+		# This is where alsa-utils will install its rules if we don't tell it an=
ything else.
+		rm -rf ${D}/lib/udev
+		rmdir --ignore-fail-on-non-empty ${D}/lib
 	fi
 }
--=20
1.9.1


