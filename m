Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 664607807C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 11:49:42 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jul 2017 04:49:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,302,1496127600"; d="scan'208";a="121751586"
Received: from summit.tm.intel.com ([10.237.55.159])
	by fmsmga005.fm.intel.com with ESMTP; 03 Jul 2017 04:49:42 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jul 2017 14:49:55 +0300
Message-Id: <20170703114955.19297-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH v2] sanity.bbclass: fix AttributeError in mirror format checks
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
X-List-Received-Date: Mon, 03 Jul 2017 11:49:42 -0000

mirrors is a list after split() and results in:

AttributeError: 'list' object has no attribute 'strip'

when the 'mirror values are pairs' check fails.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---

v2: drop redundant .strip() because it's guaranteed str(mirrors)
does not have leading or trailing spaces.

 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index e8064ac483..9e0f57ddfe 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -839,7 +839,7 @@ def check_sanity_everybuild(status, d):
 
         # Split into pairs
         if len(mirrors) % 2 != 0:
-            bb.warn('Invalid mirror variable value for %s: %s, should contain paired members.' % (mirror_var, mirrors.strip()))
+            bb.warn('Invalid mirror variable value for %s: %s, should contain paired members.' % (mirror_var, str(mirrors)))
             continue
         mirrors = list(zip(*[iter(mirrors)]*2))
 
-- 
2.13.2


