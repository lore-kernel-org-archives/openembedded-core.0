Return-Path: <swee.aun.khor@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7CFE370018
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 07:35:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jul 2017 00:35:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,414,1496127600"; d="scan'208";a="115768413"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga002.jf.intel.com with ESMTP; 26 Jul 2017 00:35:22 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 17:25:00 -0700
Message-Id: <1501028700-11808-1-git-send-email-swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel-devsrc: Remove .kernel-meta from package
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
X-List-Received-Date: Wed, 26 Jul 2017 07:35:21 -0000

From: sweeaun <swee.aun.khor@intel.com>

[YOCTO #11730]

Include .kernel-meta directory in the prune list of the find to
prevent .kernel-meta directory included into installable package.

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 7004261..c1b5b77 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -46,7 +46,7 @@ do_install() {
         cd ${B}
         find . -type d -name '.git*' -prune -o -path '.debug' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
         cd ${S}
-        find . -type d -name '.git*' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
+	find . -type d -name '.git*' -prune -o -type d -name '.kernel-meta' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
 
         # Explicitly set KBUILD_OUTPUT to ensure that the image directory is cleaned and not
         # The main build artifacts. We clean the directory to avoid QA errors on mismatched
-- 
2.7.4


