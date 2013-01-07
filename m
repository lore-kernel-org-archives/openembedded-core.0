Received: from 4.mo1.mail-out.ovh.net ([46.105.76.26]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TsGKl-0002Lo-3Q
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 18:18:00 +0100
Received: from mail435.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id B6288FF9863
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2013 17:57:00 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 7 Jan 2013 18:43:33 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	buildor.local.eukrea.com) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 7 Jan 2013 18:43:32 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Mon,  7 Jan 2013 17:43:44 +0100
Message-Id: <1357577024-7889-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 18101092804144639426
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrfeejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrfeejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Subject: [PATCH] libnl: fix compilation on hosts without lex
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 17:18:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

* libnl's makefiles are calling $(LEX) but only define $(FLEX), thus
compilation on a host which doesn't have lex fails with :
| lex --header-file=3Droute/cls/ematch_grammar.h  -o route/cls/ematch_gra=
mmar.c route/cls/ematch_grammar.l
| make[1]: lex: Command not found
| make[1]: *** [route/cls/ematch_grammar.c] Error 127

* this patch fix this by setting LEX variable to flex tool

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta/recipes-support/libnl/libnl_3.2.16.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libnl/libnl_3.2.16.bb b/meta/recipes-su=
pport/libnl/libnl_3.2.16.bb
index be3a3a2..0181436 100644
--- a/meta/recipes-support/libnl/libnl_3.2.16.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.infradead.org/~tgr/libnl/"
 SECTION =3D "libs/network"
=20
 PE =3D "1"
-PR =3D "r0"
+PR =3D "r1"
=20
 LICENSE =3D "LGPLv2.1"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
@@ -19,6 +19,8 @@ SRC_URI[sha256sum] =3D "c43a42336c6a3cf559f390e202f8f02=
9d165bd767da7cf7a32a815c570
=20
 inherit autotools pkgconfig
=20
+EXTRA_OEMAKE +=3D "LEX=3Dflex"
+
 FILES_${PN} =3D "${libdir}/libnl-3.so.* \
                ${libdir}/libnl.so.* \
                ${sysconfdir}"
--=20
1.7.10.4



