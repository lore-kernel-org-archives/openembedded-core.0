Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD7871ADB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:30:17 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
	(envelope-from <ejo@pengutronix.de>)
	id 1cBejw-00056c-Pp; Tue, 29 Nov 2016 10:30:16 +0100
Received: from ejo by dude.hi.pengutronix.de with local (Exim 4.88)
	(envelope-from <ejo@pengutronix.de>)
	id 1cBejw-00065g-Cq; Tue, 29 Nov 2016 10:30:16 +0100
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2016 10:29:57 +0100
Message-Id: <20161129092957.22133-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.10.2
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: Enrico Jorns <ejo@pengutronix.de>
Subject: [PATCH][krogoth] bs4: fix bitbake build error with latest html5lib version
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
X-List-Received-Date: Tue, 29 Nov 2016 09:30:19 -0000

Since the 0.999999999 release of python-html5lib, the module
`treewalkers._base` was changed to `treewalkers.base` (without
underscore). This breaks bitbake is it uses the old module name.

|   [...]
|   File "[...]/bitbake/lib/bs4/builder/_html5lib.py", line 57, in <module>
|       class TreeBuilderForHtml5lib(html5lib.treebuilders._base.TreeBuilder):
| AttributeError: 'module' object has no attribute '_base'
| [...]/bitbake/lib/bb/event.py:119: RuntimeWarning: Parent module 'bb' not found while handling absolute import

This patch renames all occurrences of the `_base` module to `base`.

Note that this patch will break builds with older versions of
python-html5lib.

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 bitbake/lib/bs4/builder/_html5lib.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/bs4/builder/_html5lib.py b/bitbake/lib/bs4/builder/_html5lib.py
index 7de36ae..529ce5a 100644
--- a/bitbake/lib/bs4/builder/_html5lib.py
+++ b/bitbake/lib/bs4/builder/_html5lib.py
@@ -54,7 +54,7 @@ class HTML5TreeBuilder(HTMLTreeBuilder):
         return u'<html><head></head><body>%s</body></html>' % fragment
 
 
-class TreeBuilderForHtml5lib(html5lib.treebuilders._base.TreeBuilder):
+class TreeBuilderForHtml5lib(html5lib.treebuilders.base.TreeBuilder):
 
     def __init__(self, soup, namespaceHTMLElements):
         self.soup = soup
@@ -115,7 +115,7 @@ class AttrList(object):
         return name in list(self.attrs.keys())
 
 
-class Element(html5lib.treebuilders._base.Node):
+class Element(html5lib.treebuilders.base.Node):
     def __init__(self, element, soup, namespace):
         html5lib.treebuilders._base.Node.__init__(self, element.name)
         self.element = element
-- 
2.10.2


