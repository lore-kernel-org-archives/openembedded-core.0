Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CD7C47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 12:36:01 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.52898.1704371752653587197
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 04:35:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LTEpkniL;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: jhatnedap@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-427e83601c4so2367461cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 04:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704371752; x=1704976552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=em3uFh53S6QsE1Z8Y+6Zlt7tibIr0cuA5cf0iljNz9k=;
        b=LTEpkniLPyqJEW9Eb79fiKubrXjlxydG6w2kG3zhAV1E1wnGNj9yH+WX2MSHVYZqWJ
         yUJnYTo8zTtF9aHGoZ+1nVkRy0alvlTIivBXmJdnkGp6e2atlFSCnRaNck/kQPrwO4Pj
         sE4cwCGXKcutN3diSylJhgQyhjAgwrTAdoHY2sqOrVHls3unx5mG78ORJVZHvvLSVZ6d
         Twyh+wlQhdXfvfBE3ivSqti82XH34n5OGFTaEzx9OcZ9TeVMoPGpnfpyzXirlzcxEjWH
         SjBQdtNvj0EMOjD0YJDoJAhFS6nyX1sBQqf/9Cz2wDHxFE0eLSwZJv7GaeQ9CyV2srdA
         otVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704371752; x=1704976552;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=em3uFh53S6QsE1Z8Y+6Zlt7tibIr0cuA5cf0iljNz9k=;
        b=cb0AhVunblBIs0sklnZu62BigegNcsM/rsz0+ZVu1wuDRIlZKxGou8wipU+X9fzeMV
         Mn4aG2dutGbwhImzVqXaz7SvMhaNX8fDl9Zb6N+B3TpSRbk0Z/x6c9MdDBPOfH63CHVb
         RYBU4TzNmF7CVsW0/sCeqhb8Khu7yPUSChBi4NQIoVSn8EGwy+QfrdUrKSAEtFMYwosS
         LzCA1a0Mzyq3jVWCTJ+Sp5U2ZGXgqyfFuOlr9cllEVlTcNTDEV502APPi4hlyLZQRp7w
         xW0nVNdR37AHmBcIUeRE9eKs53fxPyyduIy5z96T4XrzpNFjlJfffp1IZo6KsCYtNp7M
         p6Hg==
X-Gm-Message-State: AOJu0Yy4Md4oiWj481HgGvWUdKwSBFHMYzO5BMcoaCMWm6qTs1MK6EOa
	kwdIlEriQDia0pXIeNvyA6fP5cDyxFY=
X-Google-Smtp-Source: AGHT+IG8RGN67ycw/Za8N8fbjjcPtp/ufm4Zfv9Ii02VPsa28o8TaYxYqnX2HopRvoBzHODSH9se6g==
X-Received: by 2002:ac8:4e82:0:b0:428:272c:a655 with SMTP id 2-20020ac84e82000000b00428272ca655mr496625qtp.2.1704371751764;
        Thu, 04 Jan 2024 04:35:51 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id i11-20020a05622a08cb00b004281ce041f6sm4516537qte.21.2024.01.04.04.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 04:35:51 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC v2 2/2] bitbake-layers: Add test case layers setup update
Date: Thu,  4 Jan 2024 13:33:18 +0100
Message-ID: <20240104123420.932-4-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20240104123420.932-2-jermain.horsman@nedap.com>
References: <20240104123420.932-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 12:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193318

From: Jermain Horsman <jermain.horsman@nedap.com>

This includes a simple test which creates a layer setup,
modifies it using a test string and checks if the resulting
layer setup is written correctly.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 8faa060234..0467fbb736 100644
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
+                result = runCmd('bitbake-layers create-layers-setup --update {} --reference {} {}'.format(test_repo, 'remote/test', self.testlayer_path))
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


