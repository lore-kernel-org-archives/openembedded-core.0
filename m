Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qbz29-00083N-AH
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 19:58:41 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Wed, 29 Jun 2011
	19:54:59 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jun 2011 19:54:48 +0200
Message-ID: <815991ad20889a21837ac34266f4108c4824e344.1309370038.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309370038.git.anders@chargestorm.se>
References: <cover.1309370038.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: =?UTF-8?B?W1JGQyB2MyBQQVRDSCAyLzldIGltYWdlwqFrZXJuZWwuYmJsYXNzOiBkbyBub3QgdXNlIGRlcG1vZC0yLjY=?=
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
X-List-Received-Date: Wed, 29 Jun 2011 17:58:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Change to only depend on virtual/*/depmod.
Change all calls to only use depmod.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/classes/image.bbclass  |    2 +-
 meta/classes/kernel.bbclass |   10 ++++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2469442..46d066e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -114,7 +114,7 @@ fakeroot do_rootfs () {
 		KERNEL_VERSION=3D`cat ${STAGING_KERNEL_DIR}/kernel-abiversion`
=20
 		mkdir -p ${IMAGE_ROOTFS}/lib/modules/$KERNEL_VERSION
-		${TARGET_SYS}-depmod-2.6 -a -b ${IMAGE_ROOTFS} -F ${STAGING_KERNEL_DIR}/=
System.map-$KERNEL_VERSION $KERNEL_VERSION
+		${TARGET_SYS}-depmod -a -b ${IMAGE_ROOTFS} -F ${STAGING_KERNEL_DIR}/Syst=
em.map-$KERNEL_VERSION $KERNEL_VERSION
 	fi
=20
 	${IMAGE_PREPROCESS_COMMAND}
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6bdfd3e..26c8ea1 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -1,7 +1,7 @@
 inherit linux-kernel-base module_strip
=20
 PROVIDES +=3D "virtual/kernel"
-DEPENDS +=3D "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod-$=
{@get_kernelmajorversion('${PV}')} virtual/${TARGET_PREFIX}gcc${KERNEL_CCSU=
FFIX} update-modules"
+DEPENDS +=3D "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmod v=
irtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
=20
 # we include gcc above, we dont need virtual/libc
 INHIBIT_DEFAULT_DEPS =3D "1"
@@ -53,7 +53,6 @@ KERNEL_IMAGEDEST =3D "boot"
 export CMDLINE_CONSOLE =3D "console=3D${@bb.data.getVar("KERNEL_CONSOLE",d=
,1) or "ttyS0"}"
=20
 KERNEL_VERSION =3D "${@get_kernelversion('${B}')}"
-KERNEL_MAJOR_VERSION =3D "${@get_kernelmajorversion('${KERNEL_VERSION}')}"
=20
 KERNEL_LOCALVERSION ?=3D ""
=20
@@ -232,7 +231,7 @@ if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
 	mkdir -p $D/lib/modules/${KERNEL_VERSION}
 fi
 if [ -n "$D" ]; then
-	${HOST_PREFIX}depmod-${KERNEL_MAJOR_VERSION} -A -b $D -F ${STAGING_KERNEL=
_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
+	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNE=
L_VERSION} ${KERNEL_VERSION}
 else
 	depmod -a
 fi
@@ -240,7 +239,7 @@ fi
=20
 pkg_postinst_modules () {
 if [ -n "$D" ]; then
-	${HOST_PREFIX}depmod-${KERNEL_MAJOR_VERSION} -A -b $D -F ${STAGING_KERNEL=
_DIR}/System.map-${KERNEL_VERSION} ${KERNEL_VERSION}
+	${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KERNE=
L_VERSION} ${KERNEL_VERSION}
 else
 	depmod -a
 	update-modules || true
@@ -313,9 +312,8 @@ python populate_packages_prepend () {
 			kernelver_stripped =3D m.group(1)
 		path =3D bb.data.getVar("PATH", d, 1)
 		host_prefix =3D bb.data.getVar("HOST_PREFIX", d, 1) or ""
-		major_version =3D bb.data.getVar('KERNEL_MAJOR_VERSION', d, 1)
=20
-		cmd =3D "PATH=3D\"%s\" %sdepmod-%s -n -a -r -b %s -F %s/boot/System.map-=
%s %s" % (path, host_prefix, major_version, dvar, dvar, kernelver, kernelve=
r_stripped)
+		cmd =3D "PATH=3D\"%s\" %sdepmod -n -a -r -b %s -F %s/boot/System.map-%s =
%s" % (path, host_prefix, dvar, dvar, kernelver, kernelver_stripped)
 		f =3D os.popen(cmd, 'r')
=20
 		deps =3D {}
--=20
1.7.4.1



