Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A54EA71E01
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 16:37:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 15 Mar 2017 09:37:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,169,1486454400"; d="scan'208";a="1108788632"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2017 09:37:42 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 09:37:39 -0700
Message-Id: <1489595859-15016-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: richard.purdie@intel.com
Subject: [PATCH] sanity.bbclass: modify check for shell
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
X-List-Received-Date: Wed, 15 Mar 2017 16:37:42 -0000

Due to the recently implemented update-alternatives for bash binary,
sanity checker may end up with a (false-positive) error such as:

Error, /bin/sh links to /bin/bash.bash, must be dash or bash

This patch modifies the test: presence of "/bash" or "/dash" in shell binary
name results in pass.

[YOCTO#11108]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/sanity.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b5f4756..e3be40b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -935,7 +935,9 @@ def check_sanity_everybuild(status, d):
     # If /bin/sh is a symlink, check that it points to dash or bash
     if os.path.islink('/bin/sh'):
         real_sh = os.path.realpath('/bin/sh')
-        if not real_sh.endswith('/dash') and not real_sh.endswith('/bash'):
+        # Due to update-alternatives, the shell name may take various
+        # forms, such as /bin/dash, bin/bash, /bin/bash.bash ...
+        if '/dash' not in real_sh and '/bash' not in real_sh:
             status.addresult("Error, /bin/sh links to %s, must be dash or bash\n" % real_sh)
 
 def check_sanity(sanity_data):
-- 
2.7.4


