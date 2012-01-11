Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rl5Oj-0003vX-9e
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 22:07:53 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jan 2012 13:00:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="111235428"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.14.12])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jan 2012 13:00:05 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2012 13:00:01 -0800
Message-Id: <e4819c42f20c18f914598c440f7b430e3e0475b6.1326315478.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.5
In-Reply-To: <cover.1326315477.git.josh@linux.intel.com>
References: <cover.1326315477.git.josh@linux.intel.com>
In-Reply-To: <cover.1326315477.git.josh@linux.intel.com>
References: <cover.1326315477.git.josh@linux.intel.com>
Subject: [RFC PATCH 3/5] busybox: enable log level configuration in syslog-startup.conf and script
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
X-List-Received-Date: Wed, 11 Jan 2012 21:07:53 -0000

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
1.7.7.5



