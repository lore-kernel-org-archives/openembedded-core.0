Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C717AC4708D
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 21:59:45 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.126062.1672005582877211654
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 13:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V3SLDNGo;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id jo4so23096013ejb.7
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 13:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8NxucXV6rn0spdM+T2O1RQX0uQD3s/Ct+shKCIlKQ4=;
        b=V3SLDNGouhKUv7a25YpBYCgtzowm5KWVAFO6aV8jZQMoUWd6jaQzfmuDr3GfcF1uK/
         +5eMDMNPf3l16+2h6hfv11jx+ZYdEEEv4BT7WgN/8GFnXoU8K9oJM2ByJvToPF7GReqx
         w5G7kJCduzxq+CRnDuuJBA/cZ0cEZCl0jNZ5SYgrtSR73ScbIxIzEy7Feq4mXCSIETdh
         nRJ8YBrMyjQxLKrCs2u8xljZbQeD3oOQ7EfutT4l+CcV8m12v5stl6496pIpGS4V3gWm
         Pr1EkaKR60a7B3z/OhcL04VEivpx//qgqFRSP+0/6tdVbTJ0T3FPZO8vABdkSQ13eYtQ
         k1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8NxucXV6rn0spdM+T2O1RQX0uQD3s/Ct+shKCIlKQ4=;
        b=z9aPVcovnyq15WpCMDI52hf0265mOjxSAc0vi3vbv5+6D7jah2Z5x2TFN3AsAWMQ+v
         WInVuWYDuQFsaUm3ZiiaBOfrcZxM2fp3HlcBn+u28EOsBdQdUU4cop0CkKGDXspTfpRe
         e0MEldU58au7b7ViIsNhhfe3lWTqIGUztZxcNkRirPXN2DCAJlMrsOPF/BElM5HJi2sW
         xE8HolbLnQiUFMG6d9giL5suupju8ar5vtPK7ZROKXHBo26WMvyoYj3YpHIBYHQ+al3t
         2dVXfontg2zXGVVwqxnMQ6LB+Nq49HhAqU8qa+817HP3ua+owEpfthjdkFuz7t9Jw7TV
         ag3A==
X-Gm-Message-State: AFqh2kqkq3q0JL2JvyTCeEqJvWam8DdVC7XbWDVXFbyQfTmlJBmnxJ2R
	4rLM6Y/+2A2Pedmoo0dB+Xidg1NjFIU=
X-Google-Smtp-Source: AMrXdXv00l9Fi92CNSvm9hnx7KY/K1ec7WndHBYUgAluiR+4Go7T34e/a23BixtuPcazr/jBETk6JA==
X-Received: by 2002:a17:907:3907:b0:840:db38:bf23 with SMTP id so7-20020a170907390700b00840db38bf23mr12173450ejc.26.1672005581189;
        Sun, 25 Dec 2022 13:59:41 -0800 (PST)
Received: from localhost.localdomain (42.93.115.87.dyn.plus.net. [87.115.93.42])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007c0f2c4cdffsm4066487ejk.44.2022.12.25.13.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 13:59:40 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 11/11] oeqa/runtime/rust: Add cargo test
Date: Sun, 25 Dec 2022 21:59:21 +0000
Message-Id: <20221225215921.12868-12-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221225215921.12868-1-alex.kiernan@gmail.com>
References: <20221225215921.12868-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 21:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175006

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/lib/oeqa/runtime/cases/rust.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/rust.py b/meta/lib/oeqa/runtime/cases/rust.py
index 186bb0d79e15..c9c60e16fd2b 100644
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
+        status, output = self.target.run('cargo run --manifest-path=/tmp/hello/Cargo.toml')
+        msg = 'running compiled file failed, output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
 class RustHelloworldTest(OERuntimeTestCase):
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(['rust-hello-world'])
-- 
2.39.0


