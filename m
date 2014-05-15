Return-Path: <joaohf@gmail.com>
X-Greylist: delayed 334 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 May 2014 01:43:16 UTC
Received: from mail-yk0-f174.google.com (unknown [209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 62DE865F99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 01:43:16 +0000 (UTC)
Received: by mail-yk0-f174.google.com with SMTP id 9so345938ykp.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 18:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=P1UNyA1gP5PhAKNQxeYWaWc60EBZhdCUARG4bS0SY4w=;
	b=cRdXuj6fwuFSJ6wy7Lha7uKOMbzOfROFXTKFPD8unbYX32zdpYrub9akk5Ie7spz5b
	71rBxNpL7gkSegGFg2M7hdGec7aKLvWcpddmIBE4nE283uYJOXP6UnWR/VYOA92fly/h
	iwHDfxQClIT3jky3YSlnqGv5oESX5dzdzMvQxo7EQSy5QhOjKHoB2KPNm5Uu/QiA+EVa
	HZuSF4HM7Nk7kAqhCNgjOgdfOrOWwLUFM6DJAq5Rzq2q7eSAbhS4BHUEf/xQMiVVnyGm
	s+3kCP09tO8JkXbCN+duSJbXfx8lGCoyCp3MqgnrLxDnlojgBCq+UQlwLs7ulFZwhba2
	C8Pg==
X-Received: by 10.236.230.6 with SMTP id i6mr10728573yhq.14.1400117869852;
	Wed, 14 May 2014 18:37:49 -0700 (PDT)
Received: from localhost.localdomain ([201.53.199.239])
	by mx.google.com with ESMTPSA id k50sm576778yhc.21.2014.05.14.18.37.48
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 May 2014 18:37:49 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 May 2014 22:37:28 -0300
Message-Id: <1400117848-4350-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400117848-4350-1-git-send-email-joaohf@gmail.com>
References: <1400117848-4350-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 2/2] wic: add support to look in all layers and get plugins
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
X-List-Received-Date: Thu, 15 May 2014 01:43:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Plugins are looked in 'scripts/lib/mic/plugins/[type]/' directory on all
BBLAYERS variable returned by bitbake environment. If found, it will
be load at runtime.

The user could create your own plugin and keep it inside its layers. For
now the path must be <layer-dir>/scripts/lib/mic/plugins/[type]/. Where
'type' could be 'imager' or 'source'.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/mic/plugin.py | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/mic/plugin.py b/scripts/lib/mic/plugin.py
index df03c15..bec33d6 100644
--- a/scripts/lib/mic/plugin.py
+++ b/scripts/lib/mic/plugin.py
@@ -20,12 +20,14 @@ import os, sys
 from mic import msger
 from mic import pluginbase
 from mic.utils import errors
-
+from mic.utils.oe.misc import *
 
 __ALL__ = ['PluginMgr', 'pluginmgr']
 
 PLUGIN_TYPES = ["imager", "source"] # TODO  "hook"
 
+PLUGIN_DIR = "/lib/mic/plugins" # relative to scripts
+SCRIPTS_PLUGIN_DIR = "scripts" + PLUGIN_DIR
 
 class PluginMgr(object):
     plugin_dirs = {}
@@ -42,8 +44,23 @@ class PluginMgr(object):
         mic_path = os.path.dirname(__file__)
         eos = mic_path.find('scripts') + len('scripts')
         scripts_path = mic_path[:eos]
+        self.scripts_path = scripts_path
+        self.plugin_dir = scripts_path + PLUGIN_DIR
+        self.layers_path = None
+
+    def _build_plugin_dir_list(self, dl, ptype):
+        if self.layers_path is None:
+            self.layers_path = get_bitbake_var("BBLAYERS")
+        layer_dirs = []
+
+        for layer_path in self.layers_path.split():
+            path = os.path.join(layer_path, SCRIPTS_PLUGIN_DIR, ptype)
+            layer_dirs.append(path)
 
-        self.plugin_dir = scripts_path + "/lib/mic/plugins"
+            path = os.path.join(dl, ptype)
+            layer_dirs.append(path)
+
+        return layer_dirs
 
     def append_dirs(self, dirs):
         for path in dirs:
@@ -56,7 +73,7 @@ class PluginMgr(object):
         path = os.path.abspath(os.path.expanduser(path))
 
         if not os.path.isdir(path):
-            msger.warning("Plugin dir is not a directory or does not exist: %s"\
+            msger.debug("Plugin dir is not a directory or does not exist: %s"\
                           % path)
             return
 
@@ -93,8 +110,9 @@ class PluginMgr(object):
         if ptype not in PLUGIN_TYPES:
             raise errors.CreatorError('%s is not valid plugin type' % ptype)
 
-        self._add_plugindir(os.path.join(self.plugin_dir, ptype))
-        self._load_all()
+        plugins_dir = self._build_plugin_dir_list(self.plugin_dir, ptype)
+
+        self.append_dirs(plugins_dir)
 
         return pluginbase.get_plugins(ptype)
 
-- 
1.8.3.2


