Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 508D8770A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 08:36:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3T8anhA026048
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 01:36:49 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 29 Apr 2016 01:36:48 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Apr 2016 04:36:45 -0400
Message-ID: <8f633600aeaa420d61f5849365bafaf863d6c8ba.1461918435.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1461918435.git.dengke.du@windriver.com>
References: <cover.1461918435.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] lttng-tools: filter random filename of ptest output
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
X-List-Received-Date: Fri, 29 Apr 2016 08:36:52 -0000
Content-Type: text/plain

When run the ptest of lttng-tools, it produced many random filename
when the tests passed, the output confused QA analysis, so we need
to filter the ptest output if tests passed and add up the passed and
failed tests.

NOTE:The tests invoked the run.sh twice, so it output like this:
...
FAIL:...
unit_tests statistics
total pass: 133 tests passed!
total fail: 5 tests failed!
...
FAIL:...
fast_regression statistics
total pass: 1904 tests passed!
total fail: 202 tests failed!

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ...ls-filter-random-filename-of-tests-output.patch | 55 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-lttng-tools-filter-random-filename-of-tests-output.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-lttng-tools-filter-random-filename-of-tests-output.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-lttng-tools-filter-random-filename-of-tests-output.patch
new file mode 100644
index 0000000..fed5a2f
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-lttng-tools-filter-random-filename-of-tests-output.patch
@@ -0,0 +1,55 @@
+From b9744428d6dfb1cba7b6e3fdbf0613977914b12f Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Fri, 29 Apr 2016 03:25:58 -0400
+Subject: [PATCH] lttng-tools: filter random filename of tests output
+
+Show the failed tests, filter the random filename when the test
+passed, add up the result.
+
+Upstream-Status: Pending
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ tests/run.sh | 25 +++++++++++++++++++++++--
+ 1 file changed, 23 insertions(+), 2 deletions(-)
+
+diff --git a/tests/run.sh b/tests/run.sh
+index 6455359..9080afc 100755
+--- a/tests/run.sh
++++ b/tests/run.sh
+@@ -17,9 +17,30 @@
+ # Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
+ #
+ 
++# Define two variable to store the passed and failed result
++pass_count=0
++fail_count=0
++
+ [ -z "$1" ] && echo "Error: No testlist. Please specify a testlist to run." && exit 1
+ 
+-prove --merge -v --exec '' - < $1 | sed \
++# Using a while loop to add up the passed and failed result, we use Here Strings
++# "<<<" in bash in order to redirect the test output to the while loop. If put the
++# test output as a pipeline, the while loop will run in subshell, we can't get the
++# pass_count and fail_count when the subshell exit. 
++while read line
++do
++	if [[ $line == "FAIL"* ]]; then
++		echo $line;((fail_count=fail_count+1))
++	fi  
++	if [[ $line == "PASS"* ]]; then
++		((pass_count=pass_count+1))
++	fi  
++done <<< "$(prove --merge -v --exec '' - < $1 | sed \
+   -e 's|^ok \(.*\)|PASS: \1|' \
+   -e 's|^not ok \(.*\)|FAIL: \1|' \
+-  | egrep -h 'PASS|FAIL'
++  | egrep -h 'PASS|FAIL')"
++
++# Add up the result and output the passed and failed tests
++echo "$1 statistics"
++echo "total pass: $pass_count tests passed!"
++echo "total fail: $fail_count tests failed!"
+-- 
+2.8.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index 8bd0989..3ce4a9e 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.7 \
            file://Revert-Build-look-for-python-3.0-when-building-pytho.patch \
            file://stop-using-SIGUNUSED.patch \
            file://runtest-2.4.0.patch \
+           file://0001-lttng-tools-filter-random-filename-of-tests-output.patch \
            file://run-ptest"
 
 S = "${WORKDIR}/git"
-- 
2.8.1


