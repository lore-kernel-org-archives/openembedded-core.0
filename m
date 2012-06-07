Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Scj2e-0004wt-1R
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 22:10:48 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q57K07Df018923;
	Thu, 7 Jun 2012 13:00:16 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  7 Jun 2012 15:59:50 -0400
Message-Id: <987e5fba8f7b6f09cc96f4e3d2a5857209a45b7b.1339098507.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 9/9] kern-tools: anchor KMACHINE test
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
X-List-Received-Date: Thu, 07 Jun 2012 20:10:50 -0000

Updating the kern-tools SRCREV to pick up the following fix:

    Out of tree feature descriptions (.scc files) take two forms: normal
    features and BSP descriptions.

    A normal feature is detected and added to the end of the current machine
    being processed. During tree processing, it's configuration and patches
    will be applied.

    A BSP description on the other hand must be matched based on three
    critera (which are in the .scc file via "define <foo>"):

      - machine
      - kernel type
      - architecture

    Since features that define machines are only explicitly added, they
    are removed from the list of features that should be automatically
    added.

    The criteria for removing them from the auto-add list is the
    definitions found in the .scc file. The existing check was simply
    for KMACHINE anywhere in the file. This meant that a conditional
    or even a comment containing that phrase would exclude a file.

    Properly anchoring the KMACHINE test to "^define.*KMACHINE" fixes the
    problem of overly agreesive exclusions.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index becb0de..2329ab9 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "0859d2f73cc6f6973835fa5713b5a98a43ed43ff"
+SRCREV = "4b1fef0a85db38bad6db7f14d44ea59713a64fdb"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.5.4



