Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2543C4707B
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 14:42:15 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.8372.1704724933789671724
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 06:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N9qXI0om;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: jhatnedap@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5f68af028afso11164137b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 06:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704724933; x=1705329733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sBm+hy7PM6RQOWk5LlGyx/sDLNJ679LdNNMsFs7xx8I=;
        b=N9qXI0omUihWVZ+bQnp3/O1vhNgtwLherfrYFloY/IPk4yWYKrc8Z21VVfXfHVvdxy
         1r15F6MmniWNSWu9IkHjX6JrAffQCc3CFNJsDH4FFwgt83jW7iIlKjY6xMYr0efOrhTP
         zpzBanYrg7Wutj/qv8xm0D3gug2EshxaQcmBYG0oHPD7GZROCMSCnICUN9vLdoSZxHls
         /DqVxhy/D7Tsmo5A2bmsSy2BtY3SrFTY5fbhOna0U8iJ5xUo1mQwa62/fpIufRWtsz5n
         HAbCmCRfJiocSXK1N0NYnmR48dlcd4f35UYaZizg1RUiEIP85Whd5TC06KNALreQ6LBu
         P3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704724933; x=1705329733;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBm+hy7PM6RQOWk5LlGyx/sDLNJ679LdNNMsFs7xx8I=;
        b=rbU0lnmS3J6B6hYyrgfQc4krcDmTbBRzuCTAKvbNpXV8JbmVLLdEz7LjwgfJtkeTlH
         GUmLEwNAk45+Y8AAoWuZOUX8sE98+xuitiZNYnV5EwGlk9W5eJefjSY9+yteUvoCFNRb
         UrIwcIKQ6D5HiRrjTNM27IHdVHg3Laf1fcmQZV4ES8L3AUNyWjzY/A/IZy1yGl94V+Yn
         OpeyCWhVIQeaSdHKeRRqzAtbuLadnAvinV2qZq2o45P1Lb9Sy9v4uh8kgOaC+S/xe9wQ
         nkNEkZHIxYD96fhB81P40s5Z1v2FCIsR7Mt6av6zhlEf7LXQnA1BKjjgCkyrJq5mZ6Jg
         QoxA==
X-Gm-Message-State: AOJu0YzyzWyllFZjkrZxkDprmT7hOQdm+EgMTA6qLaQCD1+uaZBiMdHr
	7Vn3NSj51G51KI8FxxgRsazoFG4gWI8=
X-Google-Smtp-Source: AGHT+IFKNLZIHAH5Tna03tjEnHcjcDFEGAbIpBW8Me5u5ERRuE8uYNETkitfDxXBZ+b/nIwh6KRrZA==
X-Received: by 2002:a0d:c141:0:b0:5ee:7299:e2cf with SMTP id c62-20020a0dc141000000b005ee7299e2cfmr1287913ywd.52.1704724932934;
        Mon, 08 Jan 2024 06:42:12 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id g188-20020a0df6c5000000b005e25dc30d2fsm3241233ywf.45.2024.01.08.06.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 06:42:12 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC v3 2/2] bitbake-layers: Add test case layers setup update
Date: Mon,  8 Jan 2024 15:39:00 +0100
Message-ID: <20240108143857.2316-6-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20240108143857.2316-2-jermain.horsman@nedap.com>
References: <20240108143857.2316-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 14:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193409

From: Jermain Horsman <jermain.horsman@nedap.com>

This includes a simple test which creates a layer setup,
modifies it using a test string and checks if the resulting
layer setup is written correctly.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 8faa060234..f07fbd46fb 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -167,3 +167,29 @@ class BitbakeLayers(OESelftestTestCase):
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
+        test_repo = None
+        for s in data['sources']:
+            if 'contains_this_file' not in data['sources'][s].keys():
+                test_repo = s
+                result = runCmd('bitbake-layers create-layers-setup --update --repository {} --reference {} {}'.format(test_repo, 'remote/test', self.testlayer_path))
+                break
+
+        self.assertTrue(test_repo, "No test repo found")
+        self.validate_layersjson(jsonfile)
+
+        with open(jsonfile) as f:
+            data = json.load(f)
+        curr_rev = data['sources'][test_repo]['git-remote']['rev']
+        curr_desc = data['sources'][test_repo]['git-remote']['describe']
+
+        self.assertEqual(curr_rev, 'remote/test', "Revision not set correctly: '{}'".format(curr_rev))
+        self.assertEqual(curr_desc, '', "Describe not cleared: '{}'".format(curr_desc))
-- 
2.42.0.windows.2


