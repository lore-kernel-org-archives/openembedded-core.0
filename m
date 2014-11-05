Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EACDE713A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 18:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA5Ik5kG028433 for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 18:46:05 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id R9dik-VoFg1K
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 18:46:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA5Ik1d4028430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 18:46:02 GMT
Message-ID: <1415213195.23396.60.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 05 Nov 2014 18:46:35 +0000
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] base: Improve makefile clean handling, introduce CLEANBROKEN variable
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
X-List-Received-Date: Wed, 05 Nov 2014 18:46:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It turns out we have quite a number of Makefiles out there without a
clean target. Rather than have all cases code an empty do_configure, add
a CLEANBROKEN variable which when set to "1" will disable the attempt to
"make clean".

This patch also adjusts various recipes which either have this problem
fixed, or have been reported to have make clean failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 52b835e..9989438 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -231,6 +231,7 @@ gdkpixbuf_complete() {
 }
 
 CONFIGURESTAMPFILE = "${WORKDIR}/configure.sstate"
+CLEANBROKEN = "0"
 
 addtask configure after do_patch
 do_configure[dirs] = "${S} ${B}"
@@ -239,7 +240,7 @@ base_do_configure() {
 	if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
 		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" ]; then
 			cd ${B}
-			if [ -e Makefile -o -e makefile -o -e GNUmakefile ]; then
+			if [ "${CLEANBROKEN}" != "1" -a -e Makefile -o -e makefile -o -e GNUmakefile ]; then
 				${MAKE} clean
 			fi
 			find ${B} -name \*.la -delete
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
index 21d24f0..f5fce6f 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
@@ -17,10 +17,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/gnu-config/gnu-config-${PV
 SRC_URI[md5sum] = "bcfca5a2bb39edad4aae5a65efc84094"
 SRC_URI[sha256sum] = "44f99a8e76f3e8e4fec0bb5ad4762f8e44366168554ce66cb85afbe2ed3efd8b"
 
-# Disable default since make clean doesn't work
-do_configure () {
-	:
-}
+CLEANBROKEN = "1"
 
 do_compile() {
 	:
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index ef9e323..754a99a 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -17,10 +17,7 @@ SRC_URI = "git://git.sv.gnu.org/config.git \
 
 S = "${WORKDIR}/git"
 
-# Disable default since make clean doesn't work
-do_configure () {
-	:
-}
+CLEANBROKEN = "1"
 
 do_compile() {
 	:
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index fbdc48e..945f69a 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -15,6 +15,8 @@ SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
 
 LEAD_SONAME = "libcupsdriver.so"
 
+CLEANBROKEN = "1"
+
 inherit autotools-brokensep binconfig useradd systemd
 
 USERADD_PACKAGES = "${PN}"
diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index d265731..e012497 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -21,6 +21,8 @@ SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
 SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
 S = "${WORKDIR}/lsb-release-1.4"
 
+CLEANBROKEN = "1"
+
 do_install(){
 	oe_runmake install prefix=${D}  mandir=${D}/${datadir}/man/ DESTDIR=${D}
 
diff --git a/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc b/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc
index 946faac..1d775f8 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev_1.6.inc
@@ -9,3 +9,5 @@ SRC_URI[md5sum] = "eade38998313c25fd7934719cdf8a2ea"
 SRC_URI[sha256sum] = "75f1425c8ea1f8cae523905a5a046a35092327a6152800b0b86efc4e56fb3e2f"
 
 S = "${WORKDIR}/cryptodev-linux-${PV}"
+
+CLEANBROKEN = "1"
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index a107f80..a2f16d1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -34,6 +34,8 @@ S = "${WORKDIR}/git"
 
 inherit allarch update-alternatives
 
+CLEANBROKEN = "1"
+
 do_compile() {
 	:
 }
diff --git a/meta/recipes-multimedia/flac/flac_1.3.0.bb b/meta/recipes-multimedia/flac/flac_1.3.0.bb
index fdf38e9..cf786a4 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.0.bb
@@ -21,6 +21,8 @@ SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
 SRC_URI[md5sum] = "13b5c214cee8373464d3d65dee362cdd"
 SRC_URI[sha256sum] = "fa2d64aac1f77e31dfbb270aeb08f5b32e27036a52ad15e69a77e309528010dc"
 
+CLEANBROKEN = "1"
+
 inherit autotools-brokensep gettext
 
 EXTRA_OECONF = "--disable-oggtest \



