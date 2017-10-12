Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A819C60290
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 08:09:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 12 Oct 2017 01:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,365,1503385200"; d="scan'208";a="322373288"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2017 01:09:46 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 0FDAB5802CC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 01:09:45 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Oct 2017 11:09:07 +0300
Message-Id: <1507795747-8668-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] sstate.bbclass: provide an exception for useradd scenario
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
X-List-Received-Date: Thu, 12 Oct 2017 08:09:46 -0000

Packages, which depend on users/groups created from other packages,
needs "shadow-native" as a build time dependency. So, add an exception
to the "shadow-native" from otherwise discarded native/cross tools
dependency.

Fixes [YOCTO #11960]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/classes/sstate.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 2a54993..e30fbe1 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -967,7 +967,8 @@ def setscene_depvalid(task, taskdependees, notneeded, d, log=None):
             if isNativeCross(taskdependees[dep][0]):
                 return False
             # Native/cross tools depended upon by target sysroot are not needed
-            if isNativeCross(taskdependees[task][0]):
+            # Add an exception for shadow-native as required by useradd.bbclass
+            if isNativeCross(taskdependees[task][0]) and taskdependees[task][0] != 'shadow-native':
                 continue
             # Target populate_sysroot need their dependencies
             return False
-- 
2.4.0


