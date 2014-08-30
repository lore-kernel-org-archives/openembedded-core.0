Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6F86FEA9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 04:38:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7U4cTGC007779
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Aug 2014 21:38:29 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 29 Aug 2014 21:38:29 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 30 Aug 2014 00:38:08 -0400
Message-ID: <11f0bd4475347fae75cfcb0c97f90d3cc38ed0f7.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/18] kernel-yocto: remove branch existence checking in do_validate_branches
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
X-List-Received-Date: Sat, 30 Aug 2014 04:38:29 -0000
Content-Type: text/plain

Now that the fetcher will enforce branch existence, we no longer need to
confirm that a branch exists, and that it was the branch requested to
be built.

We know the branch exists and we'll confirm that the specified SRCREV
is going to be built after we've patched the tree.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 3bef841ae80a..d51748e556ef 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -309,13 +309,19 @@ python do_kernel_configcheck() {
 # their SRCREV values. If they are NOT on the right commits, the branches
 # are corrected to the proper commit.
 do_validate_branches() {
+	set +e
 	cd ${S}
 	export KMETA=${KMETA}
 
 	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
 	machine_srcrev="${SRCREV_machine}"
 
-	set +e
+	# if the machine branch doesn't exist, lets build master
+	git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
+	if [ $? -eq 1 ]; then
+		machine_branch = "master"
+	fi
+
 	# if SRCREV is AUTOREV it shows up as AUTOINC there's nothing to
 	# check and we can exit early
 	if [ "${machine_srcrev}" = "AUTOINC" ] || [ "${machine_srcrev}" = "INVALID" ] ||
@@ -324,19 +330,6 @@ do_validate_branches() {
 		return
 	fi
 
-	# If something other than the default branch was requested, it must
-	# exist in the tree, and it's a hard error if it wasn't
-	git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
-	if [ $? -eq 1 ]; then
-		if [ -n "${KBRANCH_DEFAULT}" ] && 
-                      [ "${machine_branch}" != "${KBRANCH_DEFAULT}" ]; then
-			echo "ERROR: branch ${machine_branch} was set for kernel compilation, "
-			echo "       but it does not exist in the kernel repository."
-			echo "       Check the value of KBRANCH and ensure that it describes"
-			echo "       a valid banch in the source kernel repository"
-			exit 1
-		fi
-	fi
 
 	git cat-file -t ${machine_srcrev} > /dev/null
 	if [ if $? -ne 0 ]; then
@@ -369,13 +362,7 @@ do_validate_branches() {
 		fi
 	fi
 
-	git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
-	if [ $? -eq 0 ]; then
-		# restore the branch for builds
-		git checkout -q -f ${machine_branch}
-        else
-	        git checkout -q master
-	fi
+	git checkout -q -f ${machine_branch}
 }
 
 # Many scripts want to look in arch/$arch/boot for the bootable
-- 
1.8.1.2


