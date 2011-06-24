Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1Qa205-0000RJ-Ka
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 10:44:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2011 00:54:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,418,1304319600"; d="scan'208";a="20117139"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2011 00:54:16 -0700
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2011 16:11:40 +0800
Message-Id: <efa72cd5d8229ca5399568e155011459022a2685.1308902622.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308902622.git.jiajun.xu@intel.com>
References: <cover.1308902622.git.jiajun.xu@intel.com>
Subject: [PATCH 1/1] qemuimagetest: update cvs and iptables to newer version for toolchain test
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
X-List-Received-Date: Fri, 24 Jun 2011 08:44:30 -0000

The old versions of cvs and iptables may meet compile error under some architecture
- cvs 1.11.23 fails on x86-64 host and iptables 1.4.9 fails on arm host. Update them
to latest version could solve these build error.
Meanwhile, 240s timeout is set for sudoku becasue 120s is not enough to finish
compile.

Signed-off-by Jiajun Xu <jiajun.xu@intel.com>
---
 meta/classes/imagetest-qemu.bbclass             |    2 +-
 scripts/qemuimage-testlib                       |   52 ++++++++++++++++++----
 scripts/qemuimage-tests/toolchain/sudoku-savant |    2 +-
 3 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest-qemu.bbclass
index e259ae9..25304de 100644
--- a/meta/classes/imagetest-qemu.bbclass
+++ b/meta/classes/imagetest-qemu.bbclass
@@ -33,7 +33,7 @@ def qemuimagetest_main(d):
     Test Controller for automated testing.
     """
     
-    casestr = re.compile(r'(?P<scen>\w+\b):(?P<case>\w+$)')
+    casestr = re.compile(r'(?P<scen>\w+\b):(?P<case>\S+$)')
     resultstr = re.compile(r'\s*(?P<case>\w+)\s*(?P<pass>\d+)\s*(?P<fail>\d+)\s*(?P<noresult>\d+)')
     machine = bb.data.getVar('MACHINE', d, 1)
     pname = bb.data.getVar('PN', d, 1)
diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index c39fb7a..c2dbf60 100755
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -32,14 +32,14 @@ PID=0
 TARGET_IPADDR=0
 
 # Global variable for test project version during toolchain test
-# Version of cvs is 1.11.23
-# Version of iptables is 1.4.9
+# Version of cvs is 1.12.13
+# Version of iptables is 1.4.11
 # Version of sudoku-savant is 1.3
 PROJECT_PV=0
 
 # Global variable for test project download URL during toolchain test
-# URL of cvs is http://ftp.gnu.org/non-gnu/cvs/source/stable/1.11.23/cvs-1.11.23.tar.bz2
-# URL of iptables is http://netfilter.org/projects/iptables/files/iptables-1.4.9.tar.bz2
+# URL of cvs is http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2
+# URL of iptables is http://netfilter.org/projects/iptables/files/iptables-1.4.11.tar.bz2
 # URL of sudoku-savant is http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2
 PROJECT_DOWNLOAD_URL=0
 
@@ -641,14 +641,46 @@ Test_Time_Out()
 	local date=0
 	local tmp=`mktemp`
 	local ret=1
+	local pid=0
+	local ppid=0
+	local i=0
+	declare local pid_l
 
 	# Run command in background
 	($command; echo $? > $tmp) &
-	while ps -e -o pid | grep -qw $!; do
+	pid=$!
+	while ps -e -o pid | grep -qw $pid; do
 		if [ $date -ge $timeout ]; then
 			Test_Info "$timeout Timeout when running command $command"
 			rm -rf $tmp
-			return 1
+
+			# Find all child processes of pid and kill them
+			ppid=$pid
+			ps -f --ppid $ppid
+			ret=$?
+	
+			while [ $ret -eq 0 ]
+			do
+				# If yes, get the child pid and check if the child pid has other child pid
+				# Continue the while loop until there is no child pid found
+				pid_l[$i]=`ps -f --ppid $ppid | awk '{if ($2 != "PID") print $2}'`
+				ppid=${pid_l[$i]}
+				i=$((i+1))
+				ps -f --ppid $ppid
+				ret=$?
+			done
+	
+				# Kill these children pids from the last one
+				while [ $i -ne 0 ]
+				do
+					i=$((i-1))
+					kill ${pid_l[$i]}
+					sleep 2
+				done
+	
+				# Kill the parent id
+				kill $pid
+				return 1
 		fi
 		sleep 5
 		date=`expr $date + 5`
@@ -672,11 +704,11 @@ Test_Toolchain()
 
 	# Set value for PROJECT_PV and PROJECT_DOWNLOAD_URL accordingly
 	if [ $test_project == "cvs" ]; then
-		PROJECT_PV=1.11.23
-		PROJECT_DOWNLOAD_URL="http://ftp.gnu.org/non-gnu/cvs/source/stable/1.11.23/cvs-1.11.23.tar.bz2"
+		PROJECT_PV=1.12.13
+		PROJECT_DOWNLOAD_URL="http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2"
 	elif [ $test_project == "iptables" ]; then
-		PROJECT_PV=1.4.9
-		PROJECT_DOWNLOAD_URL="http://netfilter.org/projects/iptables/files/iptables-1.4.9.tar.bz2"
+		PROJECT_PV=1.4.11
+		PROJECT_DOWNLOAD_URL="http://netfilter.org/projects/iptables/files/iptables-1.4.11.tar.bz2"
 	elif [ $test_project == "sudoku-savant" ]; then
 		PROJECT_PV=1.3
 		PROJECT_DOWNLOAD_URL="http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2"
diff --git a/scripts/qemuimage-tests/toolchain/sudoku-savant b/scripts/qemuimage-tests/toolchain/sudoku-savant
index 603afe6..3d149de 100755
--- a/scripts/qemuimage-tests/toolchain/sudoku-savant
+++ b/scripts/qemuimage-tests/toolchain/sudoku-savant
@@ -11,7 +11,7 @@
 #
 . $COREBASE/scripts/qemuimage-testlib
 
-TIMEOUT=120
+TIMEOUT=240
 
 # Extract and test toolchain tarball
 Test_Toolchain sudoku-savant ${TIMEOUT}
-- 
1.7.1



