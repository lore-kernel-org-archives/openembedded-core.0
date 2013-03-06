Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UDB70-0002QF-TD
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 10:58:25 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1; Wed, 6 Mar 2013
	10:41:20 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 789C2289653;
	Wed,  6 Mar 2013 10:41:20 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Mar 2013 10:41:08 +0100
Message-ID: <1362562871-16878-2-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1362562871-16878-1-git-send-email-bjst@enea.com>
References: <1362562871-16878-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 1/4] ptest: Move ptest checks from recipes to ptest.bbclass
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
X-List-Received-Date: Wed, 06 Mar 2013 09:58:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch cleans up ptest implementation in recipes by moving ptest
specific code parts into dedicated *_ptest functions.

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/classes/ptest.bbclass |   35 +++++++++++++++++++++++++++++------
 1 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 131af7b..6ab5ee4 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -23,13 +23,36 @@ FILES_${PN}-dbg +=3D "${PTEST_PATH}/.debug \
                     ${PTEST_PATH}/*/*/*/*/.debug \
                    "
=20
-ptest_do_install() {
-    if [ "${PN}" =3D "${BPN}" -a ${PTEST_ENABLED} =3D "1" ]; then
-        install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
-        if grep -q install-ptest: Makefile; then
-            oe_runmake DESTDIR=3D${D}${PTEST_PATH} install-ptest
+do_configure_ptest_base() {
+    if [ ${PTEST_ENABLED} =3D 1 ]; then
+        if [ type -t do_configure_ptest =3D function ]; then
+            do_configure_ptest
         fi
     fi
 }
=20
-EXPORT_FUNCTIONS ptest_do_install
+do_compile_ptest_base() {
+    if [ ${PTEST_ENABLED} =3D 1 ]; then
+        if [ type -t do_compile_ptest =3D function ]; then
+            do_compile_ptest
+        fi
+    fi
+}
+
+do_install_ptest_base() {
+    if [ ${PTEST_ENABLED} =3D 1 ]; then
+        if [ -f ${WORKDIR}/run-ptest ]; then
+            install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
+            if grep -q install-ptest: Makefile; then
+                oe_runmake DESTDIR=3D${D}${PTEST_PATH} install-ptest
+            fi
+            if [ type -t do_install_ptest =3D function ]; then
+                do_install_ptest
+            fi
+        fi
+    fi
+}
+
+addtask configure_ptest_base after do_configure before do_compile
+addtask compile_ptest_base   after do_compile   before do_install
+addtask install_ptest_base   after do_install   before do_package
--=20
1.7.5.4



