Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D387C3DA7B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 12:53:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.17640.1671627207796468335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 04:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lPd5lSfc;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso2389130wmb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 04:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dQHPa1jl42Qnqzrk65PfWAhCFFrh3E/g4lPOBwYjb8=;
        b=lPd5lSfcXGAwNDHUfTNjfMufpVptuLnbXLY4Qo+IIcMOpvh3CVmJdfsq7qSJswC2TJ
         OrkdmbNu1ik9yuMVSeEOVdbo0AnHsavusSCg1Tn9k91OPf9eyiqnQpYCMRKnyhs6QLRp
         tzqoa6ptHZnVPg8ga/KMvLtEBOoPDA2a74Xqb3lfL4N5A9qDqkSDr2SIiRQf0YFo4iPK
         HJ+3r8qkw3vDqQHtCEl/aJsVRLwp6XavZrYJwdeGXVlfzxV1rfZkrGZiVdgBOpJ1QWDD
         tMYltB2ktC0Dcm+p+qzjv6e0Vw6qJGu5+1zhywgwfscof7iEpUPihsUYmHMRw44AwWkC
         XdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dQHPa1jl42Qnqzrk65PfWAhCFFrh3E/g4lPOBwYjb8=;
        b=iknPRyoI9/Mqktexx1NvRzAamInGOY4wSHzTtKGbnFgbzSbJRUELZAK0HqKEreAxnq
         p9hFTxW4z2zwCFnYe6FGn36axSn6s1RvUSL/fLNJD1BkVkWIqeze9HWDk5hLD8wY1aKr
         J0wUW0vf3TJelOhauhIO0VKHnxnEYbbro6OcPiXRiHQozKGAhaN+BXXr5HU8OwTsnYNw
         BBrKJu/e7E30m3aKB8p9UPezj3BsKrFtcc4hE6dV7ex1W+iMdiFAiXO4WPB9Om/5ZF/m
         ySczzaFbww1C6+FBns6cvICmgcxwGYVAyTLRkwgOdQQuwjKHxHcxRGwXQddPDaU/og8Q
         fNUQ==
X-Gm-Message-State: AFqh2koGiJPjwtyDm0U/7oJd3gwDi29Gh8Cec8A2Pj0UP4n2dwQp4CVn
	slpb8H8GOVBI4/jXFSmJCV52WyKPgZM=
X-Google-Smtp-Source: AMrXdXu7lAkAiK+6e+KlwXu5MAsPxwAGFFkY0qRdE17K6EtAJpJSondzMMo2cP6BEC2t/My/ow4YoQ==
X-Received: by 2002:a05:600c:4e51:b0:3cf:7b8b:6521 with SMTP id e17-20020a05600c4e5100b003cf7b8b6521mr1555394wmq.32.1671627206163;
        Wed, 21 Dec 2022 04:53:26 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bcb86000000b003b47ff307e1sm2124097wmi.31.2022.12.21.04.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 04:53:25 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 10/10] oeqa/runtime/rust: Add cargo test
Date: Wed, 21 Dec 2022 12:53:05 +0000
Message-Id: <20221221125306.13779-11-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221125306.13779-1-alex.kiernan@gmail.com>
References: <20221221125306.13779-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 12:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174916

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

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


