Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165D7C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:58:35 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.15129.1671202697712081318
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7TShnvNJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d7so2541109pll.9
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GTcnF7M2bTtBDDxao4dZgoNkrd9DgSKmTzrFIDSLVpE=;
        b=7TShnvNJ9N84aUg2oGnysoAWB3UafHMKuaDxDFr54LnkN0ydbWFeDuaCGDrk9pR2q2
         6yIKjOmk2dc5y1VObzVar9OE2xVBkm1SYHaSNPkpcUt9TalfAoNKzOPJNFOqMuHz3yYw
         2nbxgVgXi+l0i/x+Af8McFhlyxHuoMtVNO6w47txI4smb+p+d5tl8d86u0qKjRsMQ6qp
         rKltn6AX+1I4bl0PgbdwqnqRt2aUFlYpCWtFV1MRyrgjuZqclLsrI//jN9usWYvEiosh
         ZXZ+MW/GVMPo3yTqhOR5V4bBJHokzkBXMv1W0uu8CYKJ5m3dwTcex5jMCnt19MlLpWEc
         sQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTcnF7M2bTtBDDxao4dZgoNkrd9DgSKmTzrFIDSLVpE=;
        b=rL9VUg2QsZHUVmS+S7EFVoHrvNQ2fJrlAE2HAKAoVlwio1RL9LzH0hHoIRGqRhemya
         JlbToLVmB8Bmi2wgCClKa9CAq+pcOgpjOVIhjL2c4MTUEBpXjWorZTOmNGt95Dmq7iiM
         vT0IApgIt2xUlHS18WLRcvR3ShsGyeIs7GMwfXw8hiBkDX26j+6W9UnpMRamKjf2Yf3e
         B8i3j0LvThv/qdNEFOBla5DFmStrFIyxNk/3uTM13MYzRc65sGYWXYLiJYmy+Lvo0wk7
         15Ch624e94bkwJNclXc4UpDRBCUPBit1MyLmgq5l0G9b7pHrU584/a8O8Zx26rVWJrH3
         kG/w==
X-Gm-Message-State: ANoB5pn1itid0dFttrIzVKMg5dGnmGh6/DSIlUr2meFja9v1kK5BdyJs
	8IwSul6sY7x31FdVCIQf7eZTpzCrLtP6zEFzjSY=
X-Google-Smtp-Source: AA0mqf4qVm6tW3EEHu7a5bB40M9lLUr6vHJN0FASK5rpnk6OrgLHCjb9QkA5mjiTiiyW2ZRQ2VqhqA==
X-Received: by 2002:a17:90b:3692:b0:221:5597:bfeb with SMTP id mj18-20020a17090b369200b002215597bfebmr20260076pjb.46.1671202705180;
        Fri, 16 Dec 2022 06:58:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r21-20020a17090b051500b00219eefe47c7sm1482230pjz.47.2022.12.16.06.58.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:58:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/13] oeqa/selftest/tinfoil: Add test for separate config_data with recipe_parse_file()
Date: Fri, 16 Dec 2022 04:57:52 -1000
Message-Id: <cc8ec63310f9a936371ea1070cb257c926808755.1671202568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671202568.git.steve@sakoman.com>
References: <cover.1671202568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174757

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We've seen two different regressions in this API since it is used by
layer-index but not be the core code. Add a test for it to try and
ensure we don't break it again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit b07de5de43ec9c9a2c5d496a64940ccdc5b47cf8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 686ce7e6b9..6668d7cdc8 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -65,6 +65,20 @@ class TinfoilTests(OESelftestTestCase):
             localdata.setVar('PN', 'hello')
             self.assertEqual('hello', localdata.getVar('BPN'))
 
+    # The config_data API tp parse_recipe_file is used by:
+    # layerindex-web layerindex/update_layer.py
+    def test_parse_recipe_custom_data(self):
+        with bb.tinfoil.Tinfoil() as tinfoil:
+            tinfoil.prepare(config_only=False, quiet=2)
+            localdata = bb.data.createCopy(tinfoil.config_data)
+            localdata.setVar("TESTVAR", "testval")
+            testrecipe = 'mdadm'
+            best = tinfoil.find_best_provider(testrecipe)
+            if not best:
+                self.fail('Unable to find recipe providing %s' % testrecipe)
+            rd = tinfoil.parse_recipe_file(best[3], config_data=localdata)
+            self.assertEqual("testval", rd.getVar('TESTVAR'))
+
     def test_list_recipes(self):
         with bb.tinfoil.Tinfoil() as tinfoil:
             tinfoil.prepare(config_only=False, quiet=2)
-- 
2.25.1


