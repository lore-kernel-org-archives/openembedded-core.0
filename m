Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF8577CEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 09:26:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3C9QZUI019657
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 02:26:36 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Apr 2017 02:26:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Apr 2017 02:26:31 -0700
Message-ID: <39e0f6afef521a126a47da4a4b67c5fab185bf0e.1491989148.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491989148.git.liezhi.yang@windriver.com>
References: <cover.1491989148.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] blacklist.bbclass: fix for multilib
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
X-List-Received-Date: Wed, 12 Apr 2017 09:26:35 -0000
Content-Type: text/plain

* Fixed:
  The netmap has been blacklisted in
  meta-networking/recipes-kernel/netmap/netmap_git.bb, but lib32-netmap still can
  be built (suppose it doesn't depend on another broken recipe netmap-modules, it
  is a little complicated, will talk below):
  $ bitbake lib32-netmap

  This is because of the old code masks on bb.event.ConfigParsed which can only
  handle global blacklist, netmap sets blacklist in the recipe, so it can't be
  handled, and lib32-netmap can be built. which was incorrect:
  blacklist_multilib_eventhandler[eventmask] = "bb.event.ConfigParsed"

  Move multilib code into multilib.bbclass can fix the problem easily:
  $ bitbake lib32-netmap
    ERROR: Nothing PROVIDES 'lib32-netmap'
    ERROR: lib32-netmap was skipped: Recipe is blacklisted: BROKEN: <foo>

* Not fixed
  Another problem is netmap-modules has also been blacklisted in the recipe, and
  the recipe inherits module.bbclass, so multilib.bbclass doesn't handle it as the
  code shows:
    # There should only be one kernel in multilib configs
    # We also skip multilib setup for module packages.
    provides = (e.data.getVar("PROVIDES") or "").split()
    if "virtual/kernel" in provides or bb.data.inherits_class('module-base', e.data):
        raise bb.parse.SkipPackage("We shouldn't have multilib variants for the kernel")

  And netmap-modules provides lib32-netmap-modules which is handled in
  multilib_global.bbclass, so bitbake lib32-netmap-modules can't show
  the blacklist message:
  $ bitbake netmap-modules
  ERROR: Nothing PROVIDES 'netmap-modules'
  ERROR: netmap-modules was skipped: Recipe is blacklisted: BROKEN: <foo>
  ERROR: netmap-modules was skipped: We shouldn't have multilib variants for the kernel

  $ bitbake lib32-netmap-modules
  ERROR: Nothing PROVIDES 'lib32-netmap-modules'. Close matches:
    netmap-modules
    netmap-modules
    lib32-fbset-modes

  Note the different messages between netmap-modules and lib32-netmap-modules.
  This is because multilib.bbclass doesn't handle the "module" recipe so
  there is no PN called lib32-netmap-modules, therefore blacklist.bbclass can't
  handle it.

  Note, there are two "netmap-modules" which needs to be fixed later.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/blacklist.bbclass | 25 -------------------------
 meta/classes/multilib.bbclass  |  6 ++++++
 2 files changed, 6 insertions(+), 25 deletions(-)

diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbclass
index 3413a5b0aa..e58564c34e 100644
--- a/meta/classes/blacklist.bbclass
+++ b/meta/classes/blacklist.bbclass
@@ -12,31 +12,6 @@
 #   PNBLACKLIST[pn] = "message"
 #
 
-# Cope with PNBLACKLIST flags for multilib case
-addhandler blacklist_multilib_eventhandler
-blacklist_multilib_eventhandler[eventmask] = "bb.event.ConfigParsed"
-python blacklist_multilib_eventhandler() {
-    multilibs = e.data.getVar('MULTILIBS')
-    if not multilibs:
-        return
-
-    # this block has been copied from base.bbclass so keep it in sync
-    prefixes = []
-    for ext in multilibs.split():
-        eext = ext.split(':')
-        if len(eext) > 1 and eext[0] == 'multilib':
-            prefixes.append(eext[1])
-
-    blacklists = e.data.getVarFlags('PNBLACKLIST') or {}
-    for pkg, reason in blacklists.items():
-        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith(("nativesdk-", "virtual/nativesdk-")) or 'cross-canadian' in pkg:
-            continue
-        for p in prefixes:
-            newpkg = p + "-" + pkg
-            if not e.data.getVarFlag('PNBLACKLIST', newpkg):
-                e.data.setVarFlag('PNBLACKLIST', newpkg, reason)
-}
-
 python () {
     blacklist = d.getVarFlag('PNBLACKLIST', d.getVar('PN'))
 
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 401e0c2cc0..ab04597f93 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -53,6 +53,12 @@ python multilib_virtclass_handler () {
  
     override = ":virtclass-multilib-" + variant
 
+    blacklist = e.data.getVarFlag('PNBLACKLIST', e.data.getVar('PN'))
+    if blacklist:
+        pn_new = variant + "-" + e.data.getVar('PN')
+        if not e.data.getVarFlag('PNBLACKLIST', pn_new):
+            e.data.setVarFlag('PNBLACKLIST', pn_new, blacklist)
+
     e.data.setVar("MLPREFIX", variant + "-")
     e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
-- 
2.11.0.rc2.dirty


