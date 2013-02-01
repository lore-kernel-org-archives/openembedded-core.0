Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1U1HRm-0004lg-2E
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 15:18:32 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r11E2fTS000226;
	Fri, 1 Feb 2013 06:02:44 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  1 Feb 2013 09:02:38 -0500
Message-Id: <64eb2b4f4387a4781606f0713ae224d54430f824.1359726620.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359726620.git.bruce.ashfield@windriver.com>
References: <cover.1359726620.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1359726620.git.bruce.ashfield@windriver.com>
References: <cover.1359726620.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] kernel-yocto/linux-yocto-custom: support low bandwidth options
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
X-List-Received-Date: Fri, 01 Feb 2013 14:18:55 -0000

To support configurations where active development is not being done within
the oe/bitbake build environment and restricted bandwidth situations, this
commit allows the SRC_URI to point to a kernel tgz instead of a full git
repository.

Outside of the upstream tgz instead of a kernel git repository, the
restrictions, config and patch process is the same as any linux-yocto-custom
recipe.

An example linux-yocto-custom based recipe would have a configuration like
this to build the 3.7 kernel, using an externally supplied config, from the
3.7 tgz:

  SRC_URI = "http://kernel.org/pub/linux/kernel/v3.0/linux-3.7.tar.bz2"
  PV = "3.7"
  S = "${WORKDIR}/linux-3.7"
  SRC_URI[md5sum] = "5323f3faadd051e83af605a63be5ea2e"
  SRC_URI[sha256sum] = "dc08d87a579fe2918362e6666e503a95a76296419195cb499aa9dd4dbe171a9e"

[YOCTO #2686]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |   34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 92ede6a..8494c16 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -158,22 +158,10 @@ do_kernel_checkout() {
 		mkdir -p ${S}
 		
 		# We can fix up the kernel repository even if it wasn't a bare clone.
-		# If KMETA is defined, the branch must exist, but a machine branch
-		# can be missing since it may be created later by the tools.
 		mv ${WORKDIR}/git/.git ${S}
 		rm -rf ${WORKDIR}/git/
 		cd ${S}
-		if [ -n "${KMETA}" ]; then
-			git branch -a | grep -q ${KMETA}
-			if [ $? -ne 0 ]; then
-				echo "ERROR. The branch '${KMETA}' is required and was not"
-				echo "found. Ensure that the SRC_URI points to a valid linux-yocto"
-				echo "kernel repository"
-				exit 1
-			fi
-		fi
-	fi
-	if [ -d "${WORKDIR}/git/" ] && [ ! -d "${WORKDIR}/git/.git" ]; then
+	elif [ -d "${WORKDIR}/git/" ] && [ ! -d "${WORKDIR}/git/.git" ]; then
 		# we build out of {S}, so ensure that ${S} is clean and present
 		rm -rf ${S}
 		mkdir -p ${S}/.git
@@ -182,9 +170,29 @@ do_kernel_checkout() {
 		rm -rf ${WORKDIR}/git/
 		cd ${S}	
 		git config core.bare false
+	else
+	        # We have no git repository at all. To support low bandwidth options
+		# for building the kernel, we'll just convert the tree to a git repo
+	        # and let the rest of the process work unchanged
+	        cd ${S}
+		git init
+		git add .
+		git commit -q -m "baseline commit: creating repo for ${PN}-${PV}"
 	fi
 	# end debare
 
+       	# If KMETA is defined, the branch must exist, but a machine branch
+	# can be missing since it may be created later by the tools.
+	if [ -n "${KMETA}" ]; then
+		git branch -a | grep -q ${KMETA}
+		if [ $? -ne 0 ]; then
+			echo "ERROR. The branch '${KMETA}' is required and was not"
+			echo "found. Ensure that the SRC_URI points to a valid linux-yocto"
+			echo "kernel repository"
+			exit 1
+		fi
+	fi
+
 	# convert any remote branches to local tracking ones
 	for i in `git branch -a | grep remotes | grep -v HEAD`; do
 		b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
-- 
1.7.10.4



