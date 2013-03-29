Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1ULbET-0002Zu-Dl
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 16:28:45 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Mar 2013 08:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,373,1363158000"; d="scan'208";a="309162526"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 29 Mar 2013 08:10:36 -0700
Received: from localhost.localdomain (unknown [10.237.112.141])
	by linux.intel.com (Postfix) with ESMTP id 1AC3B2C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 08:10:29 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2013 17:10:22 +0200
Message-Id: <cafb2912d821531777504ed69e15d36da795fa4f.1364568244.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1364568244.git.stefanx.stanacar@intel.com>
References: <cover.1364568244.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1364568244.git.stefanx.stanacar@intel.com>
References: <cover.1364568244.git.stefanx.stanacar@intel.com>
Subject: [PATCH 3/4] scripts/contrib/build-perf-test.sh: add option to allow cherry-picking of fix revisions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2013 15:28:45 -0000

From: Richard Purdie <richard@linuxfoundation.org>

Adds a -p option to allow cherry-picking of fix revisions.
Removes the final build/sstate directories to stop running out of space.
Runs subsequent tasks even if one test fails.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/contrib/build-perf-test.sh | 84 ++++++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 35 deletions(-)

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
index 0f7a3a9..103475d 100755
--- a/scripts/contrib/build-perf-test.sh
+++ b/scripts/contrib/build-perf-test.sh
@@ -36,23 +36,25 @@ cat << EOT
 Usage: $ME [-h]
        $ME [-c <commit>] [-v] [-m <val>] [-j <val>] [-t <val>] [-i <image-name>] [-d <path>]
 Options:
-	-h
-		Display this help and exit.
-	-c <commit>
-		git checkout <commit> before anything else
-	-v
-		Show bitbake output, don't redirect it to a log.
-	-m <machine>
-		Value for MACHINE. Default is qemux86.
-	-j <val>
-		Value for PARALLEL_MAKE. Default is 8. 
-	-t <val>
-		Value for BB_NUMBER_THREADS. Default is 8.
+        -h
+                Display this help and exit.
+        -c <commit>
+                git checkout <commit> before anything else
+        -v
+                Show bitbake output, don't redirect it to a log.
+        -m <machine>
+                Value for MACHINE. Default is qemux86.
+        -j <val>
+                Value for PARALLEL_MAKE. Default is 8. 
+        -t <val>
+                Value for BB_NUMBER_THREADS. Default is 8.
         -i <image-name>
                 Instead of timing agains core-image-sato, use <image-name>
         -d <path>
                 Use <path> as DL_DIR
-		
+        -p <githash>
+                Cherry pick githash onto the commit
+                
 Note: current working directory must be inside a poky git clone.
  
 EOT
@@ -71,29 +73,32 @@ verbose=0
 dldir=
 commit=
 pmake=
-while getopts "hvc:m:j:t:i:d:" opt; do
-	case $opt in
-		h)	usage
-			exit 0
-			;;
-		v)	verbose=1
-			;;
-		c)	commit=$OPTARG
-			;;
-		m)      export MACHINE=$OPTARG
-			;;
-		j)	pmake=$OPTARG
-			;;
-		t)	export BB_NUMBER_THREADS=$OPTARG
-			;;
+cherrypicks=
+while getopts "hvc:m:j:t:i:d:p:" opt; do
+        case $opt in
+                h)      usage
+                        exit 0
+                        ;;
+                v)      verbose=1
+                        ;;
+                c)      commit=$OPTARG
+                        ;;
+                m)      export MACHINE=$OPTARG
+                        ;;
+                j)      pmake=$OPTARG
+                        ;;
+                t)      export BB_NUMBER_THREADS=$OPTARG
+                        ;;
                 i)      IMAGE=$OPTARG
                         ;;
                 d)      dldir=$OPTARG
                         ;;
-		*)	usage
-			exit 1
-			;;			
-	esac
+                p)      cherrypicks="$cherrypicks $OPTARG"
+                        ;;
+                *)      usage
+                        exit 1
+                        ;;                      
+        esac
 done
 
 
@@ -113,6 +118,12 @@ if [ -n "$commit" ]; then
             git pull > /dev/null 2>&1
 fi
 
+if [ -n "$cherrypicks" ]; then
+    for c in $cherrypicks; do
+        git cherry-pick $c
+    done
+fi
+
 rev=$(git rev-parse --short HEAD)  || exit 1
 OUTDIR="$clonedir/build-perf-test/results-$rev-`date "+%Y%m%d%H%M%S"`"
 BUILDDIR="$OUTDIR/build"
@@ -176,7 +187,7 @@ bbtime () {
         TIMES[(( time_count++ ))]="$t"
     else
         log "Exit status was non-zero. Exit..."
-        exit $ret 
+        #exit $ret 
     fi
     
     #time by default overwrites the output file and we  want to keep the results
@@ -269,8 +280,8 @@ bbtime "virtual/kernel"
 test1_p3 () {
 log "Running Test 1, part 3/3: Build $IMAGE w/o sstate and report size of tmp/dir with rm_work enabled"
 echo "INHERIT += \"rm_work\"" >> conf/local.conf
-do_rmtmp
-do_rmsstate
+#do_rmtmp
+#do_rmsstate
 do_sync
 bbtime "$IMAGE"
 sed -i 's/INHERIT += \"rm_work\"//' conf/local.conf
@@ -303,6 +314,9 @@ test2
 
 log "All done"
 
+do_rmtmp
+do_rmsstate
+
 # if we got til here write to global results
 echo "$rev" >> $globalres
 for i in "${TIMES[@]}"; do
-- 
1.8.1.4



