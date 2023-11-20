Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703EDC5AE5C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:40:03 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.655.1700498401300426576
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EwmHOi5Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b82541da51so708446b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498400; x=1701103200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FUEmMILZt9PyOnHwIAOaXDXPp38RlCW2vnxtdYA28tg=;
        b=EwmHOi5Z8AUiU4NEo7oDSZxjJduU41JLUIXAkQFNuhIpV64t/2bpj2KumJSp4qr8nu
         JTZGfIvW0x206pBMyuXyfVe/K3FC8l3wxoebKLQlASrgavM+xhvXU3ASUWvoUrcU+/Cp
         z5m7izaMvWICO48wmzenBpiE99Jq6/wO4YugD+BNqjpaVKguKITFIt8vQI4Xgr1EsA+g
         3hLbxn2Q6bNY9yFKIoFdm9Qj60H/aLhwm19tZKe8Xk3F+XSibO2DEMP2Lk59U5v7FupV
         qSqHLzSj36GRAq6Z6IMgFVGoGIx0e7Ug6bSS808EnMlQ4NpvFgOFVe76EpfeII+53jB0
         wW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498400; x=1701103200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUEmMILZt9PyOnHwIAOaXDXPp38RlCW2vnxtdYA28tg=;
        b=oPOn4WzTqqauHW0sk3LhXNTGVoupFj8Uanb8QhQtIxBNs2hVbLbNYESShVyuStO/yC
         qoBL7Yj5GuSjnE22kUNxGZqOdw0mQy8QEPnEQ+OT5Ch+gBwuJN1/W6MNh27gksgUkqfa
         CRLbXauSKugKnAI/PSR+vLGdLJtdlT2VjcVCbBOvT8klxRlYqELy02pV+8RqFK5FDlRU
         gxc8vapsqOQSnttyYs/vdPTaHH3rR1n8MSirOyGC7sNBDFPVzo61adB02K6hDq4ysqL2
         axP7P9VfbZCfHUTnkngAiTNao9pGCP7devhkV5/gK/zMciNxjwxekwcCxzM3Pg8WTcsR
         Y1JQ==
X-Gm-Message-State: AOJu0YwJR9Z24B7mF6aT68EGGQlObdtyvLrBGxmWdJTmfEfqa4vGYFOX
	Wd9CNc4Z6Qh48l8bOWdagz2nvxuCE4OKObIp63JjRw==
X-Google-Smtp-Source: AGHT+IHYewxdo3crk24N93PXUjHoC9cqG3iu9AXpBgXrtB5zHHin6ut6pWIPZZPZq3+tnGlqwxSWFA==
X-Received: by 2002:a05:6808:22a0:b0:3b2:e07e:5062 with SMTP id bo32-20020a05680822a000b003b2e07e5062mr10976577oib.52.1700498400290;
        Mon, 20 Nov 2023 08:40:00 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 33/33] patchtest: rework license checksum tests
Date: Mon, 20 Nov 2023 06:38:47 -1000
Message-Id: <34153775ffdb80a869a69ec051367d33007d516e.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190922

From: Trevor Gamblin <tgamblin@baylibre.com>

Remove the pretest_lic_files_chksum_modified_not_mentioned test entirely
and use pyparsing in test_lic_files_chksum_modified_not_mentioned to
scan the patches for lines starting with either "+LIC_FILES_CHKSUM" or
"-LIC_FILES_CHKSUM".  If either is found but no "License-Update" tag is
present in the commit, fail the test.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8e1bda0eb225ada22fdf5990edfec512be1d6629)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/patchtest/tests/test_metadata.py | 40 +++++------------------
 1 file changed, 8 insertions(+), 32 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index 3742760b45..b6f4456ad2 100644
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
2.34.1


