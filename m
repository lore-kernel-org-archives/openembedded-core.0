Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QHqaU-0008Pu-Vp
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 06:54:55 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p454q5rJ013993;
	Wed, 4 May 2011 21:52:08 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  5 May 2011 00:53:22 -0400
Message-Id: <80845025999966db9efc4a67a7b4f1c7e8b74f5e.1304570401.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1304570401.git.bruce.ashfield@windriver.com>
References: <cover.1304570401.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1304570401.git.bruce.ashfield@windriver.com>
References: <cover.1304570401.git.bruce.ashfield@windriver.com>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org,
	poky@yoctoproject.org, saul.wold@intel.com
Subject: [PATCH 1/3] linux-yocto: apply meta data to external repos
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
X-List-Received-Date: Thu, 05 May 2011 04:54:55 -0000

To support quick uprev and testing, it is desireable to build
repositories that do not have embedded meta data. In this scenario
the meta data can be automatically created or provided externally.
This commit supports the first situation by detecting the lack
of meta data and then automatically creating a base set of meta
files.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |   27 +++++++++++++++----
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index fc9f3a7..78a1309 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -66,8 +66,15 @@ IFS='
 	fi
 	cd ${S}
 
-	# checkout and clobber and unimportant files
-	git checkout -f ${KBRANCH}
+	set +e
+	git show-ref --quiet --verify -- "refs/heads/${KBRANCH}"
+	if [ $? -eq 0 ]; then
+		# checkout and clobber and unimportant files
+		git checkout -f ${KBRANCH}
+	else
+		echo "Not checking out ${KBRANCH}, it will be created later"
+		git checkout -f master
+	fi
 }
 do_kernel_checkout[dirs] = "${S}"
 
@@ -105,21 +112,29 @@ python do_kernel_configcheck() {
     bb.plain( "%s" % result )
 }
 
+# overrides the base kernel_do_configure, since we don't want all the
+# defconfig processing in there
+kernel_do_configure() {
+        yes '' | oe_runmake oldconfig
+}
+
+
 # Ensure that the branches (BSP and meta) are on the locatios specified by
 # their SRCREV values. If they are NOT on the right commits, the branches
 # are reset to the correct commit.
 do_validate_branches() {
 	cd ${S}
- 	branch_head=`git show-ref -s --heads ${KBRANCH}`
- 	meta_head=`git show-ref -s --heads ${KMETA}`
- 	target_branch_head="${SRCREV_machine}"
- 	target_meta_head="${SRCREV_meta}"
 
 	# nothing to do if bootstrapping
  	if [ -n "${YOCTO_KERNEL_EXTERNAL_BRANCH}" ]; then
  	 	return
  	fi
 
+ 	branch_head=`git show-ref -s --heads ${KBRANCH}`
+ 	meta_head=`git show-ref -s --heads ${KMETA}`
+ 	target_branch_head="${SRCREV_machine}"
+ 	target_meta_head="${SRCREV_meta}"
+
 	current=`git branch |grep \*|sed 's/^\* //'`
 	if [ -n "$target_branch_head" ] && [ "$branch_head" != "$target_branch_head" ]; then
 		if [ -n "${KERNEL_REVISION_CHECKING}" ]; then
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 00cc666..cc71179 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "8f61abb6344e78677450994e8930cabc86102d78"
+SRCREV = "92b965b02e3ac32badde3ee71a1e7d3a85cedeb8"
 PR = r10
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.0.4



