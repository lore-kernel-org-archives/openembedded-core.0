Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T8scs-0008Pk-FF
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 14:53:07 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q84Cecwr008783;
	Tue, 4 Sep 2012 05:40:41 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  4 Sep 2012 08:40:34 -0400
Message-Id: <eab6720d39d71c9e80edbbb103d29c1f8daca5aa.1346762109.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346762109.git.bruce.ashfield@windriver.com>
References: <cover.1346762109.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1346762109.git.bruce.ashfield@windriver.com>
References: <cover.1346762109.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 3/6] linux-yocto: check for bad SRCREV before branch checks
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
X-List-Received-Date: Tue, 04 Sep 2012 12:53:07 -0000

do_validate_branches ensures that the desired SRCREV is at
the tip of every branch that contains the revision. To do this,
it looks for containing branches and processes them.

This processing was mistakenly placed before the check for an
invalid SRCREV, hence a git error message is seen in the log
if a bad SRCREV is used, rather than a clear message.

reordering the checks, and fixing a check for master, ensures
that clear messages are generated in all cases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 45918d6..724e5cd 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -258,12 +258,6 @@ do_validate_branches() {
 		return
 	fi
 
-	containing_branches=`git branch --contains $target_branch_head | sed 's/^..//'`
-	if [ -z "$containing_branches" ]; then
-		echo "ERROR: SRCREV was set to \"$target_branch_head\", but no branches"
-		echo "       contain this commit"
-		exit 1
-	fi
 	ref=`git show ${target_branch_head} 2>&1 | head -n1 || true`
 	if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
 	    echo "ERROR ${target_branch_head} is not a valid commit ID."
@@ -271,6 +265,13 @@ do_validate_branches() {
 	    exit 1
 	fi
 
+	containing_branches=`git branch --contains $target_branch_head | sed 's/^..//'`
+	if [ -z "$containing_branches" ]; then
+		echo "ERROR: SRCREV was set to \"$target_branch_head\", but no branches"
+		echo "       contain this commit"
+		exit 1
+	fi
+
 	# force the SRCREV in each branch that contains the specified
 	# SRCREV (if it isn't the current HEAD of that branch)
 	git checkout -q master
@@ -278,7 +279,7 @@ do_validate_branches() {
 		branch_head=`git show-ref -s --heads ${b}`		
 		if [ "$branch_head" != "$target_branch_head" ]; then
 			echo "[INFO] Setting branch $b to ${target_branch_head}"
-			if [ "$b" == "master" ]; then
+			if [ "$b" = "master" ]; then
 				git reset --hard $target_branch_head > /dev/null
 			else
 				git branch -D $b > /dev/null
-- 
1.7.5.4



