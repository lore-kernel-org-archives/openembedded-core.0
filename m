Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKR-0004D6-4D
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:30:47 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:22:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472093"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:22:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:29 -0800
Message-Id: <0afa9a63a83ee128dac522af70e1f823b7d6a6df.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/33] busybox: enable dropping of duplicates in syslog, off by default
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
X-List-Received-Date: Thu, 19 Jan 2012 09:30:47 -0000

From: Joshua Lock <josh@linux.intel.com>

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
index ebd751d..b474ad4 100644
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
1.7.6.5



