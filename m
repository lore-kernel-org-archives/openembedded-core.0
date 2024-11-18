Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43285D68BFA
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 16:27:09 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.45630.1731947214105278749
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 08:26:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T/gcrPws;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38232c6311fso1595722f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 08:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731947212; x=1732552012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1X/R9GGu28OuLPH0/Y/nFb6eHVzKXZFrTExIT0YDVo=;
        b=T/gcrPws4IJKReki/FSHRfRCOHN0vYfZA/KoFhN/KTUvRF9AHa5TqkSS5jA/92Zm0D
         UYxw/rRLHj4bRSmwA+45WRgU8XI/5x+6k4zuxdvwGI96HG5SQKZU8jU9jSb1jMY1N3Pc
         piQtnj2smCnpT2Pfb3nx2G7EPyLnXnxXMY3lNPl/1YyKNEC4vr2wU4NN2PH5WesSfQmF
         jCbmXFoDm/kl+tsheDyqkPwZphMgwdzFyWzzT+sB/2E+rMbmJ8MrgCOf03dvs5o8qAJt
         NnRJqHelIz0IrYg5pcKgMHLaQlgnFy3QgjMQG/QbRkjtfafhHe2Gup9OZa6WggDz2A7i
         rRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731947212; x=1732552012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I1X/R9GGu28OuLPH0/Y/nFb6eHVzKXZFrTExIT0YDVo=;
        b=a0JP6hQN/orYlRzfJrZubc0b3wYfIP8B++tPaO4Fm9X7ESy7hVR6ITHaKhfJvT5d3H
         QDsAAJLun+NeXkdZm8+DQfwDsA7lD0mEmbCwkevhKlevBKXEjYcNW9+fsenxefDcRRXp
         9ZH1itnZHyBTjlsKSZ0gc9SXMovMxOAZlMtUCvca1jgJWdR2YvYFs7nGxDd3/o7Ke+EZ
         yVGXqL8MrG8rVIP3zytxroMW3r6sFvBwuSRQbeOPqgvr7vgq34zfp12NDBoIAOXys6gP
         uKeQWNYHt2/21wAKsHOtcdpcrxt4ud2oGC5t8FhVZWJuSfGmLWbwJrCiuQiiTA/q7Y7x
         s8Sw==
X-Gm-Message-State: AOJu0Yw0iQY5jeuooykb5+gSbZd/UvFBJyZeNHORjLKnx9rzekJ/ktfg
	C+tW5vkYXZ2UbyMYTRVDVSTPHSbQlVcVKrN1W7k+LoUhcXYXBUL1VYvomQ==
X-Google-Smtp-Source: AGHT+IEFfL6yyF34f/7sl4AgVcfUEwHubI94RGDauJwDJXdUp4ZaNJw9btNfPJFkQrj87wxz+axiSQ==
X-Received: by 2002:a5d:6c68:0:b0:37c:d11f:c591 with SMTP id ffacd0b85a97d-3822590f158mr8552655f8f.17.1731947212372;
        Mon, 18 Nov 2024 08:26:52 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3824770f3dasm3563048f8f.54.2024.11.18.08.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 08:26:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v3 3/3] bitbake-config-build: add a plugin for config fragments
Date: Mon, 18 Nov 2024 17:26:43 +0100
Message-Id: <20241118162643.1423409-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241118162643.1423409-1-alex.kanavin@gmail.com>
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 16:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207224

From: Alexander Kanavin <alex@linutronix.de>

This allows fine-tuning local configurations with pre-frabricated
configuration snippets in a structured, controlled way. It's also
an important building block for bitbake-setup.

There are three (and a half) operations (list/enable/disable/disable all), and here's the 'list' output:

alex@Zen2:/srv/storage/alex/yocto/build-64$ bitbake-config-build list-fragments
NOTE: Starting bitbake server...
Available fragments in selftest layer located in /srv/work/alex/poky/meta-selftest:

selftest/test-fragment	(disabled)	This is a configuration fragment intended for testing in oe-selftest context
selftest/more-fragments-here/test-another-fragment	(disabled)	This is a second configuration fragment intended for testing in oe-selftest context

The tool requires that each fragment contains a one-line summary, and one or more
lines of description, as BB_CONF_FRAGMENT_SUMMARY[layerid/fragmentname] style metadata.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../test-another-fragment.conf                |   3 +
 .../conf/fragments/test-fragment.conf         |   3 +
 meta/lib/bbconfigbuild/configfragments.py     | 147 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/bblayers.py      |  31 ++++
 4 files changed, 184 insertions(+)
 create mode 100644 meta-selftest/conf/fragments/more-fragments-here/test-another-fragment.conf
 create mode 100644 meta-selftest/conf/fragments/test-fragment.conf
 create mode 100644 meta/lib/bbconfigbuild/configfragments.py

diff --git a/meta-selftest/conf/fragments/more-fragments-here/test-another-fragment.conf b/meta-selftest/conf/fragments/more-fragments-here/test-another-fragment.conf
new file mode 100644
index 00000000000..cf9ba6a6132
--- /dev/null
+++ b/meta-selftest/conf/fragments/more-fragments-here/test-another-fragment.conf
@@ -0,0 +1,3 @@
+BB_CONF_FRAGMENT_SUMMARY[selftest/more-fragments-here/test-another-fragment] = "This is a second configuration fragment intended for testing in oe-selftest context"
+BB_CONF_FRAGMENT_DESCRIPTION[selftest/more-fragments-here/test-another-fragment] = "It defines another variable that can be checked inside the test."
+SELFTEST_FRAGMENT_ANOTHER_VARIABLE = "someothervalue"
diff --git a/meta-selftest/conf/fragments/test-fragment.conf b/meta-selftest/conf/fragments/test-fragment.conf
new file mode 100644
index 00000000000..63ebc1fca68
--- /dev/null
+++ b/meta-selftest/conf/fragments/test-fragment.conf
@@ -0,0 +1,3 @@
+BB_CONF_FRAGMENT_SUMMARY[selftest/test-fragment] = "This is a configuration fragment intended for testing in oe-selftest context"
+BB_CONF_FRAGMENT_DESCRIPTION[selftest/test-fragment] = "It defines a variable that can be checked inside the test."
+SELFTEST_FRAGMENT_VARIABLE = "somevalue"
diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
new file mode 100644
index 00000000000..39031b43435
--- /dev/null
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -0,0 +1,147 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import logging
+import os
+import sys
+import os.path
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
+                 fragmentdir = os.path.relpath(topdir, os.path.join(layerdir, fragments_path_prefix))
+                 for fragmentfile in sorted(files):
+                     fragmentname = os.path.normpath("/".join((layername, fragmentdir, fragmentfile.split('.')[0])))
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
+    def create_conf(self, confpath):
+        if not os.path.exists(confpath):
+            with open(confpath, 'w') as f:
+                f.write('')
+        with open(confpath, 'r') as f:
+            lines = f.read()
+        if "OE_FRAGMENTS += " not in lines:
+            lines += "\nOE_FRAGMENTS += \"\"\n"
+        with open(confpath, 'w') as f:
+            f.write(lines)
+
+    def do_enable_fragment(self, args):
+        """ Enable a fragment in the local build configuration """
+        def enable_helper(varname, origvalue, op, newlines):
+            enabled_fragments = origvalue.split()
+            if args.fragmentname in enabled_fragments:
+                print("Fragment {} already included in {}".format(args.fragmentname, args.confpath))
+            else:
+                enabled_fragments.append(args.fragmentname)
+            return " ".join(enabled_fragments), None, 0, True
+
+        if not self.fragment_exists(args.fragmentname):
+            raise Exception("Fragment {} does not exist; use 'list-fragments' to see the full list.".format(args.fragmentname))
+
+        self.create_conf(args.confpath)
+        modified = bb.utils.edit_metadata_file(args.confpath, ["OE_FRAGMENTS"], enable_helper)
+        if modified:
+            print("Fragment {} added to {}.".format(args.fragmentname, args.confpath))
+
+    def do_disable_fragment(self, args):
+        """ Disable a fragment in the local build configuration """
+        def disable_helper(varname, origvalue, op, newlines):
+            enabled_fragments = origvalue.split()
+            if args.fragmentname in enabled_fragments:
+                enabled_fragments.remove(args.fragmentname)
+            else:
+                print("Fragment {} not currently enabled in {}".format(args.fragmentname, args.confpath))
+            return " ".join(enabled_fragments), None, 0, True
+
+        self.create_conf(args.confpath)
+        modified = bb.utils.edit_metadata_file(args.confpath, ["OE_FRAGMENTS"], disable_helper)
+        if modified:
+            print("Fragment {} removed from {}.".format(args.fragmentname, args.confpath))
+
+    def do_disable_all_fragments(self, args):
+        """ Disable all fragments in the local build configuration """
+        def disable_all_helper(varname, origvalue, op, newlines):
+            return "", None, 0, True
+
+        self.create_conf(args.confpath)
+        modified = bb.utils.edit_metadata_file(args.confpath, ["OE_FRAGMENTS"], disable_all_helper)
+        if modified:
+            print("All fragments removed from {}.".format(args.confpath))
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
index 695d17377d4..68b03777201 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -240,3 +240,34 @@ class BitbakeLayers(OESelftestTestCase):
         self.assertEqual(first_desc_2, '', "Describe not cleared: '{}'".format(first_desc_2))
         self.assertEqual(second_rev_2, second_rev_1, "Revision should not be updated: '{}'".format(second_rev_2))
         self.assertEqual(second_desc_2, second_desc_1, "Describe should not be updated: '{}'".format(second_desc_2))
+
+class BitbakeConfigBuild(OESelftestTestCase):
+    def test_enable_disable_fragments(self):
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), None)
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), None)
+
+        runCmd('bitbake-config-build enable-fragment selftest/test-fragment')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), 'somevalue')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), None)
+
+        runCmd('bitbake-config-build enable-fragment selftest/more-fragments-here/test-another-fragment')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), 'somevalue')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), 'someothervalue')
+
+        fragment_metadata_command = "bitbake-getvar -f {} --value {}"
+        result = runCmd(fragment_metadata_command.format("selftest/test-fragment", "BB_CONF_FRAGMENT_SUMMARY"))
+        self.assertIn("This is a configuration fragment intended for testing in oe-selftest context", result.output)
+        result = runCmd(fragment_metadata_command.format("selftest/test-fragment", "BB_CONF_FRAGMENT_DESCRIPTION"))
+        self.assertIn("It defines a variable that can be checked inside the test.", result.output)
+        result = runCmd(fragment_metadata_command.format("selftest/more-fragments-here/test-another-fragment", "BB_CONF_FRAGMENT_SUMMARY"))
+        self.assertIn("This is a second configuration fragment intended for testing in oe-selftest context", result.output)
+        result = runCmd(fragment_metadata_command.format("selftest/more-fragments-here/test-another-fragment", "BB_CONF_FRAGMENT_DESCRIPTION"))
+        self.assertIn("It defines another variable that can be checked inside the test.", result.output)
+
+        runCmd('bitbake-config-build disable-fragment selftest/test-fragment')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), None)
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), 'someothervalue')
+
+        runCmd('bitbake-config-build disable-fragment selftest/more-fragments-here/test-another-fragment')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), None)
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), None)
-- 
2.39.5


