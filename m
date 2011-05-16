Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QM15Q-0003MM-Fb
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 18:56:04 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4GGqbZk009843;
	Mon, 16 May 2011 09:52:38 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 16 May 2011 12:52:36 -0400
Message-Id: <8d26746c2a90672a3f86cbec021b9f450d38cb73.1305564106.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1305564106.git.bruce.ashfield@windriver.com>
References: <cover.1305564106.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1305564106.git.bruce.ashfield@windriver.com>
References: <cover.1305564106.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto: detect and avoid branch revision checking for AUTOREV
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
X-List-Received-Date: Mon, 16 May 2011 16:56:04 -0000

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
1.7.0.4



