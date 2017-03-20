Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 80F5660685
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 21:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490045659; x=1521581659;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=JWi5I98l4wL9NniRRhnH5cydrG0F9bceJ/ST4p++2Fs=;
	b=F4z9QcXend8HIencgMacntpKXvmZcPq/RLrYfJ1mAep02M3Bp1uxkpms
	AC6JjbLT9UDRru4v2/j+DV9eRBbMMw==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2017 14:34:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,196,1486454400"; d="scan'208";a="77508431"
Received: from aklin-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.255.72.95])
	by orsmga005.jf.intel.com with ESMTP; 20 Mar 2017 14:34:17 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 15:38:00 -0600
Message-Id: <1490045880-26412-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] scripts/compatlayer: Add exclude of meta-world-pkgdata on get_signatures
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
X-List-Received-Date: Mon, 20 Mar 2017 21:34:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The meta-world-pkgdata recipe can be modified when a layer is added
may be can add recipes to world target, so exclude by default.

[YOCTO #11162]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/lib/compatlayer/__init__.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index a7eb862..888d303 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -133,6 +133,11 @@ def get_signatures(builddir, failsafe=False):
     import subprocess
     import re
 
+    # some recipes needs to be excluded like meta-world-pkgdata
+    # because a layer can add recipes to a world build so signature
+    # will be change
+    exclude_recipes = ('meta-world-pkgdata',)
+
     sigs = {}
 
     cmd = 'bitbake '
@@ -153,6 +158,15 @@ def get_signatures(builddir, failsafe=False):
             line = line.strip()
             s = sig_regex.match(line)
             if s:
+                exclude = False
+                for er in exclude_recipes:
+                    (recipe, task) = s.group('task').split(':')
+                    if er == recipe:
+                        exclude = True
+                        break
+                if exclude:
+                    continue
+
                 sigs[s.group('task')] = s.group('hash')
 
     if not sigs:
-- 
2.1.4


