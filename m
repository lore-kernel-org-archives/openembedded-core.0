Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RnENP-0001N7-TD
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:07:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2012 10:59:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="99658545"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.216])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2012 10:59:43 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 10:59:40 -0800
Message-Id: <ac789cbbd95cb260bf2b938165ead42d3311a4d1.1326826646.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.5
In-Reply-To: <cover.1326826646.git.josh@linux.intel.com>
References: <cover.1326826646.git.josh@linux.intel.com>
In-Reply-To: <cover.1326826646.git.josh@linux.intel.com>
References: <cover.1326826646.git.josh@linux.intel.com>
Subject: [PATCH 5/5] busybox: enable dropping of duplicates in syslog, off by default
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
X-List-Received-Date: Tue, 17 Jan 2012 19:07:24 -0000

Busybox syslog includes functionality to drop duplicated syslog entries,
enable this feature in the defconfig yet disable it by default.

Expose configuration of the feature through the syslog-startup.conf file
and the syslog init script.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
 meta/recipes-core/busybox/busybox_1.19.3.bb        |    2 +-
 meta/recipes-core/busybox/files/syslog             |    3 +++
 .../recipes-core/busybox/files/syslog-startup.conf |    1 +
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
index 1990f28..cd2a2ad 100644
--- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
@@ -997,7 +997,7 @@ CONFIG_FEATURE_SH_HISTFILESIZE=y
 CONFIG_SYSLOGD=y
 CONFIG_FEATURE_ROTATE_LOGFILE=y
 CONFIG_FEATURE_REMOTE_LOG=y
-# CONFIG_FEATURE_SYSLOGD_DUP is not set
+CONFIG_FEATURE_SYSLOGD_DUP=y
 CONFIG_FEATURE_SYSLOGD_CFG=y
 CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
 CONFIG_FEATURE_IPC_SYSLOG=y
diff --git a/meta/recipes-core/busybox/busybox_1.19.3.bb b/meta/recipes-core/busybox/busybox_1.19.3.bb
index f591856..a075407 100644
--- a/meta/recipes-core/busybox/busybox_1.19.3.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.3.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
diff --git a/meta/recipes-core/busybox/files/syslog b/meta/recipes-core/busybox/files/syslog
index deeea8b..2944d3d 100644
--- a/meta/recipes-core/busybox/files/syslog
+++ b/meta/recipes-core/busybox/files/syslog
@@ -40,6 +40,9 @@ if [ -f /etc/syslog-startup.conf ]; then
 	if [ "$REDUCE" = "yes" ]; then
 		SYSLOG_ARGS="$SYSLOG_ARGS -S"
 	fi
+	if [ "$DROPDUPLICATES" = "yes" ]; then
+	    SYSLOG_ARGS="$SYSLOG_ARGS -D"
+	fi
 	if [ -n "$LOGLEVEL" ]; then
 	    SYSLOG_ARGS="$SYSLOG_ARGS -l $LOGLEVEL"
 	fi
diff --git a/meta/recipes-core/busybox/files/syslog-startup.conf b/meta/recipes-core/busybox/files/syslog-startup.conf
index 553490b..fda450a 100644
--- a/meta/recipes-core/busybox/files/syslog-startup.conf
+++ b/meta/recipes-core/busybox/files/syslog-startup.conf
@@ -5,6 +5,7 @@ DESTINATION=file		# log destinations (buffer file remote)
 LOGFILE=/var/log/messages	# where to log (file)
 REMOTE=loghost:514		# where to log (syslog remote)
 REDUCE=no			# reduce-size logging
+DROPDUPLICATES=no		# whether to drop duplicate log entries
 #ROTATESIZE=0			# rotate log if grown beyond X [kByte]
 #ROTATEGENS=3			# keep X generations of rotated logs
 BUFFERSIZE=64			# size of circular buffer [kByte]
-- 
1.7.7.5



