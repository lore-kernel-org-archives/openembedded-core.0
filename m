Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B2EC4167D
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:28:04 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.13767.1699370880679359769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Nov 2023 07:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AZJbbpqb;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9dd5879a126so638760566b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 07:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699370879; x=1699975679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/3i3Qi2QpIrZh9W4yO//xltt7a8m3UUu5ChkwsiZUzY=;
        b=AZJbbpqbniFc5SyKNhUefHx+Jewd8ZNQCtDAFB0qOcABBfZ/TJu9dkp/alSYWniZvy
         IpK+LQtmEnJmKMt0pKaQtrbWVylFSPf+E1s23N58DLwiXCdkIVgNJjj9gyCswDAr+Zxx
         jWdVRJmJJQ3QSBIdlHy3P06Dzqve+PTgTqaYUisXrWudcoTKcJpoRBYpKdEa6wNtPBur
         T33YLK7viAalnKICY0/OdfAiBxJc0JvcW93sONWDlwnBBhbC1XqDpq8WYVg8/OnnbM7p
         vnmwA/Dvd/DTmRO9jX8gvsHChS2vD3wL56V+2I8HLeYr30CQMhRsSoRqAE0Rt7nHguCe
         xRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699370879; x=1699975679;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3i3Qi2QpIrZh9W4yO//xltt7a8m3UUu5ChkwsiZUzY=;
        b=o+vNyuEJJ/ZUhIHoklBxLL6GriVBYyUfkp0Y+jIzCnGxttGGONjA4Ld5OSDRPtImnA
         1lfrd2uzZrRFuFtfqVvbxfPUqAsu0G1Ab42720UAqCOiMqLriEyR5/2DwzD0eM0FAaaO
         XOU1dyxfu23EEydMm+FH9MhuFB8RuvPJ4wRrkUoI3GjbQPcRKuqs2DLrLsSmuPsLY4sT
         C5AUHJLrnr9zvJNFKWGK764GH0lDqrSvuylVRZ5vJX3orAKFf+nZc88GtMt8RE9vzW8X
         waDiuIClDm5LvOVQiMLi+BpmgK9ENcZdQ4WeZRb9AscyK3n5+4ZTnadlpkNNzd56FivV
         0CDw==
X-Gm-Message-State: AOJu0Yw4Ac+fQkMorULq8cQgU0xtUTC6Bg2P/BLMNH+6K7HjGbp/EJYC
	8H9rvwCWn234zmfY9MBjmdH77Co0IaM=
X-Google-Smtp-Source: AGHT+IEsi6dKKqWvm5xzk6ujdBEhv2YzTqT4W4vjdxVsutBHxa9G+tKu4seyiYXIXiUWBSKHMrG9WA==
X-Received: by 2002:a17:907:6e86:b0:9be:d55a:81c5 with SMTP id sh6-20020a1709076e8600b009bed55a81c5mr17219000ejc.60.1699370879114;
        Tue, 07 Nov 2023 07:27:59 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id bx7-20020a170906a1c700b009c5c5c2c5a4sm1146574ejb.219.2023.11.07.07.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 07:27:58 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC 7/7] bitbake-layers: Add test case update-layer-setup
Date: Tue,  7 Nov 2023 16:26:42 +0100
Message-ID: <20231107152641.1043-9-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20231107152641.1043-2-jermain.horsman@nedap.com>
References: <20231107152641.1043-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 15:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190297

From: Jermain Horsman <jermain.horsman@nedap.com>

The test creates a layer setup, modifies it to use a branch,
attempts a checkout using the modified file, it modifies the
layers setup again to use a revision restoring it to the
original state.
A final checkout is skipped as the revision might not be
present, additionally this functionality is covered by the
setup test.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 58 +++++++++++++++++++++---
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 8faa060234..bac4d5bbb5 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -142,6 +142,14 @@ class BitbakeLayers(OESelftestTestCase):
         jsonschema = os.path.join(get_bb_var('COREBASE'), 'meta/files/layers.schema.json')
         result = runCmd("{} {} -i {} {}".format(python, jsonvalidator, json, jsonschema))
 
+    def validate_layerscheckout(self, path):
+        testcheckoutdir = os.path.join(self.builddir, 'test-layer-checkout')
+        result = runCmd('{}/setup-layers --destdir {}'.format(path, testcheckoutdir))
+        # May not necessarily be named 'poky' or 'openembedded-core'
+        oecoredir = os.listdir(testcheckoutdir)[0]
+        testcheckoutfile = os.path.join(testcheckoutdir, oecoredir, "oe-init-build-env")
+        self.assertTrue(os.path.exists(testcheckoutfile), "File {} not found in test layer checkout".format(testcheckoutfile))
+
     def test_validate_examplelayersjson(self):
         json = os.path.join(get_bb_var('COREBASE'), "meta/files/layers.example.json")
         self.validate_layersjson(json)
@@ -161,9 +169,47 @@ class BitbakeLayers(OESelftestTestCase):
         with open(jsonfile, 'w') as f:
             json.dump(data, f)
 
-        testcheckoutdir = os.path.join(self.builddir, 'test-layer-checkout')
-        result = runCmd('{}/setup-layers --destdir {}'.format(self.testlayer_path, testcheckoutdir))
-        # May not necessarily be named 'poky' or 'openembedded-core'
-        oecoredir = os.listdir(testcheckoutdir)[0]
-        testcheckoutfile = os.path.join(testcheckoutdir, oecoredir, "oe-init-build-env")
-        self.assertTrue(os.path.exists(testcheckoutfile), "File {} not found in test layer checkout".format(testcheckoutfile))
+        self.validate_layerscheckout(self.testlayer_path)
+
+    def test_bitbakelayers_updatelayer(self):
+        result = runCmd('bitbake-layers create-layers-setup {}'.format(self.testlayer_path))
+        jsonfile = os.path.join(self.testlayer_path, "setup-layers.json")
+        self.validate_layersjson(jsonfile)
+
+        import json
+        with open(jsonfile) as f:
+            data = json.load(f)
+        test_repo = None
+        for s in data['sources']:
+            if 'contains_this_file' not in data['sources'][s].keys():
+                test_repo = s
+                test_rev = data['sources'][s]['git-remote']['rev']
+                test_desc = data['sources'][s]['git-remote']['describe']
+                break
+
+        self.assertTrue(test_repo, "No test repo found")
+
+        result = runCmd('bitbake-layers update-layers-setup {json} {repo} --branch'.format(json=jsonfile, repo=test_repo))
+        self.validate_layersjson(jsonfile)
+
+        with open(jsonfile) as f:
+            data = json.load(f)
+
+        curr_rev = data['sources'][test_repo]['git-remote']['rev']
+        curr_desc = data['sources'][test_repo]['git-remote']['describe']
+
+        self.assertEqual(curr_rev, '', "Revision not cleared: '{}'".format(curr_rev))
+        self.assertEqual(curr_desc, '', "Describe not cleared: '{}'".format(curr_desc))
+
+        self.validate_layerscheckout(self.testlayer_path)
+
+        result = runCmd('bitbake-layers update-layers-setup {json} {repo}'.format(json=jsonfile, repo=test_repo))
+        self.validate_layersjson(jsonfile)
+
+        with open(jsonfile) as f:
+            data = json.load(f)
+
+        curr_rev = data['sources'][test_repo]['git-remote']['rev']
+        curr_desc = data['sources'][test_repo]['git-remote']['describe']
+        self.assertEqual(curr_rev, test_rev, "Revision incorrect: '{}', expected '{}'".format(curr_rev, test_rev))
+        self.assertEqual(curr_desc, test_desc, "Describe incorrect: '{}', expected '{}'".format(curr_desc, test_desc))
-- 
2.42.0.windows.2


