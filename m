Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1USUhw-0002nY-6Z
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 17:55:42 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3HFSxmD027018 for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 16:28:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HH6Mzuc0nYDq
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 16:28:59 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3HFSrVC027008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 16:28:55 +0100
Message-ID: <1366212500.25282.47.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2013 16:28:20 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] pcmciautils: Use pkgconfig to set udev variables correctly
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
X-List-Received-Date: Wed, 17 Apr 2013 15:55:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index 0651236..0ef939e 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -5,7 +5,7 @@ SECTION = "kernel/userland"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "sysfsutils flex-native"
+DEPENDS = "udev sysfsutils flex-native"
 RDEPENDS_${PN} = "udev module-init-tools"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/pcmcia/pcmciautils-${PV}.tar.bz2"
@@ -16,8 +16,8 @@ export HOSTCC = "${BUILD_CC}"
 export etcdir = "${sysconfdir}"
 export sbindir = "${base_sbindir}"
 export pcmciaconfdir = "${sysconfdir}/pcmcia"
-export udevdir = "${base_libdir}/udev"
-export udevrulesdir = "${nonarch_base_libdir}/udev/rules.d"
+export udevdir = "`pkg-config --variable=udevdir udev`"
+export udevrulesdir = "`pkg-config --variable=udevdir udev`/rules.d"
 export UDEV = "1"
 LD = "${CC}"
 CFLAGS =+ "-I${S}/src"
diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
index 41fd799..50629b4 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
@@ -7,5 +7,5 @@ SRC_URI[sha256sum] = "79e6ae441278e178c07501d492394ed2c0326fdb66894f6d040ec811b0
 
 PR = "r1"
 
-FILES_${PN}-dbg += "${base_libdir}/udev/.debug"
-FILES_${PN} += "${base_libdir}/udev ${nonarch_base_libdir}/udev"
+FILES_${PN}-dbg += "*/udev/.debug"
+FILES_${PN} += "*/udev"




