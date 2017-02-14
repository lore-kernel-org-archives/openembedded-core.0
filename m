Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2AF7B60745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:14:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1ELEREd018988
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 14 Feb 2017 13:14:28 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Feb 2017 13:14:26 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Feb 2017 16:14:15 -0500
Message-ID: <5f2afecaeb3eb4b03cb0e0ab00bf1d9662eecf6a.1487106757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1487106757.git.bruce.ashfield@windriver.com>
References: <cover.1487106757.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/11] kernel-yocto.bbclass: ensure repatching when HEAD is checked out
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
X-List-Received-Date: Tue, 14 Feb 2017 21:14:29 -0000
Content-Type: text/plain

From: Awais Belal <awais_belal@mentor.com>

In some cases it is seen that kernel_checkout and validate_branches are
run again in simultaneous builds. During do_patch the kgit-s2q mechanism
looks for a sentinel file inside the .git directory, finds a fence post
and starts picking up patches after that.

This can create trouble as validate_branches checks out the HEAD of the
branch and so the patches should be reapplied rather than skipped due to
finding of the fence post.

We can call kgit-s2q --clean to remove the sentinel file when the
branches are checked out.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                       | 4 ++++
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index a7b635638186..33361b962469 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -365,6 +365,10 @@ do_validate_branches() {
 			current_branch=`git rev-parse --abbrev-ref HEAD`
 			git branch "$current_branch-orig"
 			git reset --hard ${force_srcrev}
+			# We've checked out HEAD, make sure we cleanup kgit-s2q fence post check
+			# so the patches are applied as expected otherwise no patching
+			# would be done in some corner cases.
+			kgit-s2q --clean
 		fi
 	fi
 }
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 4b1de5752c93..03f8ce3cc253 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
 
 DEPENDS = "git-native"
 
-SRCREV = "c14440d4e7ae0160c260ed65c3e123be5dc97ae8"
+SRCREV = "5deada879404820db146685729e89ba0887fc0ee"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.5.0


