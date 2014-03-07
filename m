Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 998A76F698
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 14:48:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Mar 2014 06:48:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,608,1389772800"; d="scan'208";a="494194854"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.98])
	by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2014 06:48:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Mar 2014 14:48:48 +0000
Message-Id: <1394203728-12471-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] classes/uboot-config: ignore doc varflag
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
X-List-Received-Date: Fri, 07 Mar 2014 14:48:58 -0000

The doc varflag on UBOOT_CONFIG should be ignored by this code; without
this the recent addition of the UBOOT_CONFIG[doc] to documentation.conf
causes errors when UBOOT_MACHINE is used.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/uboot-config.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 3e09f17..8ac1b71 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -14,6 +14,8 @@
 python () {
     ubootmachine = d.getVar("UBOOT_MACHINE", True)
     ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
+    # The "doc" varflag is special, we don't want to see it here
+    ubootconfigflags.pop('doc', None)
 
     if not ubootmachine and not ubootconfigflags:
         PN = d.getVar("PN", True)
-- 
1.8.5.3


