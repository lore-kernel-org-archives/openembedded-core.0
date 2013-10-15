Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 14B9C6D096
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 22:22:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Oct 2013 15:22:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,503,1378882800"; d="scan'208";a="393450227"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.253])
	by orsmga001.jf.intel.com with ESMTP; 15 Oct 2013 15:22:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Oct 2013 15:22:46 -0700
Message-Id: <1381875766-20689-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] packagegroup-core-basic: libuser has a hard depenency on libpam
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
X-List-Received-Date: Tue, 15 Oct 2013 22:22:46 -0000

Since libpam is only built when DISTRO_FEATURES pam is enabled we should
not be trying to build libuser also.

[YOCTO #4949]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-basic.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
index 2e6f576..596fede 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-basic.bb
@@ -107,7 +107,7 @@ RDEPENDS_packagegroup-core-initscripts = "\
 RDEPENDS_packagegroup-core-multiuser = "\
     cracklib \
     gzip \
-    libuser \
+    ${@base_contains('DISTRO_FEATURES', 'pam', 'libuser', '', d)} \
     shadow \
     sudo \
     "
-- 
1.7.10.4


