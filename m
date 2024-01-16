Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565BDC4706C
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 08:24:43 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.8368.1705393476766977684
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 00:24:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=efQtQSim;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d6b4e2945so108452105e9.0
        for <Openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705393475; x=1705998275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9Ri8bKRh0UUnfr+zAPfllkWpqpv4B+od+eg4YK9j8k=;
        b=efQtQSim9CJpsHmM2qUTTpVgEvgWEWFYET8E8o38nx4/VA4i2C9AxqyJRD5lBOOqaE
         R85Jn/mUa2AHkXS+F0ixQAn/9JDcEqhCkC9jSf/sL2V9jKJt519Inx5e3PYFyztwas9c
         jdDEPP+AYIt0kjiHLP4bj/xRZSN5kq/bQMhWHaxFPnudu7EG2e77Szs4qZnBY/tTxicn
         H3uukEB0NbEd7yX/ASDwILCysx7GQY6KramEU0HK2WpWXlEHQRKsyMYaMWIFSsNiWc3d
         IkbmzbYsKqG3N2mdb/UvvQEkzsCGb2vbqkT/yeomhLOhnBbt1GlCaUpefcjtZi4hyT6T
         /ogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705393475; x=1705998275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9Ri8bKRh0UUnfr+zAPfllkWpqpv4B+od+eg4YK9j8k=;
        b=C6zwPZgLh+JMQ4T4M+j2xTeHzHPTF8w8xKt/x5X7BMTzcyDRsZmIUXDrk/TwjGXWIF
         6IBGKOQBl1yDVk+It3IFKE7y/uktT/gH24oirO3I1xdpP/8Hb9Rm8UN1MbokOsz15Cku
         5YssV1m5M1v3Pek/TsZ78viCpkv0wkr23FDvP+Fl2rngmY6p0hOvddc/4eiU4wMjQV7+
         tSw9ShvcIxUecOFPtn2E1nmkiSEZKHz+UbXg0PMj8W6UKB6x77H9d/LZwgXyNzeHxftv
         izpWtAq1ZXTH9P8OlovBI4HzmHjvREhx8Ng/5AwBAJisGPwRHYaGSwQzGmIsotTuVg3i
         qRYQ==
X-Gm-Message-State: AOJu0YzyqP8pRS8pfA80BXQYIqtZsxYtYpRkS6uXHmzCmw+be3zkM8z3
	t5XnEonHLDqvbYq7a0fk0XqfFdRDE3qbQw==
X-Google-Smtp-Source: AGHT+IGECTXfuuJpkO+RmTk09LK0e9mY6JC9Me839XKUcoMaKbunSMw2F1Ztod/xtB8YZZoUbtCVsg==
X-Received: by 2002:a7b:cbd6:0:b0:40d:80b4:16d6 with SMTP id n22-20020a7bcbd6000000b0040d80b416d6mr2339810wmi.188.1705393474769;
        Tue, 16 Jan 2024 00:24:34 -0800 (PST)
Received: from slackware.local ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id dv1-20020a0560000d8100b00337b55ed9afsm1091923wrb.95.2024.01.16.00.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 00:24:34 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke-oss@weidmueller.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 8/9] oeqa/selftest/recipetool: Move helper function to the class scope
Date: Tue, 16 Jan 2024 09:23:26 +0100
Message-Id: <20240116082327.128990-8-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240116082327.128990-1-uvv.mail@gmail.com>
References: <20240116082327.128990-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193831

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index 356bb4a746..83848d6170 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -744,14 +744,14 @@ class RecipetoolCreateTests(RecipetoolBase):
     def test_recipetool_create_git_srcbranch(self):
         self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;protocol=https', 'matchbox-keyboard-0-1')
 
+    def _go_urifiy(self, url, version, modulepath = None, pathmajor = None, subdir = None):
+        modulepath = ",path='%s'" % modulepath if len(modulepath) else ''
+        pathmajor = ",pathmajor='%s'" % pathmajor if len(pathmajor) else ''
+        subdir = ",subdir='%s'" % subdir if len(subdir) else ''
+        return "${@go_src_uri('%s','%s'%s%s%s)}" % (url, version, modulepath, pathmajor, subdir)
+
     def test_recipetool_create_go(self):
         # Basic test to check go recipe generation
-        def urifiy(url, version, modulepath = None, pathmajor = None, subdir = None):
-            modulepath = ",path='%s'" % modulepath if len(modulepath) else ''
-            pathmajor = ",pathmajor='%s'" % pathmajor if len(pathmajor) else ''
-            subdir = ",subdir='%s'" % subdir if len(subdir) else ''
-            return "${@go_src_uri('%s','%s'%s%s%s)}" % (url, version, modulepath, pathmajor, subdir)
-
         temprecipe = os.path.join(self.tempdir, 'recipe')
         os.makedirs(temprecipe)
 
@@ -919,7 +919,7 @@ class RecipetoolCreateTests(RecipetoolBase):
 
         src_uri = set()
         for d in dependencies:
-            src_uri.add(urifiy(*d))
+            src_uri.add(self._go_urifiy(*d))
 
         checkvars = {}
         checkvars['GO_DEPENDENCIES_SRC_URI'] = src_uri
-- 
2.35.1


