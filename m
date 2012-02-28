Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S2USt-0005j1-IF
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 22:20:07 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1SLBZEW028690;
	Tue, 28 Feb 2012 13:11:36 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 28 Feb 2012 16:09:58 -0500
Message-Id: <4851737d22f645f8a5ccfd798939d48d66267bd5.1330463101.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1330463101.git.bruce.ashfield@windriver.com>
References: <cover.1330463101.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1330463101.git.bruce.ashfield@windriver.com>
References: <cover.1330463101.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/3] linux-yocto: make kernel_checkout reentrant
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
X-List-Received-Date: Tue, 28 Feb 2012 21:20:08 -0000

The steps in do_kernel_checkout modify the source tree in WORKDIR.
If it is called multiple times, or interrupted, the tree is left
in an inconsistent state.

This change adds protections around branch names, and around the
manipulations of directories to ensure that it is safe to call
at any point.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |   33 ++++++++++++++++++++-------------
 1 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 5f3cb63..187e3cc 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -139,17 +139,17 @@ do_patch() {
 }
 
 do_kernel_checkout() {
-	# we build out of {S}, so ensure that ${S} is clean and present
-	rm -rf ${S}
-	mkdir -p ${S}/.git
-
 	set +e
 
 	# A linux yocto SRC_URI should use the bareclone option. That
 	# ensures that all the branches are available in the WORKDIR version
 	# of the repository. If it wasn't passed, we should detect it, and put
 	# out a useful error message
-	if [ -d "${WORKDIR}/git/.git" ]; then
+	if [ -d "${WORKDIR}/git/" ] && [ -d "${WORKDIR}/git/.git" ]; then
+		# we build out of {S}, so ensure that ${S} is clean and present
+		rm -rf ${S}
+		mkdir -p ${S}/.git
+
 		echo "WARNING. ${WORKDIR}/git is not a bare clone."
 		echo "Ensure that the SRC_URI includes the 'bareclone=1' option."
 		
@@ -158,12 +158,14 @@ do_kernel_checkout() {
 		mv ${WORKDIR}/git/.git ${S}
 		rm -rf ${WORKDIR}/git/
 		cd ${S}
-		git branch -a | grep -q ${KMETA}
-		if [ $? -ne 0 ]; then
-			echo "ERROR. The branch '${KMETA}' is required and was not"
-			echo "found. Ensure that the SRC_URI points to a valid linux-yocto"
-			echo "kernel repository"
-			exit 1
+		if [ -n "${YOCTO_KERNEL_META_DATA}" ] && [ -n "${KMETA}" ]; then
+			git branch -a | grep -q ${KMETA}
+			if [ $? -ne 0 ]; then
+				echo "ERROR. The branch '${KMETA}' is required and was not"
+				echo "found. Ensure that the SRC_URI points to a valid linux-yocto"
+				echo "kernel repository"
+				exit 1
+			fi
 		fi
 	 	if [ -z "${YOCTO_KERNEL_EXTERNAL_BRANCH}" ] && [ -n "${KBRANCH}" ] ; then
 			git branch -a | grep -q ${KBRANCH}
@@ -174,10 +176,15 @@ do_kernel_checkout() {
 				exit 1
 			fi
 		fi
-	else
+	fi
+	if [ -d "${WORKDIR}/git/" ] && [ ! -d "${WORKDIR}/git/.git" ]; then
+		# we build out of {S}, so ensure that ${S} is clean and present
+		rm -rf ${S}
+		mkdir -p ${S}/.git
+
 		mv ${WORKDIR}/git/* ${S}/.git
 		rm -rf ${WORKDIR}/git/
-		cd ${S}
+		cd ${S}	
 		git config core.bare false
 	fi
 	# end debare
-- 
1.7.0.4



