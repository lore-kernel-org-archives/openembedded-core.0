Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RbYXK-0004TQ-EE
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 15:13:22 +0100
Received: from localhost.localdomain (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 621F74B00B7;
	Fri, 16 Dec 2011 15:06:19 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2011 15:05:40 +0100
Message-Id: <1324044340-21898-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: fcooper@ti.com
Subject: [PATCH] gdb-cross-canadian: build gdb with python support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Dec 2011 14:13:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

* python support is needed for providing finer scripting control
in gdb, and for remote controling gdb for example from qtcreator
* gdb/configure tries to autodetect python using python executable
with --includes --ldflags --exec-prefix to get the right flags
As it's difficult to achieve in OE's context, we generate a
script which will return the right values and make gdb's build
system happy. This idea was taken from the following article :
http://www.mentby.com/doug-evans-2/python-enabled-gdb-on-windows-and-relo=
cation.html
* tested using angstrom & armv7 target & qtcreator 201005 & 2.4.0

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
Cc: fcooper@ti.com
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc |   20 ++++++++++++++++=
+++-
 1 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/reci=
pes-devtools/gdb/gdb-cross-canadian.inc
index ec0748e..e0e6e30 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -4,4 +4,22 @@ DESCRIPTION =3D "cross-canadian gdb for ${TARGET_ARCH} t=
arget - GNU debugger"
 PN =3D "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN =3D "gdb"
=20
-DEPENDS =3D "ncurses-nativesdk expat-nativesdk gettext-nativesdk readlin=
e-nativesdk"
+DEPENDS =3D "ncurses-nativesdk expat-nativesdk gettext-nativesdk readlin=
e-nativesdk python-nativesdk"
+RDEPENDS +=3D "python-nativesdk-core python-nativesdk-lang python-native=
sdk-re \
+             python-nativesdk-codecs python-nativesdk-netclient"
+
+EXTRA_OECONF_append =3D "--with-python=3D${WORKDIR}/python"
+
+do_configure_prepend() {
+cat > ${WORKDIR}/python << EOF
+#! /bin/sh
+case "\$2" in
+        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_=
VENDOR}-${HOST_OS}${exec_prefix}/include/python${PYTHON_BASEVERSION}/" ;;
+        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_V=
ENDOR}-${HOST_OS}${libdir}/python${PYTHON_BASEVERSION}/config/config -lpt=
hread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
+        --exec-prefix) echo "/usr" ;;
+        *) exit 1 ;;
+esac
+exit 0
+EOF
+        chmod +x ${WORKDIR}/python
+}
\ No newline at end of file
--=20
1.7.0.4



