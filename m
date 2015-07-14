Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F2C6075F1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 14:57:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 14 Jul 2015 07:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,472,1432623600"; d="scan'208";a="728662451"
Received: from cbernard-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.31.54])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2015 07:57:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 15:56:56 +0100
Message-Id: <b4ec7357bef578fa4577d9ec7234e3928d4576a1.1436884357.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1436884357.git.paul.eggleton@linux.intel.com>
References: <cover.1436884357.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1436884357.git.paul.eggleton@linux.intel.com>
References: <cover.1436884357.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] classes/logging: allow shell message functions to work in devshell
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
X-List-Received-Date: Tue, 14 Jul 2015 14:57:10 -0000

Fix a regression caused by the shell message changes - if you run a
shell task's runfile, the task isn't actually running in BitBake and
thus the message FIFO won't exist - so we should just fall back to
printing the message with echo as we did before so that the run files
are still useful.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/logging.bbclass | 42 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/meta/classes/logging.bbclass b/meta/classes/logging.bbclass
index 6b24839..06c7c31 100644
--- a/meta/classes/logging.bbclass
+++ b/meta/classes/logging.bbclass
@@ -9,34 +9,54 @@ LOGFIFO = "${T}/fifo.${@os.getpid()}"
 # tasks that should be seen on the console. Use sparingly.
 # Output: logs console
 bbplain() {
-	printf "%b\0" "bbplain $*" > ${LOGFIFO}
+	if [ -p ${LOGFIFO} ] ; then
+		printf "%b\0" "bbplain $*" > ${LOGFIFO}
+	else
+		echo "$*"
+	fi
 }
 
 # Notify the user of a noteworthy condition. 
 # Output: logs
 bbnote() {
-	printf "%b\0" "bbnote $*" > ${LOGFIFO}
+	if [ -p ${LOGFIFO} ] ; then
+		printf "%b\0" "bbnote $*" > ${LOGFIFO}
+	else
+		echo "NOTE: $*"
+	fi
 }
 
 # Print a warning to the log. Warnings are non-fatal, and do not
 # indicate a build failure.
 # Output: logs console
 bbwarn() {
-	printf "%b\0" "bbwarn $*" > ${LOGFIFO}
+	if [ -p ${LOGFIFO} ] ; then
+		printf "%b\0" "bbwarn $*" > ${LOGFIFO}
+	else
+		echo "WARNING: $*"
+	fi
 }
 
 # Print an error to the log. Errors are non-fatal in that the build can
 # continue, but they do indicate a build failure.
 # Output: logs console
 bberror() {
-	printf "%b\0" "bberror $*" > ${LOGFIFO}
+	if [ -p ${LOGFIFO} ] ; then
+		printf "%b\0" "bberror $*" > ${LOGFIFO}
+	else
+		echo "ERROR: $*"
+	fi
 }
 
 # Print a fatal error to the log. Fatal errors indicate build failure
 # and halt the build, exiting with an error code.
 # Output: logs console
 bbfatal() {
-	printf "%b\0" "bbfatal $*" > ${LOGFIFO}
+	if [ -p ${LOGFIFO} ] ; then
+		printf "%b\0" "bbfatal $*" > ${LOGFIFO}
+	else
+		echo "ERROR: $*"
+	fi
 	exit 1
 }
 
@@ -44,7 +64,11 @@ bbfatal() {
 # bitbake's UI.
 # Output: logs console
 bbfatal_log() {
-	printf "%b\0" "bbfatal_log $*" > ${LOGFIFO}
+	if [ -p ${LOGFIFO} ] ; then
+		printf "%b\0" "bbfatal_log $*" > ${LOGFIFO}
+	else
+		echo "ERROR: $*"
+	fi
 	exit 1
 }
 
@@ -68,6 +92,10 @@ bbdebug() {
 	fi
 
 	# All debug output is printed to the logs
-	printf "%b\0" "bbdebug $DBGLVL $*" > ${LOGFIFO}
+	if [ -p ${LOGFIFO} ] ; then
+		printf "%b\0" "bbdebug $DBGLVL $*" > ${LOGFIFO}
+	else
+		echo "DEBUG: $*"
+	fi
 }
 
-- 
2.1.0


