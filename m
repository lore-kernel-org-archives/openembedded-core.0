Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UDB6t-0002QF-7G
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 10:58:12 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1; Wed, 6 Mar 2013
	10:41:20 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 883C2289658;
	Wed,  6 Mar 2013 10:41:20 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Mar 2013 10:41:11 +0100
Message-ID: <1362562871-16878-5-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1362562871-16878-1-git-send-email-bjst@enea.com>
References: <1362562871-16878-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 4/4] bash: Use new _ptest functions
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
X-List-Received-Date: Wed, 06 Mar 2013 09:58:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/recipes-extended/bash/bash.inc |   15 ++++++---------
 1 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/ba=
sh/bash.inc
index 20a23f0..c619f82 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -25,10 +25,8 @@ do_configure_prepend () {
 	fi
 }
=20
-do_compile_append () {
-        if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
-            oe_runmake buildtest
-        fi
+do_compile_ptest () {
+	oe_runmake buildtest
 }
=20
 do_install_append () {
@@ -37,12 +35,11 @@ do_install_append () {
 		mkdir -p ${D}${base_bindir}
 		mv ${D}${bindir}/bash ${D}${base_bindir}
 	fi
+}
=20
-        if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
-            ptest_do_install
-            make INSTALL_TEST_DIR=3D${D}${PTEST_PATH}/tests install-test
-            cp ${B}/Makefile ${D}${PTEST_PATH}
-        fi
+do_install_ptest () {
+	make INSTALL_TEST_DIR=3D${D}${PTEST_PATH}/tests install-test
+	cp ${B}/Makefile ${D}${PTEST_PATH}
 }
=20
 pkg_postinst_${PN} () {
--=20
1.7.5.4



