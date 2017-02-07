Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E7B7A6E668
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 21:13:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Feb 2017 13:12:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="818214873"
Received: from unknown (HELO mlopezva-MOBL2.zpn.intel.com) ([10.219.4.164])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Feb 2017 13:12:58 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2017 15:14:14 -0600
Message-Id: <34f90a06027ceb777ba34f65b42ab98214623935.1486501999.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1486501999.git.mariano.lopez@linux.intel.com>
References: <cover.1486501999.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] insane.bbclass: Add prepare_recipe_sysroot dependency for package_qa
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
X-List-Received-Date: Tue, 07 Feb 2017 21:13:22 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

package_qa task requires some tools installed in sysroot; with
the introduction of recipe specific sysroot this task won't
have such tools installed if it's forced to run.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3cf86c1..64c6d14 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1225,7 +1225,7 @@ python do_package_qa () {
 
 do_package_qa[vardepsexclude] = "BB_TASKDEPDATA"
 do_package_qa[rdeptask] = "do_packagedata"
-addtask do_package_qa after do_packagedata do_package before do_build
+addtask do_package_qa after do_prepare_recipe_sysroot do_packagedata do_package before do_build
 
 SSTATETASKS += "do_package_qa"
 do_package_qa[sstate-inputdirs] = ""
-- 
2.10.2


