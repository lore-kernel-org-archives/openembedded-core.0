Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T4Oue-0001kB-M1
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 06:20:57 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7N48lSm003086;
	Wed, 22 Aug 2012 21:08:48 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 23 Aug 2012 00:08:45 -0400
Message-Id: <46e45318d189cf9846e2ee3bf3e7bc3a881a0ffe.1345694632.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1345694632.git.bruce.ashfield@windriver.com>
References: <cover.1345694632.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1345694632.git.bruce.ashfield@windriver.com>
References: <cover.1345694632.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/2] kernel-yocto: set master branch to a defined SRCREV
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
X-List-Received-Date: Thu, 23 Aug 2012 04:20:57 -0000

To support custom repositories that set a SRCREV and that only have
a single master branch, do_validate_branches needs a special case
for 'master'. We can't delete and recreate the branch, since you
cannot delete the current branch, instead we must reset the branch
to the proper SRCREV.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |   12 ++++++++----
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index bb0915c..3dcc8b5 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -274,11 +274,15 @@ do_validate_branches() {
 	# SRCREV (if it isn't the current HEAD of that branch)
 	git checkout -q master
 	for b in $containing_branches; do
-		branch_head=`git show-ref -s --heads ${b}`
+		branch_head=`git show-ref -s --heads ${b}`		
 		if [ "$branch_head" != "$target_branch_head" ]; then
-			echo "[INFO] Setting branch $b to ${target_branch_head}"	      
-			git branch -D $b > /dev/null
-			git branch $b $target_branch_head > /dev/null
+			echo "[INFO] Setting branch $b to ${target_branch_head}"
+			if [ "$b" == "master" ]; then
+				git reset --hard $target_branch_head > /dev/null
+			else
+				git branch -D $b > /dev/null
+				git branch $b $target_branch_head > /dev/null
+			fi
 		fi
 	done
 
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 974b86e..0ff8b19 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "33068f21169b327c64ac7e957fe9d89c391897a3"
+SRCREV = "7d936da57db11f1114f3860e4fcc15221e796275"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.5.4



