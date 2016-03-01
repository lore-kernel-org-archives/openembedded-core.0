Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D561976420
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 11:10:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 01 Mar 2016 03:10:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,522,1449561600"; d="scan'208";a="926990437"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 01 Mar 2016 03:10:39 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 91A1D2C8001;
	Tue,  1 Mar 2016 03:58:25 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 11:00:56 +0200
Message-Id: <1456822856-30014-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] bootimg: set default value for LABELS variable
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
X-List-Received-Date: Tue, 01 Mar 2016 11:10:38 -0000

With empty LABELS variable build_efi_cfg skips most of its
functionality producing warning message:
    'LABELS not defined, nothing to do'
This causes build failure for efi images.

Setting default value for LABELS to 'boot install' should fix
this issue.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/bootimg.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 7946839..0249a9d 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -49,6 +49,8 @@ EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}",
 
 KERNEL_IMAGETYPE ??= "bzImage"
 
+LABELS ?= "boot install"
+
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
 # contain "efi". This way legacy is supported by default if neither is
 # specified, maintaining the original behavior.
-- 
2.1.4


