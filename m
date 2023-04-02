Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFF5C7619A
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 16:42:59 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.48842.1680453775377856552
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 09:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Yck7nHZN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso28194925pjb.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680453774; x=1683045774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3J6wEmtSdNc9rjT0nDAWpVm7JmrssD8UvV9+yU8FgYE=;
        b=Yck7nHZNdKKtTNMISdWJlP2oTqFq/i5VXm4pyHGVboJH/H+RcveS3epx0aFQ8/Xx9j
         9xuRb1UsYBHp/kbE8SlCWNSvsD/fymBO4AOLqgT6pz1fRvipsBqoA35NRwDOsehsZRge
         n8Whh8j12kDtTBvzGihTt4TD1Zh677TORaMstvPHvkVOSbFbbbTIvPHGFt90RMeV9i1e
         Iu6j5kC3c9Oc/gfafLF4PlqZoVxQ9JYYzif199/H2rwnkLayl11UspL8LbNUtnuqOhM/
         a7UTeUe54RV6rqikDr49RFeUfDvHytmwibM9S7iAvug9KhJ5B3v2jQ4gTMlHlJOiR8Rx
         Xudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680453774; x=1683045774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3J6wEmtSdNc9rjT0nDAWpVm7JmrssD8UvV9+yU8FgYE=;
        b=QcxPfrB3/hZ5q4B2hLN8pczdW2NOM3gYh/FqSAvzcJFQPs90YGj+NqyDInu20tLcj3
         c80nyj2TAMwf8fzjernsJJuLzRQxaXh0T633c/mK7Yh2menxgCfHh0ktRON9IJlLEfEB
         SC5Gag9SKbkDvyPYsqA/aL5aZ59n2leT6UUjDAVdg/m07uCybA3ctq4IwlrYEEIPnL+b
         BJ4ynhjtrUCxEHnM+UiM3IYnxP1cf2hjc1zONzHS/ftCACbnAinPxrK+OtWgcZN1Scat
         2PRvOYGC4FQXUlzd0qhlrVGa1xszvV1vX7FYdakacBhYa9OEgVkiKwSDqsDUr/ur6Cbr
         j2Eg==
X-Gm-Message-State: AAQBX9e1UHZ7OrfmExi/pVw6qLURY9Q5I8MghIPCkJEuMbCuGtj3IAdb
	aaPONUXLkRCw1VvQcR+Lr9ga6ZBFHzCSuLL20n4=
X-Google-Smtp-Source: AKy350YhrD1YRo8Z9Q2XTcP6aLJaq364IbVUz5ntlagJdmESvamhfaHVk7gOf010iXbBITXtnfYFwQ==
X-Received: by 2002:a17:902:fa47:b0:1a2:3e05:8efc with SMTP id lb7-20020a170902fa4700b001a23e058efcmr23547963plb.33.1680453774414;
        Sun, 02 Apr 2023 09:42:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001a1ddd224desm5042079plb.89.2023.04.02.09.42.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 09:42:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/21] selftest: devtool: set BB_HASHSERVE_UPSTREAM when setting SSTATE_MIRROR
Date: Sun,  2 Apr 2023 06:42:11 -1000
Message-Id: <e634a87d2f4f1e57d28c4e7462d56515ed2ea9ef.1680453201.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680453201.git.steve@sakoman.com>
References: <cover.1680453201.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 16:42:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179597

From: Martin Jansa <Martin.Jansa@gmail.com>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 96d4392ee9c5c3674e5c4c4512f527a2ca6765e4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 34fc791f3a..f512ebc0a0 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -258,6 +258,7 @@ class DevtoolBase(DevtoolTestCase):
         cls.sstate_conf  = 'SSTATE_DIR = "%s"\n' % cls.devtool_sstate
         cls.sstate_conf += ('SSTATE_MIRRORS += "file://.* file:///%s/PATH"\n'
                             % cls.original_sstate)
+        cls.sstate_conf += ('BB_HASHSERVE_UPSTREAM = "hashserv.yocto.io:8687"\n')
 
     @classmethod
     def tearDownClass(cls):
-- 
2.34.1


