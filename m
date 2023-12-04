Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C122C10DCE
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:26:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.72251.1701703579322707912
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:26:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=v/SltEoZ;
 spf=pass (domain: baylibre.com, ip: 209.85.128.52, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40a4848c6e1so47618955e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 07:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701703577; x=1702308377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9Zb84Ec/4iGGHrwB2lZjLIhO9h38MYcxk9KrWHn4E0=;
        b=v/SltEoZluLuze1P9ibxZIFeG6D/SA2Ww7j5uIVS3vxk3buUKl+rQ+cqE3KJ3kQ+QH
         kjsWDSY7jZyxd3zSzt/84X1+670Y9Ped1jM4HfQhJDHBumYhXm9Ru8GO/SXKOafMxOYP
         Q+ZrCHvg7+9iwLpp6Fh+TP+5aHxCfkQ/1qJx5DzJJL/o5WVpq4vFmI/lmuNWScq9eKlW
         A0Q8WdiUN2ByFR847WkIK+XEaulFPpjc6qZhzAQ4mNwMkFR1QWWp3Y0JGUKXGeBBf3ht
         RaVuajY93JneEeYliNmElE6jAiISxpUVJ6R/HHgvCj+a4nkSYnK7sDV7xRPS8sjW/q0O
         WchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701703577; x=1702308377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9Zb84Ec/4iGGHrwB2lZjLIhO9h38MYcxk9KrWHn4E0=;
        b=vrgUB3cdiCsc4kN0iaVDcX5Nim37Kcvhamz2yeZJaKWCVyFkk9+ELJwZw6MV38Cghx
         8w+15PXh979+VwcdJxAfY2grk6HNYu48XkmcRmAWopYlff5D6nVYALnTTxFEMmmiHuKW
         wRYCexyx/o7uuccc5Ign59LplPabIdvuMiegwEumBF+nAUEDwzyDnNfAQSHFvEsK5ULy
         pwg18g4g/yGKn8k/r3lZ+qQRoK5u9hKOKd1qrytdahb0uhCwWLpNsEmGkAX24q4brztm
         ijbX1C1u9iF3YuixYsKtzsSESxKMoca8Mbvq7uyUgShUN5IBNo0oWXZ3dPdkdN/f/0xl
         ExLA==
X-Gm-Message-State: AOJu0Yx24XpeX/+Y+pVttCme65qXJpABQQV3vJs82aCDD68m5I7ZxONk
	kEoTb0uOU3zrANDQ+cKjecEB3IhPLKo+BAScPW9RDw==
X-Google-Smtp-Source: AGHT+IEwyQ64FJSo0ZsrB0yPQUeFQLniHi8MRQrrHlyKOok+Kuoryp+2vRCKiNV6JeWlQfiGw017+A==
X-Received: by 2002:a05:600c:1d95:b0:40b:5e21:bdd7 with SMTP id p21-20020a05600c1d9500b0040b5e21bdd7mr2454236wms.102.1701703577244;
        Mon, 04 Dec 2023 07:26:17 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d6087000000b0033340937da6sm5257341wrt.95.2023.12.04.07.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 07:26:16 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 8/9] oeqa/selftest/recipetool: appendsrfile: add test for machine
Date: Mon,  4 Dec 2023 16:26:02 +0100
Message-ID: <20231204152603.831495-9-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204152603.831495-1-jstephan@baylibre.com>
References: <20231204152603.831495-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 15:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191751

Add a new test for machine specific bbappend override

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 44 +++++++++++++++++++---
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 21cb350e8a6..c55025e7df6 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -1056,7 +1056,7 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
             if p.scheme == 'file':
                 return p.netloc + p.path, uri
 
-    def _test_appendsrcfile(self, testrecipe, filename=None, destdir=None, has_src_uri=True, srcdir=None, newfile=None, remove=None, options=''):
+    def _test_appendsrcfile(self, testrecipe, filename=None, destdir=None, has_src_uri=True, srcdir=None, newfile=None, remove=None, machine=None , options=''):
         if newfile is None:
             newfile = self.testfile
 
@@ -1084,17 +1084,39 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
         expectedlines = ['FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"\n',
                          '\n']
 
+        override = ""
+        if machine:
+            options += ' -m %s' % machine
+            override = ':append:%s' % machine
+            expectedlines.extend(['PACKAGE_ARCH = "${MACHINE_ARCH}"\n',
+                                  '\n'])
+
         if remove:
             for entry in remove:
-                expectedlines.extend(['SRC_URI:remove = "%s"\n' % entry,
+                if machine:
+                    entry_remove_line = 'SRC_URI:remove:%s = " %s"\n' % (machine, entry)
+                else:
+                    entry_remove_line = 'SRC_URI:remove = "%s"\n' % entry
+
+                expectedlines.extend([entry_remove_line,
                                        '\n'])
 
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
+        with open("/tmp/tmp.txt", "w") as file:
+            print(expectedlines, file=file)
+
+        if machine:
+            filename = '%s/%s' % (machine, filename)
 
         return self._try_recipetool_appendsrcfile(testrecipe, newfile, destpath, options, expectedlines, [filename])
 
@@ -1153,13 +1175,23 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         self.assertTrue(filepath, 'Unable to test, no file:// uri found in SRC_URI for %s' % testrecipe)
         self._test_appendsrcfile(testrecipe, filepath, has_src_uri=False)
 
-    def test_recipetool_appendsrcfile_existing_in_src_uri_diff_params(self):
+    def test_recipetool_appendsrcfile_existing_in_src_uri_diff_params(self, machine=None):
         testrecipe = 'base-files'
         subdir = 'tmp'
         filepath, srcuri_entry = self._get_first_file_uri(testrecipe)
         self.assertTrue(filepath, 'Unable to test, no file:// uri found in SRC_URI for %s' % testrecipe)
 
-        self._test_appendsrcfile(testrecipe, filepath, subdir, remove=[srcuri_entry])
+        self._test_appendsrcfile(testrecipe, filepath, subdir, machine=machine, remove=[srcuri_entry])
+
+    def test_recipetool_appendsrcfile_machine(self):
+        # A very basic test
+        self._test_appendsrcfile('base-files', 'a-file', machine='mymachine')
+
+        # Force cleaning the output of previous test
+        self.tearDownLocal()
+
+        # A more complex test: existing entry in src_uri with different param
+        self.test_recipetool_appendsrcfile_existing_in_src_uri_diff_params(machine='mymachine')
 
     def test_recipetool_appendsrcfile_replace_file_srcdir(self):
         testrecipe = 'bash'
-- 
2.42.0


