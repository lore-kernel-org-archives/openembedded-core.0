Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC54C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 22:43:34 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.4590.1670539405252646354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 14:43:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PJqi6HV6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id fa4-20020a17090af0c400b002198d1328a0so6983953pjb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 14:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBOP2ylt03dLN95SSzteD6JmIluoIdRRCeet/5gbbaA=;
        b=PJqi6HV6ajeIijz/5EfS64S8yX8xYTfBBG80sK9J5V2Mz/LblqXwKdaLD/WRW9EgIg
         OrOYF7b0IPwAzFOfDZY45j6MJ2GDLK790rOBsYGA1xjbJk0pNvsVuabrJQH21/WX93Od
         cXAQz7ENY4jTHDz8hQqm/sQEWyae8z1XS4ExGNkh3pMsRqX2J1RlN/mQH92fVjHoJQ6S
         m+k6yhbEQbbgBw14RWpw6jUKZa0PU9qhzZpx8eeZ7xHN3k1wdUHX25+/z3KQVLnxrCdL
         vgWNU56ZxyfvuDUz2k6W1mNuzJtgbFTDVV+ETw0V0SSYER83ugbnjtb/+rvHtXd46pY5
         Uu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBOP2ylt03dLN95SSzteD6JmIluoIdRRCeet/5gbbaA=;
        b=XA6ojKrl+uhuu0h2J7G3LpvAz3ijufTM2rNQnmFuGqu01EAL8Jst7bb937KnAYpLS3
         jSu+cb9Z9IcI291V8+q/nW8FNZXbYw9U92boC1TkQwK4eC6wBFK9jdBW4ND2GHBhGqDd
         qc8FablYcZE3W5KyGrRxQlNb/upZ17SP/X9+IDSG3hVSbzmhbgIgP6/J8V/waZb3iK5/
         hkdj0fp4KqgGRuMdstdz1ByaKqDkeVzcMumsJ5lCNGj0mEW7EJSkSAfmq3UOLYU4Rixh
         08P2elrOS3525KWaTizfJJjVnKANEzdkJY4UEl6S2ntg8UpsG10BUjIQBXvfhRxB0h4R
         /BMA==
X-Gm-Message-State: ANoB5plNGj6l4UMftvHuUB32s525YuQAqkBjYonEJPLVN3v05okEM+kw
	dNBfxZRqNpjCbcGg8NpG+kspLgBk74bfPQZy40D6JA==
X-Google-Smtp-Source: AA0mqf7g7D3OxWgTQVVEK4+YMs4GlJhRcgr0cDTFnSn3+FW2Pfpc5wq3LZ7GoKdb9vguGaocL90QcQ==
X-Received: by 2002:a17:902:b218:b0:185:441e:2d98 with SMTP id t24-20020a170902b21800b00185441e2d98mr3819076plr.47.1670539404264;
        Thu, 08 Dec 2022 14:43:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709027ec100b00172973d3cd9sm1675980plb.55.2022.12.08.14.43.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 14:43:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/12] oeqa/selftest/tinfoil: Add test for separate config_data with recipe_parse_file()
Date: Thu,  8 Dec 2022 12:42:53 -1000
Message-Id: <fe294798f6f371e98e8234c8c45e78d28e824b7a.1670539237.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1670539235.git.steve@sakoman.com>
References: <cover.1670539235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 22:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174425

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
index c81d56d82b..4b261dad00 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -64,6 +64,20 @@ class TinfoilTests(OESelftestTestCase):
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


