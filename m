Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F316D68B16
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 13:32:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.37209.1731591153295797555
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 05:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IfkFhnyn;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so5574235e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 05:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731591152; x=1732195952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCPKvIVgSIuGR3dR04Wb4OtlCfpfSTmgjqyG7j8jQuY=;
        b=IfkFhnynZCr81Huelw5herc/VRU2dDYQM1BT1I5VfZ+hi0oB/QZtxSGGdIuPRXD+h5
         Y+NKPgTyBFQycuHUEiMhuTN3e6B920HUn5rGyY3h82OQuSdiPFZvBi2r0GTPs25Dvq6+
         QDPV0if60ta7sEtrsOEWK747USMkKnYueK8D4NMUVb+HEe+7O8RCbJcJ4ZAf/Ed50E3y
         Ixvsbhxllupuh2bC3ui+6P86tAf3p9KjTv8sGXeXoBq4UG83VjWKHYTCQ1UkOcqZQXdY
         SjOEWA/9oEO4NpX1aOqlio/E9cuIFc2t7oim/4xs2IqLxnIBLbAiVxfCBC5uM4+claDF
         +pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731591152; x=1732195952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCPKvIVgSIuGR3dR04Wb4OtlCfpfSTmgjqyG7j8jQuY=;
        b=e5JF/zsZQaNrFaD511cl8iHj4wRqpFtBzqIvDt/jBAmL57I/t7ivhELwgdUNLZVN8/
         8W0WEcpLBi2mjYxcUEzwnxDDHN0NXntbmsQqJvZX/zDC89ThMZ8UaYbxVpM4d/k3P74N
         39/Ap7AUFbdzxUWtuj4XNIUOK2ncLCrDAtBbv1o9MhnJRFRF634EkOzUKKfzawymhWtN
         L42EpcusxgxkyKjXmM6of1vpNJCbW8ubGlxH0+F7pTKcpabzlIpOOwr8WCZIpk6B53tM
         93q/O1hm5qE6BEv/3TvdERmk2KNWuYM+GnK6xkOfeXRc9BAnhr8KdWGa90cu/hMFBXVA
         CbBg==
X-Gm-Message-State: AOJu0Yz9Pn982bxoBnCOO6C0md2Z0z857vrZNOQMSOLqFvnlBHx4ZGNt
	z6Xgcvzv3AyT4aSZG3UxA88YUnoQ4DYTQqt0espjIhiq+m7/jG55pOvI5g==
X-Google-Smtp-Source: AGHT+IHKGRtWKJdDbPIY0KWLM2EOyfI2HKKGSmxHkwTZYVumcaIgUvtkqeNxfkiF5/airVmjtfMu7Q==
X-Received: by 2002:a05:600c:1c28:b0:432:7c08:d0ff with SMTP id 5b1f17b1804b1-432d4acfc2emr52143105e9.23.1731591151466;
        Thu, 14 Nov 2024 05:32:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da29ffe9sm24281615e9.44.2024.11.14.05.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 05:32:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 2/2] bitbake-config-build: add a plugin for config fragments
Date: Thu, 14 Nov 2024 14:32:26 +0100
Message-Id: <20241114133226.348812-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241114133226.348812-1-alex.kanavin@gmail.com>
References: <20241114133226.348812-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 13:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207164

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
index 695d17377d4..e15cf2d5707 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -240,3 +240,34 @@ class BitbakeLayers(OESelftestTestCase):
         self.assertEqual(first_desc_2, '', "Describe not cleared: '{}'".format(first_desc_2))
         self.assertEqual(second_rev_2, second_rev_1, "Revision should not be updated: '{}'".format(second_rev_2))
         self.assertEqual(second_desc_2, second_desc_1, "Describe should not be updated: '{}'".format(second_desc_2))
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


