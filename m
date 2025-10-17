Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5E4CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 09:34:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11609.1760693679698086354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 02:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36E781595
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 02:34:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B80973F66E
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 02:34:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] build-appliance-image: install bitbake+oe-core+meta-yocto, not poky
Date: Fri, 17 Oct 2025 10:34:30 +0100
Message-ID: <20251017093430.4120018-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 09:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225004

Change the build-appliance image to include current git trees of the
separate bitbake/openembedded-core/meta-yocto repositories, instead of
the merged poky repository as that is being discontinued.

[ YOCTO #16002 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../images/build-appliance-image_15.0.0.bb    | 34 ++++++++++++-------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/m=
eta/recipes-core/images/build-appliance-image_15.0.0.bb
index 7f68d3396ca..74883870b70 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -26,8 +26,14 @@ inherit core-image setuptools3 features_check
=20
 REQUIRED_DISTRO_FEATURES +=3D "xattr"
=20
-SRCREV ?=3D "cb478c6228f0654ded5ac19a8a8d2f8ba9a717af"
-SRC_URI =3D "git://git.yoctoproject.org/poky;branch=3Dmaster;destsuffix=3D=
poky \
+SRCREV_bitbake ?=3D "8b582ef8dd0cef0192d4c0104bcd9b5d642d132c"
+SRCREV_oe-core ?=3D "5298d01663f897e38380116edf23973d2a156cbc"
+SRCREV_yocto ?=3D "fe65e142d0d9ba0e51ff9175ffa82e902f982a20"
+SRCREV_FORMAT =3D "bitbake_oe-core_yocto"
+
+SRC_URI =3D "git://git.openembedded.org/bitbake;name=3Dbitbake;branch=3D=
master;destsuffix=3Dbitbake \
+           git://git.openembedded.org/openembedded-core;name=3Doe-core;b=
ranch=3Dmaster;destsuffix=3Dopenembedded-core \
+           git://git.yoctoproject.org/meta-yocto;name=3Dyocto;branch=3Dm=
aster;destsuffix=3Dmeta-yocto \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
            file://README_VirtualBox_Guest_Additions.txt \
@@ -44,17 +50,20 @@ IMAGE_CMD:ext4:append () {
 fakeroot do_populate_poky_src () {
 	# Because fetch2's git's unpack uses -s cloneflag, the unpacked git rep=
o
 	# will become invalid in the target.
-	rm -rf ${UNPACKDIR}/poky/.git
-	rm -f ${UNPACKDIR}/poky/.gitignore
+	for d in bitbake openembedded-core meta-yocto; do
+		rm -rf ${UNPACKDIR}/$d/.git
+		rm -f ${UNPACKDIR}/$d/.gitignore
+		cp -R ${UNPACKDIR}/$d ${IMAGE_ROOTFS}/home/builder/
+	done
=20
-	cp -R ${UNPACKDIR}/poky ${IMAGE_ROOTFS}/home/builder/poky
+	mkdir -p ${IMAGE_ROOTFS}/home/builder/openembedded-core/build/conf
+	echo "INHERIT +=3D \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/openemb=
edded-core/build/conf/auto.conf
=20
-	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/conf
-	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/downloads
 	if [ ${BA_INCLUDE_SOURCES} !=3D 0 ]; then
-		cp -RpL ${DL_DIR}/* ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/
+		mkdir -p ${IMAGE_ROOTFS}/home/builder/openembedded-core/build/download=
s
+		cp -RpL ${DL_DIR}/* ${IMAGE_ROOTFS}/home/builder/openembedded-core/bui=
ld/downloads/
 		# Remove the git2_* tarballs -- this is ok since we still have the git=
2/.
-		rm -rf ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/git2_*
+		rm -rf ${IMAGE_ROOTFS}/home/builder/openembedded-core/build/downloads/=
git2_*
 	fi
=20
 	# Place the README_VirtualBox_Guest_Additions file in builders home fol=
der.
@@ -63,7 +72,6 @@ fakeroot do_populate_poky_src () {
 	# Place the README_VirtualBox_Toaster file in builders home folder.
 	cp ${UNPACKDIR}/README_VirtualBox_Toaster.txt ${IMAGE_ROOTFS}/home/buil=
der/
=20
-	echo "INHERIT +=3D \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/bu=
ild/conf/auto.conf
 	echo "export LC_ALL=3Den_US.utf8" >> ${IMAGE_ROOTFS}/home/builder/.bash=
rc
 	echo "export TERM=3Dxterm-color" >> ${IMAGE_ROOTFS}/home/builder/.bashr=
c
=20
@@ -79,8 +87,8 @@ fakeroot do_populate_poky_src () {
 	echo "# export ALL_PROXY=3Dhttps://proxy.example.com:8080" >> ${IMAGE_R=
OOTFS}/home/builder/.bashrc
 	echo "# export ALL_PROXY=3Dsocks://socks.example.com:1080" >> ${IMAGE_R=
OOTFS}/home/builder/.bashrc
=20
-	chown -R builder:builder ${IMAGE_ROOTFS}/home/builder/poky
-	chmod -R ug+rw ${IMAGE_ROOTFS}/home/builder/poky
+	chown -R builder:builder ${IMAGE_ROOTFS}/home/builder/
+	chmod -R ug+rw ${IMAGE_ROOTFS}/home/builder/
=20
 	# Assume we will need CDROM to install guest additions
 	mkdir -p ${IMAGE_ROOTFS}/media/cdrom
@@ -102,7 +110,7 @@ fakeroot do_populate_poky_src () {
 	export STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE}
 	export HOME=3D${IMAGE_ROOTFS}/home/builder
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/.cache/pip
-	pip3_install_params=3D"--user -I -U -v -r ${IMAGE_ROOTFS}/home/builder/=
poky/bitbake/toaster-requirements.txt"
+	pip3_install_params=3D"--user -I -U -v -r ${IMAGE_ROOTFS}/home/builder/=
bitbake/toaster-requirements.txt"
 	if [ -n "${http_proxy}" ]; then
 	   pip3_install_params=3D"${pip3_install_params} --proxy ${http_proxy}"
 	fi
--=20
2.43.0


