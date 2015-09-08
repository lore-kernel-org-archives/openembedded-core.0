Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7590076AC7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:58:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 08 Sep 2015 03:58:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="764592813"
Received: from unknown (HELO marquiz.fi.intel.com) ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 08 Sep 2015 03:58:18 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 13:58:13 +0300
Message-Id: <1441709895-1304-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1441709895-1304-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1441709895-1304-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/4] kernel-yocto.bbclass: do_kernel_metadata depends on do_unpack
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
X-List-Received-Date: Tue, 08 Sep 2015 10:58:20 -0000

Make sure that 'do_unpack' is executed before 'do_kernel_metadata'.
Enabling externalsrc for kernel disables 'do_validate_branches' task
which caused 'do_kernel_metadata' to fail as the dependency chain to
'do_unpack' got broken.

[YOCTO #6658]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 231e08d..325f94c 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -228,7 +228,7 @@ do_kernel_checkout() {
 do_kernel_checkout[dirs] = "${S}"
 
 addtask kernel_checkout before do_kernel_metadata after do_unpack
-addtask kernel_metadata after do_validate_branches before do_patch
+addtask kernel_metadata after do_validate_branches do_unpack before do_patch
 do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
 
 do_kernel_configme[dirs] += "${S} ${B}"
-- 
2.1.4


