Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEb-0005QG-4K
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:32 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2011 00:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="914945654"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2011 00:29:56 -0700
Message-Id: <a34718a02b76e37c59ff67d9e182bd7b64c9f125.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Fri, 22 Apr 2011 09:25:23 -0700
Date: Wed, 27 Apr 2011  0:29:55 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 34/52] logging: add bb* logging mechanisms for bash recipe functions
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:33 -0000

From: Darren Hart <dvhart@linux.intel.com>

The following logging mechanisms are to be used in bash functions of recipes.
They are intended to map one to one in intention and output format with the
python recipe logging functions of a similar naming convention: bb.plain(),
bb.note(), etc.

For the time being, all of these print only to the task logs. Future
enhancements may integrate these calls with the bitbake logging infrastructure,
allowing for printing to the console as appropriate. The interface and intention
statements reflect that future goal. Once it is in place, no changes will be
necessary to recipes using these logging mechanisms.

I opted to write new functions instead of modifying the oe* logging functions
from base.bbclass (and utils.bbclass in oe) for a couple reasons. First, one of
my goals was to generate a uniform logging API between bash and python in
recipes. Second, there are no users of oe* logging in meta (oe-core) or
meta-yocto, while several oe recipes do use them. I wanted to make a clean start
with the freedom to change behavior without forcing the oe recipes to change or
experience unexpected logging changes. Eventually, the oe recipes can be
migrated to the new bb* logging routines and the existing oe* routines can be
retired (deleted).

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Chris Larson <clarson@kergoth.com>
---
 meta/classes/base.bbclass    |    1 +
 meta/classes/logging.bbclass |   72 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/logging.bbclass

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 7ca396d..eafad7e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -8,6 +8,7 @@ inherit utils
 inherit utility-tasks
 inherit metadata_scm
 inherit buildstats
+inherit logging
 
 python sys_path_eh () {
     if isinstance(e, bb.event.ConfigParsed):
diff --git a/meta/classes/logging.bbclass b/meta/classes/logging.bbclass
new file mode 100644
index 0000000..78d65bd
--- /dev/null
+++ b/meta/classes/logging.bbclass
@@ -0,0 +1,72 @@
+# The following logging mechanisms are to be used in bash functions of recipes.
+# They are intended to map one to one in intention and output format with the
+# python recipe logging functions of a similar naming convention: bb.plain(),
+# bb.note(), etc.
+#
+# For the time being, all of these print only to the task logs. Future
+# enhancements may integrate these calls with the bitbake logging
+# infrastructure, allowing for printing to the console as appropriate. The
+# interface and intention statements reflect that future goal. Once it is
+# in place, no changes will be necessary to recipes using these logging
+# mechanisms.
+
+# Print the output exactly as it is passed in. Typically used for output of
+# tasks that should be seen on the console. Use sparingly.
+# Output: logs console
+# NOTE: console output is not currently implemented.
+bbplain() {
+	echo "$*"
+}
+
+# Notify the user of a noteworthy condition. 
+# Output: logs console
+# NOTE: console output is not currently implemented.
+bbnote() {
+	echo "NOTE: $*"
+}
+
+# Print a warning to the log. Warnings are non-fatal, and do not
+# indicate a build failure.
+# Output: logs
+bbwarn() {
+	echo "WARNING: $*"
+}
+
+# Print an error to the log. Errors are non-fatal in that the build can
+# continue, but they do indicate a build failure.
+# Output: logs
+bberror() {
+	echo "ERROR: $*"
+}
+
+# Print a fatal error to the log. Fatal errors indicate build failure
+# and halt the build, exiting with an error code.
+# Output: logs
+bbfatal() {
+	echo "ERROR: $*"
+	exit 1
+}
+
+# Print debug messages. These are appropriate for progress checkpoint
+# messages to the logs. Depending on the debug log level, they may also
+# go to the console.
+# Output: logs console
+# Usage: bbdebug 1 "first level debug message"
+#        bbdebug 2 "second level debug message"
+# NOTE: console output is not currently implemented.
+bbdebug() {
+	USAGE='Usage: bbdebug [123] "message"'
+	if [ $# -lt 2 ]; then
+		bbfatal "$USAGE"
+	fi
+	
+	# Strip off the debug level and ensure it is an integer
+	DBGLVL=$1; shift
+	if ! [[ "$DBGLVL" =~ ^[0-9]+ ]]; then
+		bbfatal "$USAGE"
+	fi
+
+	# All debug output is printed to the logs
+	echo "DEBUG: $*"
+}
+
-- 
1.7.1.1



