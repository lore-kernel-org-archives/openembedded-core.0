Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QM5d2-0003Sd-E2
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:47:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 May 2011 14:44:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="437102384"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2011 14:44:09 -0700
Message-Id: <da0858a85deb199824d4f8e3059d22e4e79e1dd4.1305580484.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305580484.git.sgw@linux.intel.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
Old-Date: Mon, 16 May 2011 11:42:28 -0400
Date: Mon, 16 May 2011 14:44:09 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 09/14] linux-yocto: detect and avoid branch revision checking for AUTOREV
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
X-List-Received-Date: Mon, 16 May 2011 21:47:04 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

When a BSP or layer specifies an AUTOREV for SRCREV, the logic
that matches expected vs real branch heads doesn't apply. We
always want the latest.

To solve the issues with invalid git revs causing validation
failures, we detect the AUTOINC value and do a early return,
skipping validation.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |    7 +++++++
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 818a07e..536434f 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -136,6 +136,13 @@ do_validate_branches() {
  	 	return
  	fi
 
+	# nothing to do if SRCREV=${AUTOREV}
+	if [ "${SRCREV_machine}" = "AUTOINC" ]; then
+		# restore the branch for builds
+		git checkout -f ${KBRANCH}
+		return
+	fi
+
  	branch_head=`git show-ref -s --heads ${KBRANCH}`
  	meta_head=`git show-ref -s --heads ${KMETA}`
  	target_branch_head="${SRCREV_machine}"
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 829d105..f7600ca 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "ecbdf3cdf6705a63dcb3c50bb24c311046f0b35c"
+SRCREV = "f8eb067b023d590b6cd8deddf6f96d6a820997af"
 PR = r10
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.1.1



