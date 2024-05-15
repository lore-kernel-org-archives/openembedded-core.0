Return-Path: <JHarris@westell.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75CDC41513
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 18:56:14 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.2443.1715799365215716142
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 11:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vb7hwURt;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: jefftharris@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43d2277d7e1so35083721cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715799364; x=1716404164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8a8QGdFMmQoB0ztV6qj3uPtoZBwQMPBvzgGQFhxHR70=;
        b=Vb7hwURtmY89jnBdSTN/YC/HsZK4Zlyxtd9FrSE/jvG8hmoeDI4gSckO4CTbACNgig
         NcsHY0NIZzZgWMqML7Z/rOWgZkBOHeYgg9ONB/X97oieKe98yuGJ8GIebq3l5CI0zI3A
         WvFOhTrTTZ5rvfc07JV4aor8VS8DNJFlS2onFjaboKny/plwe7nFOU06QqonCq1XLaS0
         QTg0x/7UErql1DeEJdQl4zb8znl5i6ie+d2VUDTPqB7Cr36FYZBcQuheUAoCiAGVT6p1
         w6mNQ9zJFC3KH3k1kYJGyOPsmRo15l3t/9/mmh8/Vv+5YInHziynxPGAsxo4EvP3eKgG
         bu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715799364; x=1716404164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8a8QGdFMmQoB0ztV6qj3uPtoZBwQMPBvzgGQFhxHR70=;
        b=pAh3VfomPG7YNGZbKvPCJHv7cGP2OBpOeKP5nWhaBNL52WXiQhXWEzRcMS8piEXwo9
         R5CpXsUAkeg4m9JMxx3mVCOeZffbtst15PMuUfFVj7ixd7FLSbapv2PRjndfK02lsKz6
         XMM8p+j/vOjKeRTeiZ9riN5tlAuPzzKwnlFFclCmsrvhnepBmbHltDj384of8pf+DXy4
         mrYMVV9siM2et9eOqCjjQiUpSzqdkq20d0zjYytYF+/srrlt7i1bg6Ruiog9cpw02JAg
         NCA2m1TQh4oBUJnK/QBQbc6prgH+Cc2k+RzYp5FRhYMD5K118VoYxu5CXXUzy/ysdWWX
         gDlg==
X-Gm-Message-State: AOJu0Yy//SN3bAA9/c9TyjbEX9pu2wxwr2GHKxo3ugsmmqEUsxqtLloP
	gya7lHoxx2wTNiiZP75hifT3FLErx1Q8qg8ezp+ZcsZoi/rXcHD94hWQd7Xy
X-Google-Smtp-Source: AGHT+IErfjEupIjQvyk5a0H9AYyeIGFAcXCQZXQ4MkfSQItOxINjnCFN/GZI5cqpj87GTpQFu+Q+sQ==
X-Received: by 2002:a05:622a:1184:b0:43b:1561:6c41 with SMTP id d75a77b69052e-43dfdaaa4c2mr192653471cf.1.1715799364068;
        Wed, 15 May 2024 11:56:04 -0700 (PDT)
Received: from clarinet.com (syn-024-160-195-130.res.spectrum.com. [24.160.195.130])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df5516115sm86413591cf.45.2024.05.15.11.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 11:56:03 -0700 (PDT)
From: Jeff Harris <jefftharris@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Jeff Harris <jefftharris@gmail.com>
Subject: [scarthgap][PATCH 2/2] oeqa/selftest/devtool: add test for updating local files into another layer
Date: Wed, 15 May 2024 14:56:00 -0400
Message-ID: <20240515185600.3456234-3-jefftharris@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240515185600.3456234-1-jefftharris@gmail.com>
References: <20240515185600.3456234-1-jefftharris@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 18:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199428

From: Julien Stephan <jstephan@baylibre.com>

We don't have a test to check if we can correctly devtool update-recipe/finish
into another layer. So update the existing test_devtool_update_recipe_local_files
to also check the updates into another layer.

(From OE-Core rev: bd44c895d36e246a25c7a6e40bf9f4089dc7a297)

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Jeff Harris <jefftharris@gmail.com>
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
2.45.0


