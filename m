Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9E83971B04
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 15:37:33 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 01 Dec 2016 07:37:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,282,1477983600"; d="scan'208";a="36222167"
Received: from unknown (HELO mlopezva-MOBL2.zpn.intel.com) ([10.219.25.91])
	by orsmga004.jf.intel.com with ESMTP; 01 Dec 2016 07:37:35 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 09:37:35 -0600
Message-Id: <a646fe03067eb9f6ca712cba8379e393b517c1e5.1480525452.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <cover.1480525452.git.mariano.lopez@linux.intel.com>
References: <cover.1480525452.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1480525452.git.mariano.lopez@linux.intel.com>
References: <cover.1480525452.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 1/3] oeqa/utils/commands.py: Make a copy of variables in get_bb_vars
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
X-List-Received-Date: Thu, 01 Dec 2016 15:37:33 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The function get_bb_vars will remove items for the list passed
as the function argument, this will leave the caller with an
empty list and the function never says it will consume the items.

This hasn't been found before because only get_bb_var uses this
function.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/commands.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 5cd0f74..e00c879 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -149,6 +149,7 @@ def get_bb_vars(variables=None, target=None, postconfig=None):
     """Get values of multiple bitbake variables"""
     bbenv = get_bb_env(target, postconfig=postconfig)
 
+    variables = variables.copy()
     var_re = re.compile(r'^(export )?(?P<var>\w+)="(?P<value>.*)"$')
     unset_re = re.compile(r'^unset (?P<var>\w+)$')
     lastline = None
-- 
2.7.3


