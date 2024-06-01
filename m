Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A7CC41513
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:26 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.36115.1717244717096487304
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=w6EoEQ9l;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f6342c5fa8so12958475ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244716; x=1717849516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JaBaLLQz6oGXBE39SbJ9DQAmeNPfDMG1ZqACeYPf8Ms=;
        b=w6EoEQ9lWRSp04ub0C7ioE1QWG2jHOREGI1yTbMqRUSOoqlKdIRvx4f4a4ybl0h2gz
         Mh/dz131ZeVuIy39TOQrIm6f1Oeei41ky5wYa9HTmuhE0paoCPTs5F13HZQcKAIrKhNm
         8boq0YGKwumTkMtDH2Gw7QcGmUWl6Jx1mOPF7iOp2oquyRyXg/D8mK1Vz8F6ncfna1sR
         gbMJtg6MawE0cXEGFm7NSYYlV2+gHQ9taKtBOBjXBN+H7Pk6jIpaQy42A7AmITdXbCP7
         5As22Rh1ThPyQ3h4AVFFCx/xkua9XjEw4jxvUkzlxDvNOSmwTvGQh7APMb0D06pT+ykp
         8kvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244716; x=1717849516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JaBaLLQz6oGXBE39SbJ9DQAmeNPfDMG1ZqACeYPf8Ms=;
        b=CI4Icqb4VY9OHH7c+6XudtNk4x2nEf0Y4n1MJVTvMES9s12M0NEeu8UyTymjhpp0mz
         kEeeR07L5BOx6kjPbsv7oIiWMgZUBX/M1XhL2G8ULZJr38lt9RQG7zyT8uJRfHaWDN/k
         JB0INIUz8O4u9YlVFyr/YjnXoia9iWGr+rqLvFjsWYrSnMepEexSHKdgNXSsSIUKSGut
         W02mM1P3o4VAgjs2v3OUyFyXigXypnUSgPjYvbTyVdJFHC7pKKQJKdLSAxsIX1R27F6f
         VYWW1ops/HH6dI5jWYOIpnV48fF4PCQrvWUQww/4kKl0O3U8aHNN0W40FtHzXUl/7Sou
         mlAw==
X-Gm-Message-State: AOJu0YxI7sjnFEkt5r5gFlDAV1fY/bLWKzA4gRq+/5SKjCPTAJHjP8VD
	agFTgtMB7sbFHfFQgUhOVW76eo7Z85J04F2serCaQfZ9m5GuQoEGB76M1Zgzg78i0+xjov2Jtzy
	s
X-Google-Smtp-Source: AGHT+IGQo+Yx+Hlq0ekjfsiso4Be7JZMO7hUZI6wxXt+itvW9tA1qczg9rrhvCEH7qEsrVbtZHDN8A==
X-Received: by 2002:a17:902:ebc5:b0:1f3:e41:949c with SMTP id d9443c01a7336-1f637098209mr44917205ad.47.1717244716253;
        Sat, 01 Jun 2024 05:25:16 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/21] oeqa/selftest/devtool: add test for updating local files into another layer
Date: Sat,  1 Jun 2024 05:24:42 -0700
Message-Id: <0532a6292edbe68303b6d85017ebcdb36a60886f.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200112

From: Julien Stephan <jstephan@baylibre.com>

We don't have a test to check if we can correctly devtool update-recipe/finish
into another layer. So update the existing test_devtool_update_recipe_local_files
to also check the updates into another layer.

(From OE-Core rev: bd44c895d36e246a25c7a6e40bf9f4089dc7a297)

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Jeff Harris <jefftharris@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index bc1e40ef83..51949e3c93 100644
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
2.34.1


