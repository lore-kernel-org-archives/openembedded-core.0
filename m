Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFACC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 13:56:57 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web11.18100.1707400611978252356
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 05:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DKcDIkrq;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: jhatnedap@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7bee8858a8aso74197239f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 05:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707400611; x=1708005411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wxpzSzfWibORrYY5vh+ZIDfR9njYdT2/1Is3l+6RD8w=;
        b=DKcDIkrqwKg8+I1X6vzt5WK67qOvR5RETpaczueAcIwJSxUIQps2KtlZXZDNf58Vvc
         c0Sfq7uaR9ucblJSoycqeLP1SGYAKFWfmsvW7PTFf1FE+ISk8tqP++vauVSrWXPBCz0K
         hw8iRgJIUUxWJGnIBm4xSo6JbqrrjYusx7htYel/8xw5GkCqMKiESG2geVnDMnh14pCV
         HnmUznJhXZECtSPsF9GOlGqQhCfDvImAEbnOCC7D3oAJ02iXf9zn9KQFCYa4cP7cTlrs
         EgABKE+CLRmZRvhnFbK/sgq/1DW6wvHOmGN5yGh64H7bNkxwV0mYUkcEXxviGsG+E64I
         KJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707400611; x=1708005411;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxpzSzfWibORrYY5vh+ZIDfR9njYdT2/1Is3l+6RD8w=;
        b=RtWYNhhMWS0Sunz1StmaEnGg45GbFC7AFnDcQ5JKUBKZnM/pxu+cCOseiR7U2tqSHe
         TpuBiTQNBtmwGaHWOcAtlOctGA8GovIKUZkZ9NgdCXxCy4yQEAh2HvZZBBmECn7USNVQ
         su4LxwJ01lvWVLhB720xtjGxLs/oyjSuF4zgUMuEN0qe/KjN6fEVqyHf3OEP1QBeJegW
         G57htsOOjps5+fxi2u/bjCt5Xjc/8ELtFHOdmgnIWqCxG5X/CNYV4jlI1I7eKQOZVdK5
         0uU1lDW9XCLHcpdDZK1e19ILt5sxpR3CArutv5kJz5UD9BIWMCu3bSjeZvcq/KR85U5g
         W/Rw==
X-Gm-Message-State: AOJu0YyARUq5hW/8YkpsiP7DIJ4jzzahdy2IpUQ8Jt+wdGkWrgY6jEWL
	in836kv1rT1RUNdS8oqbalhWtHWZEbILo8rOk+j1Tl2IQGhyROKaiLcUdwy1
X-Google-Smtp-Source: AGHT+IEsyaiOEDt0XtJmnPwWWyPUAt5hl94htQl4PteIQbtJ1f37D+0Fk2f/VREG5vWl/lh/sBEKdg==
X-Received: by 2002:a6b:e215:0:b0:7c3:f2a3:88a6 with SMTP id z21-20020a6be215000000b007c3f2a388a6mr8577321ioc.19.1707400611271;
        Thu, 08 Feb 2024 05:56:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5Np8lclMQgJekoanDNeGMbRNWc5aMY/Ilo5eZ10D2mQDbi9QoFwxQf3h1/jpEPM16Ae47p7+8OUb2l81t5JJHib/yO2k252/NcJL2PA==
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id m8-20020a02c888000000b004713ba1b284sm890412jao.44.2024.02.08.05.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 05:56:50 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 2/2] bitbake-layers: Add test case layers setup for custom references
Date: Thu,  8 Feb 2024 14:50:30 +0100
Message-ID: <20240208135028.893-4-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20240208135028.893-2-jermain.horsman@nedap.com>
References: <20240208135028.893-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 13:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195156

From: Jermain Horsman <jermain.horsman@nedap.com>

This includes a simple test which creates a layer setup using
custom references, and subsequently modifies the resulting layers
setup using a different custom reference.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---


Changes in v2:
- Rebased on abelloni/master-next as per requested

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>



 meta/lib/oeqa/selftest/cases/bblayers.py | 53 ++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 00b1e6ce96f..db56200b5fa 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -187,3 +187,56 @@ class BitbakeLayers(OESelftestTestCase):
 
         cmd = '{} --layerlist {} setup -c {} --no-shell'.format(oe_setup_build_l, layers_json, conf)
         result = runCmd(cmd)
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


