Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA95BC25B77
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 11:46:55 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.9483.1715082406382460271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 04:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ra6duQRx;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a59ab4f60a6so649041366b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715082404; x=1715687204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+/zpwJd307h0VIOUObhyMPia3hdzN9VvluxH6MNJ/c=;
        b=Ra6duQRxTHqaIfsF/08hc1sy1MWeq16JebBD2HDAZR1xq1/gH+uaqww+Io+sivIuoO
         VO+Nxr6N1Aqc+AmcRVExCA4hPU7x1y9AosmjW45Ptj5QzP9ljr9I5/VFjJitVzo8BbnV
         Zi0ZMLFpTC7I8xzJa1JUJqmS2jkIDrBbxs5GT+8CRAA3arTk8lmJR7Ma+OdavnxMPj6S
         fNUGqTly0ZnR3mN8jgNQJXY/SPGpkkLeJ91YB/9hvmzPDF3Pn/ZsEjE2z6MfGizea0P0
         0b3Vv3KfRpIc1TNR4hiRcenjXT6EEDulgx1KfQuuTl6TDhUSBm18gPewmp/hXfnEhPPC
         rUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082404; x=1715687204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+/zpwJd307h0VIOUObhyMPia3hdzN9VvluxH6MNJ/c=;
        b=RATBJj0oC+B+vgf2D28pXd2tvwaajwJf99J4DcgisdPM6/qsVib1dQurlbRfSlQBk+
         vsu5sBprF2nCbknPKlrCAme8z3F1RjIet8lR6NC5lXX7BXUHTHYfkRSm46uGZBkeVoAf
         qlMdGkMh8gbfZYFxdpUkFUWsKmyY4LXFi+gACbRdf0TURPuQb5DetfY2CUPMUGaPuix/
         hVbHEnmjbs+pNheAgke5p2mC8Kp5Gfh/0WCZLYB6NAwiwVo3v50cQh5O2re34aPuU6Bx
         UuPA+sNvvzvULfw0J9+Y0aOW8nMEJTbIptSMFnybEv9r7F6XvNRCkbWv0MlPnJfw8to8
         jWVQ==
X-Gm-Message-State: AOJu0YxxY2Cr8gUF0oi8hEticHk8EpqTzN35I9AVYJlFvXE0+eD5YPEw
	4HJpeSlCuuaa5Z7SSh5iQRKXMeEHTO/MAXrO8NGCub3aXDJBwRJbr3pnlQ==
X-Google-Smtp-Source: AGHT+IGVXoFh3lMdaQQd45ocQO42BweybTKADcZsW8/MVEHFg9t2o29dIkAknE+jFyRj5dQO2Wrt9Q==
X-Received: by 2002:a50:aa95:0:b0:568:cdd8:cf60 with SMTP id q21-20020a50aa95000000b00568cdd8cf60mr12031380edc.8.1715082404411;
        Tue, 07 May 2024 04:46:44 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id et4-20020a056402378400b00572d255e342sm5268215edb.10.2024.05.07.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 04:46:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/9] bblayers/setupwriters/oe-local-copy: add a 'local copy' plugin for bitbake-layers create-layer-setup
Date: Tue,  7 May 2024 13:46:24 +0200
Message-Id: <20240507114629.2591882-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240507114629.2591882-1-alex.kanavin@gmail.com>
References: <20240507114629.2591882-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 11:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199087

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


