Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B6D82779D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 23:29:53 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 20 Mar 2017 16:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,196,1486454400"; d="scan'208";a="69199745"
Received: from aklin-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.255.72.95])
	by orsmga004.jf.intel.com with ESMTP; 20 Mar 2017 16:29:54 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 17:33:23 -0600
Message-Id: <1490052806-12100-4-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1490052806-12100-1-git-send-email-anibal.limon@linux.intel.com>
References: <1490052806-12100-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, patrick.ohly@gmx.de
Subject: [PATCH 4/7] scripts/compatlayer: Add exclude of meta-world-pkgdata on get_signatures
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
X-List-Received-Date: Mon, 20 Mar 2017 23:29:53 -0000
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


