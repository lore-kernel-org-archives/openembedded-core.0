Return-Path: <matt@arkanian.console-pimps.org>
Received: from arkanian.console-pimps.org (arkanian.console-pimps.org
	[212.110.184.194])
	by mail.openembedded.org (Postfix) with ESMTP id D1B3D6E7D3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 11:04:48 +0000 (UTC)
Received: by arkanian.console-pimps.org (Postfix, from userid 1002)
	id 15E5D6C076; Thu,  6 Mar 2014 11:04:49 +0000 (GMT)
Received: from localhost (unknown [94.8.38.236])
	by arkanian.console-pimps.org (Postfix) with ESMTPSA id 84B7C6C055;
	Thu,  6 Mar 2014 11:04:45 +0000 (GMT)
From: Matt Fleming <matt@console-pimps.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 11:04:34 +0000
Message-Id: <1394103874-32687-1-git-send-email-matt@console-pimps.org>
X-Mailer: git-send-email 1.8.5.3
Cc: Matt Fleming <matt.fleming@intel.com>
Subject: [PATCH v2] kernel-yocto: Disable ANSI escape codes from git branch
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
X-List-Received-Date: Thu, 06 Mar 2014 11:04:50 -0000

From: Matt Fleming <matt.fleming@intel.com>

'git branch' may use ANSI escape codes in its output (to provide colour)
which doesn't play well with commands expecting pure plain text, e.g.

    fatal: '^[[31mmaster^[[m' is not a valid branch name.

Use the --no-color option to ensure all branch names are plain text.

Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Matt Fleming <matt.fleming@intel.com>
---

v2: Make the minimum change necessary to disable the escape codes per
    Bruce's suggestion.

 meta/classes/kernel-yocto.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index fb8e04e..7913dd8 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -196,7 +196,7 @@ do_kernel_checkout() {
        	# If KMETA is defined, the branch must exist, but a machine branch
 	# can be missing since it may be created later by the tools.
 	if [ -n "${KMETA}" ]; then
-		git branch -a | grep -q ${KMETA}
+		git branch -a --no-color | grep -q ${KMETA}
 		if [ $? -ne 0 ]; then
 			echo "ERROR. The branch '${KMETA}' is required and was not"
 			echo "found. Ensure that the SRC_URI points to a valid linux-yocto"
@@ -214,7 +214,7 @@ do_kernel_checkout() {
 	fi
 
 	# convert any remote branches to local tracking ones
-	for i in `git branch -a | grep remotes | grep -v HEAD`; do
+	for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
 		b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
 		git show-ref --quiet --verify -- "refs/heads/$b"
 		if [ $? -ne 0 ]; then
-- 
1.8.5.3


