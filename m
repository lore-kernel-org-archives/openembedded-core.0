Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7C84878226
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 11:24:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 04:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,286,1496127600"; d="scan'208";a="873432576"
Received: from summit.tm.intel.com ([10.237.55.159])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2017 04:24:03 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 14:24:11 +0300
Message-Id: <20170630112411.11705-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] sanity.bbclass: fix AttributeError in mirror format checks
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
X-List-Received-Date: Fri, 30 Jun 2017 11:24:05 -0000

mirrors is a list after split() and results in:

AttributeError: 'list' object has no attribute 'strip'

when the 'mirror values are pairs' check fails.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index e8064ac483..1f74026e13 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -839,7 +839,7 @@ def check_sanity_everybuild(status, d):
 
         # Split into pairs
         if len(mirrors) % 2 != 0:
-            bb.warn('Invalid mirror variable value for %s: %s, should contain paired members.' % (mirror_var, mirrors.strip()))
+            bb.warn('Invalid mirror variable value for %s: %s, should contain paired members.' % (mirror_var, str(mirrors).strip()))
             continue
         mirrors = list(zip(*[iter(mirrors)]*2))
 
-- 
2.11.0


