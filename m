Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMc5k-0000wy-MQ
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 10:26:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2011 01:17:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,230,1304319600"; 
   d="scan'208";a="3233864"
Received: from unknown (HELO localhost) ([10.255.12.160])
	by fmsmga002.fm.intel.com with ESMTP; 18 May 2011 01:17:56 -0700
Message-Id: <5761fd4e75e39be9e610c02eff1a86e6b8b3559c.1305702436.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305702436.git.sgw@linux.intel.com>
References: <cover.1305702436.git.sgw@linux.intel.com>
Old-Date: Tue, 17 May 2011 09:35:57 -0600
Date: Wed, 18 May 2011  1:17:56 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Robert Yang <liezhi.yang@windriver.com>
Subject: [PATCH 08/15] Add pidofproc to ${sysconfdir}/init.d/functions
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
X-List-Received-Date: Wed, 18 May 2011 08:26:53 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Add pidofproc to ${sysconfdir}/init.d/functions, this is used for
getting the pid of the process. It uses pidof to implement currently, it
may also use the pidfile or ps to implement in the future.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../initscripts/initscripts-1.0/functions          |   32 ++++++++++++++++++-
 1 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/functions b/meta/recipes-core/initscripts/initscripts-1.0/functions
index ac99e11..c1eac3e 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/functions
+++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
@@ -3,6 +3,35 @@
 # functions     This file contains functions to be used by most or all
 #               shell scripts in the /etc/init.d directory.
 #
+# NOTE: The pidofproc () doesn't support the process which is a script unless
+#       the pidof supports "-x" option. If you want to use it for such a
+#       process:
+#       1) If there is no "pidof -x", replace the "pidof $1" with another
+#          command like(for core-image-minimal):
+#            ps | awk '/'"$1"'/ {print $1}'
+#       Or
+#       2) If there is "pidof -x", replace "pidof" with "pidof -x".
+#
+# pidofproc - print the pid of a process
+# $1: the name of the process
+pidofproc () {
+
+	# pidof output null when no program is running, so no "2>/dev/null".
+	pid=`pidof $1`
+	case $? in
+	0)
+		echo $pid
+		return 0
+		;;
+	127)
+		echo "ERROR: command pidof not found" >&2
+		exit 127
+		;;
+	*)
+		return $?
+		;;
+	esac
+}
 
 machine_id() { # return the machine ID
 	awk 'BEGIN { FS=": " } /Hardware/ \
@@ -10,6 +39,5 @@ machine_id() { # return the machine ID
 }
 
 killproc() { # kill the named process(es)
-	pid=`/bin/pidof $1`
-	[ "$pid" != "" ] && kill $pid
+	pid=`pidofproc $1` && kill $pid
 }
-- 
1.7.3.4



