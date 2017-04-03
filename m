Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id AF86877C85
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 15:58:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 03 Apr 2017 08:58:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,271,1486454400"; d="scan'208";a="841292466"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2017 08:58:47 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 18:58:39 +0300
Message-Id: <20170403155839.14067-8-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170403155839.14067-1-markus.lehtonen@linux.intel.com>
References: <20170403155839.14067-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 7/7] build-perf-test-wrapper.sh: support sending email reports
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
X-List-Received-Date: Mon, 03 Apr 2017 15:58:46 -0000

Add new '-E' command line option for sending an email report to
specified recipient.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index c847197..49bc298 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -19,6 +19,7 @@
 # oe-build-perf-test and archives the results.
 
 script=`basename $0`
+script_dir=$(realpath $(dirname $0))
 archive_dir=~/perf-results/archives
 
 usage () {
@@ -32,6 +33,7 @@ Optional arguments:
   -c COMMITISH      test (checkout) this commit, <branch>:<commit> can be
                     specified to test specific commit of certain branch
   -C GIT_REPO       commit results into Git
+  -E EMAIL_ADDR     send email report
   -P GIT_REMOTE     push results to a remote Git repository
   -w WORK_DIR       work dir for this script
                     (default: GIT_TOP_DIR/build-perf-test)
@@ -39,12 +41,16 @@ Optional arguments:
 EOF
 }
 
+get_os_release_var () {
+    ( source /etc/os-release; eval echo '$'$1 )
+}
+
 
 # Parse command line arguments
 commitish=""
 oe_build_perf_test_extra_opts=()
 oe_git_archive_extra_opts=()
-while getopts "ha:c:C:P:w:x" opt; do
+while getopts "ha:c:C:E:P:w:x" opt; do
     case $opt in
         h)  usage
             exit 0
@@ -55,6 +61,8 @@ while getopts "ha:c:C:P:w:x" opt; do
             ;;
         C)  results_repo=`realpath -s "$OPTARG"`
             ;;
+        E)  email_to="$OPTARG"
+            ;;
         P)  oe_git_archive_extra_opts+=("--push" "$OPTARG")
             ;;
         w)  base_dir=`realpath -s "$OPTARG"`
@@ -178,8 +186,18 @@ if [ -n "$results_repo" ]; then
         --notes "buildstats/{branch_name}" "$results_dir/buildstats.json" \
         "${oe_git_archive_extra_opts[@]}" \
         "$results_dir"
+
+    # Send email report
+    if [ -n "$email_to" ]; then
+        echo -e "\nEmailing test report"
+        os_name=`get_os_release_var PRETTY_NAME`
+        oe-build-perf-report -r "$results_repo" > report.txt
+        oe-build-perf-report -r "$results_repo" --html > report.html
+        "$script_dir"/oe-build-perf-report-email.py --to "$email_to" --subject "Build Perf Test Report for $os_name" --text report.txt --html report.html
+    fi
 fi
 
+
 echo -ne "\n\n-----------------\n"
 echo "Global results file:"
 echo -ne "\n"
-- 
2.10.2


