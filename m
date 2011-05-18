Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMc00-0000h9-HH
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:20:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 May 2011 01:17:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,230,1304319600"; d="scan'208";a="438114088"
Received: from unknown (HELO localhost) ([10.255.12.160])
	by azsmga001.ch.intel.com with ESMTP; 18 May 2011 01:17:56 -0700
Message-Id: <d32174e3248ed13410d3d8ff2b2bed8ec7f0a265.1305702436.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305702436.git.sgw@linux.intel.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
Old-Date: Mon, 16 May 2011 21:57:21 -0600
Date: Wed, 18 May 2011  1:17:56 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 09/15] Add a skeleton for init scripts
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
X-List-Received-Date: Wed, 18 May 2011 08:20:58 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Add a skeleton for init scripts, the original structure is from
/etc/init.d/skeleton of Ubuntu 10.10, it is in sysvinit_2.87dsf, so add
the COPYRIGHT(GPLv2) of sysvinit_2.87dsf. Modified the original skeleton
a lot to make it as easy as possible, just use posix shell command, and
have tested it with core-image-minimal.

* The skeleton implements the following actions:
  - start, stop, restart, status, try-restart and force-reload.
    # force-reload is a alias of try-restart.

  - not implements reload, since only a few programs have it, just leave
    it as placeholder.

* Add /usr/sbin/skeleton-test to test /etc/init.d/skeleton

* The /etc/init.d/skeleton can be run and output the example messages:
  1) #./skeleton start (test start)
     Starting skeleton ...

  2) #./skeleton start (test start again when running)
     skeleton already running (1078).

  3) #./skeleton status (test status when running)
     skeleton is running (1078).

  4) #./skeleton stop (test stop)
     Stopped skeleton (1078).

  5) #./skeleton stop (test stop again)
     skeleton is not running; none killed.

  6) #./skeleton status (test status when stopped)
     skeleton is not running.

  7) #./skeleton restart (test restart when running)
     Stopped skeleton (1128).
     Starting skeleton ...

  8) #./skeleton restart (test restart when stopped)
     skeleton is not running; none killed.
     Starting skeleton ...

  9)  try-restart (or force-reload) means restart the service if the
      service is already running

     #./skeleton try-restart (test try-restart when stopped)
     skeleton is not running; none killed.

     #./skeleton try-restart (test try-restart when running)
      Stopped skeleton (1181).
      Starting skeleton ...

* Have used syslogd to test it in a real world(with both
  core-image-minimal and core-image-sato)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-skeleton/service/service/COPYRIGHT     |   15 ++
 .../recipes-skeleton/service/service/skeleton      |  193 ++++++++++++++++++++
 .../service/service/skeleton_test.c                |   12 ++
 .../recipes-skeleton/service/service_0.1.bb        |   32 ++++
 4 files changed, 252 insertions(+), 0 deletions(-)
 create mode 100644 meta-skeleton/recipes-skeleton/service/service/COPYRIGHT
 create mode 100644 meta-skeleton/recipes-skeleton/service/service/skeleton
 create mode 100644 meta-skeleton/recipes-skeleton/service/service/skeleton_test.c
 create mode 100644 meta-skeleton/recipes-skeleton/service/service_0.1.bb

diff --git a/meta-skeleton/recipes-skeleton/service/service/COPYRIGHT b/meta-skeleton/recipes-skeleton/service/service/COPYRIGHT
new file mode 100644
index 0000000..ec3e171
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/service/service/COPYRIGHT
@@ -0,0 +1,15 @@
+Sysvinit is Copyright (C) 1991-2004 Miquel van Smoorenburg
+
+    This program is free software; you can redistribute it and/or modify
+    it under the terms of the GNU General Public License as published by
+    the Free Software Foundation; either version 2 of the License, or
+    (at your option) any later version.
+
+    This program is distributed in the hope that it will be useful,
+    but WITHOUT ANY WARRANTY; without even the implied warranty of
+    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+    GNU General Public License for more details.
+
+    You should have received a copy of the GNU General Public License
+    along with this program; if not, write to the Free Software
+    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA
diff --git a/meta-skeleton/recipes-skeleton/service/service/skeleton b/meta-skeleton/recipes-skeleton/service/service/skeleton
new file mode 100644
index 0000000..a3edc9d
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/service/service/skeleton
@@ -0,0 +1,193 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          skeleton
+# Required-Start:    $local_fs
+# Should-Start:
+# Required-Stop:     $local_fs
+# Should-Stop:
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Example initscript
+# Description:       This file should be used to construct scripts to be
+#                    placed in /etc/init.d
+### END INIT INFO
+
+# The definition of actions: (From LSB 3.1.0)
+# start         start the service
+# stop          stop the service
+# restart       stop and restart the service if the service is already running,
+#               otherwise start the service
+# try-restart	restart the service if the service is already running
+# reload	cause the configuration of the service to be reloaded without
+#               actually stopping and restarting the service
+# force-reload	cause the configuration to be reloaded if the service supports
+#               this, otherwise restart the service if it is running
+# status	print the current status of the service
+
+# The start, stop, restart, force-reload, and status actions shall be supported
+# by all init scripts; the reload and the try-restart actions are optional
+
+# Common steps to convert this skeleton into a real init script
+# 1) cp skeleton <the_real_name>
+# 2) Set DESC and NAME
+# 3) Check whether the daemon app is /usr/sbin/$NAME, if not, set it.
+# 4) Set DAEMON_ARGS if there is any
+# 5) Remove the useless code
+
+# NOTE: The skeleton doesn't support the daemon which is a script unless the
+#       pidof supports "-x" option, please see more comments for pidofproc ()
+#       in /etc/init.d/functions
+
+# PATH should only include /usr/* if it runs after the mountnfs.sh script
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+
+DESC="skeleton"
+NAME="skeleton-test"
+DAEMON=/usr/sbin/$NAME
+DAEMON_ARGS=""
+PIDFILE=/var/run/$NAME.pid
+
+. /etc/init.d/functions || exit 1
+
+# Exit if the package is not installed
+[ -x "$DAEMON" ] || exit 0
+
+# Read configuration variable file if it is present
+[ -r /etc/default/$NAME ] && . /etc/default/$NAME
+
+#
+# Function that starts the daemon/service
+#
+do_start() {
+	local status pid
+
+	status=0
+	pid=`pidofproc $NAME` || status=$?
+	case $status in
+	0)
+		echo "$DESC already running ($pid)."
+		exit 1
+		;;
+	*)
+		echo "Starting $DESC ..."
+		exec $DAEMON $DAEMON_ARGS >/dev/null 2>&1 || status=$?
+		echo "ERROR: Failed to start $DESC."
+		exit $status
+		;;
+	esac
+
+	# Add code here, if necessary, that waits for the process to be ready
+	# to handle requests from services started subsequently which depend
+	# on this one.  As a last resort, sleep for some time.
+}
+
+#
+# Function that stops the daemon/service
+#
+do_stop() {
+	local pid status
+
+	status=0
+	pid=`pidofproc $NAME` || status=$?
+	case $status in
+	0)
+		# Exit when fail to stop, the kill would complain when fail
+		kill -s 15 $pid >/dev/null && rm -f $PIDFILE && \
+			echo "Stopped $DESC ($pid)." || exit $?
+		;;
+	*)
+		echo "$DESC is not running; none killed." >&2
+		;;
+	esac
+
+	# Wait for children to finish too if this is a daemon that forks
+	# and if the daemon is only ever run from this initscript.
+	# If the above conditions are not satisfied then add some other code
+	# that waits for the process to drop all resources that could be
+	# needed by services started subsequently.  A last resort is to
+	# sleep for some time.
+	return $status
+}
+
+#
+# Function that sends a SIGHUP to the daemon/service
+#
+do_reload() {
+	local pid status
+
+	status=0
+        # If the daemon can reload its configuration without
+        # restarting (for example, when it is sent a SIGHUP),
+        # then implement that here.
+	pid=`pidofproc $NAME` || status=$?
+	case $status in
+	0)
+		echo "Reloading $DESC ..."
+		kill -s 1 $pid || exit $?
+		;;
+	*)
+		echo "$DESC is not running; none reloaded." >&2
+		;;
+	esac
+	exit $status
+}
+
+
+#
+# Function that shows the daemon/service status
+#
+status_of_proc () {
+	local pid status
+
+	status=0
+	# pidof output null when no program is running, so no "2>/dev/null".
+	pid=`pidofproc $NAME` || status=$?
+	case $status in
+	0)
+		echo "$DESC is running ($pid)."
+		exit 0
+		;;
+	*)
+		echo "$DESC is not running." >&2
+		exit $status
+		;;
+	esac
+}
+
+case "$1" in
+start)
+	do_start
+	;;
+stop)
+	do_stop || exit $?
+	;;
+status)
+	status_of_proc
+	;;
+restart)
+	# Always start the service regardless the status of do_stop
+	do_stop
+	do_start
+	;;
+try-restart|force-reload)
+	# force-reload is the same as reload or try-restart according
+	# to its definition, the reload is not implemented here, so
+	# force-reload is the alias of try-restart here, but it should
+	# be the alias of reload if reload is implemented.
+	#
+	# Only start the service when do_stop succeeds
+	do_stop && do_start
+	;;
+#reload)
+	# If the "reload" action is implemented properly, then let the
+	# force-reload be the alias of reload, and remove it from
+	# try-restart|force-reload)
+	#
+	#do_reload
+	#;;
+*)
+	echo "Usage: $0 {start|stop|status|restart|try-restart|force-reload}" >&2
+	exit 3
+	;;
+esac
+
diff --git a/meta-skeleton/recipes-skeleton/service/service/skeleton_test.c b/meta-skeleton/recipes-skeleton/service/service/skeleton_test.c
new file mode 100644
index 0000000..96c67ac
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/service/service/skeleton_test.c
@@ -0,0 +1,12 @@
+#include <unistd.h>
+
+/* This demo does nothing except for testing /etc/init.d/skeleton */
+
+int main(int argc, char *argv[])
+{
+	daemon(0, 0);
+	while (1) {
+		sleep(1);
+	}
+	return 0;
+}
diff --git a/meta-skeleton/recipes-skeleton/service/service_0.1.bb b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
new file mode 100644
index 0000000..22137a5
--- /dev/null
+++ b/meta-skeleton/recipes-skeleton/service/service_0.1.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "The canonical example of init scripts"
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYRIGHT;md5=349c872e0066155e1818b786938876a4"
+RDEPENDS_${PN} = "initscripts"
+PR = "r0"
+
+SRC_URI = "file://skeleton \
+	   file://skeleton_test.c \
+	   file://COPYRIGHT \
+	   "
+
+CONFFILES_${PN} += "${sysconfdir}/init.d/skeleton"
+
+do_compile () {
+	${CC} ${WORKDIR}/skeleton_test.c -o ${WORKDIR}/skeleton-test
+}
+
+do_install () {
+	install -d ${D}${sysconfdir}/init.d
+	cat ${WORKDIR}/skeleton | \
+	  sed -e 's,/etc,${sysconfdir},g' \
+	      -e 's,/usr/sbin,${sbindir},g' \
+	      -e 's,/var,${localstatedir},g' \
+	      -e 's,/usr/bin,${bindir},g' \
+	      -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/skeleton
+	chmod a+x ${D}${sysconfdir}/init.d/skeleton
+
+	install -d ${D}${sbindir}
+	install -m 0755 ${WORKDIR}/skeleton-test ${D}${sbindir}/
+}
+
-- 
1.7.3.4



