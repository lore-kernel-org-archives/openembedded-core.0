Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A7B9572720
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 16:10:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 23 Dec 2014 08:08:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,632,1413270000"; d="scan'208";a="628280308"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.255.13.178])
	by orsmga001.jf.intel.com with ESMTP; 23 Dec 2014 08:08:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Dec 2014 16:08:48 +0000
Message-Id: <14ec1988201a830d4da2328607f499fe6c6d5f26.1419350817.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1419350817.git.paul.eggleton@linux.intel.com>
References: <cover.1419350817.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1419350817.git.paul.eggleton@linux.intel.com>
References: <cover.1419350817.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/7] oeqa/selftest: fix test_force_task so it doesn't taint the entire build
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
X-List-Received-Date: Tue, 23 Dec 2014 16:10:09 -0000

Using -f sets a taint on the specified task, and m4-native is in the
dependency chain for just about everything, which means that everything
gets forced to rebuild. We don't need the influence of this test to
extend outside of the test itself, so ensure that the taint gets cleared
at the end of the test.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 2a85f10..5708d3d 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -71,6 +71,7 @@ class BitbakeTests(oeSelfTest):
     @testcase(163)
     def test_force_task(self):
         bitbake('m4-native')
+        self.add_command_to_tearDown('bitbake -c clean m4-native')
         result = bitbake('-C compile m4-native')
         look_for_tasks = ['do_compile', 'do_install', 'do_populate_sysroot']
         for task in look_for_tasks:
-- 
1.9.3


