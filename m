Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776A9C4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:34:21 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.57000.1699284855028280953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 07:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=KV4WcZb0;
 spf=pass (domain: baylibre.com, ip: 209.85.160.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-41cc56255e3so28229591cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 07:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699284854; x=1699889654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MxoC6c4a6UMPxh6fWbGmLmJDyN32HFos5hK66U9ZO6E=;
        b=KV4WcZb0au9tsLrV0Uh2Z9ayEGJ6U/QV1OShS9mAZf83QcSJ22PlYol9Cw7MxU4LA2
         nbMAbKvpuL8MDquUjoAdM5P2/yIjGZuuga183GL/Xmi6y1jaW+zke9bew5ZiRUD/dgLQ
         uSql6FbVmVqC0X1a5UwwAnY+Cr5kLUL+sDg/RQ9sJCUF+EtLNvegXcTKDwGjG7LY18Rb
         ThamRTIvvk5biNJIHd8RgM/56zGNypN3GFcJboRA+kjXqn0izOz9eae1SPtttqLKA7Om
         PrO3V8HK4QgTmtul3Ht4SqUSAYWhEKxHNW2S9gNL6jR4TNNfARn5GXOTR98qC1ShSl+F
         s6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699284854; x=1699889654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MxoC6c4a6UMPxh6fWbGmLmJDyN32HFos5hK66U9ZO6E=;
        b=ZCpfErLJJSvgZZvSv9RWjA/gtTAWdP3kzWjtJXV+zXaR/N74qENuKq6CJjbQBErPRV
         yjC2duY9F0OnMvnZsjuGlY2jmezfxt2oF83b/Cv9ZSNxsHw4935QzdbJRQ0TxuNg4kO1
         QntThPgHJJ9i2XIskzyUOISNZwubYTF9s/jiy4QxZn8lTposxcxTvyEK8hxniEf4al9K
         /ImRf1B/4CrGS9gIAUpV7VmdogWmxspfBlhayFh8uBDigNC4nFZ+exmeEO5Ii7+XQ13j
         I7ruykzpuMC49uzhcEHkDBWbrvmCD9Uj/cYNq7/6YfiiHXgikEh00W56dsBLrYEaf+2e
         erYA==
X-Gm-Message-State: AOJu0YxxL57uqqRsdVk62+QcDhhNhp7jBmXUSFMPdzilR8icXHjJVkck
	zRXoF546nZ9/v/DkdJUMh0cwA4KqnX88blTWtZYPpw==
X-Google-Smtp-Source: AGHT+IFfvyjIoavvQ1HFSScfQNn80fSdE4c3FApDJxghb18htoaDJABWQSR6XrXam7MuYfsdW2C66w==
X-Received: by 2002:a05:622a:189f:b0:41c:c27a:2927 with SMTP id v31-20020a05622a189f00b0041cc27a2927mr32042417qtc.44.1699284853847;
        Mon, 06 Nov 2023 07:34:13 -0800 (PST)
Received: from megalith.. (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id u15-20020a05622a198f00b0041977932fc6sm3469886qtc.18.2023.11.06.07.34.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 07:34:13 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest: rework license checksum tests
Date: Mon,  6 Nov 2023 10:34:12 -0500
Message-ID: <20231106153412.2223228-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 15:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190231

Remove the pretest_lic_files_chksum_modified_not_mentioned test entirely
and use pyparsing in test_lic_files_chksum_modified_not_mentioned to
scan the patches for lines starting with either "+LIC_FILES_CHKSUM" or
"-LIC_FILES_CHKSUM".  If either is found but no "License-Update" tag is
present in the commit, fail the test.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_metadata.py | 40 +++++------------------
 1 file changed, 8 insertions(+), 32 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index 3742760b451..b6f4456ad2e 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -16,6 +16,8 @@ class TestMetadata(base.Metadata):
     license_var  = 'LICENSE'
     closed   = 'CLOSED'
     lictag_re  = pyparsing.AtLineStart("License-Update:")
+    lic_chksum_added = pyparsing.AtLineStart("+" + metadata_chksum)
+    lic_chksum_removed = pyparsing.AtLineStart("-" + metadata_chksum)
     add_mark = pyparsing.Regex('\+ ')
     max_length = 200
     metadata_src_uri  = 'SRC_URI'
@@ -76,48 +78,22 @@ class TestMetadata(base.Metadata):
             if not lic_files_chksum:
                 self.fail('%s is missing in newly added recipe' % self.metadata_chksum)
 
-    def pretest_lic_files_chksum_modified_not_mentioned(self):
-        if not self.modified:
-            self.skip('No modified recipes, skipping pretest')
-        # get the proper metadata values
-        for pn in self.modified:
-            rd = self.tinfoil.parse_recipe(pn)
-            pathname = rd.getVar('FILE')
-            # we are not interested in images
-            if '/images/' in pathname:
-                continue
-            PatchTestDataStore['%s-%s-%s' % (self.shortid(),self.metadata_chksum,pn)] = rd.getVar(self.metadata_chksum)
-
     def test_lic_files_chksum_modified_not_mentioned(self):
         if not self.modified:
             self.skip('No modified recipes, skipping test')
 
-        # get the proper metadata values
-        for pn in self.modified:
-            rd = self.tinfoil.parse_recipe(pn)
-            pathname = rd.getVar('FILE')
-            # we are not interested in images
-            if '/images/' in pathname:
+        for patch in self.patchset:
+            # for the moment, we are just interested in metadata
+            if patch.path.endswith('.patch'):
                 continue
-            PatchTestDataStore['%s-%s-%s' % (self.shortid(),self.metadata_chksum,pn)] = rd.getVar(self.metadata_chksum)
-        # compare if there were changes between pre-merge and merge
-        for pn in self.modified:
-            pretest = PatchTestDataStore['pre%s-%s-%s' % (self.shortid(),self.metadata_chksum, pn)]
-            test    = PatchTestDataStore['%s-%s-%s' % (self.shortid(),self.metadata_chksum, pn)]
-
-            # TODO: this is workaround to avoid false-positives when pretest metadata is empty (not reason found yet)
-            # For more info, check bug 12284
-            if not pretest:
-                return
-
-            if pretest != test:
+            payload = str(patch)
+            if (self.lic_chksum_added.search_string(payload) or self.lic_chksum_removed.search_string(payload)):
                 # if any patch on the series contain reference on the metadata, fail
                 for commit in self.commits:
                     if self.lictag_re.search_string(commit.commit_message):
                        break
                 else:
-                    self.fail('LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message',
-                              data=[('Current checksum', pretest), ('New checksum', test)])
+                    self.fail('LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message')
 
     def test_max_line_length(self):
         for patch in self.patchset:
-- 
2.41.0


