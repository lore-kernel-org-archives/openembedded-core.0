Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5E13772F4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 18:19:16 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 10:19:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="67383869"
Received: from unknown (HELO mlopezva-MOBL2.zpn.intel.com) ([10.219.25.91])
	by orsmga005.jf.intel.com with ESMTP; 21 Feb 2017 10:19:17 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 12:20:35 -0600
Message-Id: <84a69197bd825467fd773005ccb36ad0d41ef1b4.1487701080.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1487701080.git.mariano.lopez@linux.intel.com>
References: <cover.1487701080.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1487701080.git.mariano.lopez@linux.intel.com>
References: <cover.1487701080.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv3 1/1] insane.bbclass: Add missing dependencies
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
X-List-Received-Date: Tue, 21 Feb 2017 18:19:16 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

package_qa task requires some tools installed in sysroot; with
the introduction of recipe specific sysroot this task won't
have such tools installed if it's forced to run.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/insane.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index e8e54f0..6a34bd5 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1221,6 +1221,9 @@ python do_package_qa () {
     bb.note("DONE with PACKAGE QA")
 }
 
+# binutils is used for most checks, so need to set as dependency
+# POPULATESYSROOTDEPS is defined in staging class.
+do_package_qa[depends] += "${POPULATESYSROOTDEPS}"
 do_package_qa[vardepsexclude] = "BB_TASKDEPDATA"
 do_package_qa[rdeptask] = "do_packagedata"
 addtask do_package_qa after do_packagedata do_package before do_build
-- 
2.10.2


