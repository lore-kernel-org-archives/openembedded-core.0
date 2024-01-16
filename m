Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C92DC4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 10:57:04 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.10684.1705402621673460347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 02:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QNafrVar;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a277339dcf4so1085900466b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 02:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705402620; x=1706007420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ij+k4cMrUdDW8f+dfOLnGZ2C9znYtPpveKpFFUHO9qk=;
        b=QNafrVarci562GgTBe8GSoy+KU2kcfjGiHf13WNoJAKWutRVz2q4kU+koCCqY9Nlid
         WxffNrYVnRTDCN4pyoxiKeu7Xviopdo5NAggmrzQYl24TAu+jHtnKuy02trsKTcl0dTG
         QjNEcyinFX3i54dZIptpNqThYFEiGnrexsBmE4w2hQDdimMq7TygZEXyoLlWiGBe56EH
         z+/M2aQyuDhAxqLaF4t6MVm4SuMtrqzCXNvuQ9c9gY97naQxiIhq5U9beUrmBsX9Tq/2
         35UeyIKNCUKEf9zAX22jfFTMssupjsw8HTunIXo6/sP0uvIp9vcm2Me5PtoOTN8TORem
         MVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705402620; x=1706007420;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ij+k4cMrUdDW8f+dfOLnGZ2C9znYtPpveKpFFUHO9qk=;
        b=H0bdpGoDf13OkXu0Ywe3D9XTah0faGriJ2X0bg5qDY2iQxH486Es20EchdvXkggJQt
         gEV9U7iixOWWmkrZXcMCSF9vp2YGvAhzm8MXqxLLxt8danP0OhDsTKWAHazxULrfINNz
         mSz6jqxU8qBOJJfFzZrNevOglOnsO92tBfrkOYsVARehMaORYGnqjH+cV+6GhPuAChwd
         HQKCILjewnkiCeD1ToU6wGWKNBVPJa46uxGKzCJPD7/UUD6D5kZlSqXWFlddjdsm9xV+
         UiKoaHNByYWEbET0mcWMi7YqNpT8urLy4nwsWLLq1HeQ53vInPQPlhvnLPHrEWn4Zq3y
         RyiQ==
X-Gm-Message-State: AOJu0YzmNLZfEyWx2OrvI0sPQU/87G53p6sduMwuax0DVw3nNfPn/TGk
	WnBtCLoIBpg2+RYk5caDonR/6U3G+FU=
X-Google-Smtp-Source: AGHT+IEu9FEy+vZZfFtLSXMAFIsEsG6oAsvHvRjOO+exkewppNBKpsHieKDT0X7xFGDx1of9UJVX6Q==
X-Received: by 2002:a17:907:1184:b0:a2d:5394:18fb with SMTP id uz4-20020a170907118400b00a2d539418fbmr2426453ejb.109.1705402619869;
        Tue, 16 Jan 2024 02:56:59 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id tg14-20020a1709078dce00b00a2cb117050fsm5366969ejc.126.2024.01.16.02.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 02:56:59 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [RFC v4 2/2] bitbake-layers: Add test case layers setup update
Date: Tue, 16 Jan 2024 11:55:38 +0100
Message-ID: <20240116105537.961-4-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
In-Reply-To: <20240116105537.961-2-jermain.horsman@nedap.com>
References: <20240116105537.961-2-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 10:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193852

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
2.42.0.windows.2


