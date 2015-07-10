Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AFA35607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 11:08:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Jul 2015 04:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,446,1432623600"; d="scan'208";a="726379056"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 10 Jul 2015 04:08:31 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 8F1236A4005;
	Fri, 10 Jul 2015 04:07:50 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jul 2015 14:08:26 +0300
Message-Id: <1436526506-1684-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <559E86F4.5060504@linux.intel.com>
References: <559E86F4.5060504@linux.intel.com>
Subject: [wic][PATCH] wic: Set default set of bitbake variables
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
X-List-Received-Date: Fri, 10 Jul 2015 11:08:31 -0000

Set default set of bitbake variables to the set of variables
for the first parsed image.

This allows wic to find proper bitbake varibale values
if it's called with '-e <image>' even without specifying
image in the call of get_bitbake_var.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 2f9f515..4978745 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -146,6 +146,11 @@ def get_bitbake_var(var, image=None):
             if key.replace('_', '').isalnum():
                 _BITBAKE_VARS[image][key] = val.strip('"')
 
+        # Make first image a default set of variables
+        images = [key for key in _BITBAKE_VARS if key]
+        if len(images) == 1:
+            _BITBAKE_VARS[None] = _BITBAKE_VARS[image]
+
     return _BITBAKE_VARS[image].get(var)
 
 def parse_sourceparams(sourceparams):
-- 
2.1.4


