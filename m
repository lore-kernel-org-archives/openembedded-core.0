Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SKGcW-0001wu-9P
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 00:11:32 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3HM21PJ020816;
	Tue, 17 Apr 2012 15:02:02 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 17 Apr 2012 18:01:44 -0400
Message-Id: <f74ed24324007c2f7a644065eaa8a2d4a097dfe7.1334699045.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334699045.git.bruce.ashfield@windriver.com>
References: <cover.1334699045.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1334699045.git.bruce.ashfield@windriver.com>
References: <cover.1334699045.git.bruce.ashfield@windriver.com>
Cc: denys@ti.com, openembedded-core@lists.openembedded.org,
	yang.shi@windriver.com, saul.wold@intel.com
Subject: [PATCH 1/3] linux-yocto: .diff is a valid patch extension
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
X-List-Received-Date: Tue, 17 Apr 2012 22:11:32 -0000

In fixing an existing patch migration bug, the list of valid extensions
got out of sync from the core patch class. As a result, valid patches
were not being applied to the tree.

Updating the tools to migrate .diff files fixes the issue.

Also in this fix is the removal of .patch in the find_sccs() routine, since
it will never be returned by patch.bbclass when all non-patches are
requested, it is simply confusing.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  |    2 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 0caf6a6..c995a2e 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -20,7 +20,7 @@ def find_sccs(d):
 	sources_list=[]
 	for s in sources:
 		base, ext = os.path.splitext(os.path.basename(s))
-		if ext and ext in ('.scc' '.cfg' '.patch'):
+		if ext and ext in ('.scc' '.cfg'):
 			sources_list.append(s)
 		elif base and base in 'defconfig':
 			sources_list.append(s)
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index d1c2ee4..754ebe5 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "67bcedda582b2b191f26ec47dd1d4eac37f1305c"
+SRCREV = "2bbbaaa00cc70887d6d6f745b9425890d522d240"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.5.4



