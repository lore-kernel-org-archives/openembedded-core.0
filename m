Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id ADD647404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:01:24 +0000 (UTC)
Received: by padhk3 with SMTP id hk3so214089459pad.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 10:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Esz3zhGlKvoMUrjjJeCK381fg2zHB9YpiWUgY5gMlN4=;
	b=PMHcqKvs2P0QYhEka3l6tz8zx+AdrMmHNrWmcYbrF6FccsSZQ7laVVgUNpPG3EWdLe
	3dNR4jfimoV9giLA0TLCBVXJPxIDrz/wPE10i++MDf4cf5YKrnBX0tO11imolOsgbYeQ
	l5bjM8xK4F4cSvNqDe0NUSNsRdQpdMzJkHTo+lPJvsCnkVDL/6h6um02+mAXO4yUMsBc
	/Jyp8BjHcuLaf9dvAyrcoVVMKQRnza9UyDbF8b3e686ekq5LNoh3LwlTgaSk3PVMsEjf
	dSXbpO/A6TySIfNHNa/CWFKt43K/YXmw9Uw/t7gTbr78Ck0lSM41vwf/2B+JrT4lHC4x
	i/9g==
X-Received: by 10.69.27.70 with SMTP id je6mr58949053pbd.62.1442422884675;
	Wed, 16 Sep 2015 10:01:24 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	xd10sm28968897pab.25.2015.09.16.10.01.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 10:01:23 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Sep 2015 10:03:32 -0700
Message-Id: <1442423012-22426-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [PATCHv2] recipetool: add 'newappend' sub-command
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
X-List-Received-Date: Wed, 16 Sep 2015 17:01:28 -0000

This sub-command creates a bbappend for the specified target and prints the
path to the bbappend. The -w argument, as with some of the other recipetool
commands, will make a version-independent bbappend.

Example usage: recipetool newappend meta-mylayer virtual/kernel

[YOCTO #7964]

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 scripts/lib/recipetool/newappend.py | 111 ++++++++++++++++++++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 scripts/lib/recipetool/newappend.py

diff --git a/scripts/lib/recipetool/newappend.py b/scripts/lib/recipetool/newappend.py
new file mode 100644
index 0000000..77b74cb
--- /dev/null
+++ b/scripts/lib/recipetool/newappend.py
@@ -0,0 +1,111 @@
+# Recipe creation tool - newappend plugin
+#
+# This sub-command creates a bbappend for the specified target and prints the
+# path to the bbappend.
+#
+# Example: recipetool newappend meta-mylayer busybox
+#
+# Copyright (C) 2015 Christopher Larson <kergoth@gmail.com>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+import argparse
+import errno
+import logging
+import os
+import re
+import sys
+
+
+logger = logging.getLogger('recipetool')
+tinfoil = None
+
+
+def plugin_init(pluginlist):
+    # Don't need to do anything here right now, but plugins must have this function defined
+    pass
+
+
+def tinfoil_init(instance):
+    global tinfoil
+    tinfoil = instance
+
+
+def _provide_to_pn(cooker, provide):
+    """Get the name of the preferred recipe for the specified provide."""
+    import bb.providers
+    filenames = cooker.recipecache.providers[provide]
+    eligible, foundUnique = bb.providers.filterProviders(filenames, provide, cooker.expanded_data, cooker.recipecache)
+    filename = eligible[0]
+    pn = cooker.recipecache.pkg_fn[filename]
+    return pn
+
+
+def _get_recipe_file(cooker, pn):
+    import oe.recipeutils
+    recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
+    if not recipefile:
+        skipreasons = oe.recipeutils.get_unavailable_reasons(cooker, pn)
+        if skipreasons:
+            logger.error('\n'.join(skipreasons))
+        else:
+            logger.error("Unable to find any recipe file matching %s" % pn)
+    return recipefile
+
+
+def layer(layerpath):
+    if not os.path.exists(os.path.join(layerpath, 'conf', 'layer.conf')):
+        raise argparse.ArgumentTypeError('{0!r} must be a path to a valid layer'.format(layerpath))
+    return layerpath
+
+
+def newappend(args):
+    import oe.recipeutils
+
+    pn = _provide_to_pn(tinfoil.cooker, args.target)
+    recipe_path = _get_recipe_file(tinfoil.cooker, pn)
+
+    rd = tinfoil.config_data.createCopy()
+    rd.setVar('FILE', recipe_path)
+    append_path, path_ok = oe.recipeutils.get_bbappend_path(rd, args.destlayer, args.wildcard_version)
+    if not append_path:
+        logger.error('Unable to determine layer directory containing %s', recipe_path)
+        return 1
+
+    if not path_ok:
+        logger.warn('Unable to determine correct subdirectory path for bbappend file - check that what %s adds to BBFILES also matches .bbappend files. Using %s for now, but until you fix this the bbappend will not be applied.', os.path.join(destlayerdir, 'conf', 'layer.conf'), os.path.dirname(appendpath))
+
+    layerdirs = [os.path.abspath(layerdir) for layerdir in rd.getVar('BBLAYERS', True).split()]
+    if not os.path.abspath(args.destlayer) in layerdirs:
+        logger.warn('Specified layer is not currently enabled in bblayers.conf, you will need to add it before this bbappend will be active')
+
+    if not os.path.exists(append_path):
+        bb.utils.mkdirhier(os.path.dirname(append_path))
+
+        try:
+            open(append_path, 'a')
+        except (OSError, IOError) as exc:
+            logger.critical(str(exc))
+            return 1
+
+    print(append_path)
+
+
+def register_command(subparsers):
+    parser = subparsers.add_parser('newappend',
+                                   help='Create a bbappend for the specified target in the specified layer')
+    parser.add_argument('-w', '--wildcard-version', help='Use wildcard to make the bbappend apply to any recipe version', action='store_true')
+    parser.add_argument('destlayer', help='Base directory of the destination layer to write the bbappend to', type=layer)
+    parser.add_argument('target', help='Target recipe/provide to append')
+    parser.set_defaults(func=newappend, parserecipes=True)
-- 
2.2.1


