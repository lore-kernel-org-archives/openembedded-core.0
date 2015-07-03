Return-Path: <ismo.puustinen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 65D7775CD0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 11:36:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jul 2015 04:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,399,1432623600"; d="scan'208";a="755441146"
Received: from ipuustin-mobl.ger.corp.intel.com (HELO
	ipuustin-mobl.fi.intel.com) ([10.237.72.163])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2015 04:36:34 -0700
From: Ismo Puustinen <ismo.puustinen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jul 2015 14:36:15 +0300
Message-Id: <1435923375-6683-1-git-send-email-ismo.puustinen@intel.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH v2] combo-layer: modified to generate better commit messages.
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
X-List-Received-Date: Fri, 03 Jul 2015 11:36:41 -0000

From: "Puustinen, Ismo" <ismo.puustinen@intel.com>

This patch includes support for a global section in combo-layer.conf
called [combo-layer-settings]. Supported in this section is key
"commit_msg"; its value is the template for the git commit message
that updates the last_revision. The template can include substitution
for the updated component list: ${components}. The substituted value
will either be a comma-separated list of components or "all components",
if combo-layer was invoked without component list argument.

If the key is not present, the old default value is used for the commit
message.

Configuration file example:

[combo-layer-settings]
commit_msg = pulled in the latest changes for ${components}.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
---
 scripts/combo-layer | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 4029d2b..2d100be 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -29,6 +29,7 @@ import tempfile
 import ConfigParser
 import re
 from collections import OrderedDict
+from string import Template
 
 __version__ = "0.2.1"
 
@@ -77,15 +78,27 @@ class Configuration(object):
                         value = getattr(parser, 'get' + types[name])(section, name)
                     self.repos[repo][name] = value
 
+        def readglobalsection(parser, section):
+            for (name, value) in parser.items(section):
+                if name == "commit_msg":
+                    self.commit_msg_template = value
+
         logger.debug("Loading config file %s" % self.conffile)
         self.parser = ConfigParser.ConfigParser()
         with open(self.conffile) as f:
             self.parser.readfp(f)
 
+        # initialize default values
+        self.commit_msg_template = "Automatic commit to update last_revision"
+
         self.repos = {}
         for repo in self.parser.sections():
-            self.repos[repo] = {}
-            readsection(self.parser, repo, repo)
+            if repo == "combo-layer-settings":
+                # special handling for global settings
+                readglobalsection(self.parser, repo)
+            else:
+                self.repos[repo] = {}
+                readsection(self.parser, repo, repo)
 
         # Load local configuration, if available
         self.localconffile = None
@@ -715,7 +728,21 @@ def action_update(conf, args):
     if output:
         logger.info("Committing updated configuration file")
         if output.lstrip().startswith("M"):
-            runcmd('git commit -m "Automatic commit to update last_revision" %s' % relpath)
+
+            # create the "components" string
+            component_str = "all components"
+            if len(components) > 0:
+                # otherwise tell which components were actually changed
+                component_str = ", ".join(components)
+
+            # expand the template with known values
+            template = Template(conf.commit_msg_template)
+            raw_msg = template.substitute(components = component_str)
+
+            # sanitize the string before using it in command line
+            msg = raw_msg.replace('"', '\\"')
+
+            runcmd('git commit -m "%s" %s' % (msg, relpath))
 
 def apply_patchlist(conf, repos):
     """
-- 
2.4.3


