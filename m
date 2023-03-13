Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B440AC77B61
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.17697.1678709755781897260
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jJby9cvZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id k10so47726293edk.13
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9SBrNI0jWSdkK4DAxOYGVcslq2cytPOcx5KcyTuWRkc=;
        b=jJby9cvZwbdT+Y/KZhVyDUwxPwt2uMYw5mWXLD1thmMVd21mMa8SvlP3dKCzg2jS7O
         8+NaijwUNZZofs2dK4VzvWtgyFjaSFdyDjyWrX3ODchMjsecY5Lx9VKoaz9MextjesGA
         QmA3KydvoqHl13lJaVsdtq01df9S1Y+FfgNwr+++qLSdifBhO+QPloSF8FVAITl2IG/n
         wiLLy30n+33YOCLjl++jI64fJl6rArjPNYwoMHGP4l4qJYNGOaC+Msjo3wh2CwBw4odS
         WvGh/9I8D1pqxIP1JlJ2Dj12LuM2ShSqqk+cA9TfhAiF5tl0JPzPG1k6pJY8PPSEVugB
         BxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SBrNI0jWSdkK4DAxOYGVcslq2cytPOcx5KcyTuWRkc=;
        b=nQQzyfiqdf0drKpANV2KI9PicP8FKWw8WYtrFc1OwOsBT29OUI4l+XpWXdic+VaAFy
         zV1Bg1IUw9i68Z3XrXv2Pw+ut0T6OWIp/+jWEzMlztOrUzxmscrO1WK2zf4UyTZmEm1C
         FlqCabFOC5Dl28B9XhNS1SoP7XfH3xmLp4Yg9jQLLPzBKMulxgmne5g2PnIL7wvBJVNU
         nGTJFV+lH7hyMjyNiDtemMrNP1fRfJHlw9jUDDbUMKchdGg2TAS/BGCqdP4LhBaiCvUB
         EjNcZ4F7t+xt+eO2w61Q1vYO48O0Y6a9k33XXuLjv7fBy2xGsFlK4QbJSDLZb3SC7Slv
         1avw==
X-Gm-Message-State: AO0yUKVdWwo+pv31zaTOO0hU3kCrLLnDYzoypShti0eZBsKJIWT9tFj0
	eO2bbflZpXvAfGa7yNA22u2YqTvsL1Q=
X-Google-Smtp-Source: AK7set9H6hMMA3U7jlo+pWmKC+TIwBjIafXIKWrNEUya9y7aB3esX/p6RSA6wK/xYxZXBJVYZ3eYig==
X-Received: by 2002:a17:907:787:b0:8dd:76d5:a82 with SMTP id xd7-20020a170907078700b008dd76d50a82mr45343729ejb.47.1678709754060;
        Mon, 13 Mar 2023 05:15:54 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u11-20020a170906408b00b009294524ac21sm1221848ejj.60.2023.03.13.05.15.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:15:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/14] selftest: devtool: set BB_HASHSERVE_UPSTREAM when setting SSTATE_MIRROR
Date: Mon, 13 Mar 2023 13:15:29 +0100
Message-Id: <67903dd0b38525697c767a2a3bb5e3abe29f6cf5.1678709427.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178434

* with my build/conf/local.conf:
  SSTATE_DIR = "/OE/build/poky/build/sstate-cache"
  these devtool tests will first set own SSTATE_DIR and the original one set as SSTATE_MIRROR:

2023-03-11 11:51:46,837 - oe-selftest - INFO - test_devtool_update_recipe_append (devtool.DevtoolUpdateTests.test_devtool_update_recipe_append)
2023-03-11 11:51:46,846 - oe-selftest - DEBUG - Appending to: /OE/build/poky/build/build-st-2023-03-11-patch2/devtool.DevtoolUpdateTests.test_devtool_update_recipe_append/build-st/conf/selftest.inc
SSTATE_DIR = "/OE/build/poky/build/build-st-2023-03-11-patch2/devtool.DevtoolUpdateTests.test_devtool_update_recipe_append/build-st/sstate_devtool"
SSTATE_MIRRORS += "file://.* file:////OE/build/poky/build/sstate-cache/PATH"

* but that unfortunately leads to a warning from sanity.bbclass
  about SSTATE_MIRRORS without matching BB_HASHSERVE, because
  BB_HASHSERVE is set to "auto" by default

  these tests failing with:

2023-03-11 11:55:39,610 - oe-selftest - INFO - ======================================================================
2023-03-11 11:55:39,610 - oe-selftest - INFO - FAIL: test_devtool_update_recipe_append_git (devtool.DevtoolUpdateTests.test_devtool_update_recipe_append_git)
2023-03-11 11:55:39,610 - oe-selftest - INFO - ----------------------------------------------------------------------
2023-03-11 11:55:39,611 - oe-selftest - INFO - Traceback (most recent call last):
  File "/OE/build/poky/meta/lib/oeqa/selftest/cases/devtool.py", line 1118, in test_devtool_update_recipe_append_git
    self.assertNotIn('WARNING:', result.output)
AssertionError: 'WARNING:' unexpectedly found in 'NOTE: Starting bitbake server...\nWARNING: You are using a local hash equivalence server but have configured an sstate mirror. This will likely mean no sstate will match from the mirror. You may wish to disable the hash equivalence use (BB_HASHSERVE), or use a hash equivalence server alongside the sstate mirror.\nLoading cache...done.\nLoaded 0 entries from dependency cache.\nParsing recipes...done.\nParsing of 947 .bb files complete (0 cached, 947 parsed). 1764 targets, 52 skipped, 0 masked, 0 errors.\n\nSummary: There was 1 WARNING message.\nINFO: Updating SRCREV in recipe mtd-utils-selftest_git.bb\nNOTE: Writing append file /tmp/devtoolqa1m2lh02v/layer/recipes-devtools/mtd/mtd-utils-selftest_git.bbappend'
----------------------------------------------------------------------

* just setting BB_HASHSERVE to empty doesn't work, because then we
  would need to disable OEEquivHash as well as it fails with:

  ERROR: OEEquivHash requires BB_HASHSERVE to be set

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 86014d2557..81d02017c1 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -276,6 +276,7 @@ class DevtoolBase(DevtoolTestCase):
         cls.sstate_conf  = 'SSTATE_DIR = "%s"\n' % cls.devtool_sstate
         cls.sstate_conf += ('SSTATE_MIRRORS += "file://.* file:///%s/PATH"\n'
                             % cls.original_sstate)
+        cls.sstate_conf += ('BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"\n')
 
     @classmethod
     def tearDownClass(cls):
-- 
2.39.2


