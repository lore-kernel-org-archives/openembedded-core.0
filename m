Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1UaVMV-0007j9-Dk
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 20:14:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r49HuXaq007253
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 May 2013 10:56:34 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 9 May 2013 10:56:33 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 May 2013 10:56:33 -0700
Message-ID: <1368122193-4893-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] sysvinit: add /sbin/service utility
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
X-List-Received-Date: Thu, 09 May 2013 18:14:54 -0000
Content-Type: text/plain

Provide a handy utility which is found on Red Hat/Fedora
systems.
---
 .../sysvinit_2.88dsf-add-service-script.patch      |  266 ++++++++++++++++++++
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   12 +-
 2 files changed, 277 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit-2.88dsf/sysvinit_2.88dsf-add-service-script.patch

diff --git a/meta/recipes-core/sysvinit/sysvinit-2.88dsf/sysvinit_2.88dsf-add-service-script.patch b/meta/recipes-core/sysvinit/sysvinit-2.88dsf/sysvinit_2.88dsf-add-service-script.patch
new file mode 100644
index 0000000..69f1225
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit-2.88dsf/sysvinit_2.88dsf-add-service-script.patch
@@ -0,0 +1,266 @@
+From a8c4484603f184e1180752fce8690a205198d7bf Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Thu, 28 Jun 2012 15:49:54 +0800
+Subject: [PATCH] sysvinit_2.88dsf-add-service-script
+
+This patch is part of the sysvinit_2.88dsf-13.10ubuntu11.diff
+which is the patch for ubuntu12.04
+
+---
+ debian/service/service   |  140 ++++++++++++++++++++++++++++++++++++++++++++++
+ debian/service/service.8 |   96 +++++++++++++++++++++++++++++++
+ 2 files changed, 236 insertions(+), 0 deletions(-)
+ create mode 100644 debian/service/service
+ create mode 100644 debian/service/service.8
+
+diff --git a/debian/service/service b/debian/service/service
+new file mode 100644
+index 0000000..3d1dffe
+--- /dev/null
++++ b/debian/service/service
+@@ -0,0 +1,140 @@
++#!/bin/sh
++
++###########################################################################
++#
++# A convenient wrapper for the /etc/init.d init scripts.
++#
++# This script is a modified version of the /sbin/service utility found on
++# Red Hat/Fedora systems (licensed GPLv2+).
++#
++# Copyright (C) 2006 Red Hat, Inc. All rights reserved.
++# Copyright (C) 2008 Canonical Ltd.
++#   * August 2008 - Dustin Kirkland <kirkland@canonical.com>
++#
++# This program is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 2 of the License, or
++# (at your option) any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program; if not, write to the Free Software
++# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
++#
++###########################################################################
++
++
++is_ignored_file() {
++	case "$1" in
++		skeleton | README | *.dpkg-dist | *.dpkg-old | rc | rcS | single | reboot | bootclean.sh)
++			return 0
++		;;
++	esac
++	return 1
++}
++
++VERSION="`basename $0` ver. 0.91-ubuntu1"
++USAGE="Usage: `basename $0` < option > | --status-all | \
++[ service_name [ command | --full-restart ] ]"
++SERVICE=
++ACTION=
++SERVICEDIR="/etc/init.d"
++OPTIONS=
++
++if [ $# -eq 0 ]; then
++   echo "${USAGE}" >&2
++   exit 1
++fi
++
++cd /
++while [ $# -gt 0 ]; do
++  case "${1}" in
++    --help | -h | --h* )
++       echo "${USAGE}" >&2
++       exit 0
++       ;;
++    --version | -V )
++       echo "${VERSION}" >&2
++       exit 0
++       ;;
++    *)
++       if [ -z "${SERVICE}" -a $# -eq 1 -a "${1}" = "--status-all" ]; then
++          cd ${SERVICEDIR}
++          for SERVICE in * ; do
++            case "${SERVICE}" in
++              functions | halt | killall | single| linuxconf| kudzu)
++                  ;;
++              *)
++                if ! is_ignored_file "${SERVICE}" \
++		    && [ -x "${SERVICEDIR}/${SERVICE}" ]; then
++                        if ! grep -qs "\Wstatus)" "$SERVICE"; then
++                          #printf " %s %-60s %s\n" "[?]" "$SERVICE:" "unknown" 1>&2
++                          echo " [ ? ]  $SERVICE" 1>&2
++                          continue
++                        else
++                          out=$(env -i LANG="$LANG" PATH="$PATH" TERM="$TERM" "$SERVICEDIR/$SERVICE" status 2>&1)
++                          if [ "$?" = "0" -a -n "$out" ]; then
++                            #printf " %s %-60s %s\n" "[+]" "$SERVICE:" "running"
++                            echo " [ + ]  $SERVICE"
++                            continue
++                          else
++                            #printf " %s %-60s %s\n" "[-]" "$SERVICE:" "NOT running"
++                            echo " [ - ]  $SERVICE"
++                            continue
++                          fi
++                        fi
++                  #env -i LANG="$LANG" PATH="$PATH" TERM="$TERM" "$SERVICEDIR/$SERVICE" status
++                fi
++                ;;
++            esac
++          done
++          exit 0
++       elif [ $# -eq 2 -a "${2}" = "--full-restart" ]; then
++          SERVICE="${1}"
++          if [ -x "${SERVICEDIR}/${SERVICE}" ]; then
++            env -i LANG="$LANG" PATH="$PATH" TERM="$TERM" "$SERVICEDIR/$SERVICE" stop
++            env -i LANG="$LANG" PATH="$PATH" TERM="$TERM" "$SERVICEDIR/$SERVICE" start
++            exit $?
++          fi
++       elif [ -z "${SERVICE}" ]; then
++         SERVICE="${1}"
++       elif [ -z "${ACTION}" ]; then
++         ACTION="${1}"
++       else
++         OPTIONS="${OPTIONS} ${1}"
++       fi
++       shift
++       ;;
++   esac
++done
++
++if [ -r "/etc/init/${SERVICE}.conf" ]; then
++   # Upstart configuration exists for this job
++   case "${ACTION}" in
++      start|stop|status|reload)
++         # Action is a valid upstart action
++         exec ${ACTION} ${SERVICE} ${OPTIONS}
++      ;;
++      restart)
++         # Map restart to the usual sysvinit behavior.
++         stop ${SERVICE} ${OPTIONS} || :
++         exec start ${SERVICE} ${OPTIONS}
++      ;;
++      force-reload)
++         # Upstart just uses reload for force-reload
++         exec reload ${SERVICE} ${OPTIONS}
++      ;;
++   esac
++fi
++
++# Otherwise, use the traditional sysvinit
++if [ -x "${SERVICEDIR}/${SERVICE}" ]; then
++   exec env -i LANG="$LANG" PATH="$PATH" TERM="$TERM" "$SERVICEDIR/$SERVICE" ${ACTION} ${OPTIONS}
++else
++   echo "${SERVICE}: unrecognized service" >&2
++   exit 1
++fi
+diff --git a/debian/service/service.8 b/debian/service/service.8
+new file mode 100644
+index 0000000..4f221af
+--- /dev/null
++++ b/debian/service/service.8
+@@ -0,0 +1,96 @@
++.\" A man page for service(8). -*- nroff -*-
++.\"
++.\" Copyright (C) 2006 Red Hat, Inc. All rights reserved.
++.\"
++.\" This copyrighted material is made available to anyone wishing to use,
++.\" modify, copy, or redistribute it subject to the terms and conditions of the
++.\" GNU General Public License v.2.
++.\"
++.\" This program is distributed in the hope that it will be useful, but WITHOUT
++.\" ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or 
++.\" FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for 
++.\" more details.
++.\"
++.\" You should have received a copy of the GNU General Public License along
++.\" with this program; if not, write to the Free Software Foundation, Inc.,
++.\" 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
++.\"
++.\" Author: Miloslav Trmac <mitr@redhat.com>
++.\" Updated by: Petter Reinholdtsen <pere@hungry.com>
++
++.TH service 8 "Jan 2006"
++
++.SH NAME
++service \- run a System V init script
++
++.SH SYNOPSIS
++\fBservice\fR \fISCRIPT\fR \fICOMMAND\fR [\fIOPTIONS\fR]
++
++\fBservice \-\-status\-all\fR
++
++\fBservice\fR \fB\-\-help\fR | \fB\-h\fR | \fB\-\-version\fR
++
++.SH DESCRIPTION
++.B service
++runs a System V init script or upstart job in as predictable environment as possible,
++removing most environment variables
++and with current working directory set to \fB/\fR.
++
++The
++.I SCRIPT
++parameter specifies a System V init script,
++located in \fB/etc/init.d/\fISCRIPT\fR, or the name of an upstart job in /etc/init. The existence of an upstart job of the same name as a script in /etc/init.d will cause the upstart job to take precedence over the init.d script.
++The supported values of
++.I COMMAND
++depend on the invoked script,
++.B service
++passes
++.I COMMAND
++and
++.I OPTIONS
++to the init script unmodified. For upstart jobs, start, stop, status, are passed through to their upstart equivilents. Restart will call the upstart 'stop' for the job, followed immediately by the 'start', and will exit with the return code of the start command.
++All scripts should support at least the
++.B start
++and
++.B stop
++commands.
++As a special case, if
++.I COMMAND
++is \fB\-\-full-restart\fR, the script is run twice, first with the
++.B stop
++command, then with the
++.B start
++command. This option has no effect on upstart jobs.
++
++.B service \-\-status\-all
++runs all init scripts, in alphabetical order, with the
++.B status
++command. This option only calls status for sysvinit jobs, upstart jobs can be queried in a similar manner with \fBinitctl list\fR'.
++
++.SH EXIT CODES
++.BR service
++calls the init script and returns the status returned by it.
++
++.SH FILES
++.TP
++\fB/etc/init.d\fR
++The directory containing System V init scripts.
++.TP
++\fB/etc/init\fR
++The directory containing upstart jobs.
++
++.SH ENVIRONMENT
++.TP
++\fBLANG\fR, \fBTERM\fR
++The only environment variables passed to the init scripts.
++
++.SH SEE ALSO
++.IR /etc/init.d/skeleton ,
++.br
++.BR update\-rc.d (8),
++.br
++.BR init (8),
++.br
++.BR invoke\-rc.d (8).
++.br
++.BR initctl (8).
+-- 
+1.7.4
+
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index e64b67a..9113fb0 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
-PR = "r11"
+PR = "r12"
 
 RDEPENDS_${PN} = "${PN}-inittab"
 
@@ -19,6 +19,10 @@ SRC_URI = "http://download.savannah.gnu.org/releases-noredirect/sysvinit/sysvini
            file://rcS \
 	   file://bootlogd.init"
 
+# add /sbin/service utility
+#
+SRC_URI += "file://sysvinit_2.88dsf-add-service-script.patch"
+
 SRC_URI[md5sum] = "6eda8a97b86e0a6f59dabbf25202aa6f"
 SRC_URI[sha256sum] = "60bbc8c1e1792056e23761d22960b30bb13eccc2cabff8c7310a01f4d5df1519"
 
@@ -89,4 +93,10 @@ do_install () {
 
         update-rc.d -r ${D} bootlogd start 07 S .
         update-rc.d -r ${D} stop-bootlogd start 99 2 3 4 5 .
+
+	# This is not part of the original package.
+	#
+	install -m 0755 ${S}/debian/service/service ${D}${base_sbindir}/service
+	install -m 0755 ${S}/debian/service/service.8 ${D}${mandir}/man8
+	ln -sf ${base_sbindir}/service ${D}/${base_bindir}/service
 }
-- 
1.7.3.4



