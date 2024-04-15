Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F8BC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 19:20:23 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.1815.1713208815750423495
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 12:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Iy63vBJ0;
 spf=pass (domain: baylibre.com, ip: 209.85.128.41, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41881bce4b5so4766635e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 12:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713208813; x=1713813613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFWav51KKf006dfZD50b2wafY0pKp3AbSGyZvcNXfCk=;
        b=Iy63vBJ03Pk8O2UAAMTIbpbPPm7yiFpFa2SqOm1jSrJgDruFu2qKSZxs51wrk1IQE3
         ZKb4Q3E4IIiWX6izf34FV7SdUEprvrJ8FZvZ1ILQxRjinmr98OZ1cFXUU5RaHjV2ni3M
         CshMk8T99Vo/EXZvIne+BmGuwNtaS5eP4tmY89vx6KDiBWBh9U2eRxoKLkmJrPh8pMpe
         HhV69w0mOCQBdVT3cSwDu+XrZ6ae3RIA/qMguOOtHVDNoPdqjB1lOTXSHKy4d879c5j4
         N1KtKDvPdtly6YKhNtA7q/7LwVlI+iKJi+0tgdH7ElDMKn6YaRQk+YtkTxQJlwri7seS
         UWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713208813; x=1713813613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFWav51KKf006dfZD50b2wafY0pKp3AbSGyZvcNXfCk=;
        b=LPGZm3xrgSPoWLiQTKXENfdmIdHwIVdCSzTKQqq9Exo4Cg2pjoK1hK4kAfJRkLNdi5
         zSTVCiM9ywY/eRTECzedy8zlTE+iShtt9/CuH82/ETSSn27q4u5JVkCXrjENNQcC46A3
         5jA8TXEez8t1jzz2RksJFdlhAKpEnOc3cZF/ziypTqbteZ9pEV5k6bRDKZVC0X/5jMw3
         gelLmECAfz9Y/bu8GqT1C7hNyziyvFd2MA0USi1VgxFw4q+ryuPj0NbIe2dFm0BNuqyS
         zW7d0QKDquW3d/wty8H0qh7Bw9895dpjjENjAvOHZcoVpg5/BkE2y6B/y0gcyDp4MYs8
         /Y8g==
X-Gm-Message-State: AOJu0YzhYXC6S+7Iy0pqjqannPJXDM3gMk4jHLgO2XZi2omNVFvAoBGE
	EyBo8t+Zfjk48vKUKSipw4++Cqf6skq0tlEeXeFaO/i7xClJfiDbufJJQ+svnmGQJq4GU4/wt3D
	CkAk=
X-Google-Smtp-Source: AGHT+IGnF7BiVJNxSLCdmybvVGRBaupjoTAU71G5rDSGrB0PLIayFl/SAYEzwa4qorSqJuB7klXScA==
X-Received: by 2002:a05:600c:511d:b0:416:643d:862 with SMTP id o29-20020a05600c511d00b00416643d0862mr9827728wms.25.1713208813363;
        Mon, 15 Apr 2024 12:20:13 -0700 (PDT)
Received: from localhost.localdomain ([2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id fm10-20020a05600c0c0a00b004180abdee2fsm12696885wmb.38.2024.04.15.12.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:20:13 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 2/2] oeqa/selftest/devtool: add test for updating local files into another layer
Date: Mon, 15 Apr 2024 21:20:10 +0200
Message-ID: <20240415192010.233966-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415192010.233966-1-jstephan@baylibre.com>
References: <20240415192010.233966-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 19:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198245

We don't have a test to check if we can correctly devtool update-recipe/finish
into another layer. So update the existing test_devtool_update_recipe_local_files
to also check the updates into another layer.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index c555e101217..4c59a630add 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1405,14 +1405,30 @@ class DevtoolUpdateTests(DevtoolBase):
         runCmd('echo "Bar" > new-file', cwd=tempdir)
         runCmd('git add new-file', cwd=tempdir)
         runCmd('git commit -m "Add new file"', cwd=tempdir)
-        self.add_command_to_tearDown('cd %s; git clean -fd .; git checkout .' %
-                                     os.path.dirname(recipefile))
         runCmd('devtool update-recipe %s' % testrecipe)
         expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile)),
                            (' M', '.*/makedevs/makedevs.c$'),
                            ('??', '.*/makedevs/new-local$'),
                            ('??', '.*/makedevs/0001-Add-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        # Now try to update recipe in another layer, so first, clean it
+        runCmd('cd %s; git clean -fd .; git checkout .' % os.path.dirname(recipefile))
+        # Create a temporary layer and add it to bblayers.conf
+        self._create_temp_layer(templayerdir, True, 'templayer')
+        # Update recipe in templayer
+        result = runCmd('devtool update-recipe %s -a %s' % (testrecipe, templayerdir))
+        self.assertNotIn('WARNING:', result.output)
+        # Check recipe is still clean
+        self._check_repo_status(os.path.dirname(recipefile), [])
+        splitpath = os.path.dirname(recipefile).split(os.sep)
+        appenddir = os.path.join(templayerdir, splitpath[-2], splitpath[-1])
+        bbappendfile = self._check_bbappend(testrecipe, recipefile, appenddir)
+        patchfile = os.path.join(appenddir, testrecipe, '0001-Add-new-file.patch')
+        new_local_file = os.path.join(appenddir, testrecipe, 'new_local')
+        local_file = os.path.join(appenddir, testrecipe, 'makedevs.c')
+        self.assertExists(patchfile, 'Patch file 0001-Add-new-file.patch not created')
+        self.assertExists(local_file, 'File makedevs.c not created')
+        self.assertExists(patchfile, 'File new_local not created')
 
     def test_devtool_update_recipe_local_files_2(self):
         """Check local source files support when oe-local-files is in Git"""
-- 
2.44.0


