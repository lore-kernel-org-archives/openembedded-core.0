Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 370B971DDA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 20:18:05 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 10 Feb 2017 12:18:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,142,1484035200"; d="scan'208";a="57375543"
Received: from unknown (HELO mlopezva-MOBL2.zpn.intel.com) ([10.219.4.164])
	by orsmga004.jf.intel.com with ESMTP; 10 Feb 2017 12:18:05 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 14:19:20 -0600
Message-Id: <c5b75215539cdca65e5d5d90fa7b0068fb142473.1486757577.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1486757577.git.mariano.lopez@linux.intel.com>
References: <cover.1486757577.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1486757577.git.mariano.lopez@linux.intel.com>
References: <cover.1486757577.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 1/1] insane.bbclass: Add missing dependencies
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
X-List-Received-Date: Fri, 10 Feb 2017 20:18:05 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

package_qa task requires some tools installed in sysroot; with
the introduction of recipe specific sysroot this task won't
have such tools installed if it's forced to run.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/insane.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3cf86c1..0167b14 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1223,9 +1223,12 @@ python do_package_qa () {
     bb.note("DONE with PACKAGE QA")
 }
 
+# binutils is used for most checks, so need to set as dependency
+# POPULATESYSROOTDEPS is defined in staging class.
+do_package_qa[depends] += "${POPULATESYSROOTDEPS}"
 do_package_qa[vardepsexclude] = "BB_TASKDEPDATA"
 do_package_qa[rdeptask] = "do_packagedata"
-addtask do_package_qa after do_packagedata do_package before do_build
+addtask do_package_qa after do_prepare_recipe_sysroot do_packagedata do_package before do_build
 
 SSTATETASKS += "do_package_qa"
 do_package_qa[sstate-inputdirs] = ""
-- 
2.10.2


