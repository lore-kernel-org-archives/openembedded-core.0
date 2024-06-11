Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0D8C41513
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 14:16:57 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.10723.1718115411586558852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 07:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D0Kqtek9;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57864327f6eso1968168a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718115410; x=1718720210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e+/zpwJd307h0VIOUObhyMPia3hdzN9VvluxH6MNJ/c=;
        b=D0Kqtek9f609i/agf3oSNlEP0jRSq0zPr3sntNoPwOgnfbs8YeNHGj5FBz+mKijR0i
         b1ieBqbO885WvHmWXN6ByoGfrgd+8GPTYaqj1ZHu5mX8R1D5toCxYhixZJWSVIaIynlE
         3Mk0kFExuCxlS5vJWV4FBkWJiucKuQqsnRpL12gGb+UakWKSNd01YfH8Yj4ZoLP7yEHh
         sNGBH/Lt+ggkJTDeJI1Fp9NFb4BvV992kTFSi8r2iW7s/WkVL4k1zJu61GiKkEGseKby
         vvcQ3SIhGITR9+STHINh86RigsYbgEazOY/cDjchb8cewnu/9nz6geokmRu/5WKRgzcO
         1hfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718115410; x=1718720210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+/zpwJd307h0VIOUObhyMPia3hdzN9VvluxH6MNJ/c=;
        b=CWJJ4ZWZYSeZLZF0KiktiyUQ6WIfwWk0m1GShuzPKym1hcNHaJ/qMZbX9fGZjVdq6H
         /hIiupBLK9PHYXrYJiUdhTB68Dhz9L/MU7p8yF30R5HHRe1PRqNvSrYGkjRvCnq5lT1q
         60008VA4h7ffqhKhes4E0LwQbE/QvCG6KjdrtyZoPsxANoE4SJ8QGambKUYC7eOLKVHG
         jHXcGspQo0fZ1KgN0+QrzsIUfMRXbBsJUDaRcul636yI8INDvYSiFsDgVgETRp2/Z2n3
         w02Pl2T2wD6UvQexB6IBnqiH1s8AhHOLnjaDbHMRFIr7gTsfM5TFgFGMP9TYv+DCVGst
         0ZSQ==
X-Gm-Message-State: AOJu0YwU+FImLO8WCFXos7LMgMOvoMN/yLZNVsSWkp6VXqHKD6qlcs9d
	VMr3eYHqU5apBYE3m8W8/8GDqEmG7c3soPqR9L9TqIPp0bLQsjus5o4VMA==
X-Google-Smtp-Source: AGHT+IGh5dnAYMghJKrO4T3ISfVD1ebJ+qc/o6+prLj3AiblOiY2ef5nf8HcGHCA2f5Pfd6OeuI2GQ==
X-Received: by 2002:a05:6402:1750:b0:57c:537a:49c5 with SMTP id 4fb4d7f45d1cf-57c90e7cc60mr1801518a12.18.1718115409414;
        Tue, 11 Jun 2024 07:16:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57c7fcfc67fsm4311033a12.31.2024.06.11.07.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 07:16:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] bblayers/setupwriters/oe-local-copy: add a 'local copy' plugin for bitbake-layers create-layer-setup
Date: Tue, 11 Jun 2024 16:15:20 +0200
Message-Id: <20240611141522.3075000-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 14:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200526

From: Alexander Kanavin <alex@linutronix.de>

This plugin copies all currently configured layer respositories into
a dedicated location on local disk. This is useful for entirely offline
layer replication, when the layers are packed and then unpacked from
an archive, rather than fetched from git (there can be situations
where fetching from git is undesirable or impossible).

This plugin will also be used when replicating an entire yocto build
(with build config and sstate cache), and is an element of that.

This plugin is similar to what esdk does, and it provides that functionality
outside of populate_sdk_ext task. It does not reuse esdk code,
as that simply copies the layer tree; it's better to use 'git clone'
with a path to original repo on local disk, as that will preserve
commit history in the copy.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../bblayers/setupwriters/oe-local-copy.py    | 41 +++++++++++++++++++
 meta/lib/oeqa/selftest/cases/bblayers.py      | 13 ++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/lib/bblayers/setupwriters/oe-local-copy.py

diff --git a/meta/lib/bblayers/setupwriters/oe-local-copy.py b/meta/lib/bblayers/setupwriters/oe-local-copy.py
new file mode 100644
index 00000000000..8c1ccb67368
--- /dev/null
+++ b/meta/lib/bblayers/setupwriters/oe-local-copy.py
@@ -0,0 +1,41 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import logging
+import json
+
+logger = logging.getLogger('bitbake-layers')
+
+def plugin_init(plugins):
+    return OeLocalCopyWriter()
+
+class OeLocalCopyWriter():
+
+    def __str__(self):
+        return "oe-local-copy"
+
+    def do_write(self, parent, args):
+        """ Writes out a local copy of all the metadata layers (and bitbake) included in a current build. """
+        if not os.path.exists(args.destdir):
+            os.makedirs(args.destdir)
+        repos = parent.make_repo_config(args.destdir)
+        if not repos:
+            raise Exception("Could not determine layer sources")
+        output = os.path.join(os.path.abspath(args.destdir), args.output_prefix or "layers")
+        json_f = os.path.join(os.path.abspath(args.destdir), "bundle-repos.json")
+
+        for r in repos.values():
+            r['git-remote']['remotes'] = {"origin":{"uri":r["originpath"]}}
+
+        json_data = {"version":"1.0","sources":repos}
+        with open(json_f, 'w') as f:
+            json.dump(json_data, f, sort_keys=True, indent=4)
+
+        logger.info("Cloning repositories into {}".format(output))
+        bb.process.run('oe-setup-layers --force-bootstraplayer-checkout --destdir {} --jsondata {}'.format(output, json_f))
+
+    def register_arguments(self, parser):
+        pass
diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 695d17377d4..8b2bc319d50 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -240,3 +240,16 @@ class BitbakeLayers(OESelftestTestCase):
         self.assertEqual(first_desc_2, '', "Describe not cleared: '{}'".format(first_desc_2))
         self.assertEqual(second_rev_2, second_rev_1, "Revision should not be updated: '{}'".format(second_rev_2))
         self.assertEqual(second_desc_2, second_desc_1, "Describe should not be updated: '{}'".format(second_desc_2))
+
+    def test_bitbakelayers_setup_localcopy(self):
+        testcopydir = os.path.join(self.builddir, 'test-layer-copy')
+        result = runCmd('bitbake-layers create-layers-setup --writer oe-local-copy {}'.format(testcopydir))
+        oe_core_found = False
+        meta_selftest_found = False
+        for topdir, subdirs, files in os.walk(testcopydir):
+            if topdir.endswith('meta/conf') and 'layer.conf' in files:
+                oe_core_found = True
+            if topdir.endswith('meta-selftest/conf') and 'layer.conf' in files:
+                meta_selftest_found = True
+        self.assertTrue(oe_core_found, "meta/conf/layer.conf not found in {}".format(testcopydir))
+        self.assertTrue(meta_selftest_found, "meta-selftest/conf/layer.conf not found in {}".format(testcopydir))
-- 
2.39.2


