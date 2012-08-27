Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T5rSM-0007di-BT
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 07:01:46 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7R4nSi0010798;
	Sun, 26 Aug 2012 21:49:30 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 27 Aug 2012 00:49:18 -0400
Message-Id: <2bad67c8ff964997e7a6f15873d7103df6938748.1346042224.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346042224.git.bruce.ashfield@windriver.com>
References: <cover.1346042224.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1346042224.git.bruce.ashfield@windriver.com>
References: <cover.1346042224.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/3] kern-tools: fix forced branching
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
X-List-Received-Date: Mon, 27 Aug 2012 05:01:46 -0000

commit 7a79f7412 [linux-yocto: make KBRANCH the exception and not the rule]
ensures that a request branch is always built. The implementation of this
guarantee is a branch switch before the build starts. But that switch may
be before all patches are applied. If the proper routines are not called,
no patches can be applied to the tree.

Updating the SRCREV to pickup this fix:

    updateme: use branch command when forcing branch switches

    When forcing a branch switch to the desired branch we should be
    using the proper 'branch' command. Since without this call, the
    proper variables will not be set, and patches can't be applied
    to the tree.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 0ff8b19..e1fc0a3 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "7d936da57db11f1114f3860e4fcc15221e796275"
+SRCREV = "c82d67d0cf17bc3b499f19667690c56bd00d3ddc"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.5.4



