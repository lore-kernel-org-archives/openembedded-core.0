Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7219F65CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 23:50:55 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 22 Mar 2016 16:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,379,1455004800"; d="scan'208";a="71450831"
Received: from afshjern.zpn.intel.com ([10.219.16.250])
	by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2016 16:50:55 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 17:52:06 -0600
Message-Id: <1458690727-23015-3-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1458690727-23015-1-git-send-email-alejandro.franco@linux.intel.com>
References: <1458690727-23015-1-git-send-email-alejandro.franco@linux.intel.com>
Cc: joshua.g.lock@intel.com, aschultz@tpip.net, benjamin.esquivel@intel.com
Subject: [PATCHv2 2/3] icecc.bbclass: expand package arch
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
X-List-Received-Date: Tue, 22 Mar 2016 23:50:55 -0000

If PACKAGE_ARCH contains variables (with ${) then expand it
this might be necessary if the value of PACKAGE_ARCH, which
is checked against in this test, should for any reason not
contain a value, but one or more variables

[YOCTO #8934]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta/classes/icecc.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 75d0e5d..6632f5b 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -138,7 +138,10 @@ def use_icc(bb,d):
     return "yes"
 
 def icc_is_allarch(bb, d):
-    return d.getVar("PACKAGE_ARCH", False) == "all" or bb.data.inherits_class('allarch', d)
+    package_arch = d.getVar("PACKAGE_ARCH", False)
+    if '${' in package_arch:
+        package_arch = d.expand(package_arch)
+    return package_arch == "all" or bb.data.inherits_class('allarch', d)
 
 def icc_is_kernel(bb, d):
     return \
-- 
2.7.3


