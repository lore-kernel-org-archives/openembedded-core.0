Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F39C77B6D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:14:33 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.38978.1680210866986904883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 14:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=6e76ci7d;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id o11so19393073ple.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680210866; x=1682802866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uYGsAVetNv1WCsX5k+luhaCwvE5bJU7ER+kr0Zpa1D0=;
        b=6e76ci7d+KCTN6P8EsBsbd4Sth7eevnFXjLEAEwLVFqNjW+Yyp9dY2eOLoNwNjljla
         MCK9/CpmqrsFOPVBeGUfiWnT+fNyiYsvgwdjceeV63vjdR+cHFvmgZD5aPKKfhxzJgSt
         g4OJd267Z1sGc9qr/+XWy/uF/GTsNxKOTR9iK0yN9Ai1lygqqPlEHb8HR/5hms0yT3dV
         yiY9gCYrq4skReRbjDYcZNPnaGCFF9+J8MCR2PRWovvyDrM4zNyORtfrxgaoa2zJMAHU
         YiQG1FDu/b9f36sqSveIIxMhMnfpn9VIWhuFT6xmY4yjhv6BdVdRaoJznZ6xzQkfvYfj
         fzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680210866; x=1682802866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uYGsAVetNv1WCsX5k+luhaCwvE5bJU7ER+kr0Zpa1D0=;
        b=tYn+fwy5bA/EkNYd3z9mnsMkqnZZb31/ef8eVvj0ICMqBaEKsWO+rbZLJWrawJ2lcq
         pPtnEOQ48Ml3Rlk69RDKYJA5Hnb3Dsqka8MazFXfyTLKxSxSKB10eNswtP2WWnivtjZS
         haelghmsg2pJlchzpCwOW5W6j3ZqSeMCIEoYfLIqOnUoLFxL+wQxoVoDy5OnvkfiFFzl
         XHskAqFsw73ijYCma9eAlWr+ERHOEKEhCCw1q3sfJeEaWNwHLIrbL6ikrUW2QHryX2V/
         HXpcsn9+hC4ROR3rR281xufxLF8dYP5lAC0LqHuMldHKB4bPqxHcCOoEp1faS9NHI9Q/
         e4Pw==
X-Gm-Message-State: AAQBX9eNRH0kNBFfKEBD2S2lAiouU+ql0WJT9PGsHN0EPx+PsbNEOPGc
	UculrBV7PassEArJ6Dme678fEyBdqgHrYpLTrL0=
X-Google-Smtp-Source: AKy350ZV3m0WZRgTPO21dpfw7GQ8wNgRyeg4BdC5M4QIJC89QuDuGC4TGEeRebdsxSkbQO3+bFBJGQ==
X-Received: by 2002:a05:6a20:3545:b0:e4:2a2c:869b with SMTP id f5-20020a056a20354500b000e42a2c869bmr1568833pze.36.1680210865976;
        Thu, 30 Mar 2023 14:14:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c30-20020a631c1e000000b0050301521335sm250661pgc.11.2023.03.30.14.14.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:14:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/14] selftest: devtool: set BB_HASHSERVE_UPSTREAM when setting SSTATE_MIRROR
Date: Thu, 30 Mar 2023 11:13:52 -1000
Message-Id: <14c727e4cafd7e1a945913bcc69747bb2efe3c71.1680210378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680210378.git.steve@sakoman.com>
References: <cover.1680210378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 21:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179369

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
index 0cb7403f16..877d77d488 100644
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
2.34.1


