Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8789471A3A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 09:01:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2017 02:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,287,1491289200"; d="scan'208";a="1126344792"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2017 02:01:31 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 May 2017 12:01:30 +0300
Message-Id: <20170504090130.28944-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] build-perf-test-wrapper.sh: support uploading test reports
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
X-List-Received-Date: Thu, 04 May 2017 09:01:31 -0000

Implement new '-R' command line option for specifying an rsync
destination where to upload test reports.

[YOCTO #5049]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test-wrapper.sh | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/scripts/contrib/build-perf-test-wrapper.sh b/scripts/contrib/build-perf-test-wrapper.sh
index 3da32532be..19bee1dd03 100755
--- a/scripts/contrib/build-perf-test-wrapper.sh
+++ b/scripts/contrib/build-perf-test-wrapper.sh
@@ -35,6 +35,7 @@ Optional arguments:
   -C GIT_REPO       commit results into Git
   -E EMAIL_ADDR     send email report
   -P GIT_REMOTE     push results to a remote Git repository
+  -R DEST           rsync reports to a remote destination
   -w WORK_DIR       work dir for this script
                     (default: GIT_TOP_DIR/build-perf-test)
   -x                create xml report (instead of json)
@@ -50,7 +51,7 @@ get_os_release_var () {
 commitish=""
 oe_build_perf_test_extra_opts=()
 oe_git_archive_extra_opts=()
-while getopts "ha:c:C:E:P:w:x" opt; do
+while getopts "ha:c:C:E:P:R:w:x" opt; do
     case $opt in
         h)  usage
             exit 0
@@ -65,6 +66,8 @@ while getopts "ha:c:C:E:P:w:x" opt; do
             ;;
         P)  oe_git_archive_extra_opts+=("--push" "$OPTARG")
             ;;
+        R)  rsync_dst="$OPTARG"
+            ;;
         w)  base_dir=`realpath -s "$OPTARG"`
             ;;
         x)  oe_build_perf_test_extra_opts+=("--xml")
@@ -132,6 +135,11 @@ if [ -n "$commitish" ]; then
     git reset --hard $commit > /dev/null
 fi
 
+# Determine name of the current branch
+branch=`git symbolic-ref HEAD 2> /dev/null`
+# Strip refs/heads/
+branch=${branch:11}
+
 # Setup build environment
 if [ -z "$base_dir" ]; then
     base_dir="$git_topdir/build-perf-test"
@@ -187,13 +195,25 @@ if [ -n "$results_repo" ]; then
         "${oe_git_archive_extra_opts[@]}" \
         "$results_dir"
 
+    # Generate test reports
+    sanitized_branch=`echo $branch | tr / _`
+    report_txt=`hostname`_${sanitized_branch}_${machine}.txt
+    report_html=`hostname`_${sanitized_branch}_${machine}.html
+    echo -e "\nGenerating test report"
+    oe-build-perf-report -r "$results_repo" > $report_txt
+    oe-build-perf-report -r "$results_repo" --html > $report_html
+
     # Send email report
     if [ -n "$email_to" ]; then
-        echo -e "\nEmailing test report"
+        echo "Emailing test report"
         os_name=`get_os_release_var PRETTY_NAME`
-        oe-build-perf-report -r "$results_repo" > report.txt
-        oe-build-perf-report -r "$results_repo" --html > report.html
-        "$script_dir"/oe-build-perf-report-email.py --to "$email_to" --subject "Build Perf Test Report for $os_name" --text report.txt --html report.html "${OE_BUILD_PERF_REPORT_EMAIL_EXTRA_ARGS[@]}"
+        "$script_dir"/oe-build-perf-report-email.py --to "$email_to" --subject "Build Perf Test Report for $os_name" --text $report_txt --html $report_html "${OE_BUILD_PERF_REPORT_EMAIL_EXTRA_ARGS[@]}"
+    fi
+
+    # Upload report files, unless we're on detached head
+    if [ -n "$rsync_dst" -a -n "$branch" ]; then
+        echo "Uploading test report"
+        rsync $report_txt $report_html $rsync_dst
     fi
 fi
 
-- 
2.12.0


