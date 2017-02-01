Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 299EF7732F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 15:30:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v11FUfpI001501
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 1 Feb 2017 07:30:41 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 1 Feb 2017 07:30:40 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 1 Feb 2017 10:30:29 -0500
Message-ID: <4c157d91dd83ac88fa954cd6408a1cc0460098d2.1485962567.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1485962567.git.bruce.ashfield@windriver.com>
References: <cover.1485962567.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] kern-tools: re-enable scc merge command
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
X-List-Received-Date: Wed, 01 Feb 2017 15:30:44 -0000
Content-Type: text/plain

The ability to merge two branches directly from a .scc file was
dropped during the streamlining of the tools.

As was pointed out by David Vincent <freesilicon@gmail.com>, there is
once again a valid use case for this functionality, so we restore the
capability.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                       | 16 +++++++++++++++-
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb |  2 +-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 5cfd8aff5007..36f61c5694fb 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -148,7 +148,7 @@ do_kernel_metadata() {
 	# run1: pull all the configuration fragments, no matter where they come from
 	elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
 	if [ -n "${elements}" ]; then
-		scc --force -o ${S}/${meta_dir}:cfg,meta ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
+		scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}
 		if [ $? -ne 0 ]; then
 			bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
 		fi
@@ -165,6 +165,7 @@ do_kernel_metadata() {
 }
 
 do_patch() {
+	set +e
 	cd ${S}
 
 	check_git_config
@@ -177,6 +178,19 @@ do_patch() {
 			bbfatal_log "Patch failures can be resolved in the linux source directory ${S})"
 		fi
 	fi
+
+	if [ -f "${meta_dir}/merge.queue" ]; then
+		# we need to merge all these branches
+		for b in $(cat ${meta_dir}/merge.queue); do
+			git show-ref --verify --quiet refs/heads/${b}
+			if [ $? -eq 0 ]; then
+				bbnote "Merging branch ${b}"
+				git merge -q --no-ff -m "Merge branch ${b}" ${b}
+			else
+				bbfatal "branch ${b} does not exist, cannot merge"
+			fi
+		done
+	fi
 }
 
 do_kernel_checkout() {
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 9e3e968a46aa..4b1de5752c93 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
 
 DEPENDS = "git-native"
 
-SRCREV = "bf2942f7559d114e96f7c7f1287bf7e5120632a3"
+SRCREV = "c14440d4e7ae0160c260ed65c3e123be5dc97ae8"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.5.0


