Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7B9C25B10
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 16:08:51 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.14822.1715270929245477914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 09:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c+GlYf8p;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51ef64d051bso1181602e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 09:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715270927; x=1715875727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/6IuRoSD0ll89iG9vu5H6RWMVNE0q076vm0fPDTsd8=;
        b=c+GlYf8p48RUad6gu/wuGTHIxJocgjlPpPbPq6w4/Cxcz0zT1gpsC49kFBLCnvALbV
         n9tS9DRjIVQQOiv6hzI/oDbCs6pMXA1AM94azAg8CgLes+jk+YFEhJrTkc4tYGXeaeVZ
         nEyqHxASwTPqIvZwn+8YtzBKhpfk/5YSO5gGcIN4SnzDaxvN7yK98Ui1nnkKTQDsxi2X
         ZF1BJ9m/HrS8cOrCkYaX0e3fZs381qJgs5zpK9ALcBFfVYyy8M4GZENMP4EyeGTl87zU
         MPFhh7t8J2OH6gfnpsN0kghyKNfBaDGHnEirfHD1+YbCS0Hrl7UDI95l6uKNRvEcNKLF
         4gWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715270927; x=1715875727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/6IuRoSD0ll89iG9vu5H6RWMVNE0q076vm0fPDTsd8=;
        b=Y4ffaM4PyOmYOQ/b8jO9iI2qEVbiuiNEbq0z1tkaFcx2t4bbXy6McdteGmkIzrovEY
         1dmeAsQZkayhegwuu1FTUA6veBIWLakF1Db1btOIT5mty4XlDPH2x0sOPkSqkyZOPZma
         257GSobPvJBzYUlNmslw3d/lTlkMa37QAkXOkaRtdIeBCH101Mxn5BQ4PsIjdaKT2r4C
         MjncG3pSbgjdA9vrttxPi+XUixZtxrnqD6d21WMb3UD0usdArGXO0himIuHxkz+cq0Lq
         pXbSNpxmhtMbDL1Ciak0/arBatHaRddZWYFHUflpSrMAgM5LO2Re/29oHSPIB6jpLHpC
         Fecg==
X-Gm-Message-State: AOJu0YzvR+Fbvorn0/exBCUBC2mREIgDGyLo7VWnwW3c81psI6JwIpEt
	EKB1QFKZUlQbxVRfANEEKs3DQlNZSj89RBWAj9S4dr+YR1qbUwrAO+CcSA==
X-Google-Smtp-Source: AGHT+IFRoh0hoSr8jG6DU3cfvMOG4EmWVAYi6Di9iyROynYeG2k5nv2yXDYi2RDyMyCAA7/47dnwxw==
X-Received: by 2002:a19:5f59:0:b0:513:d3cb:249f with SMTP id 2adb3069b0e04-5217cc434bamr3520952e87.52.1715270927347;
        Thu, 09 May 2024 09:08:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c2cb331sm830711a12.67.2024.05.09.09.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 09:08:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] bitbake-config-build: add a plugin for config fragments
Date: Thu,  9 May 2024 18:08:43 +0200
Message-Id: <20240509160843.3283186-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 16:08:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199179

From: Alexander Kanavin <alex@linutronix.de>

This allows fine-tuning local configurations with pre-frabricated
configuration snippets in a structured, controlled way. It's also
an important building block for bitbake-setup.

There are three operations (list/add/remove), and here's the list output:

alex@Zen2:/srv/storage/alex/yocto/build-64$ bitbake-config-build list-fragments
NOTE: Starting bitbake server...
Available fragments in selftest layer located in /srv/work/alex/poky/meta-selftest:

selftest/test-another-fragment	This is a second configuration fragment intended for testing in oe-selftest context
selftest/test-fragment	This is a configuration fragment intended for testing in oe-selftest context

The tool requires that each fragment contains a one-line summary
at the top, followed by multiple lines of description, as hash-prefixed
comments.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../selftest/test-another-fragment.inc        |   4 +
 .../conf/fragments/selftest/test-fragment.inc |   4 +
 meta/lib/bbconfigbuild/configfragments.py     | 117 ++++++++++++++++++
 meta/lib/oeqa/selftest/cases/bblayers.py      |  21 ++++
 4 files changed, 146 insertions(+)
 create mode 100644 meta-selftest/conf/fragments/selftest/test-another-fragment.inc
 create mode 100644 meta-selftest/conf/fragments/selftest/test-fragment.inc
 create mode 100644 meta/lib/bbconfigbuild/configfragments.py

diff --git a/meta-selftest/conf/fragments/selftest/test-another-fragment.inc b/meta-selftest/conf/fragments/selftest/test-another-fragment.inc
new file mode 100644
index 00000000000..4f6c535de2d
--- /dev/null
+++ b/meta-selftest/conf/fragments/selftest/test-another-fragment.inc
@@ -0,0 +1,4 @@
+# This is a second configuration fragment intended for testing in oe-selftest context
+#
+# It defines another variable that can be checked inside the test.
+SELFTEST_FRAGMENT_ANOTHER_VARIABLE = "someothervalue"
diff --git a/meta-selftest/conf/fragments/selftest/test-fragment.inc b/meta-selftest/conf/fragments/selftest/test-fragment.inc
new file mode 100644
index 00000000000..0ad62db9e13
--- /dev/null
+++ b/meta-selftest/conf/fragments/selftest/test-fragment.inc
@@ -0,0 +1,4 @@
+# This is a configuration fragment intended for testing in oe-selftest context
+#
+# It defines a variable that can be checked inside the test.
+SELFTEST_FRAGMENT_VARIABLE = "somevalue"
diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
new file mode 100644
index 00000000000..d7e4f54dba2
--- /dev/null
+++ b/meta/lib/bbconfigbuild/configfragments.py
@@ -0,0 +1,117 @@
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
+    def get_fragment_info(self, path):
+        summary = ""
+        description = []
+        with open(path) as f:
+            for l in f.readlines():
+                if not l.startswith('#'):
+                    break
+                if not summary:
+                    summary = l[1:].strip()
+                else:
+                    description.append(l[1:].strip())
+        if not summary or not description:
+            raise Exception('Please add a one-line summary followed by a description as #-prefixed comments at the beginning of {}'.format(path))
+
+        return summary, description
+
+
+    def discover_fragments(self):
+        allfragments = {}
+        for layername in self.bbfile_collections:
+             layerdir = self.bbfile_collections[layername]
+             fragments = []
+             for topdir, dirs, files in os.walk(os.path.join(layerdir, 'conf/fragments')):
+                 fragmentdir = topdir.split('conf/fragments/')[-1]
+                 for fragmentfile in sorted(files):
+                     fragmentname = "/".join((fragmentdir, fragmentfile.split('.')[0]))
+                     fragmentpath = os.path.join(topdir, fragmentfile)
+                     fragmentsummary, fragmentdesc = self.get_fragment_info(fragmentpath)
+                     fragments.append({'path':fragmentpath, 'name':fragmentname, 'summary':fragmentsummary, 'description':fragmentdesc})
+             if fragments:
+                 allfragments[layername] = {'layerdir':layerdir,'fragments':fragments}
+        return allfragments
+
+
+    def do_list_fragments(self, args):
+        """ List available configuration fragments """
+        for layername, layerdata in self.discover_fragments().items():
+            layerdir = layerdata['layerdir']
+            fragments = layerdata['fragments']
+
+            print('Available fragments in {} layer located in {}:\n'.format(layername, layerdir))
+            for f in fragments:
+                if not args.verbose:
+                    print('{}\t{}'.format(f['name'], f['summary']))
+                else:
+                    print('Name: {}\nPath: {}\nSummary: {}\nDescription:\n{}\n'.format(f['name'], f['path'], f['summary'],''.join(f['description'])))
+            print('')
+
+    def fragment_exists(self, fragmentname):
+        for layername, layerdata in self.discover_fragments().items():
+            for f in layerdata['fragments']:
+              if f['name'] == fragmentname:
+                  return True
+        return False
+
+    def do_add_fragment(self, args):
+        """ Add a fragment to the local build configuration """
+        if not self.fragment_exists(args.fragmentname):
+            raise Exception("Fragment {} does not exist; use 'list-fragments' to see the full list.".format(args.fragmentname))
+
+        confpath = os.path.join(os.environ["BBPATH"], "conf/local.conf")
+        appendline = "require conf/fragments/{}.inc\n".format(args.fragmentname)
+
+        with open(confpath) as f:
+            lines = f.readlines()
+            for l in lines:
+                if l == appendline:
+                    print("Fragment {} already included in {}".format(args.fragmentname, confpath))
+                    return
+
+        lines.append(appendline)
+        with open(confpath, 'w') as f:
+            f.write(''.join(lines))
+
+    def do_remove_fragment(self, args):
+        """ Remove a fragment from the local build configuration """
+        confpath = os.path.join(os.environ["BBPATH"], "conf/local.conf")
+        appendline = "require conf/fragments/{}.inc\n".format(args.fragmentname)
+
+        with open(confpath) as f:
+            lines = f.readlines()
+        lines = [l for l in lines if l != appendline]
+
+        with open(confpath, 'w') as f:
+            f.write(''.join(lines))
+
+    def register_commands(self, sp):
+        parser_list_fragments = self.add_command(sp, 'list-fragments', self.do_list_fragments, parserecipes=False)
+        parser_list_fragments.add_argument('--verbose', '-v', action='store_true', help='Print extended descriptions of the fragments')
+
+        parser_add_fragment = self.add_command(sp, 'add-fragment', self.do_add_fragment, parserecipes=False)
+        parser_add_fragment.add_argument('fragmentname', help='The name of the fragment (use list-fragments to see them)')
+
+        parser_remove_fragment = self.add_command(sp, 'remove-fragment', self.do_remove_fragment, parserecipes=False)
+        parser_remove_fragment.add_argument('fragmentname', help='The name of the fragment')
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 8b2bc319d50..9e75ef6928e 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -253,3 +253,24 @@ class BitbakeLayers(OESelftestTestCase):
                 meta_selftest_found = True
         self.assertTrue(oe_core_found, "meta/conf/layer.conf not found in {}".format(testcopydir))
         self.assertTrue(meta_selftest_found, "meta-selftest/conf/layer.conf not found in {}".format(testcopydir))
+
+class BitbakeConfigBuild(OESelftestTestCase):
+    def test_add_remove_fragments(self):
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), None)
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), None)
+
+        runCmd('bitbake-config-build add-fragment selftest/test-fragment')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), 'somevalue')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), None)
+
+        runCmd('bitbake-config-build add-fragment selftest/test-another-fragment')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), 'somevalue')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), 'someothervalue')
+
+        runCmd('bitbake-config-build remove-fragment selftest/test-fragment')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), None)
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), 'someothervalue')
+
+        runCmd('bitbake-config-build remove-fragment selftest/test-another-fragment')
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_VARIABLE'), None)
+        self.assertEqual(get_bb_var('SELFTEST_FRAGMENT_ANOTHER_VARIABLE'), None)
-- 
2.39.2


