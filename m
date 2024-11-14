Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6749BD65C75
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 11:11:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.34865.1731582668602784105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 03:11:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KhzSzYfb;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-431695fa98bso4317825e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 03:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731582667; x=1732187467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ahj/EWPfbNttNqp1bKNnUUkEjiS0h+o6JUIczOQf6/c=;
        b=KhzSzYfbY+jRyPq4h8nRXRFJB0ygWcW8DrdB9ptEZIsgPD7uqRznNGeocivNlO0wFl
         XubnfON95G7/o/7csAXOb0npWknYRmavLMrznOWxrY0YZi5rZ3AMjshnhPNvhW9IUPHT
         6fRr2R1k2wetjbYtqjgKL07906kbGgiGHOJTus4uxpmyirE2tG4HwmLoPf1sExqw9WNY
         bGP0/sak0zOH+3jO+XHCe3wpFWmWswvFLzkogaDP/NpyxE3PVXH7/l6Jh5yHhFCHtRSi
         b86Te/F14/yP97d2txo7l2jBed0PeAUO7O5k36chM8CobThcOl9ZhCiK5SuPfXE/86px
         4Q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731582667; x=1732187467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ahj/EWPfbNttNqp1bKNnUUkEjiS0h+o6JUIczOQf6/c=;
        b=LeK7MtZmDxHzajn5+ifIEw4QbgCpvFWBIMPvNH3NVt7wXkVNtNeBSTN32+GSTDUDD0
         2ZKbhOlrFsV0sTh7cqqR1SRy7YpwHyE0Uj5Rog+D9Qd3lvRDKrXC/aVvaGSWPsFgfcqF
         s6QtNwKgjjKl07h/YB6uPekgAivk+G97bUgrz11wa4SHk2uBtAsfT1X2Y7DcZrx9Amhi
         N103BPNsH2jmuDb84N2qzj6ChGhCsMqquheit1Vy3Ibt2jcF5oTo3+6lM5GduFgo9xIo
         g9lQ3zkU499GwZsxvaAPmF+57mP/7YlM/wVszlQBoiJTR7fL3wUojD2JgIhM90Vut7Kh
         RFPw==
X-Gm-Message-State: AOJu0YzO6TDDV4/ZIoy8g+FNE0MQQ6WN9wDuTY2iLdRDPeF8vY6hq+I5
	XfN9+c8WDByn3hQOrj5QjFw3m3lThMviUSef06hL8/qvp+NGmaevSSGOIA==
X-Google-Smtp-Source: AGHT+IEfMIMn7eXkDnkG7K+InH66m+PjTgEBu1qpfKUaI+tKWpMOSrthfswNfIHS0Vv5lsv3eqNl5w==
X-Received: by 2002:a05:600c:138b:b0:425:7bbf:fd07 with SMTP id 5b1f17b1804b1-432b74fe205mr198809015e9.5.1731582666738;
        Thu, 14 Nov 2024 03:11:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821adbeb47sm1165841f8f.63.2024.11.14.03.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 03:11:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] bitbake-config-build: add a plugin for config fragments
Date: Thu, 14 Nov 2024 12:11:00 +0100
Message-Id: <20241114111100.2624737-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241114111100.2624737-1-alex.kanavin@gmail.com>
References: <20241114111100.2624737-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 11:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207149

From: Alexander Kanavin <alex@linutronix.de>

This allows fine-tuning local configurations with pre-frabricated
configuration snippets in a structured, controlled way. It's also
an important building block for bitbake-setup.

There are three (and a half) operations (list/enable/disable/disable all), and here's the 'list' output:

alex@Zen2:/srv/storage/alex/yocto/build-64$ bitbake-config-build list-fragments
NOTE: Starting bitbake server...
Available fragments in selftest layer located in /srv/work/alex/poky/meta-selftest:

selftest/test-another-fragment	This is a second configuration fragment intended for testing in oe-selftest context
selftest/test-fragment	This is a configuration fragment intended for testing in oe-selftest context

The tool requires that each fragment contains a one-line summary, and one or more
lines of description, as BB_CONF_FRAGMENT_SUMMARY[fragmentname] style metadata.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../selftest/test-another-fragment.conf       |   3 +
 .../fragments/selftest/test-fragment.conf     |   3 +
 meta/lib/bbconfigbuild/configfragments.py     | 138 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/bblayers.py      |  31 ++++
 4 files changed, 175 insertions(+)
 create mode 100644 meta-selftest/conf/fragments/selftest/test-another-fragment.conf
 create mode 100644 meta-selftest/conf/fragments/selftest/test-fragment.conf
 create mode 100644 meta/lib/bbconfigbuild/configfragments.py

diff --git a/meta-selftest/conf/fragments/selftest/test-another-fragment.conf b/meta-selftest/conf/fragments/selftest/test-another-fragment.conf
new file mode 100644
index 00000000000..4b4bf537964
--- /dev/null
+++ b/meta-selftest/conf/fragments/selftest/test-another-fragment.conf
@@ -0,0 +1,3 @@
+BB_CONF_FRAGMENT_SUMMARY[selftest/test-another-fragment] = "This is a second configuration fragment intended for testing in oe-selftest context"
+BB_CONF_FRAGMENT_DESCRIPTION[selftest/test-another-fragment] = "It defines another variable that can be checked inside the test."
+SELFTEST_FRAGMENT_ANOTHER_VARIABLE = "someothervalue"
diff --git a/meta-selftest/conf/fragments/selftest/test-fragment.conf b/meta-selftest/conf/fragments/selftest/test-fragment.conf
new file mode 100644
index 00000000000..63ebc1fca68
--- /dev/null
+++ b/meta-selftest/conf/fragments/selftest/test-fragment.conf
@@ -0,0 +1,3 @@
+BB_CONF_FRAGMENT_SUMMARY[selftest/test-fragment] = "This is a configuration fragment intended for testing in oe-selftest context"
+BB_CONF_FRAGMENT_DESCRIPTION[selftest/test-fragment] = "It defines a variable that can be checked inside the test."
+SELFTEST_FRAGMENT_VARIABLE = "somevalue"
diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
new file mode 100644
index 00000000000..f0d6e87b8ff
--- /dev/null
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -0,0 +1,138 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import logging
+import os
+import sys
+
+import bb.utils
+
+from bblayers.common import LayerPlugin
+
+logger = logging.getLogger('bitbake-config-layers')
+
+sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
+
+def plugin_init(plugins):
+    return ConfigFragmentsPlugin()
+
+class ConfigFragmentsPlugin(LayerPlugin):
+    def get_fragment_info(self, path, name):
+        d = bb.data.init()
+        bb.parse.handle(path, d, True)
+        summary = d.getVarFlag('BB_CONF_FRAGMENT_SUMMARY', name)
+        description = d.getVarFlag('BB_CONF_FRAGMENT_DESCRIPTION', name)
+        if not summary:
+            raise Exception('Please add a one-line summary as BB_CONF_FRAGMENT_SUMMARY[{}] = \"...\" variable at the beginning of {}'.format(name, path))
+
+        if not description:
+            raise Exception('Please add a description as BB_CONF_FRAGMENT_DESCRIPTION[{}] = \"...\" variable at the beginning of {}'.format(name, path))
+
+        return summary, description
+
+    def discover_fragments(self):
+        fragments_path_prefix = self.tinfoil.config_data.getVar('OE_FRAGMENTS_PREFIX')
+        allfragments = {}
+        for layername in self.bbfile_collections:
+             layerdir = self.bbfile_collections[layername]
+             fragments = []
+             for topdir, dirs, files in os.walk(os.path.join(layerdir, fragments_path_prefix)):
+                 fragmentdir = topdir.split(fragments_path_prefix+'/')[-1]
+                 for fragmentfile in sorted(files):
+                     fragmentname = "/".join((fragmentdir, fragmentfile.split('.')[0]))
+                     fragmentpath = os.path.join(topdir, fragmentfile)
+                     fragmentsummary, fragmentdesc = self.get_fragment_info(fragmentpath, fragmentname)
+                     fragments.append({'path':fragmentpath, 'name':fragmentname, 'summary':fragmentsummary, 'description':fragmentdesc})
+             if fragments:
+                 allfragments[layername] = {'layerdir':layerdir,'fragments':fragments}
+        return allfragments
+
+    def do_list_fragments(self, args):
+        """ List available configuration fragments """
+        enabled_fragments = (self.tinfoil.config_data.getVar('OE_FRAGMENTS') or "").split()
+
+        for layername, layerdata in self.discover_fragments().items():
+            layerdir = layerdata['layerdir']
+            fragments = layerdata['fragments']
+
+            print('Available fragments in {} layer located in {}:\n'.format(layername, layerdir))
+            for f in fragments:
+                if not args.verbose:
+                    print('{}\t{}\t{}'.format(f['name'], '(enabled)' if f['name'] in enabled_fragments else '(disabled)', f['summary']))
+                else:
+                    print('Name: {}\nPath: {}\nEnabled: {}\nSummary: {}\nDescription:\n{}\n'.format(f['name'], f['path'], 'yes' if f['name'] in enabled_fragments else 'no', f['summary'],''.join(f['description'])))
+            print('')
+
+    def fragment_exists(self, fragmentname):
+        for layername, layerdata in self.discover_fragments().items():
+            for f in layerdata['fragments']:
+              if f['name'] == fragmentname:
+                  return True
+        return False
+
+    def read_conf(self, confpath):
+        try:
+            with open(confpath) as f:
+                lines = f.readlines()
+        except Exception:
+            lines = []
+        return lines
+
+    def do_enable_fragment(self, args):
+        """ Enable a fragment in the local build configuration """
+        if not self.fragment_exists(args.fragmentname):
+            raise Exception("Fragment {} does not exist; use 'list-fragments' to see the full list.".format(args.fragmentname))
+
+        appendline = "OE_FRAGMENTS += \"{}\"\n".format(args.fragmentname)
+
+        lines = self.read_conf(args.confpath)
+        for l in lines:
+            if l == appendline:
+                print("Fragment {} already included in {}".format(args.fragmentname, args.confpath))
+                return
+
+        lines.append(appendline)
+        with open(args.confpath, 'w') as f:
+            f.write(''.join(lines))
+        print("Fragment {} added to {}.".format(args.fragmentname, args.confpath))
+
+    def do_disable_fragment(self, args):
+        """ Disable a fragment in the local build configuration """
+        removeline = "OE_FRAGMENTS += \"{}\"\n".format(args.fragmentname)
+
+        lines = [l for l in self.read_conf(args.confpath) if l != removeline]
+
+        with open(args.confpath, 'w') as f:
+            f.write(''.join(lines))
+        print("Fragment {} removed from {}.".format(args.fragmentname, args.confpath))
+
+    def do_disable_all_fragments(self, args):
+        """ Disable all fragments in the local build configuration """
+        removeline = "OE_FRAGMENTS += "
+
+        lines = [l for l in self.read_conf(args.confpath) if not l.startswith(removeline)]
+
+        with open(args.confpath, 'w') as f:
+            f.write(''.join(lines))
+        print("All fragment removed from {}.".format(args.confpath))
+
+    def register_commands(self, sp):
+        default_confpath = os.path.join(os.environ["BBPATH"], "conf/auto.conf")
+
+        parser_list_fragments = self.add_command(sp, 'list-fragments', self.do_list_fragments, parserecipes=False)
+        parser_list_fragments.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
+        parser_list_fragments.add_argument('--verbose', '-v', action='store_true', help='Print extended descriptions of the fragments')
+
+        parser_enable_fragment = self.add_command(sp, 'enable-fragment', self.do_enable_fragment, parserecipes=False)
+        parser_enable_fragment.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
+        parser_enable_fragment.add_argument('fragmentname', help='The name of the fragment (use list-fragments to see them)')
+
+        parser_disable_fragment = self.add_command(sp, 'disable-fragment', self.do_disable_fragment, parserecipes=False)
+        parser_disable_fragment.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
+        parser_disable_fragment.add_argument('fragmentname', help='The name of the fragment')
+
+        parser_disable_all = self.add_command(sp, 'disable-all-fragments', self.do_disable_all_fragments, parserecipes=False)
+        parser_disable_all.add_argument("--confpath", default=default_confpath, help='Configuration file which contains a list of enabled fragments (default is {}).'.format(default_confpath))
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 8b2bc319d50..945d9a511f7 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -253,3 +253,34 @@ class BitbakeLayers(OESelftestTestCase):
                 meta_selftest_found = True
         self.assertTrue(oe_core_found, "meta/conf/layer.conf not found in {}".format(testcopydir))
         self.assertTrue(meta_selftest_found, "meta-selftest/conf/layer.conf not found in {}".format(testcopydir))
+
+class BitbakeConfigBuild(OESelftestTestCase):
+    def test_add_remove_fragments(self):
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), None)
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), None)
+
+        runCmd('bitbake-config-build enable-fragment selftest/test-fragment')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), 'somevalue')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), None)
+
+        runCmd('bitbake-config-build enable-fragment selftest/test-another-fragment')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), 'somevalue')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), 'someothervalue')
+
+        fragment_metadata_command = "bitbake-getvar -f {} --value {}"
+        result = runCmd(fragment_metadata_command.format("selftest/test-fragment", "BB_CONF_FRAGMENT_SUMMARY"))
+        self.assertIn("This is a configuration fragment intended for testing in oe-selftest context", result.output)
+        result = runCmd(fragment_metadata_command.format("selftest/test-fragment", "BB_CONF_FRAGMENT_DESCRIPTION"))
+        self.assertIn("It defines a variable that can be checked inside the test.", result.output)
+        result = runCmd(fragment_metadata_command.format("selftest/test-another-fragment", "BB_CONF_FRAGMENT_SUMMARY"))
+        self.assertIn("This is a second configuration fragment intended for testing in oe-selftest context", result.output)
+        result = runCmd(fragment_metadata_command.format("selftest/test-another-fragment", "BB_CONF_FRAGMENT_DESCRIPTION"))
+        self.assertIn("It defines another variable that can be checked inside the test.", result.output)
+
+        runCmd('bitbake-config-build disable-fragment selftest/test-fragment')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), None)
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), 'someothervalue')
+
+        runCmd('bitbake-config-build disable-fragment selftest/test-another-fragment')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), None)
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), None)
-- 
2.39.5


