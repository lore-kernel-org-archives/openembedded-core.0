Return-Path: <john.ogness@linutronix.de>
X-Greylist: delayed 2662 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Nov 2016 17:24:25 UTC
Received: from Galois.linutronix.de (Galois.linutronix.de [146.0.238.70])
	by mail.openembedded.org (Postfix) with ESMTP id CA15C6E5FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 17:24:25 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=vostro.local)
	by Galois.linutronix.de with esmtp (Exim 4.80)
	(envelope-from <john.ogness@linutronix.de>) id 1cC7sW-0007hi-1j
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2016 17:37:04 +0100
From: John Ogness <john.ogness@linutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2016 17:39:58 +0100
Message-ID: <87oa0wly5d.fsf@linutronix.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.4 (gnu/linux)
MIME-Version: 1.0
Subject: [PATCH] add minicoredumper tool/libs
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
X-List-Received-Date: Wed, 30 Nov 2016 17:24:27 -0000
Content-Type: text/plain; charset=us-ascii

The minicoredumper project provides tools and libraries for extending
the Linux core dump facility in order to produce very small and highlx
customizable core dumps. This is particularly interesting for embedded
projects.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 .../minicoredumper/remove-script-deps.patch        | 22 +++++++
 .../minicoredumper/minicoredumper_2.0.0.bb         | 73 ++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-extended/minicoredumper/minicoredumper/remove-script-deps.patch
 create mode 100644 meta/recipes-extended/minicoredumper/minicoredumper_2.0.0.bb

diff --git a/meta/recipes-extended/minicoredumper/minicoredumper/remove-script-deps.patch b/meta/recipes-extended/minicoredumper/minicoredumper/remove-script-deps.patch
new file mode 100644
index 0000000..bcb64af
--- /dev/null
+++ b/meta/recipes-extended/minicoredumper/minicoredumper/remove-script-deps.patch
@@ -0,0 +1,22 @@
+--- a/etc/init.d/minicoredumper.in	2016-11-22 10:44:28.060000000 +0000
++++ b/etc/init.d/minicoredumper.in	2016-11-22 10:49:24.656000000 +0000
+@@ -33,13 +33,13 @@
+ # Read configuration variable file if it is present
+ [ -r @initdefaultsdir@/$NAME ] && . @initdefaultsdir@/$NAME
+ 
+-# Load the VERBOSE setting and other rcS variables
+-. /lib/init/vars.sh
++log_daemon_msg() {
++	echo "$@"
++}
+ 
+-# Define LSB log_* functions.
+-# Depend on lsb-base (>= 3.2-14) to ensure that this file is present
+-# and status_of_proc is working.
+-. /lib/lsb/init-functions
++log_end_msg() {
++	[ $1 -eq 0 ] || echo "$NAME: failed"
++}
+ 
+ #
+ # Function that starts the daemon/service
diff --git a/meta/recipes-extended/minicoredumper/minicoredumper_2.0.0.bb b/meta/recipes-extended/minicoredumper/minicoredumper_2.0.0.bb
new file mode 100644
index 0000000..7f7d5e2
--- /dev/null
+++ b/meta/recipes-extended/minicoredumper/minicoredumper_2.0.0.bb
@@ -0,0 +1,73 @@
+SUMMARY = "generate minimal and customized core dump files on Linux"
+DESCRIPTION = "minicoredumper is a program that handles the creation of core dump files on \
+Linux. It can produce much smaller core dump files by making use of sparse \
+files, compression, and allowing the user to configure what parts of the \
+process memory image should be dumped."
+HOMEPAGE = "https://www.linutronix.de/minicoredumper"
+BUGTRACKER = "https://bugs.linuxfoundation.org/buglist.cgi?product=Diamon&component=minicoredumper"
+
+SECTION = "devel"
+
+LICENSE = "BSD-2-Clause & LGPL-2.1"
+LICENSE_minicoredumper = "BSD-2-Clause"
+LICENSE_minicoredumper-utils = "BSD-2-Clause"
+LICENSE_libminicoredumper-dev = "LGPL-2.1"
+LICENSE_libminicoredumper = "LGPL-2.1"
+
+LIC_FILES_CHKSUM = " \
+	file://COPYING;md5=709087c2ed0acda54a4d91497a889e42 \
+	file://COPYING.BSD;md5=b915ac80d5236d6aa659cb986daf00e5 \
+	file://COPYING.LGPLv2.1;md5=321bf41f280cf805086dd5a720b37785 \
+	"
+
+DEPENDS = "elfutils json-c pkgconfig"
+RDEPENDS_${PN} = "base-files"
+
+SRC_URI = " \
+	https://linutronix.de/minicoredumper/files/minicoredumper-${PV}.tar.xz \
+	file://remove-script-deps.patch \
+	"
+
+SRC_URI[md5sum] = "543001b51de20a8b17fce462a7dfa377"
+SRC_URI[sha256sum] = "6b5355f94b8ba676515b4243752f231ace200dbb9195065bc2fdd397ae20d8c5"
+
+PACKAGECONFIG ??= ""
+
+EXTRA_OECONF = ""
+
+PACKAGES += "minicoredumper-utils libminicoredumper-dev libminicoredumper"
+
+FILES_${PN} = " \
+	${sbindir}/minicoredumper \
+	${sbindir}/minicoredumper_regd \
+	${sysconfdir}/minicoredumper \
+	${sysconfdir}/init.d \
+	${sysconfdir}/default \
+	${localstatedir}/crash \
+	${localstatedir}/run \
+	/run \
+	"
+FILES_minicoredumper-utils = " \
+	${bindir}/coreinject \
+	${sbindir}/minicoredumper_trigger \
+	"
+FILES_libminicoredumper-dev = " \
+	${includedir}/* \
+	${libdir}/lib*.a \
+	${libdir}/lib*.la \
+	${libdir}/lib*.so \
+	${libdir}/pkgconfig/* \
+	"
+FILES_${PN}-dbg = " \
+	${libdir}/.debug \
+	${bindir}/.debug \
+	${sbindir}/.debug \
+	${prefix}/src/debug \
+	"
+FILES_libminicoredumper = "${libdir}/lib*.so.*"
+FILES_libminicoredumper-doc = "${mandir}/*/*"
+
+INITSCRIPT_NAME = "minicoredumper"
+INITSCRIPT_PARAMS = "defaults 8"
+
+inherit autotools update-rc.d
-- 
2.1.4

