Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S0kZ4-0001zD-BY
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 03:07:20 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1O1wnI8028989;
	Thu, 23 Feb 2012 17:58:50 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 23 Feb 2012 20:58:47 -0500
Message-Id: <f7611220b2129a16600b436de649fb1cac26bbb5.1330048310.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1330048310.git.bruce.ashfield@windriver.com>
References: <cover.1330048310.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1330048310.git.bruce.ashfield@windriver.com>
References: <cover.1330048310.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto: improve checkout error handling and reporting
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 02:07:20 -0000

The typical workflow for linux-yocto simply uses a remote
upstream repository (Whether it is mirrored or not), and in this
case there are no issues with consistency in the format of the
resository that is unpacked into the WORKDIR.

When working with a local linux-yocto repository for kernel
development the remote vs local branches is not always consistent
between repositories.

The suggested/documented workflow has always been to use a
bare clone of linux-yocto, and use a second working tree repository
for development. Changes flow from the working tree to the bare
clone and then into the working directory for build. A common
mistake that happens with this workflow is that the non-bare,
working repository is used instead of the bare clone version.

If a non-bare repository is reference by the SRC_URI, then the
branches that are fetched into WORKDIR are not consitent. If the
MACHINE and META branches are not present, cryptic build errors
will result.

To solve this problem, the checkout code has been changed in
several ways:

  - works with a newly proposed 'bareclone' option to bitbake
  - detects if a bareclone is present in WORKDIR or not and
    adjustst the checkout accordingly.
  - if a non-bare clone is detected, machine and meta branches
    are checked. If they are not present, or can't be created
    a clear error message is produced
  - instead of manipulating the refs directly in the git tree,
    local tracking branches are (quietly) created for remote
    branches. Enabling a better workflow in the WORKDIR kernel
    repository.

This has been tested with linux-yocto remote upstreams, local
bare and non-bare respositories. All builds succeed or fail
with clear error messages.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |   72 +++++++++++++++++++++++++------------
 1 files changed, 49 insertions(+), 23 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 3130bf4..50ff555 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -139,33 +139,59 @@ do_patch() {
 }
 
 do_kernel_checkout() {
-	if [ -d ${WORKDIR}/git/.git/refs/remotes/origin ]; then
-		echo "Fixing up git directory for ${LINUX_KERNEL_TYPE}/${KMACHINE}"
-		rm -rf ${S}
-		mkdir ${S}
+	# we build out of {S}, so ensure that ${S} is clean and present
+	rm -rf ${S}
+	mkdir -p ${S}/.git
+
+	set +e
+
+	# A linux yocto SRC_URI should use the bareclone option. That
+	# ensures that all the branches are available in the WORKDIR version
+	# of the repository. If it wasn't passed, we should detect it, and put
+	# out a useful error message
+	if [ -d "${WORKDIR}/git/.git" ]; then
+		echo "WARNING. ${WORKDIR}/git is not a bare clone."
+		echo "Ensure that the SRC_URI includes the 'bareclone=1' option."
+		
+		# we can fix up the kernel repository, but at the least the meta
+		# branch must be present. The machine branch may be created later.
 		mv ${WORKDIR}/git/.git ${S}
-	
-		if [ -e ${S}/.git/packed-refs ]; then
-			cd ${S}
-			rm -f .git/refs/remotes/origin/HEAD
-IFS='
-';
-			for r in `git show-ref | grep remotes`; do
-				ref=`echo $r | cut -d' ' -f1`; 
-				b=`echo $r | cut -d' ' -f2 | sed 's%refs/remotes/origin/%%'`;
-				dir=`dirname $b`
-				mkdir -p .git/refs/heads/$dir
-				echo $ref > .git/refs/heads/$b
-			done
-			cd ..
-		else
-			cp -r ${S}/.git/refs/remotes/origin/* ${S}/.git/refs/heads
-			rmdir ${S}/.git/refs/remotes/origin
+		rm -rf ${WORKDIR}/git/
+		cd ${S}
+		git branch -a | grep -q ${KMETA}
+		if [ $? -ne 0 ]; then
+			echo "ERROR. The branch '${KMETA}' is required and was not"
+			echo "found. Ensure that the SRC_URI points to a valid linux-yocto"
+			echo "kernel repository"
+			exit 1
 		fi
+	 	if [ -z "${YOCTO_KERNEL_EXTERNAL_BRANCH}" ]; then
+			git branch -a | grep -q ${KBRANCH}
+			if [ $? -ne 0 ]; then
+				echo "ERROR. The branch '${KBRANCH}' is required and was not"
+				echo "found. Ensure that the SRC_URI points to a valid linux-yocto"
+				echo "kernel repository"
+				exit 1
+			fi
+		fi
+	else
+		mv ${WORKDIR}/git/* ${S}/.git
+		rm -rf ${WORKDIR}/git/
+		cd ${S}
+		git config core.bare false
 	fi
-	cd ${S}
+	# end debare
 
-	set +e
+	# convert any remote branches to local tracking ones
+	for i in `git branch -a | grep remotes | grep -v HEAD`; do
+		b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
+		git show-ref --quiet --verify -- "refs/heads/$b"
+		if [ $? -ne 0 ]; then
+			git branch $b $i > /dev/null
+		fi
+	done
+
+	# Create a working tree copy of the kernel by checkout out a branch
 	git show-ref --quiet --verify -- "refs/heads/${KBRANCH}"
 	if [ $? -eq 0 ]; then
 		# checkout and clobber and unimportant files
-- 
1.7.4.1



