Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1SwGvY-0007t5-9b
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 20:12:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 31 Jul 2012 11:00:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="173735969"
Received: from envy.jf.intel.com (HELO envy) ([10.7.201.159])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2012 11:00:38 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id q6VI0A6B017406
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:00:10 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q6VI09ZV017405
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 11:00:09 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 11:00:08 -0700
Message-Id: <3a1517325aac007f7f8bb4bac281c6568ee7cbc2.1343757533.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1343757533.git.elizabeth.flanagan@intel.com>
References: <cover.1343757533.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] runqemu-gen-tapdevs: add UID to CL options
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
X-List-Received-Date: Tue, 31 Jul 2012 18:12:16 -0000

runqemu-if* now requires UID as a command line option which means
runqemu-gen-tapdevs needs to take it as an option.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 scripts/runqemu-gen-tapdevs |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/scripts/runqemu-gen-tapdevs b/scripts/runqemu-gen-tapdevs
index 15bccd4..2c1ff0e 100755
--- a/scripts/runqemu-gen-tapdevs
+++ b/scripts/runqemu-gen-tapdevs
@@ -23,7 +23,8 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 usage() {
-	echo "Usage: sudo $0 <gid> <num> <native-sysroot-basedir>"
+	echo "Usage: sudo $0 <uid> <gid> <num> <native-sysroot-basedir>"
+        echo "Where <uid> is the numeric user id the tap devices will be owned by"
 	echo "Where <gid> is the numeric group id the tap devices will be owned by"
 	echo "<num> is the number of tap devices to create (0 to remove all)"
 	echo "<native-sysroot-basedir> is the path to the build system's native sysroot"
@@ -35,14 +36,15 @@ if [ $EUID -ne 0 ]; then
 	exit
 fi
 
-if [ $# -ne 3 ]; then
+if [ $# -ne 4 ]; then
 	echo "Error: Incorrect number of arguments"
 	usage
 fi
 
-GID=$1
-COUNT=$2
-SYSROOT=$3
+TUID=$1
+GID=$2
+COUNT=$3
+SYSROOT=$4
 
 TUNCTL=$SYSROOT/usr/bin/tunctl
 if [[ ! -x "$TUNCTL" || -d "$TUNCTL" ]]; then
@@ -73,10 +75,10 @@ for tap in `$IFCONFIG | grep ^tap | awk '{ print \$1 }'`; do
 	$TUNCTL -d $tap
 done
 
-echo "Creating $COUNT tap devices for GID $GID..."
+echo "Creating $COUNT tap devices for UID: $TUID GID: $GID..."
 for ((index=0; index < $COUNT; index++)); do
 	echo "Creating tap$index"
-	ifup=`$RUNQEMU_IFUP $GID $SYSROOT 2>&1`
+	ifup=`$RUNQEMU_IFUP $TUID $GID $SYSROOT 2>&1`
 	if [ $? -ne 0 ]; then
 		echo "Error running tunctl: $ifup"
 		exit 1
-- 
1.7.5.4



