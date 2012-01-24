Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rpk0f-0006rT-Bc for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 18:18:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0OHASJt030180;
	Tue, 24 Jan 2012 17:10:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28935-08; Tue, 24 Jan 2012 17:10:23 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0OHALCk030174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Jan 2012 17:10:22 GMT
Message-ID: <1327425023.19643.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jan 2012 17:10:23 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Garman, Scott A" <scott.a.garman@intel.com>
Subject: [PATCH] shadow: Split securetty into a separate recipe
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
X-List-Received-Date: Tue, 24 Jan 2012 17:18:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The securetty file is machine specific whilst the rest of the shadow recipe
is not. Unfortunately making the recipce machine specific is both inefficient
and also causes dependency problems since parts of the system such as the useradd
code depend upon it and this introduces a machine specific element to sstate
checksums which should not be machine specific.

To resolve this, this patch separates out the file into a separate recipe
meaning the machine specific components are isolated.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
new file mode 100644
index 0000000..e391d24
--- a/dev/null
+++ b/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Provider of the machine specific securetty file"
+DESCRIPTION = "Provider of the machine specific securetty file"
+SECTION = "base utils"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "file://securetty"
+
+# Since we deduce our arch from ${SERIAL_CONSOLE}
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_install () {
+	# Ensure we add a suitable securetty file to the package that has
+	# most common embedded TTYs defined.
+	if [ ! -z "${SERIAL_CONSOLE}" ]; then
+		# Our SERIAL_CONSOLE contains a baud rate and sometimes a -L
+		# option as well. The following pearl :) takes that and converts
+		# it into newline-separated tty's and appends them into
+		# securetty. So if a machine has a weird looking console device
+		# node (e.g. ttyAMA0) that securetty does not know, it will get
+		# appended to securetty and root logins will be allowed on that
+		# console.
+		echo "${SERIAL_CONSOLE}" | sed -e 's/[0-9][0-9]\|\-L//g'|tr "[ ]" "[\n]"  >> ${WORKDIR}/securetty
+	fi
+	install -d ${D}${sysconfdir}
+	install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty 
+}
diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index dddac2c..a69eb7c 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -8,13 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
                     file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
-PR = "r6"
+RDEPENDS_${PN} = "shadow-securetty ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
+PR = "r7"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://login_defs_pam.sed \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
-           file://securetty \
            file://shadow.automake-1.11.patch \
            file://shadow-4.1.3-dots-in-usernames.patch \
            file://shadow-4.1.4.2-env-reset-keep-locale.patch \
@@ -27,9 +26,6 @@ SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9
 
 inherit autotools gettext
 
-# Since we deduce our arch from ${SERIAL_CONSOLE}
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 EXTRA_OECONF += "--without-audit \
                  --without-libcrack \
                  ${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam', '--without-libpam', d)} \
@@ -101,20 +97,6 @@ do_install_append() {
 	# lead rpm failed dependencies.
 	ln -sf vipw.${PN} ${D}${base_sbindir}/vigr.${PN}
 	ln -sf newgrp.${PN} ${D}${bindir}/sg
-
-	# Ensure we add a suitable securetty file to the package that has
-	# most common embedded TTYs defined.
-	if [ ! -z "${SERIAL_CONSOLE}" ]; then
-		# Our SERIAL_CONSOLE contains a baud rate and sometimes a -L
-		# option as well. The following pearl :) takes that and converts
-		# it into newline-separated tty's and appends them into
-		# securetty. So if a machine has a weird looking console device
-		# node (e.g. ttyAMA0) that securetty does not know, it will get
-		# appended to securetty and root logins will be allowed on that
-		# console.
-		echo "${SERIAL_CONSOLE}" | sed -e 's/[0-9][0-9]\|\-L//g'|tr "[ ]" "[\n]"  >> ${WORKDIR}/securetty
-	fi
-	install -m 0400 ${WORKDIR}/securetty ${D}${sysconfdir}/securetty 
 }
 
 pkg_postinst_${PN} () {




