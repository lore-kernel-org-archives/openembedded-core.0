Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phytec.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id D938070900
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 11:49:32 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id EC530BF092
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 13:49:33 +0200 (CEST)
Received: from lws-mklieser.phytec.de ([172.16.10.21])
	by idefix.phytec.de (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014073013493362-3884 ;
	Wed, 30 Jul 2014 13:49:33 +0200 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jul 2014 13:49:13 +0200
Message-Id: <1406720953-30774-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 8.5.3FP6|November
	21, 2013) at 30.07.2014 13:49:33,
	Serialize by Router on Idefix/Phytec(Release 8.5.3FP6|November 21,
	2013) at 30.07.2014 13:49:33
Subject: [RFC 1/1] add support for the barebox bootloader
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
X-List-Received-Date: Wed, 30 Jul 2014 11:49:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Barebox is a bootloader that inherits the best of U-Boot and the Linux
kernel. The barebox uses kconfig and kbuild mechanisms similar to the
Linux kernel. This is reflected in the recipe. As soon as this
functionality gets more abstraction in classes, the barebox recipe can
be simplified. The recipe supports: kconfig handling, kconfig fragments,
packages for dev tools and support for the initial program loader
creation.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta/recipes-bsp/barebox/barebox-ipl.inc          |  37 +++++
 meta/recipes-bsp/barebox/barebox-ipl=5F2014.07.0.bb |   4 +
 meta/recipes-bsp/barebox/barebox.inc              | 161 ++++++++++++++++++=
++++
 meta/recipes-bsp/barebox/barebox=5F2014.07.0.bb     |   4 +
 4 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-bsp/barebox/barebox-ipl.inc
 create mode 100644 meta/recipes-bsp/barebox/barebox-ipl=5F2014.07.0.bb
 create mode 100644 meta/recipes-bsp/barebox/barebox.inc
 create mode 100644 meta/recipes-bsp/barebox/barebox=5F2014.07.0.bb

diff --git a/meta/recipes-bsp/barebox/barebox-ipl.inc b/meta/recipes-bsp/ba=
rebox/barebox-ipl.inc
new file mode 100644
index 0000000..f388522
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox-ipl.inc
@@ -0,0 +1,37 @@
+# Copyright (C) 2014 Stefan Mueller-Klieser <s.mueller-klieser@phytec.de> \
+# PHYTEC Messtechnik GmbH
+# Recipe released under the GPL-3.0 license
+
+require barebox.inc
+
+DESCRIPTION =3D "Barebox IPL Inintial Program Loader: some machines need \
+               a pre-bootloader. This one gets build by the barebox."
+PROVIDES =3D "barebox-ipl"
+S =3D "${WORKDIR}/barebox-${PV}"
+
+# Pre Bootloader=20
+BAREBOX=5FIPL=5FBIN ?=3D "barebox.bin"
+BAREBOX=5FIPL=5FBIN=5FDEPLOY ?=3D "IPL-${MACHINE}-${PV}-${PR}.bin"
+BAREBOX=5FIPL=5FBIN=5FSYMLINK ?=3D "IPL"
+BAREBOX=5FIPL=5FDEFAULT=5FDEFCONFIG ?=3D "am335x=5Fmlo=5Fdefconfig"
+
+do=5Fdefault=5Fdefconfig () {
+	bbnote "generating .config for target ${BAREBOX=5FIPL=5FDEFAULT=5FDEFCONF=
IG}"
+	unset CFLAGS LDFLAGS
+	oe=5Frunmake ${BAREBOX=5FIPL=5FDEFAULT=5FDEFCONFIG}
+}
+
+do=5Finstall () {
+	bbnote "Installing barebox-ipl image on target rootfs"
+	install -d ${D}${base=5Fbootdir}
+	install ${S}/${BAREBOX=5FIPL=5FBIN} ${D}${base=5Fbootdir}/${BAREBOX=5FIPL=
=5FBIN=5FDEPLOY}
+	ln -sf ${BAREBOX=5FIPL=5FBIN=5FDEPLOY} ${D}${base=5Fbootdir}/${BAREBOX=5F=
IPL=5FBIN=5FSYMLINK}
+}
+FILES=5F${PN} =3D ""
+FILES=5F${PN} =3D "${base=5Fbootdir}"
+
+do=5Fdeploy () {
+	bbnote "Deploying barebox ipl"
+	install ${S}/${BAREBOX=5FIPL=5FBIN} ${DEPLOYDIR}/${BAREBOX=5FIPL=5FBIN=5F=
DEPLOY}
+	ln -sf ${BAREBOX=5FIPL=5FBIN=5FDEPLOY} ${DEPLOYDIR}/${BAREBOX=5FIPL=5FBIN=
=5FSYMLINK}
+}
diff --git a/meta/recipes-bsp/barebox/barebox-ipl=5F2014.07.0.bb b/meta/rec=
ipes-bsp/barebox/barebox-ipl=5F2014.07.0.bb
new file mode 100644
index 0000000..372828a
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox-ipl=5F2014.07.0.bb
@@ -0,0 +1,4 @@
+require barebox-ipl.inc
+
+SRC=5FURI[md5sum] =3D "f3a93950777916d4b1c2cd366aec8d91"
+SRC=5FURI[sha256sum] =3D "6dca5c78de8565a15aaa404edbf1bc4663415f0dc69e094f=
3b621636876285f2"
diff --git a/meta/recipes-bsp/barebox/barebox.inc b/meta/recipes-bsp/barebo=
x/barebox.inc
new file mode 100644
index 0000000..b7885df
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox.inc
@@ -0,0 +1,161 @@
+# Copyright (C) 2014 Stefan Mueller-Klieser <s.mueller-klieser@phytec.de>
+# PHYTEC Messtechnik GmbH
+# Recipe released under the GPL-3.0 license
+#
+# TODO: see if there is some development towards moving all kconfig
+#       funcionality into the kconfig-frontends package and adjust
+#       the recipe accordingly.
+#
+
+SUMMARY =3D "The Barebox Bootloader"
+DESCRIPTION =3D "Barebox (formerly known as u-boot-v2) is a bootloader tha=
t \
+               inherits the best of U-Boot and the Linux kernel: The size =
and \
+	       look-and-feel of u-boot, with driver model and lots of design \
+	       concepts from the kernel. \
+	       The bb recipe adds config fragment support and kconfig \
+	       command handling using the yocto kern-tools-native."
+HOMEPAGE =3D "http://www.barebox.org"
+SECTION =3D "bootloaders"
+PROVIDES =3D "virtual/bootloader barebox"
+LICENSE =3D "GPL-2.0"
+LIC=5FFILES=5FCHKSUM =3D "file://COPYING;md5=3D057bf9e50e1ca857d0eb97bfe4b=
a8e5d"
+SRC=5FURI =3D "http://barebox.org/download/barebox-${PV}.tar.bz2"
+
+inherit kernel-arch cml1 deploy
+DEPENDS +=3D "kern-tools-native"
+PACKAGE=5FARCH =3D "${MACHINE=5FARCH}"
+# verbose build 0/1
+VERBOSE=5FBUILD ?=3D "0"
+EXTRA=5FOEMAKE =3D 'V=3D${VERBOSE=5FBUILD} CROSS=5FCOMPILE=3D${TARGET=5FPR=
EFIX} CC=3D"${TARGET=5FPREFIX}gcc ${TOOLCHAIN=5FOPTIONS}"'
+# target rootfs boot directory
+base=5Fbootdir =3D "/boot"
+
+# these variables need to be assigned in the machine.conf=20
+# name of the image created by barebox Makefile
+BAREBOX=5FBIN ?=3D "barebox.bin"
+# filename of file to be deployed by this recipe
+BAREBOX=5FBIN=5FDEPLOY ?=3D "barebox-${MACHINE}-${PV}-${PR}.bin"
+BAREBOX=5FBIN=5FSYMLINK ?=3D "barebox.bin"
+BAREBOX=5FDEFAULT=5FDEFCONFIG ?=3D ""
+# barebox environment
+BAREBOX=5FENV ?=3D "defaultenv/barebox=5Fdefault=5Fenv"
+BAREBOX=5FENV=5FDEPLOY ?=3D "bareboxenv-${MACHINE}-${PV}-${PR}"
+BAREBOX=5FENV=5FSYMLINK ?=3D "barebox.env"
+
+# returns .scc and .cfg filenames from SRC=5FURI
+def find=5Fsccs(d):
+    sources=3Dsrc=5Fpatches(d, True)
+    sources=5Flist=3D[]
+    for s in sources:
+        base, ext =3D os.path.splitext(os.path.basename(s))
+        if ext and ext in [".scc", ".cfg"]:
+            sources=5Flist.append(s)
+    return sources=5Flist
+
+# uses kern-tools-native to merge the config fragments
+python do=5Fprepare=5Fconfigure() {
+    import shutil, subprocess
+    workdir =3D d.getVar('WORKDIR', True)
+    S =3D d.getVar('S', True)
+    defconfig =3D os.path.join(workdir , 'defconfig')
+    if not os.path.isfile(defconfig):
+        bb.note("No defconfig file provided for the barebox recipe")
+        config =3D os.path.join(S, '.config')
+        if not os.path.isfile(config):
+            bb.note("barebox is not configured")
+            bb.build.exec=5Ffunc("do=5Fdefault=5Fdefconfig",d)
+        bb.build.exec=5Ffunc("do=5Fsavedefconfig",d)
+        defconfig =3D os.path.join(workdir , 'defconfig.temp')=20
+    os.chdir(workdir)
+    fragments =3D find=5Fsccs(d)
+    if not fragments:
+        bb.note("no config fragments will be merged")
+    else:
+        bb.note("combining kconfig fragments into .config for barebox")
+        cmd =3D 'merge=5Fconfig.sh -m -O %s %s %s' % (S, defconfig, ' '.jo=
in(map(str,fragments)))
+        subprocess.call(cmd, shell=3DTrue)
+    localversion =3D "-${DISTRO}-${DISTRO=5FVERSION}"
+    bb.note("Setting LOCALVERSION in .config to %s" % localversion)
+    bareboxconfig =3D os.path.join(S, '.config')
+    cmd =3D 'kconfig-tweak --file %s --set-str LOCALVERSION %s' % (barebox=
config, localversion)
+    subprocess.call(cmd,shell=3DTrue)
+}
+do=5Fconfigure[prefuncs] +=3D "do=5Fprepare=5Fconfigure"
+
+do=5Fdefault=5Fdefconfig () {
+	bbnote "generating .config for target ${BAREBOX=5FDEFAULT=5FDEFCONFIG}"
+	unset CFLAGS LDFLAGS
+	oe=5Frunmake ${BAREBOX=5FDEFAULT=5FDEFCONFIG}
+}
+
+do=5Fsavedefconfig() {
+	bbplain "saving defconfig to ${WORKDIR}/defconfig.temp"
+	oe=5Frunmake savedefconfig
+	install -m 644 ${S}/defconfig ${WORKDIR}/defconfig.temp
+}
+addtask savedefconfig after do=5Fconfigure
+
+do=5Fcompile () {
+	unset CFLAGS LDFLAGS
+	oe=5Frunmake all
+}
+
+do=5Finstall () {
+	bbnote "Installing barebox image on target rootfs"
+	install -d ${D}${base=5Fbootdir}
+	install ${S}/${BAREBOX=5FBIN} ${D}${base=5Fbootdir}/${BAREBOX=5FBIN=5FDEP=
LOY}
+	ln -sf ${BAREBOX=5FBIN=5FDEPLOY} ${D}${base=5Fbootdir}/${BAREBOX=5FBIN=5F=
SYMLINK}
+
+	if [ -e ${S}/${BAREBOX=5FENV} ] ; then
+		bbnote "Installing barebox-env on target rootfs"
+		install ${S}/${BAREBOX=5FENV} ${D}${base=5Fbootdir}/${BAREBOX=5FENV=5FDE=
PLOY}
+		ln -sf ${BAREBOX=5FENV=5FDEPLOY} ${D}${base=5Fbootdir}/${BAREBOX=5FENV=
=5FSYMLINK}
+	fi
+
+	if [ -e ${S}/scripts/bareboxenv-target ] ; then
+		bbnote "Installing target env tool"
+		install -d ${D}${base=5Fsbindir}
+		install -m 744 ${S}/scripts/bareboxenv-target ${D}${base=5Fsbindir}/bare=
boxenv
+	fi
+
+	if [ -e ${S}/scripts/bareboxcrc32-target ] ; then
+		bbnote "Installing target crc32 tool"
+		install -d ${D}${base=5Fsbindir}
+		install -m 744 ${S}/scripts/bareboxcrc32-target ${D}${base=5Fsbindir}/ba=
reboxcrc32
+	fi
+
+	if [ -e ${S}/scripts/kernel-install-target ] ; then
+		bbnote "Installing target kernel-install tool"
+		install -d ${D}${base=5Fsbindir}
+		install -m 744 ${S}/scripts/kernel-install-target ${D}${base=5Fsbindir}/=
barebox-kernel-install
+	fi
+}
+FILES=5F${PN} =3D ""
+FILES=5F${PN} +=3D "${base=5Fbootdir}"
+FILES=5F${PN}-dev =3D ""
+RDEPENDS=5F${PN}-dev =3D ""
+FILES=5F${PN}-dev +=3D "${base=5Fsbindir}"
+
+
+do=5Fdeploy () {
+	bbnote "Deploying barebox"
+	install -d ${DEPLOYDIR}
+	install ${S}/${BAREBOX=5FBIN} ${DEPLOYDIR}/${BAREBOX=5FBIN=5FDEPLOY}
+	cd ${DEPLOYDIR}
+	rm -f ${BAREBOX=5FBIN=5FSYMLINK}=20
+	ln -sf ${BAREBOX=5FBIN=5FDEPLOY} ${BAREBOX=5FBIN=5FSYMLINK}
+
+	if [ -e ${S}/${BAREBOX=5FENV} ] ; then
+		bbnote "Deploying barebox env"
+		install ${S}/${BAREBOX=5FENV} ${DEPLOYDIR}/${BAREBOX=5FENV=5FDEPLOY}
+		cd ${DEPLOYDIR}
+		rm -f ${BAERBOX=5FENV=5FSYMLINK}
+		ln -sf ${BAREBOX=5FENV=5FDEPLOY} ${BAREBOX=5FENV=5FSYMLINK}
+	fi
+
+	bbnote "Installing host barebox toolset"
+	install -d ${STAGING=5FBINDIR=5FNATIVE}
+	cd ${S}
+	install -m 755 scripts/bareboxenv ${STAGING=5FBINDIR=5FNATIVE}/
+}
+addtask deploy before do=5Fbuild after do=5Fcompile
diff --git a/meta/recipes-bsp/barebox/barebox=5F2014.07.0.bb b/meta/recipes=
-bsp/barebox/barebox=5F2014.07.0.bb
new file mode 100644
index 0000000..a311ca9
--- /dev/null
+++ b/meta/recipes-bsp/barebox/barebox=5F2014.07.0.bb
@@ -0,0 +1,4 @@
+require barebox.inc
+
+SRC=5FURI[md5sum] =3D "f3a93950777916d4b1c2cd366aec8d91"
+SRC=5FURI[sha256sum] =3D "6dca5c78de8565a15aaa404edbf1bc4663415f0dc69e094f=
3b621636876285f2"
--=20
1.9.1


