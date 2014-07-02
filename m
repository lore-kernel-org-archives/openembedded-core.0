Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A44056ACE9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jul 2014 07:33:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s627Xq2H022291
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jul 2014 00:33:52 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Wed, 2 Jul 2014 00:33:51 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Jul 2014 15:33:49 +0800
Message-ID: <1404286429-13962-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH] initscripts: add usleep support from RHEL
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
X-List-Received-Date: Wed, 02 Jul 2014 07:33:59 -0000
Content-Type: text/plain

Add usleep in to support sleeping some number of microseconds.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 .../initscripts/initscripts-1.0/usleep.1           | 25 +++++++
 .../initscripts/initscripts-1.0/usleep.c           | 82 ++++++++++++++++++++++
 meta/recipes-core/initscripts/initscripts_1.0.bb   | 13 +++-
 3 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/usleep.1
 create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/usleep.c

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/usleep.1 b/meta/recipes-core/initscripts/initscripts-1.0/usleep.1
new file mode 100644
index 0000000..2d7520f
--- /dev/null
+++ b/meta/recipes-core/initscripts/initscripts-1.0/usleep.1
@@ -0,0 +1,25 @@
+.TH USLEEP 1 "Red Hat, Inc" \" -*- nroff -*-
+.SH NAME
+usleep \- sleep some number of microseconds
+.SH SYNOPSIS
+.B usleep
+[\fInumber\fP]
+.SH DESCRIPTION
+.B usleep
+sleeps some number of microseconds.  The default is 1.
+.SH OPTIONS
+\fI--usage\fP
+Show short usage message.
+.TP
+\fI--help, -?\fP
+Print help information.
+.TP
+\fI-v, --version\fP
+Print version information.
+.SH BUGS
+Probably not accurate on many machines down to the microsecond.  Count
+on precision only to -4 or maybe -5.
+.SH AUTHOR
+Donald Barnes <djb@redhat.com>
+.br
+Erik Troan <ewt@redhat.com>
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/usleep.c b/meta/recipes-core/initscripts/initscripts-1.0/usleep.c
new file mode 100644
index 0000000..a5e7d9d
--- /dev/null
+++ b/meta/recipes-core/initscripts/initscripts-1.0/usleep.c
@@ -0,0 +1,82 @@
+/* 
+ * usleep
+ * 
+ * Written by Donald Barnes <djb@redhat.com> for Red Hat, Inc.
+ * 
+ * Copyright (c) 1997-2003 Red Hat, Inc. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License, version 2,
+ * as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software Foundation,
+ * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+ *
+ */
+
+
+#include <unistd.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdio.h>
+
+#include "popt.h"
+
+int main(int argc, char **argv) {
+  unsigned long count;
+  poptContext optCon;
+  int showVersion = 0;
+  int showOot = 0;
+  int rc;
+  char * countStr = NULL;
+  struct poptOption options[] = {
+            { "version", 'v', POPT_ARG_NONE, &showVersion, 0, 
+			"Display the version of this program, and exit" },
+            { "oot", 'o', POPT_ARG_NONE, &showOot, 0, 
+			"oot says hey!" },
+	    POPT_AUTOHELP
+            { 0, 0, 0, 0, 0 }
+        };
+
+  optCon = poptGetContext("usleep", argc, argv, options,0);
+  /*poptReadDefaultConfig(optCon, 1);*/
+  poptSetOtherOptionHelp(optCon, "[microseconds]");
+
+  if ((rc = poptGetNextOpt(optCon)) < -1) {
+	fprintf(stderr, "usleep: bad argument %s: %s\n", 
+		poptBadOption(optCon, POPT_BADOPTION_NOALIAS), 
+		poptStrerror(rc));
+	return 2;
+  }
+
+  if (showVersion) {
+      printf("usleep version 1.2\n	usleep --help for more info\n");
+      return 0;
+  }
+
+  if (showOot) {
+      printf("oot says hey!\n");
+      return 0;
+  }
+
+  countStr = poptGetArg(optCon);
+
+  if (countStr == NULL) count = 1;
+
+  else if (countStr && poptGetArg(optCon)) {
+      fprintf(stderr, "%s: exactly one argument (number of microseconds) "
+      		"must be used\n", argv[0]);
+      return 2;
+  }
+
+  else count = strtoul(countStr, NULL, 0); 
+
+  usleep(count);
+  return 0;
+} 
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 7273a82..456aed4 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PR = "r155"
 
-INHIBIT_DEFAULT_DEPS = "1"
+S = "${WORKDIR}"
 
 SRC_URI = "file://functions \
            file://halt \
@@ -33,6 +33,8 @@ SRC_URI = "file://functions \
            file://GPLv2.patch \
            file://dmesg.sh \
            file://logrotate-dmesg.conf \
+           file://usleep.c \
+           file://usleep.1 \
 "
 
 SRC_URI_append_arm = " file://alignment.sh"
@@ -42,6 +44,7 @@ KERNEL_VERSION = ""
 inherit update-alternatives
 DEPENDS_append = " update-rc.d-native"
 DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
+DEPENDS_append = " popt"
 
 PACKAGES =+ "${PN}-functions"
 RDEPENDS_${PN} = "${PN}-functions"
@@ -58,6 +61,10 @@ do_configure() {
 	sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${WORKDIR}/reboot
 }
 
+do_compile() {
+	${CC} ${CFLAGS} ${LDFLAGS} usleep.c -o usleep -lpopt
+}
+
 do_install () {
 #
 # Create directories and install device independent scripts
@@ -75,6 +82,8 @@ do_install () {
 	install -d ${D}${sysconfdir}/default/volatiles
 	# Holds state information pertaining to urandom
 	install -d ${D}/var/lib/urandom
+	install -d ${D}${base_bindir}
+	install -d ${D}${mandir}/man1
 
 	install -m 0644    ${WORKDIR}/functions		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/bootmisc.sh	${D}${sysconfdir}/init.d
@@ -98,6 +107,8 @@ do_install () {
 	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
+	install -m 0755    ${WORKDIR}/usleep            ${D}${base_bindir}
+	install -m 0644    ${WORKDIR}/usleep.1          ${D}${mandir}/man1
 
 	if [ "${TARGET_ARCH}" = "arm" ]; then
 		install -m 0755 ${WORKDIR}/alignment.sh	${D}${sysconfdir}/init.d
-- 
1.8.4.1


