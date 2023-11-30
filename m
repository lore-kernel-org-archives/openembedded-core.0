Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22013C46CA7
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 22:02:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.8246.1701381744190212899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 14:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=XC+Nj/by;
 spf=pass (domain: baylibre.com, ip: 209.85.128.44, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40b552deba0so14961395e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 14:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701381742; x=1701986542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJwyWPnclH3jr3b3F8LYWUiK5AUVuMEhvjPO9KBHo2Y=;
        b=XC+Nj/by4AdO0quA3xZ+0L3YKZJU4CIKFGLcIliusuIgbKLdZaCHsS6cGTc/pDsZAa
         UDIaPxQ1tYnC0epa7JT37d4mxqiM9zrO2/CXLM6Cx1Ki51+U3dUsWVXYbtTonCIhS1B6
         HuTubqYe2Fhc9REwiPL17NDES2IYt9HERAi93YR37ilqjf4D9oGVttBFbR0Sm0MYcm3H
         NgIU7AQbLiLgzlEM7WE92BggUKQZIysx6f16T+5fzIvQU4Y6tOaHKt/YeFGm9JPQaPkA
         GBI134CDDiKvs3nTqQU5NdJt/pVhPSQ9OvGtqO+7JZW2hK3MtL2L5OE8uk+NtYvdLN9w
         hldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701381742; x=1701986542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJwyWPnclH3jr3b3F8LYWUiK5AUVuMEhvjPO9KBHo2Y=;
        b=fHVUzU8MJHvSKcVBoUOeydAoartHruygmVpPjHN9VWmUOCO2EmBd8lAVhk7tSktj1n
         Wn1rnNYz8VNFuBecdXZdu4hA317GUDkb4wKR3+1g3I1Wi+jedrT7L6MR2nW4to7uLDeG
         HdiV4IbDcg78NShrM9bPZHkcWI/hCf3fFHIdHFCc+26JKU/+K5wsxRzQCWyG7imBut5I
         BvQipu78PvJ/Czd9ytzdoZlAwo29687aSdZuaeMvVcL8bMAYZtJp8gJ7i5Fa72GP0T2s
         ry4rqaozjkDQlYIKwF3TtjXM43QHV35g+BKBgUBH86La+U0OUpfrY4/5lZqv5T3k3ByS
         kS0Q==
X-Gm-Message-State: AOJu0YyCPfX2LplDLdNlrIVaxAvJxUoMRuXhKskvlgJlYtbQYzvdrLzN
	+3iSARgFWAoPGX5DxB3YYSmstOzmQuhKAsyKPOOXuw==
X-Google-Smtp-Source: AGHT+IHY5EE/roP+GKr+lyBk++bccbxs8Y1/wX0x8Ovs4b79PUrJIA4pw/Bn98a41p4Nlak8k9GF3g==
X-Received: by 2002:a7b:c8ca:0:b0:40b:5e1d:839f with SMTP id f10-20020a7bc8ca000000b0040b5e1d839fmr74253wml.51.1701381742130;
        Thu, 30 Nov 2023 14:02:22 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id w3-20020a05600c474300b0040b36050f1bsm3231372wmo.44.2023.11.30.14.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 14:02:21 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 7/8] oeqa/selftest/recipetool: appendsrfile: add test for machine
Date: Thu, 30 Nov 2023 23:01:55 +0100
Message-ID: <20231130220156.726263-8-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231130220156.726263-1-jstephan@baylibre.com>
References: <20231130220156.726263-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 22:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191551

Add a new test for machine specific bbappend override

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 23 +++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index b445a40cb10..7d5ac4b47a5 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -1056,7 +1056,7 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
             if p.scheme == 'file':
                 return p.netloc + p.path
 
-    def _test_appendsrcfile(self, testrecipe, filename=None, destdir=None, has_src_uri=True, srcdir=None, newfile=None, options=''):
+    def _test_appendsrcfile(self, testrecipe, filename=None, destdir=None, has_src_uri=True, srcdir=None, newfile=None, machine=None, options=''):
         if newfile is None:
             newfile = self.testfile
 
@@ -1084,12 +1084,26 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
         expectedlines = ['FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"\n',
                          '\n']
 
+        override = ""
+        if machine:
+            options += ' -m %s' % machine
+            override = ':append:%s' % machine
+            expectedlines.extend(['PACKAGE_ARCH = "${MACHINE_ARCH}"\n',
+                                  '\n'])
+
         if has_src_uri:
             uri = 'file://%s' % filename
             if expected_subdir:
                 uri += ';subdir=%s' % expected_subdir
-            expectedlines.extend(['SRC_URI += "%s"\n' % uri,
-                                  '\n'])
+            if machine:
+                src_uri_line = 'SRC_URI%s = " %s"\n' % (override, uri)
+            else:
+                src_uri_line = 'SRC_URI += "%s"\n' % uri
+
+            expectedlines.extend([src_uri_line, '\n'])
+
+        if machine:
+            filename = '%s/%s' % (machine, filename)
 
         return self._try_recipetool_appendsrcfile(testrecipe, newfile, destpath, options, expectedlines, [filename])
 
@@ -1162,6 +1176,9 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         output = self._test_appendsrcfile(testrecipe, filepath, subdir, has_src_uri=False)
         self.assertTrue(any('with different parameters' in l for l in output))
 
+    def test_recipetool_appendsrcfile_machine(self):
+        self._test_appendsrcfile('base-files', 'a-file', machine='mymachine')
+
     def test_recipetool_appendsrcfile_replace_file_srcdir(self):
         testrecipe = 'bash'
         filepath = 'Makefile.in'
-- 
2.42.0


