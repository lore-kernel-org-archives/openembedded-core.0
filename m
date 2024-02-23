Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC3AC54E49
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 12:01:56 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.8981.1708689706925111934
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 04:01:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QZ0yGIDw;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55f279dca99so1029227a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 04:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708689705; x=1709294505; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQf6xTUaMPFjGWdEp3oX+VMcpuC/bNXJcVjctzut2RY=;
        b=QZ0yGIDw9q+4KE0ilQF6SzacQIfR+Ocqx9IjfCX+KmA1XJbjSqwLUOEAa9+AHzBBly
         Ugo1GlGImXrGOH4+4Og3iUYO35dzyAdX3K5P3drDuAE7YUh/0b7pfDAMX2Q5Oy/HrHD3
         DSPAtUasXQbAGXrcUiUDNzTDCkIAzug6WJ5hng5Nn+RsRTwXvHYrd2C+WEOUwQ3/nyt9
         pY6XXdT8JPQN6l8w+vSlTdtt9cmyjc54iYcB2a4YX2sW90EaFPJ6St98sWQ4i3WaXPff
         dBX/WEqR6RSREoF1MJVkcuTYkmA1Lpy8ElMWSzOA0/JlGsCGc3XqcPS/D9MD4cVeSE1j
         2ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708689705; x=1709294505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQf6xTUaMPFjGWdEp3oX+VMcpuC/bNXJcVjctzut2RY=;
        b=MlyIBqopG0vz9nUliFK+9vlOzjkW43U03noWEc2bYULWDHXLsMk2ebF11+BROdbFeq
         shjd1maHax8NZGidqYrX1zOGevVf7J7zKEYkwvXJ6qbmrO2lPgR/si7Ci623LDq5ykcD
         WCavQN+GSs85sgRguIedg/tLqJqtmE4CkjU/6K+Wju3M8YBtcblBNVCIMp1gNZZsorfQ
         htxP+myOQav2pilKOuuKXw+9UjgrS1UQ9qv+cfjZEmrN149/XKSNGCstjgGwndXMhMfK
         gD+F58ZejjND2tZu/QN4MJUa9eslYaSsRPjCJMH+e9d0Y1clRuC7OJ/nYp0TI2IFn6Hg
         zrWw==
X-Gm-Message-State: AOJu0YxJOAG5bx0zVgbRHzlHhOxve66UbaXYegcaPVgBPoTnYftQmAwa
	2PHuPJIi97iEJGguCFfBpUC+lNXV8RcPrsAQbFM2jgvvl/vpbwC/kzqLM1sQ
X-Google-Smtp-Source: AGHT+IELQ6wBK9N5esREKZxpgsCc3oRutL8Senx1Hv/GPEGUGJoIO6BPtGNLAkQ6pzhKayHQTBCtJA==
X-Received: by 2002:a17:906:688d:b0:a3f:c10:4355 with SMTP id n13-20020a170906688d00b00a3f0c104355mr1201691ejr.26.1708689705131;
        Fri, 23 Feb 2024 04:01:45 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906345100b00a3d125b9c0asm220330ejb.81.2024.02.23.04.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 04:01:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 05/10] bblayers/setupwriters/oe-local-copy: add a 'local copy' plugin for bitbake-layers create-layer-setup
Date: Fri, 23 Feb 2024 13:01:29 +0100
Message-Id: <20240223120134.3713127-5-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240223120134.3713127-1-alex@linutronix.de>
References: <20240223120134.3713127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 12:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196065

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


