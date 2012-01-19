Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKQ-0004Cz-BZ
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:30:42 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:22:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472089"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:22:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:27 -0800
Message-Id: <921dfd1a2bc6ad2867da13d2b669288f9788a088.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/33] busybox: enable log level configuration in syslog-startup.conf and script
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
X-List-Received-Date: Thu, 19 Jan 2012 09:30:46 -0000

From: Joshua Lock <josh@linux.intel.com>

It's possible to configure busybox syslog to only log messages above a
certain level, expose this functionality through the syslog-startup.conf
and syslog init script.

Valid values are 1-8 inclusive.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-core/busybox/files/syslog             |    3 +++
 .../recipes-core/busybox/files/syslog-startup.conf |    1 +
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/busybox/files/syslog b/meta/recipes-core/busybox/files/syslog
index 0be412b..deeea8b 100644
--- a/meta/recipes-core/busybox/files/syslog
+++ b/meta/recipes-core/busybox/files/syslog
@@ -40,6 +40,9 @@ if [ -f /etc/syslog-startup.conf ]; then
 	if [ "$REDUCE" = "yes" ]; then
 		SYSLOG_ARGS="$SYSLOG_ARGS -S"
 	fi
+	if [ -n "$LOGLEVEL" ]; then
+	    SYSLOG_ARGS="$SYSLOG_ARGS -l $LOGLEVEL"
+	fi
 else
 	# default: log to 16K shm circular buffer
 	SYSLOG_ARGS="-C"
diff --git a/meta/recipes-core/busybox/files/syslog-startup.conf b/meta/recipes-core/busybox/files/syslog-startup.conf
index f58cbe5..83b86f2 100644
--- a/meta/recipes-core/busybox/files/syslog-startup.conf
+++ b/meta/recipes-core/busybox/files/syslog-startup.conf
@@ -9,3 +9,4 @@ REDUCE=no			# reduce-size logging
 #ROTATEGENS=3			# keep X generations of rotated logs
 BUFFERSIZE=64			# size of circular buffer [kByte]
 FOREGROUND=no			# run in foreground (don't use!)
+#LOGLEVEL=5			# local log level (between 1 and 8)
-- 
1.7.6.5



