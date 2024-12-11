Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12731E77182
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 13:46:55 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.11280.1733924805690887327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 05:46:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GKWWgnjT;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso3974158f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 05:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733924804; x=1734529604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPVEB1frCqxkA1r9QeSahLCVIIa5NZXdOFQ1YMZiR+o=;
        b=GKWWgnjT0/oCOMIJzOovTJIV6W7Bxxe+3q/r8NhoCXTCMDtte6gTWDOXAPEmV1QiJl
         gdXpb85NCqOVdkzcPp5qgA73weqeEilQRUD6HxvbQo9m85uIJZZrKANzAHyPZMrJfQuk
         O9CJd/kF0uHqsVwxD/OPNRxarpumYezYc4Q6Br3Fatotv2NxSTU70SCr80LqN84yFg5B
         1jE3aCRPjY671ZqbbTtpl8cNS8lYC8U4K8WxClWSsal3PkSnKjGy0EP60b0+5SblEWrP
         koulDnwTjHan2v8KNl6BccgJxb14TESvV7Is6aVktRVQxaAYEMScGvX2y9323garXpCw
         /RUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733924804; x=1734529604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPVEB1frCqxkA1r9QeSahLCVIIa5NZXdOFQ1YMZiR+o=;
        b=n+TyMHeN2PSZFERVpoB9rLg7sjdVAxjwHzmaYFyQkAYxNeMoa4/H2rAHvm0Q8LhSH9
         ykzPvVjiFyXS/rplkda4ffJKbMjIhsbVRg4ZZJbpbzOVR6/u4VIBjq0TYrJ4YQ7XbSJ0
         2uxx6svhI58jtajRfDQmXui+tIyP3pB+yTvVu85hITbH1/WvufFPYniW9scpMs5flYpI
         LESYOtRdpOvrAsKxIvmMSkb2ge+bFI+9zWAtgejD0ZO+tz+UOYwPySYSCUEuUt8eSmFz
         DWNftl0y1yh1PWc6er6+RVJMPVvPkupfDI3ARZMPm4LD+J1IJXL0T3urfZs/UNM+yMhc
         d/CQ==
X-Gm-Message-State: AOJu0YwSgYH5QlQK309/ibBk+/9iRzWudRB/pli99Eacz0xERJtrWiqG
	DV7XAAY0wkGO0fPPV+I2ydP4apbP+Yr7yhVhkxtgVq2qbkBxMlc22RDJDQ==
X-Gm-Gg: ASbGncvGQKfJrAOEMzQwPqBiEPcy8LUlaVXoVXe6x1zIL6wtJnuycWyvVWA38FiVBFI
	9WA+nLITt030k7WChNNenY3wqSVwoKrI1+i5pBVXB+7MGAJ6okWOg8gGQurQcYnbw8s4zlO+3HU
	cHH0IyU5SBe7JvfJo1VpB/SWO7mGOy+GH3tLDjmbWnyDHUVNBUGPsrPPK2Yo/ukxplMzKBBvzKi
	9dR4Ic5HmBkCB0A+MjtRNGFYZceM7DK0FhG+SRZv2qHBTSwBVmHZkfXUa7BIPTWjI29b/pCqfpG
	zOGD+OXnVNTfbHk=
X-Google-Smtp-Source: AGHT+IFUQEn1ZzHTW0E+zkT8nEPM+NcF6RBN7eiUhYDF3h0FEX0DsX0pWQs+c529tu53NIWXyDZbnQ==
X-Received: by 2002:a5d:6c68:0:b0:386:381b:6690 with SMTP id ffacd0b85a97d-3864cea393dmr2227327f8f.31.1733924803860;
        Wed, 11 Dec 2024 05:46:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878248f533sm1354045f8f.3.2024.12.11.05.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:46:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] bitbake-config-build: add a plugin for config fragments
Date: Wed, 11 Dec 2024 14:46:30 +0100
Message-Id: <20241211134630.2685983-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241211134630.2685983-1-alex.kanavin@gmail.com>
References: <20241211134630.2685983-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 13:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208581

From: Alexander Kanavin <alex@linutronix.de>

This allows fine-tuning local configurations with pre-frabricated
configuration snippets in a structured, controlled way. It's also
an important building block for bitbake-setup.

The tool requires that each fragment contains a one-line summary, and one or more
lines of description, as BB_CONF_FRAGMENT_SUMMARY style metadata.

There are three (and a half) operations (list/enable/disable/disable all), and here's the 'list' output:

alex@Zen2:/srv/storage/alex/yocto/build-64$ bitbake-config-build list-fragments
NOTE: Starting bitbake server...
Available fragments in selftest layer located in /srv/work/alex/poky/meta-selftest:

Enabled fragments:
selftest/test-fragment	This is a configuration fragment intended for testing in oe-selftest context

Unused fragments:
selftest/more-fragments-here/test-another-fragment	This is a second configuration fragment intended for testing in oe-selftest context

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../test-another-fragment.conf                |   3 +
 .../conf/fragments/test-fragment.conf         |   3 +
 meta/lib/bbconfigbuild/configfragments.py     | 159 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/bblayers.py      |  31 ++++
 4 files changed, 196 insertions(+)
 create mode 100644 meta-selftest/conf/fragments/more-fragments-here/test-another-fragment.conf
 create mode 100644 meta-selftest/conf/fragments/test-fragment.conf
 create mode 100644 meta/lib/bbconfigbuild/configfragments.py

diff --git a/meta-selftest/conf/fragments/more-fragments-here/test-another-fragment.conf b/meta-selftest/conf/fragments/more-fragments-here/test-another-fragment.conf
new file mode 100644
index 00000000000..3bf04590472
--- /dev/null
+++ b/meta-selftest/conf/fragments/more-fragments-here/test-another-fragment.conf
@@ -0,0 +1,3 @@
+BB_CONF_FRAGMENT_SUMMARY = "This is a second configuration fragment intended for testing in oe-selftest context"
+BB_CONF_FRAGMENT_DESCRIPTION = "It defines another variable that can be checked inside the test."
+SELFTEST_FRAGMENT_ANOTHER_VARIABLE = "someothervalue"
diff --git a/meta-selftest/conf/fragments/test-fragment.conf b/meta-selftest/conf/fragments/test-fragment.conf
new file mode 100644
index 00000000000..4c1d2409453
--- /dev/null
+++ b/meta-selftest/conf/fragments/test-fragment.conf
@@ -0,0 +1,3 @@
+BB_CONF_FRAGMENT_SUMMARY = "This is a configuration fragment intended for testing in oe-selftest context"
+BB_CONF_FRAGMENT_DESCRIPTION = "It defines a variable that can be checked inside the test."
+SELFTEST_FRAGMENT_VARIABLE = "somevalue"
diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
new file mode 100644
index 00000000000..30cc5ece079
--- /dev/null
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -0,0 +1,159 @@
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
+        summary = d.getVar('BB_CONF_FRAGMENT_SUMMARY')
+        description = d.getVar('BB_CONF_FRAGMENT_DESCRIPTION')
+        if not summary:
+            raise Exception('Please add a one-line summary as BB_CONF_FRAGMENT_SUMMARY = \"...\" variable at the beginning of {}'.format(path))
+
+        if not description:
+            raise Exception('Please add a description as BB_CONF_FRAGMENT_DESCRIPTION = \"...\" variable at the beginning of {}'.format(path))
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
+        def print_fragment(f, verbose, is_enabled):
+            if not verbose:
+                print('{}\t{}'.format(f['name'], f['summary']))
+            else:
+                print('Name: {}\nPath: {}\nEnabled: {}\nSummary: {}\nDescription:\n{}\n'.format(f['name'], f['path'], 'yes' if is_enabled else 'no', f['summary'],''.join(f['description'])))
+
+        all_enabled_fragments = (self.tinfoil.config_data.getVar('OE_FRAGMENTS') or "").split()
+
+        for layername, layerdata in self.discover_fragments().items():
+            layerdir = layerdata['layerdir']
+            fragments = layerdata['fragments']
+            enabled_fragments = [f for f in fragments if f['name'] in all_enabled_fragments]
+            disabled_fragments = [f for f in fragments if f['name'] not in all_enabled_fragments]
+
+            print('Available fragments in {} layer located in {}:\n'.format(layername, layerdir))
+            if enabled_fragments:
+                print('Enabled fragments:')
+                for f in enabled_fragments:
+                    print_fragment(f, args.verbose, is_enabled=True)
+                print('')
+            if disabled_fragments:
+                print('Unused fragments:')
+                for f in disabled_fragments:
+                    print_fragment(f, args.verbose, is_enabled=False)
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


