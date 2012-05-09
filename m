Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SRxx9-00046v-WE
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 05:52:40 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.wrs.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q493ggex021932;
	Tue, 8 May 2012 20:42:43 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  8 May 2012 23:48:44 -0400
Message-Id: <893d8018c655f70ada731eaf5f03b178f4dfe2b3.1336535085.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1336535085.git.bruce.ashfield@windriver.com>
References: <cover.1336535085.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1336535085.git.bruce.ashfield@windriver.com>
References: <cover.1336535085.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, dvhart@linux.intel.com,
	poky@yoctoproject.org, saul.wold@intel.com
Subject: [PATCH 1/1] kern-tools: checkpoint restoration for reset branches
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
X-List-Received-Date: Wed, 09 May 2012 03:52:40 -0000

Updating the SRCREV to pickup the following fix:

    createme: fix checkpoint restoration for reset branches

    The meta branch can optionally be merged out to BSP branches. This removes
    the need to restore the checkpoint when working with the tree.  The way
    it detects the merge is by checking to see how many branches contain the
    meta data. If there's more than one, the branch was was merged out.

    Unless you are a BSP that isn't tracking the latest meta, and you get
    meta and meta-orig created. That's two branches and the code opts to not
    restore the checkpoint, which leads to configuration errors.

    The fix is simple. We allow for 2 or less branches with meta, and will
    still restore the checkpoint. Three and up, we won't.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index b6fab39..b5e203e 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "9bb704df0a86578b8ae1f4c85e45089bef28e026"
+SRCREV = "de3649840e8e3ca25bc79d2444f04a1b158a1769"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.0.4



