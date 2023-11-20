Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047C4C5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:33 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.631.1700498371348716756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RtQFdVpk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cf6373ce31so6376765ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498370; x=1701103170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXySRxg+TjBqsX4RWzyaNWYOTyMDdk5Qop+dwQhVKxE=;
        b=RtQFdVpkU+2KyhJ2UH6Az0Nza68VTsBhEOm6OGkzqZZBOTjA5XzhEi+z1S5kJKTg7i
         d4q4J4PBKivAObgNYKyT3R16eGGKIcErtmrwFoZxYNI4MP+PMvRpVMaZea6UVH3uro3R
         B8aB8xajsl1BJd13PkRfryYlyIlTbIPr5rjxN+aSjv9eJ9fplkOcRB5Cq/ANBpx1EdIs
         XoYRl06WaBCSpQAljcb841UiYSbyivjJnGpC4zp8liZFMdGsZXRwoh/x6uQw93bpk32X
         58E7/AAMy5MfgW/0jhdnutwwG7jQkV3tirZAfsunF/gsGS3EEIqNQyJ76wmKUvz9h2Ry
         lwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498370; x=1701103170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXySRxg+TjBqsX4RWzyaNWYOTyMDdk5Qop+dwQhVKxE=;
        b=gT3V9/GS2V5cW8GgNm5mUVa+cvZZMW+D+wa7o925HwA2xlEXHkFF0v1T/gQJhL3SF0
         +MzYpB89luvpZ9tViy5Ohm8wG+ICkTXo422mLEU8R4HKUlmCoFubuLxzjuSLKqIcF9a5
         D/FaWEhF+2uGxIgmUO2H9GFDF+RiKpNFYk3v71Dtr/QA034dDCjHUBYpqCBR3BwBbLZD
         oxUKN6Rpe60+ervGoNeQkWeESOuopQKSMuhkONTZ/9avzHaa4OXFC4PBGNMylnLTZmrE
         G+5npT5AUS054X/ildGkcbT4nv67guflHmcvucCBz5H0wgOkwM2aQaWDg9EQwvgQYCLD
         Q5Jg==
X-Gm-Message-State: AOJu0YxGjLk6ohB/URq/joOO476+Wb5cOMDkfGx/MCNrVbKwXM/XwCa0
	i7t71RscCEtveCiO0ru3ZTe+E8mnWOTpOg1KHRqhRA==
X-Google-Smtp-Source: AGHT+IExmoAeHeqwajkCY9byPSURi9X0EZ5mN4WNrmbjLdMDVk7qLLPkmALSbExh5PH+/fS25fnJqw==
X-Received: by 2002:a17:903:188:b0:1ce:b83f:bd0c with SMTP id z8-20020a170903018800b001ceb83fbd0cmr19496plg.7.1700498370312;
        Mon, 20 Nov 2023 08:39:30 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 18/33] patchtest: test regardless of mergeability
Date: Mon, 20 Nov 2023 06:38:32 -1000
Message-Id: <aa2e3b4218b9bab00a895f470e6abcc4c1ea6358.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190907

From: Trevor Gamblin <tgamblin@baylibre.com>

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dc089073eb120de76c8907e476c341ed3e97c164)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py | 5 -----
 meta/lib/patchtest/tests/test_metadata_license.py          | 5 -----
 meta/lib/patchtest/tests/test_metadata_summary.py          | 5 -----
 meta/lib/patchtest/tests/test_python_pylint.py             | 2 --
 4 files changed, 17 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
index b2c32507ff..cb3e7c9d34 100644
--- a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
+++ b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
@@ -15,11 +15,6 @@ class LicFilesChkSum(base.Metadata):
     lictag   = 'License-Update'
     lictag_re  = pyparsing.Regex("^%s:" % lictag)
 
-    def setUp(self):
-        # these tests just make sense on patches that can be merged
-        if not PatchTestInput.repo.canbemerged:
-            self.skip('Patch cannot be merged')
-
     def test_lic_files_chksum_presence(self):
         if not self.added:
             self.skip('No added recipes, skipping test')
diff --git a/meta/lib/patchtest/tests/test_metadata_license.py b/meta/lib/patchtest/tests/test_metadata_license.py
index a5bc03b83f..1a7f09b747 100644
--- a/meta/lib/patchtest/tests/test_metadata_license.py
+++ b/meta/lib/patchtest/tests/test_metadata_license.py
@@ -12,11 +12,6 @@ class License(base.Metadata):
     metadata = 'LICENSE'
     invalid_license = 'PATCHTESTINVALID'
 
-    def setUp(self):
-        # these tests just make sense on patches that can be merged
-        if not PatchTestInput.repo.canbemerged:
-            self.skip('Patch cannot be merged')
-
     def test_license_presence(self):
         if not self.added:
             self.skip('No added recipes, skipping test')
diff --git a/meta/lib/patchtest/tests/test_metadata_summary.py b/meta/lib/patchtest/tests/test_metadata_summary.py
index 1502863df0..170e79eb4b 100644
--- a/meta/lib/patchtest/tests/test_metadata_summary.py
+++ b/meta/lib/patchtest/tests/test_metadata_summary.py
@@ -10,11 +10,6 @@ from data import PatchTestInput
 class Summary(base.Metadata):
     metadata = 'SUMMARY'
 
-    def setUp(self):
-        # these tests just make sense on patches that can be merged
-        if not PatchTestInput.repo.canbemerged:
-            self.skip('Patch cannot be merged')
-
     def test_summary_presence(self):
         if not self.added:
             self.skip('No added recipes, skipping test')
diff --git a/meta/lib/patchtest/tests/test_python_pylint.py b/meta/lib/patchtest/tests/test_python_pylint.py
index 9cfc491a13..304b2d5ee9 100644
--- a/meta/lib/patchtest/tests/test_python_pylint.py
+++ b/meta/lib/patchtest/tests/test_python_pylint.py
@@ -26,8 +26,6 @@ class PyLint(base.Base):
     def setUp(self):
         if self.unidiff_parse_error:
             self.skip('Python-unidiff parse error')
-        if not PatchTestInput.repo.canbemerged:
-            self.skip('Patch cannot be merged, no reason to execute the test method')
         if not PyLint.pythonpatches:
             self.skip('No python related patches, skipping test')
 
-- 
2.34.1


