Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD23C46CA3
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 14:57:01 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.101433.1701788212901086162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 06:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=gM8FqKHt;
 spf=pass (domain: baylibre.com, ip: 209.85.128.54, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40c032962c5so41084725e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1701788211; x=1702393011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9Zb84Ec/4iGGHrwB2lZjLIhO9h38MYcxk9KrWHn4E0=;
        b=gM8FqKHtJ7w7SYf0gXcxogqCCjOcQtyvII2eIfdTUzAyXrtpTOwDRfrZAtJ9rXf82+
         QOlE6zmS9TYKlQ4sV1bjSMznbwd9boW3rNh7RrlUfejS7pvsrSNzNoy1cPizt6Qk6hi/
         za5hoJjA5nS43T4+XjRH6v8xRoN2e3zFyJL5AfjsquIegBzWAdHq8ed/6/ChevMCfnQT
         EAJ3V0+3yCe17/G2/8cPy1tg60cCiH4vs15Bv/sBFznAfaAFOXJj8VxpQ/X8R9M/TvhZ
         QsBOE2lSpGIP3FQo1+gh/MBI/CITB3C03dXDchedgx5yunQ7ES91EhWraUPtICeWEOMR
         WmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788211; x=1702393011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9Zb84Ec/4iGGHrwB2lZjLIhO9h38MYcxk9KrWHn4E0=;
        b=I+7TAINtpZTTD1roqyXo2Xhdt2dnUCnvLp2anIekGXFJXzTF3yMyT4+j0JL2+WWjpE
         kaDup91OP5eJdw9qJ8i8p4opbUyxIwJ/XxhAbwJPv/pwaLd6M9F0dkfoUwZbm9Ggf9Pa
         RgsS5syI6wc7rgABdGSmEku2O9RxOCM/EJBDKlgPPVT9LNPJ6WD5UjANRcd8XnvUQoKq
         TdxN+TnF9AW+QGvcymggKscBRrJjvMLKugh83risxHoZi+GtXFM6Ng7qhBgHrKXeJnSY
         8bmpRsPfdzP6t9QDovLz5FgtCJXonsIabI3dhe7GZz7w+88i37jlxlBHzgVIz8pAb7U/
         1M1g==
X-Gm-Message-State: AOJu0Yw+SmD8f+BkeoVymOicmRYCK//yQvP8N+HTDo5MeDszztPrKP3p
	Y6BdSF2UrzI/RUI0ad5TJGYC4avQUscseXNkZhIaew==
X-Google-Smtp-Source: AGHT+IHuaP4LF9fJoVWFwOwWOJSKmnRQfUtOUrO+7fYB/RvgqCJE9JwF15afou2rwtlJDaKs3452QQ==
X-Received: by 2002:a7b:c8d1:0:b0:40b:5e59:99d6 with SMTP id f17-20020a7bc8d1000000b0040b5e5999d6mr338615wml.246.1701788211182;
        Tue, 05 Dec 2023 06:56:51 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id cp6-20020a056000400600b003334520e49bsm6750082wrb.53.2023.12.05.06.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:56:50 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v3 09/10] oeqa/selftest/recipetool: appendsrfile: add test for machine
Date: Tue,  5 Dec 2023 15:56:35 +0100
Message-ID: <20231205145636.960819-10-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205145636.960819-1-jstephan@baylibre.com>
References: <20231205145636.960819-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 14:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191838

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


