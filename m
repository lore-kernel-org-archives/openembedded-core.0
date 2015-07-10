Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D061B73710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 13:56:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 10 Jul 2015 06:56:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,446,1432623600"; d="scan'208";a="726451511"
Received: from dawalker-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.7.62])
	by orsmga001.jf.intel.com with ESMTP; 10 Jul 2015 06:56:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jul 2015 14:56:03 +0100
Message-Id: <422e74f7f26aeb6b081d1e8d4d178a9c087bbd9d.1436536403.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1436536403.git.paul.eggleton@linux.intel.com>
References: <cover.1436536403.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1436536403.git.paul.eggleton@linux.intel.com>
References: <cover.1436536403.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/logging: make shell message functions output to the console
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
X-List-Received-Date: Fri, 10 Jul 2015 13:56:08 -0000

Use the FIFO that is now set up when executing tasks within BitBake to
make bbdebug/bbnote/bbwarn/bbplain/bberror/bbfatal output to the console
through BitBake's UI (as their python counterparts do) instead of only
outputting to the task log.

Note that this requires the corresponding change in BitBake that creates
the FIFO; without it such messages will end up in a file where the FIFO
should have been (but won't cause any other ill effects).

Remainder of the fix for [YOCTO #5275].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/logging.bbclass | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/meta/classes/logging.bbclass b/meta/classes/logging.bbclass
index f6648b2..f19eddd 100644
--- a/meta/classes/logging.bbclass
+++ b/meta/classes/logging.bbclass
@@ -2,48 +2,41 @@
 # They are intended to map one to one in intention and output format with the
 # python recipe logging functions of a similar naming convention: bb.plain(),
 # bb.note(), etc.
-#
-# For the time being, all of these print only to the task logs. Future
-# enhancements may integrate these calls with the bitbake logging
-# infrastructure, allowing for printing to the console as appropriate. The
-# interface and intention statements reflect that future goal. Once it is
-# in place, no changes will be necessary to recipes using these logging
-# mechanisms.
+
+LOGFIFO = "${T}/fifo.${@os.getpid()}"
 
 # Print the output exactly as it is passed in. Typically used for output of
 # tasks that should be seen on the console. Use sparingly.
 # Output: logs console
-# NOTE: console output is not currently implemented.
 bbplain() {
-	echo "$*"
+	printf "%b\0" "bbplain $*" > ${LOGFIFO}
 }
 
 # Notify the user of a noteworthy condition. 
-# Output: logs console
-# NOTE: console output is not currently implemented.
+# Output: logs
 bbnote() {
-	echo "NOTE: $*"
+	printf "%b\0" "bbnote $*" > ${LOGFIFO}
 }
 
 # Print a warning to the log. Warnings are non-fatal, and do not
 # indicate a build failure.
-# Output: logs
+# Output: logs console
 bbwarn() {
-	echo "WARNING: $*"
+	printf "%b\0" "bbwarn $*" > ${LOGFIFO}
 }
 
 # Print an error to the log. Errors are non-fatal in that the build can
 # continue, but they do indicate a build failure.
-# Output: logs
+# Output: logs console
 bberror() {
-	echo "ERROR: $*"
+	printf "%b\0" "bberror $*" > ${LOGFIFO}
 }
 
 # Print a fatal error to the log. Fatal errors indicate build failure
 # and halt the build, exiting with an error code.
-# Output: logs
+# Output: logs console
 bbfatal() {
-	echo "ERROR: $*"
+	printf "%b\0" "bbfatal $*" > ${LOGFIFO}
 	exit 1
 }
 
@@ -53,7 +46,6 @@ bbfatal() {
 # Output: logs console
 # Usage: bbdebug 1 "first level debug message"
 #        bbdebug 2 "second level debug message"
-# NOTE: console output is not currently implemented.
 bbdebug() {
 	USAGE='Usage: bbdebug [123] "message"'
 	if [ $# -lt 2 ]; then
@@ -68,6 +60,6 @@ bbdebug() {
 	fi
 
 	# All debug output is printed to the logs
-	echo "DEBUG: $*"
+	printf "%b\0" "bbdebug $DBGLVL $*" > ${LOGFIFO}
 }
 
-- 
2.1.0


