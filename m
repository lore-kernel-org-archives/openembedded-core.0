Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE04EC3DA71
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:33 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.142657.1671132090268548050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=k67y2PA1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d15so7896554pls.6
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hnbk2KMG+0tbEsHbdyTDcURCKtLuAzDuNA3/x18IXnM=;
        b=k67y2PA1WhZCtwoC+KVyP+0NSDtYOK5pNMI3jOshv4ZTspOZUU6OxBAKPx0eoJG8Oz
         9PLw8rJNty2Uve8Hk8HOgNVWA6p6w3rqwYM6dwozltC8q7DdVhGPaBzpZ3cwYCqxPSId
         D3O/2wqkItpOLtIZdbGaxBHnV0rDohshZXDxyPzAk1jaTxKODarTrAO1pAozeWGvrVl/
         71NIfWUUnhql3s3qx3ugM43S/85lRTr/+heKuGpzj3zjOR25xjGY6VxdYXvy7yjF9IgT
         FM2df9mPtM/OchYaAAMMyO0DDavMjRLSFfO863VR8F4LOKT47u2lamfYulACT/l3V3i1
         HQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hnbk2KMG+0tbEsHbdyTDcURCKtLuAzDuNA3/x18IXnM=;
        b=Kz+llEKrZvi2n0ybu1xsj+KrMQq2Z6L+3yN1lo7lXQsHo8PjDaPden05Sk2MlZghaB
         6D8mNIZP1Ez2ZQgikEkzsOwhkF3g8nfQJ2aj3M/fFL9vSPSEBmR/7S62CQ+qw4cxGT3X
         3BbvPeBnuFEKm/6O0tWg2Ooa3HrWewIUgEXBGO1Wp9WbyscnhHJm5Gdmhq/O3eL+bwWc
         h/6rynvqukhttTDFxBXtBRyVDYB1xwSzPcKciAlHT174mc6JhVwK7wJWX6ta66lBCf8k
         ppgvd9jlyzpiwRWOiWzggrYnJ4cVKQqV8UrC5fvNfUGQQAfzw6jvaQmCqE/SyIlmV9jK
         vAbg==
X-Gm-Message-State: ANoB5pmWgwLE4e6JBXZFMSdPEUd3umWaKB4hGnmFzSg2BUH0A+OmjLp6
	rHkxyTqVTli6X3+dGxCoEznH7aBXH+nnbvHfZXs=
X-Google-Smtp-Source: AA0mqf4/Pt7l/70UwkOW40m9pw3yyvEtOW5YPBcw7QHN3IA8eY3Cz37NL0QESynoOo3M173MV0tuQw==
X-Received: by 2002:a17:902:e38a:b0:18f:7fb3:fe11 with SMTP id g10-20020a170902e38a00b0018f7fb3fe11mr16794845ple.19.1671132089232;
        Thu, 15 Dec 2022 11:21:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/30] oeqa/selftest/tinfoil: Add test for separate config_data with recipe_parse_file()
Date: Thu, 15 Dec 2022 09:20:40 -1000
Message-Id: <25e6559aaccabe602757d7a195a4e6916c74a5fc.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174608

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
index 0a66615fd1..dd13c20402 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -66,6 +66,20 @@ class TinfoilTests(OESelftestTestCase):
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


