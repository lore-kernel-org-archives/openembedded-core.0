Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E5AC770D4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 14:21:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Aug 2014 07:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,886,1400050800"; d="scan'208";a="560045329"
Received: from sdoherty-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.63])
	by orsmga001.jf.intel.com with ESMTP; 18 Aug 2014 07:21:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Aug 2014 15:21:54 +0100
Message-Id: <6ad104bf120f1997a6d2345bc15c49a8219361a8.1408371675.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1408371675.git.paul.eggleton@linux.intel.com>
References: <cover.1408371675.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1408371675.git.paul.eggleton@linux.intel.com>
References: <cover.1408371675.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/sstate: ensure do_package_qa_setscene doesn't pull in do_package_setscene
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
X-List-Received-Date: Mon, 18 Aug 2014 14:22:00 -0000

If we have done do_package_qa_setscene we do not also need
do_package_setscene. This means we can again for example rebuild an image
without needing do_package sstate packages to be present.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/sstate.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 0d3940e..4eec6bd 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -733,15 +733,15 @@ def setscene_depvalid(task, taskdependees, notneeded, d):
         if dep in notneeded:
             continue
         # do_package_write_* and do_package doesn't need do_package
-        if taskdependees[task][1] == "do_package" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata']:
+        if taskdependees[task][1] == "do_package" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package_qa']:
             continue
         # do_package_write_* and do_package doesn't need do_populate_sysroot, unless is a postinstall dependency
-        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata']:
+        if taskdependees[task][1] == "do_populate_sysroot" and taskdependees[dep][1] in ['do_package', 'do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package_qa']:
             if isPostInstDep(taskdependees[task][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm']:
                 return False
             continue
         # Native/Cross packages don't exist and are noexec anyway
-        if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package']:
+        if isNativeCross(taskdependees[dep][0]) and taskdependees[dep][1] in ['do_package_write_deb', 'do_package_write_ipk', 'do_package_write_rpm', 'do_packagedata', 'do_package', 'do_package_qa']:
             continue
 
         # Consider sysroot depending on sysroot tasks
-- 
1.9.3


