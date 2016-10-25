Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id A4C0D71C2F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 11:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id F0DB02E4CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Fjg04D6f9JTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:45 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id DFE862E47A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:44 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABF021A0A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:44 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A14411A0A8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:44 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 13:03:44 +0200 (CEST)
Received: from lnxolani.se.axis.com (lnxolani.se.axis.com [10.88.67.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 94D433E1;
	Tue, 25 Oct 2016 13:03:44 +0200 (CEST)
Received: by lnxolani.se.axis.com (Postfix, from userid 20853)
	id 7256C7C610; Tue, 25 Oct 2016 13:03:35 +0200 (CEST)
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: olani@axis.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2016 13:03:34 +0200
Message-Id: <1477393415-13053-4-git-send-email-olani@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1477393415-13053-1-git-send-email-olani@axis.com>
References: <1477393415-13053-1-git-send-email-olani@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 3/4] devtool: Load plugins in a well defined order
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
X-List-Received-Date: Tue, 25 Oct 2016 11:03:46 -0000

From: Ola x Nilsson <ola.x.nilsson@axis.com>

To allow devtool plugins in one layer to shadow another in a well
defined way, first search BBPATH/lib/devtool directories and then
scripts/lib/devool and load only the first found.

The previous search and load loop would load all found plugins with the
ones found later replacing any found before.

Signed-off-by: Ola x Nilsson <ola.x.nilsson@axis.com>
---
 scripts/devtool            | 3 ++-
 scripts/lib/scriptutils.py | 8 ++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 0c32c50..2197493 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -294,7 +294,8 @@ def main():
         finally:
             tinfoil.shutdown()
 
-    for path in [scripts_path] + global_args.bbpath.split(':'):
+    # Search BBPATH first to allow layers to override plugins in scripts_path
+    for path in global_args.bbpath.split(':') + [scripts_path]:
         pluginpath = os.path.join(path, 'lib', 'devtool')
         scriptutils.load_plugins(logger, plugins, pluginpath)
 
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 5ccc027..27d82b6 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -52,10 +52,14 @@ def load_plugins(logger, plugins, pluginpath):
             if fp:
                 fp.close()
 
+    def plugin_name(filename):
+        return os.path.splitext(os.path.basename(filename))[0]
+
+    known_plugins = [plugin_name(p.__name__) for p in plugins]
     logger.debug('Loading plugins from %s...' % pluginpath)
     for fn in glob.glob(os.path.join(pluginpath, '*.py')):
-        name = os.path.splitext(os.path.basename(fn))[0]
-        if name != '__init__':
+        name = plugin_name(fn)
+        if name != '__init__' and name not in known_plugins:
             plugin = load_plugin(name)
             if hasattr(plugin, 'plugin_init'):
                 plugin.plugin_init(plugins)
-- 
2.1.4


