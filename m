Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06DEC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 15:02:59 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.4616.1705503774338385811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 07:02:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZRUujH7+;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a28a997f3dfso839177366b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705503773; x=1706108573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4PQLQVjAedcSuAyKQPCT1VlTA0JMf57lo7+riU2HRMk=;
        b=ZRUujH7+BDWoG9fzvS97XO80R/HJMfUdKMPTh+LlKKmp7UNwI2mgjq5KiF+5O19lgS
         RAcYx0wCHNzYVEQ4fexjZ5cerQ4eH42l0uvepNNgohU/YwsjE/3rEX04LF2IfmE25ns6
         tCTnu5gVnu+VF2eBDplzQ8M+aVhRgJDCxOcRfaIlcpA2K+5ZjC7iZHFSt/NgWS/D5WXV
         34KR6fQUF8Bn8n3FlJU6q5pjl/2DJbWFMuDxOAAfI+TCtQkT3JPrKXyV55yCV8cnaKqk
         w6scF6nJ6hYSpQt+h+i4Oqj1puEvUUjsV4LgQRPsqCx6YfXLuEsYsjaJ9LW0MEWiXpGB
         cKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705503773; x=1706108573;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PQLQVjAedcSuAyKQPCT1VlTA0JMf57lo7+riU2HRMk=;
        b=uDeoEV/0DYZRkOCwDKfRVnGL2o4RNB3S7l6U9kxtf73wfkhY+3s/4aJBSAqH4xEETi
         kJI2kmnCiJmWeaooPVXZTQqMynXqVWhMabxlZY0L+o26a9cxoAkDsUNmyq5uiVTmAiNO
         m8QOakEM25zdvGauYZ0RMQIgJSKEbXUt3iT9+bW6+AOlJnMit7h1XZFKDEcXskq8m1yo
         TI7l1q770CMM27dG3KZigeyEh0ZKtWCZnQzAGHcui6tYYKp+9ejYlGbfG4N8mJgtMtDv
         qD76bO02lMOcSGAHZHqUR6jExYjtuqyHOLEJBHvkpDPVyxBDMaTzbP+/OdEATydKIPBM
         9BUQ==
X-Gm-Message-State: AOJu0Yww0hpt0CiIirBIHRj5SC6lzGe7efp5LXHUAKR6v5bd6I1l/xSV
	aU04GozY4JLoc4CipVIW7sK053Y/FS4=
X-Google-Smtp-Source: AGHT+IE3TfQxfv71iUo5z1nRrGIq5ADB/C9MWzyGYT5Xi2s1wUQZnFaabE4lUgWr64dLeIIfolTv5A==
X-Received: by 2002:a17:907:c26:b0:a28:aee4:cbd1 with SMTP id ga38-20020a1709070c2600b00a28aee4cbd1mr5715969ejc.7.1705503772695;
        Wed, 17 Jan 2024 07:02:52 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id h25-20020a170906399900b00a29db9e8c84sm7867465eje.220.2024.01.17.07.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 07:02:52 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [PATCH 2/2] bitbake-layers: Add test case layers setup for custom references
Date: Wed, 17 Jan 2024 16:02:15 +0100
Message-ID: <20240117150214.1110-4-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20240117150214.1110-2-jermain.horsman@nedap.com>
References: <20240117150214.1110-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 15:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193918

From: Jermain Horsman <jermain.horsman@nedap.com>

This includes a simple test which creates a layer setup using
custom references, and subsequently modifies the resulting layers
setup using a different custom reference.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 53 ++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 8faa060234..bf807badb7 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -167,3 +167,56 @@ class BitbakeLayers(OESelftestTestCase):
         oecoredir = os.listdir(testcheckoutdir)[0]
         testcheckoutfile = os.path.join(testcheckoutdir, oecoredir, "oe-init-build-env")
         self.assertTrue(os.path.exists(testcheckoutfile), "File {} not found in test layer checkout".format(testcheckoutfile))
+
+    def test_bitbakelayers_updatelayer(self):
+        result = runCmd('bitbake-layers create-layers-setup {}'.format(self.testlayer_path))
+        jsonfile = os.path.join(self.testlayer_path, "setup-layers.json")
+        self.validate_layersjson(jsonfile)
+
+        import json
+        with open(jsonfile) as f:
+            data = json.load(f)
+        repos = []
+        for s in data['sources']:
+            repos.append(s)
+
+        self.assertTrue(len(repos) > 1, "Not enough repositories available")
+        self.validate_layersjson(jsonfile)
+
+        test_ref_1 = 'ref_1'
+        test_ref_2 = 'ref_2'
+
+        # Create a new layers setup using custom references
+        result = runCmd('bitbake-layers create-layers-setup --use-custom-reference {first_repo}:{test_ref} --use-custom-reference {second_repo}:{test_ref} {path}'
+                        .format(first_repo=repos[0], second_repo=repos[1], test_ref=test_ref_1, path=self.testlayer_path))
+        self.validate_layersjson(jsonfile)
+
+        with open(jsonfile) as f:
+            data = json.load(f)
+        first_rev_1 = data['sources'][repos[0]]['git-remote']['rev']
+        first_desc_1 = data['sources'][repos[0]]['git-remote']['describe']
+        second_rev_1 = data['sources'][repos[1]]['git-remote']['rev']
+        second_desc_1 = data['sources'][repos[1]]['git-remote']['describe']
+
+        self.assertEqual(first_rev_1, test_ref_1, "Revision not set correctly: '{}'".format(first_rev_1))
+        self.assertEqual(first_desc_1, '', "Describe not cleared: '{}'".format(first_desc_1))
+        self.assertEqual(second_rev_1, test_ref_1, "Revision not set correctly: '{}'".format(second_rev_1))
+        self.assertEqual(second_desc_1, '', "Describe not cleared: '{}'".format(second_desc_1))
+
+        # Update one of the repositories in the layers setup using a different custom reference
+        # This should only update the selected repository, everything else should remain as is
+        result = runCmd('bitbake-layers create-layers-setup --update --use-custom-reference {first_repo}:{test_ref} {path}'
+                        .format(first_repo=repos[0], test_ref=test_ref_2, path=self.testlayer_path))
+        self.validate_layersjson(jsonfile)
+
+        with open(jsonfile) as f:
+            data = json.load(f)
+        first_rev_2 = data['sources'][repos[0]]['git-remote']['rev']
+        first_desc_2 = data['sources'][repos[0]]['git-remote']['describe']
+        second_rev_2 = data['sources'][repos[1]]['git-remote']['rev']
+        second_desc_2 = data['sources'][repos[1]]['git-remote']['describe']
+
+        self.assertEqual(first_rev_2, test_ref_2, "Revision not set correctly: '{}'".format(first_rev_2))
+        self.assertEqual(first_desc_2, '', "Describe not cleared: '{}'".format(first_desc_2))
+        self.assertEqual(second_rev_2, second_rev_1, "Revision should not be updated: '{}'".format(second_rev_2))
+        self.assertEqual(second_desc_2, second_desc_1, "Describe should not be updated: '{}'".format(second_desc_2))
-- 
2.43.0.windows.1


