Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 05EC971234
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4cdjr013736
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:39 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:39 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:11 -0400
Message-ID: <a5f1e8e402e65fbceb8b3085d9c73b8bd28f7bb0.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/18] kernel-yocto: use show-ref instead of branch -a
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:40 -0000
Content-Type: text/plain

It's better to check a branches existence via show-ref versus the end
user branch commands. So we make the switch.

Also as part of this change, we move the conversion of remote branches
to local branches above the meta branch checking. This is required to
ensure that the branch is local for the show-ref check.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 0ac1572471bc..9209f423cff1 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -200,11 +200,20 @@ do_kernel_checkout() {
 	fi
 	# end debare
 
+	# convert any remote branches to local tracking ones
+	for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
+		b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
+		git show-ref --quiet --verify -- "refs/heads/$b"
+		if [ $? -ne 0 ]; then
+			git branch $b $i > /dev/null
+		fi
+	done
+
        	# If KMETA is defined, the branch must exist, but a machine branch
 	# can be missing since it may be created later by the tools.
 	if [ -n "${KMETA}" ]; then
-		git branch -a --no-color | grep -q ${KMETA}
-		if [ $? -ne 0 ]; then
+		git show-ref --quiet --verify -- "refs/heads/${KMETA}"
+		if [ $? -eq 1 ]; then
 			echo "ERROR. The branch '${KMETA}' is required and was not"
 			echo "found. Ensure that the SRC_URI points to a valid linux-yocto"
 			echo "kernel repository"
@@ -214,15 +223,6 @@ do_kernel_checkout() {
 	
 	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
 
-	# convert any remote branches to local tracking ones
-	for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
-		b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
-		git show-ref --quiet --verify -- "refs/heads/$b"
-		if [ $? -ne 0 ]; then
-			git branch $b $i > /dev/null
-		fi
-	done
-
 	# Create a working tree copy of the kernel by checking out a branch
 	git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
 	if [ $? -eq 0 ]; then
-- 
1.8.1.2


