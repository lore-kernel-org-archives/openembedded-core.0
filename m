Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3B61B771C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 11:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u56BCeNt007045 for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2016 12:12:40 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Z2KDPYFMNOdU
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 12:12:40 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u56BCdeL007042
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2016 12:12:40 +0100
Message-ID: <1465211558.13979.63.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 06 Jun 2016 12:12:38 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] meta: Drop swabber
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
X-List-Received-Date: Mon, 06 Jun 2016 11:12:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

swabber hasn't been used in years and never did work well in the first
place. Remove its recipes, class and configuration.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image-swab.bbclass b/meta/classes/image-swab.bbclass
deleted file mode 100644
index 6b02cad..0000000
--- a/meta/classes/image-swab.bbclass
+++ /dev/null
@@ -1,94 +0,0 @@
-HOST_DATA ?= "${TMPDIR}/host-contamination-data/"
-SWABBER_REPORT ?= "${LOG_DIR}/swabber/"
-SWABBER_LOGS ?= "${LOG_DIR}/contamination-logs"
-TRACE_LOGDIR ?= "${SWABBER_LOGS}/${PACKAGE_ARCH}"
-TRACE_LOGFILE = "${TRACE_LOGDIR}/${PN}-${PV}"
-
-SWAB_ORIG_TASK := "${BB_DEFAULT_TASK}"
-BB_DEFAULT_TASK = "generate_swabber_report"
-
-# Several recipes don't build with parallel make when run under strace
-# Ideally these should be fixed but as a temporary measure disable parallel
-# builds for troublesome recipes
-PARALLEL_MAKE_pn-openssl = ""
-PARALLEL_MAKE_pn-glibc = ""
-PARALLEL_MAKE_pn-glib-2.0 = ""
-PARALLEL_MAKE_pn-libxml2 = ""
-PARALLEL_MAKE_pn-readline = ""
-PARALLEL_MAKE_pn-util-linux = ""
-PARALLEL_MAKE_pn-binutils = ""
-PARALLEL_MAKE_pn-bison = ""
-PARALLEL_MAKE_pn-cmake = ""
-PARALLEL_MAKE_pn-elfutils = ""
-PARALLEL_MAKE_pn-gcc = ""
-PARALLEL_MAKE_pn-gcc-runtime = ""
-PARALLEL_MAKE_pn-m4 = ""
-PARALLEL_MAKE_pn-opkg = ""
-PARALLEL_MAKE_pn-pkgconfig = ""
-PARALLEL_MAKE_pn-prelink = ""
-PARALLEL_MAKE_pn-rpm = ""
-PARALLEL_MAKE_pn-tcl = ""
-PARALLEL_MAKE_pn-beecrypt = ""
-PARALLEL_MAKE_pn-curl = ""
-PARALLEL_MAKE_pn-gmp = ""
-PARALLEL_MAKE_pn-libmpc = ""
-PARALLEL_MAKE_pn-libxslt = ""
-PARALLEL_MAKE_pn-lzo = ""
-PARALLEL_MAKE_pn-popt = ""
-PARALLEL_MAKE_pn-linux-wrs = ""
-PARALLEL_MAKE_pn-libgcrypt = ""
-PARALLEL_MAKE_pn-gpgme = ""
-PARALLEL_MAKE_pn-udev = ""
-PARALLEL_MAKE_pn-gnutls = ""
-
-python() {
-    # NOTE: It might be useful to detect host infection on native and cross
-    # packages but as it turns out to be pretty hard to do this for all native
-    # and cross packages which aren't swabber-native or one of its dependencies
-    # I have ignored them for now...
-    if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('nativesdk', d) and not bb.data.inherits_class('cross', d):
-        deps = (d.getVarFlag('do_setscene', 'depends', True) or "").split()
-        deps.append('strace-native:do_populate_sysroot')
-        d.setVarFlag('do_setscene', 'depends', " ".join(deps))
-        logdir = d.expand("${TRACE_LOGDIR}")
-        bb.utils.mkdirhier(logdir)
-    else:
-        d.setVar('STRACEFUNC', '')
-}
-
-STRACEPID = "${@os.getpid()}"
-STRACEFUNC = "imageswab_attachstrace"
-
-do_configure[prefuncs] += "${STRACEFUNC}"
-do_compile[prefuncs] += "${STRACEFUNC}"
-
-imageswab_attachstrace () {
-	STRACE=`which strace`
-
-	if [ -x "$STRACE" ]; then
-		swabber-strace-attach "$STRACE -f -o ${TRACE_LOGFILE}-${BB_CURRENTTASK}.log -e trace=open,execve -p ${STRACEPID}" "${TRACE_LOGFILE}-traceattach-${BB_CURRENTTASK}.log"
-	fi
-}
-
-do_generate_swabber_report () {
-
-	update_distro ${HOST_DATA}
-
-	# Swabber can't create the directory for us
-	mkdir -p ${SWABBER_REPORT}
-
-	REPORTSTAMP=${SWAB_ORIG_TASK}-`date +%2m%2d%2H%2M%Y`
-
-	if [ `which ccache` ] ; then
-		CCACHE_DIR=`( ccache -s | grep "cache directory" | grep -o '[^ ]*$' 2> /dev/null )`
- 	fi
-
-	if [ "$(ls -A ${HOST_DATA})" ]; then
-		echo "Generating swabber report"
-		swabber -d ${HOST_DATA} -l ${SWABBER_LOGS} -o ${SWABBER_REPORT}/report-${REPORTSTAMP}.txt -r ${SWABBER_REPORT}/extra_report-${REPORTSTAMP}.txt -c all -p ${TOPDIR} -f ${OEROOT}/meta/conf/swabber ${TOPDIR} ${OEROOT} ${CCACHE_DIR}
-	else
-		echo "No host data, cannot generate swabber report."
-	fi
-}
-addtask generate_swabber_report after do_${SWAB_ORIG_TASK}
-do_generate_swabber_report[depends] = "swabber-native:do_populate_sysroot"
diff --git a/meta/conf/swabber/Ubuntu-10.04.1-64/blacklist b/meta/conf/swabber/Ubuntu-10.04.1-64/blacklist
deleted file mode 100644
index 5fdb8f2..0000000
--- a/meta/conf/swabber/Ubuntu-10.04.1-64/blacklist
+++ /dev/null
@@ -1,6 +0,0 @@
-libneon27-gnutls
-openjdk-6-jre-headless
-openjdk-6-jre-lib
-openjdk-6-jre
-libdbus-1-3
-libneon27-gnutls
diff --git a/meta/conf/swabber/Ubuntu-10.04.1-64/filters b/meta/conf/swabber/Ubuntu-10.04.1-64/filters
deleted file mode 100644
index a447f70..0000000
--- a/meta/conf/swabber/Ubuntu-10.04.1-64/filters
+++ /dev/null
@@ -1,7 +0,0 @@
-/usr/local/lib/python2.6
-/usr/lib/python2.6
-/usr/lib/pymodules/python2.6
-/usr/lib/perl/5.10
-# which is part of the debianutils packages, but we don't want to put the entire
-# debianutils package in the whitelist.
-/usr/bin/which
diff --git a/meta/conf/swabber/Ubuntu-10.04.1-64/whitelist b/meta/conf/swabber/Ubuntu-10.04.1-64/whitelist
deleted file mode 100644
index f0fe963..0000000
--- a/meta/conf/swabber/Ubuntu-10.04.1-64/whitelist
+++ /dev/null
@@ -1,23 +0,0 @@
-base-files
-dash
-libacl1
-libattr1
-libbz2-1.0
-libc6
-libc-bin
-libglib2.0-0
-libncurses5
-libselinux1
-libsqlite3-0
-libssl0.9.8
-mime-support
-perl-base
-python2.6
-python2.6-minimal
-python-apport
-python-gst0.10
-python-imaging
-python-minimal
-python-support
-python-zope.interface
-zlib1g
diff --git a/meta/conf/swabber/generic/blacklist b/meta/conf/swabber/generic/blacklist
deleted file mode 100644
index 396bcb4..0000000
--- a/meta/conf/swabber/generic/blacklist
+++ /dev/null
@@ -1,2 +0,0 @@
-udev
-dkpg
diff --git a/meta/conf/swabber/generic/filters b/meta/conf/swabber/generic/filters
deleted file mode 100644
index 3b10fcb..0000000
--- a/meta/conf/swabber/generic/filters
+++ /dev/null
@@ -1,10 +0,0 @@
-/tmp
-/etc/localtime
-/etc/ld.so.cache
-/etc/ld.so.conf
-/etc/passwd
-/etc/group
-/etc/nsswitch.conf
-/proc
-/dev/null
-/dev/tty
diff --git a/meta/conf/swabber/generic/whitelist b/meta/conf/swabber/generic/whitelist
deleted file mode 100644
index 48ec2af..0000000
--- a/meta/conf/swabber/generic/whitelist
+++ /dev/null
@@ -1,15 +0,0 @@
-bash
-bzip2
-ccache
-coreutils
-cpp
-file
-findutils
-gawk
-grep
-hostname
-make
-sed
-tar
-util-linux
-zlib1g
diff --git a/meta/recipes-devtools/swabber/swabber-native_git.bb b/meta/recipes-devtools/swabber/swabber-native_git.bb
deleted file mode 100644
index 2f313bb..0000000
--- a/meta/recipes-devtools/swabber/swabber-native_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Tool to monitor and report on host system file usage"
-HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/swabber"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
-
-SRCREV = "2d1fe36fb0a4fdaae8823a9818a6785182d75e66"
-PV = "0.0+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-SRC_URI = "git://git.yoctoproject.org/swabber"
-
-inherit native
-
-do_configure () {
-	:
-}
-
-do_install() {
-  oe_runmake 'DESTDIR=${D}' install
-}
diff --git a/scripts/swabber-strace-attach b/scripts/swabber-strace-attach
deleted file mode 100755
index e8f3258..0000000
--- a/scripts/swabber-strace-attach
+++ /dev/null
@@ -1,31 +0,0 @@
-#!/usr/bin/env python3
-import os
-import sys
-import subprocess
-
-# Detach from the controlling terminal and parent process by forking twice to daemonize ourselves,
-# then run the command passed as argv[1]. Send log data to argv[2].
-
-pid = os.fork()
-if (pid == 0):
-    os.setsid()
-    pid = os.fork()
-    if (pid != 0):
-        os._exit(0)
-else:
-    sys.exit()
-
-
-si = open(os.devnull, 'r')
-so = open(sys.argv[2], 'w')
-se = so
-
-# Replace those fds with our own
-os.dup2(si.fileno(), sys.stdin.fileno())
-os.dup2(so.fileno(), sys.stdout.fileno())
-os.dup2(se.fileno(), sys.stderr.fileno())
-
-ret = subprocess.call(sys.argv[1], shell=True)
-
-os._exit(ret)
-


