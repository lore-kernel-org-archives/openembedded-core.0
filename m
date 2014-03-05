Return-Path: <matt@arkanian.console-pimps.org>
Received: from arkanian.console-pimps.org (arkanian.console-pimps.org
	[212.110.184.194])
	by mail.openembedded.org (Postfix) with ESMTP id E90426BBDC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 16:49:56 +0000 (UTC)
Received: by arkanian.console-pimps.org (Postfix, from userid 1002)
	id 2744E6C076; Wed,  5 Mar 2014 16:49:57 +0000 (GMT)
Received: from localhost (unknown [94.8.38.236])
	by arkanian.console-pimps.org (Postfix) with ESMTPSA id D0DE36C055;
	Wed,  5 Mar 2014 16:49:53 +0000 (GMT)
From: Matt Fleming <matt@console-pimps.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 16:49:51 +0000
Message-Id: <1394038191-26474-1-git-send-email-matt@console-pimps.org>
X-Mailer: git-send-email 1.8.5.3
Cc: Matt Fleming <matt.fleming@intel.com>
Subject: [PATCH] kernel-yocto: Inspect remote branches with git ls-remote
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
X-List-Received-Date: Wed, 05 Mar 2014 16:50:01 -0000

From: Matt Fleming <matt.fleming@intel.com>

'git branch' may use ANSI escape codes in its output (to provide colour)
which doesn't play well with commands expecting pure plain text, e.g.

    fatal: '^[[31mmaster^[[m' is not a valid branch name.

Furthermore, the output of 'git branch' is subject to change and trying
to parse it could potentially lead to breakage in the future.

Signed-off-by: Matt Fleming <matt.fleming@intel.com>
---
 meta/classes/kernel-yocto.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index fb8e04e..1115056 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -196,7 +196,7 @@ do_kernel_checkout() {
        	# If KMETA is defined, the branch must exist, but a machine branch
 	# can be missing since it may be created later by the tools.
 	if [ -n "${KMETA}" ]; then
-		git branch -a | grep -q ${KMETA}
+		git ls-remote --heads 2>/dev/null | awk '{print $NF}' | grep -q ${KMETA}
 		if [ $? -ne 0 ]; then
 			echo "ERROR. The branch '${KMETA}' is required and was not"
 			echo "found. Ensure that the SRC_URI points to a valid linux-yocto"
@@ -214,11 +214,11 @@ do_kernel_checkout() {
 	fi
 
 	# convert any remote branches to local tracking ones
-	for i in `git branch -a | grep remotes | grep -v HEAD`; do
-		b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
-		git show-ref --quiet --verify -- "refs/heads/$b"
+	for i in `git ls-remote --heads 2>/dev/null | awk '{print $NF}'`; do
+		b=`echo $i | sed 's%refs/heads/%%'`;
+		git show-ref --quiet --verify -- "$i"
 		if [ $? -ne 0 ]; then
-			git branch $b $i > /dev/null
+			git branch $b remotes/origin/$b > /dev/null
 		fi
 	done
 
-- 
1.8.5.3


