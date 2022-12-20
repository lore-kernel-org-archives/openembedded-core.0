Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6119C3DA7C
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 18:07:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.57099.1671559639564572644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 10:07:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GnYXf0ef;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id m5-20020a7bca45000000b003d2fbab35c6so9460407wml.4
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 10:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2uDT9EtozHV2LCFszTE7ApqM52rI85QXrWs5TqtHw8=;
        b=GnYXf0efGMqYc/R9DxnK3j67oci2Tlhuyfa/rEFznHaRnoqFDi26yj2fRFnK2QSMNj
         yRqlMzIcTD5ZxZ16W/Bpa+/o7uwWkzIhgL2Hnar4BxsX1yevkA61viNVHFcyWZMYyAc8
         2jVThmRjZk2pwcydroxvJEugBpQFfeWqkfv4QLIiX5Uqf49ecxagIw2Joxv9uu5BxUFQ
         ASFZtwR2HVO5gUh0A5i372t3WCBRaHT/AkGrR0WfiespT0Wu+v+/7hdQiWvCgjNbhuw+
         I0Ok6oPtMmcAYkcO5zrvJel9bhf6dmUxP5oxx2kcBYmHmaaOJL0v1lNChuilF5hjGvv5
         8StQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2uDT9EtozHV2LCFszTE7ApqM52rI85QXrWs5TqtHw8=;
        b=g7d6jdCUoeY/uor2bmY3OioGtEbjRD9ZqlNpXKCHDxpHKx08XWk4Pe0XI3NW+lZgRy
         wHu9VibHw3sQPTsG+SKlQaJ0blq9Tlxs9voLkdR73T3w6DaKOu3u7xh4IfI/TPKBu10r
         Ec8zQV4a2Kt7FkR/YkC7iTYPDGBN9aEtCyA7FYxLLIaSdRbLScaQqklLiuIImCAlZtDz
         kryYz6rixo+pZx/mOlDLxOGx578ENs4T/ZSDyyzIZqs9DtCoehLSsU8n4DzQABwv6B6p
         oqRFjOkJsWnydljpZphxuLrmQOKv2agz9SS/sDYCjw9TDswbrx87KbVZrAGKUPrSnayy
         Hujw==
X-Gm-Message-State: ANoB5pmV+2zunONAP3yF7hwmQuUdTudaLg/bUdEmQc+UWr19wUl8qRC7
	HmviGqj8ArfbD4Gl6B07ZIQOMdBisvI=
X-Google-Smtp-Source: AA0mqf7Gn+3gd04dCRq9ADCHTz/daC6OP16TvaJuTswKtaRNeL+q/0p3VanIvikIpEjmcN6ewXUDFQ==
X-Received: by 2002:a05:600c:1e26:b0:3d2:2043:9cb7 with SMTP id ay38-20020a05600c1e2600b003d220439cb7mr28886556wmb.5.1671559640236;
        Tue, 20 Dec 2022 10:07:20 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u9-20020a05600c00c900b003cf37c5ddc0sm16243754wmm.22.2022.12.20.10.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:07:19 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH][PATCH 08/11] oeqa/runtime/rust: Add cargo test
Date: Tue, 20 Dec 2022 18:06:09 +0000
Message-Id: <20221220180612.24555-9-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221220180612.24555-1-alex.kiernan@gmail.com>
References: <20221220180612.24555-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174867

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/lib/oeqa/runtime/cases/rust.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/rust.py b/meta/lib/oeqa/runtime/cases/rust.py
index 186bb0d79e15..e2793f65c932 100644
--- a/meta/lib/oeqa/runtime/cases/rust.py
+++ b/meta/lib/oeqa/runtime/cases/rust.py
@@ -20,6 +20,8 @@ class RustCompileTest(OERuntimeTestCase):
     def tearDown(cls):
         files = '/tmp/test.rs /tmp/test'
         cls.tc.target.run('rm %s' % files)
+        dirs = '/tmp/hello'
+        cls.tc.target.run('rm -r %s' % dirs)
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['rust'])
@@ -32,6 +34,21 @@ class RustCompileTest(OERuntimeTestCase):
         msg = 'running compiled file failed, output: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['cargo'])
+    def test_cargo_compile(self):
+        status, output = self.target.run('cargo new /tmp/hello')
+        msg = 'cargo new failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        status, output = self.target.run('cargo build --manifest-path=/tmp/hello/Cargo.toml')
+        msg = 'cargo build failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        status, output = self.target.run('/tmp/hello/target/debug/hello')
+        msg = 'running compiled file failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
 class RustHelloworldTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['rust-hello-world'])
-- 
2.39.0


