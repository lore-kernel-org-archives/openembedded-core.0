Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE7EC27C78
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:24 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.9997.1718288478076801670
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bxwO0QI8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f4c7b022f8so10532715ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288477; x=1718893277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AIMectB0NV966czE+BArktwfX5RTuFlAGM5V6/rrkuM=;
        b=bxwO0QI8UClxscn4zrwu8CxW3jm6MpUBG56o11QYYVCbAUndasyyXCNu7QvLXG6iKr
         s79jCeHfmBs9rIB1YL7k1QkZAEsHATbmWKXXXET72q9hwtatfzU1tu7asSCfmMyVMP1J
         pt3Z/brWR8Hxo/vdLuyD4DUX43Y1WvBKwapt5DQGWv+5tlG2CUhCpoaD5GNYlMTbDdmf
         5f4mAYuHCOfsyW8W+v0eOvMvl/C01uLtFYDRArfqhJTUa4Q9kntBEelkVVWDwNIGzKlI
         Zs4j3ceErM6Sga5idMvfsudKgzzPxOSu0qd8Br80UxC0v73pmAVmMlG4r0leMGBxVvqx
         ibmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288477; x=1718893277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AIMectB0NV966czE+BArktwfX5RTuFlAGM5V6/rrkuM=;
        b=wgH4cUxjA2KM0tc2rAnyuuP2GZaJ8uKwD1Vv5MnYRZoD1YoOhf8aHFCAG1KoDKASfY
         j2ghX8fgM83HprdHdNkjSlVa9fkEr7UkJ1NVMrXBoaiwIp/uyqTjzmpgIKqUfV14UweS
         b+CWsK2w4KpI0UH9mywXPtuv3mTy7whsoyhXhL1cNEmFDciKlJYzcS7JtDd4Yn0KEoCh
         f0gKwmMUdNzYTgSOYnFLHnWac6AfV3fe+cqwVGLc2rgd2iaBH7sGIPYbCQRJxnqln+45
         gWG3WaKUpuQYi7bpsS9+M9KyCZqChL2ImTJhg9GvUCNAFzkBzlIKY/5sGQ9NaZvkXDbk
         KOFw==
X-Gm-Message-State: AOJu0Ywyy++O32TmKigxRY/7q3bRWfJUfJ/MS3JSOXxBgfR1iX80+l3/
	6Qu19Wi/gYzuDHJ9/vdM+F5U9T2E8gXIWHVv6MPCZ1gz2hy7rv5qECRrP3GGz/W8woFjOYRxZmW
	2
X-Google-Smtp-Source: AGHT+IFK+caiNOJh/gOY5AuKGJkrzCRulC1y0ysxZdiEBldNapwU8kDSGmvCrrwSWnD3kHUGjloWpA==
X-Received: by 2002:a17:903:2302:b0:1f7:3a5b:2f0 with SMTP id d9443c01a7336-1f83b70269emr61017485ad.44.1718288477308;
        Thu, 13 Jun 2024 07:21:17 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/29] oeqa/selftest/devtool: fix _test_devtool_add_git_url
Date: Thu, 13 Jun 2024 07:20:32 -0700
Message-Id: <c297b78454da2a668e62dec95d7b6eb6e5429480.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200630

From: Alexandre Truong <alexandre.truong@smile.fr>

This patch is a follow-up to the bug#15466.

As a reminder, the bug was about devtool’s submodule detection
checking for HEAD when a version is being passed.

As Vincent Kriek pointed out:
the --version that is being passed to devtool is only used for
setting the PV value in the recipe. To take into account the tag,
we add --srcrev to the command:
devtool add --srcrev v3.1.0 --version v3.1.0 mbedtls git://git@github.com/ARMmbed/mbedtls.git;protocol=https

Changes to _test_devtool_add_git_url have been made to take
into account the srcrev. srcrev will be passed as an optional
parameter because the test_devtool_add_git_style1
does not need the srcrev contrary to test_devtool_add_git_style2

Fixes [YOCTO #15466]

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reported-by: Alexandre Truong <alexandre.truong@smile.fr>
Suggested-by: Vincent Kriek <vincent@coelebs.dev>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8686f3641e4407dee3d807898ffd620e2732b78)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index cc4cbec5ae..1597aeedff 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -286,10 +286,13 @@ class DevtoolTestCase(OESelftestTestCase):
         else:
             self.skipTest('No tap devices found - you must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
 
-    def _test_devtool_add_git_url(self, git_url, version, pn, resulting_src_uri):
+    def _test_devtool_add_git_url(self, git_url, version, pn, resulting_src_uri, srcrev=None):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
-        result = runCmd('devtool add --version %s %s %s' % (version, pn, git_url))
+        command = 'devtool add --version %s %s %s' % (version, pn, git_url)
+        if srcrev :
+            command += ' --srcrev %s' %srcrev
+        result = runCmd(command)
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created')
         # Check the recipe name is correct
         recipefile = get_bb_var('FILE', pn)
@@ -479,11 +482,12 @@ class DevtoolAddTests(DevtoolBase):
 
     def test_devtool_add_git_style2(self):
         version = 'v3.1.0'
+        srcrev = 'v3.1.0'
         pn = 'mbedtls'
         # this will trigger reformat_git_uri with branch parameter in url
         git_url = "'git://git@github.com/ARMmbed/mbedtls.git;protocol=https'"
         resulting_src_uri = "gitsm://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
-        self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri)
+        self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri, srcrev)
 
     def test_devtool_add_library(self):
         # Fetch source
-- 
2.34.1


