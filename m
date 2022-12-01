Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349D3C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 17:40:45 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.51099.1669916439194274524
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 09:40:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UX9HhQE/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id d1so3882689wrs.12
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 09:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AsALqrxWeO+B6wFS+JpHYN9DCDN5m9VBqr7qOByoXwo=;
        b=UX9HhQE/PUks0BZmHreEe+mZ5rdOfAjA6FWVTyRWeoKiwSUIiY2wJSAdTqAirpoXY7
         9zDryFm2c4QOBcdNSVBGcg9Q3tAVjBb8psOPx/yNrVnujU3wDSnmJp2Wfee9yAa96Qag
         ISmDEuMAdLqBmtTJtR9SU3Pwowr92j64twOXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AsALqrxWeO+B6wFS+JpHYN9DCDN5m9VBqr7qOByoXwo=;
        b=JrgfstKB17giypbBPT+vCK+5oyvaISyo3RAaEDZgUq6aq10HfxWg718V4LvNIJozRX
         j/4CmP0DJG516CiYQA+/EtbvVqBlJ8l6KYRFLWnNHDUJ1A2PoZpk2RkoPAfCDr5SAdyM
         T14bPy4uGz9P/URLp+hfRjLxT2Stq9o+jTUN/7Ljkgz0Zn5z8hzaoSBILt/bN1w3Xd+G
         cXiQlWJPn6lU3EX3abYREHv1D0pxOC1jDH/FSuVsKXzwimkW2PrDqebclTmAiiTd/Zzl
         qaRMt/DfTSnK2tYrXoZZh//QQ1fMoRf6Sbx6YKrgP4RAQBTbweYg493xoShmPd+Oq3Vt
         OsFQ==
X-Gm-Message-State: ANoB5plqnOLiqW24cDokLXbwJ2UWGmLdt0mN6qg7MTXTTzRUYuerDKcd
	djbe+S6lRoDdJw/Eylwt3CIpbT0PcqXZ6A==
X-Google-Smtp-Source: AA0mqf4waqkOxnhbd4zbMc/nt8ZpS8WR4ARZ/ek0JVcmFZhp1RPqEJAx74c8j82V5tgETLLlU50TWw==
X-Received: by 2002:adf:fd85:0:b0:242:2ea1:593c with SMTP id d5-20020adffd85000000b002422ea1593cmr5460998wrr.497.1669916437169;
        Thu, 01 Dec 2022 09:40:37 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3f4c:de93:c029:9984])
        by smtp.gmail.com with ESMTPSA id d18-20020a5d6452000000b002366553eca7sm4874026wrw.83.2022.12.01.09.40.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 09:40:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/tinfoil: Add test for separate config_data with recipe_parse_file()
Date: Thu,  1 Dec 2022 17:40:34 +0000
Message-Id: <20221201174034.1184100-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 17:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174200

We've seen two different regressions in this API since it is used by
layer-index but not be the core code. Add a test for it to try and
ensure we don't break it again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index 0a66615fd1b..dd13c20402d 100644
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
2.34.1


