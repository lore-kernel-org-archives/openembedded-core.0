Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F32CC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 21:17:36 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.30962.1671657445911287787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 13:17:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b+v4TrVr;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id m14so16191266wrh.7
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 13:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dQHPa1jl42Qnqzrk65PfWAhCFFrh3E/g4lPOBwYjb8=;
        b=b+v4TrVruwr+RPXnm71rIYPtmOMK8BjIyur3LHhuFldzgced8iGa93lMbU/Oar6gvf
         cxMG5RlTtiIs8+oIq244hny0GVfq+6nnpb4UNZL95qa54uDMJkY+Dp0XsAZtSV44I719
         LugwqE5yLD/glULj+3Qnw2sqw+jV2NFoBAtL3h+sXBIZl9VkZIHb6fWLGAsyAbMEsQw8
         sBMNb5QqhJYOA7m59auadK5gZyWBYj28DyGDbaE74+q2l8HS7QoWj+CyhRi2Df2kb7rW
         TmwtG+lWGna4baDe0hYE+tO2uhDnZRu7dbYYi5s2LTYOVBaDTKM4G8mQlgSNiE6x8PSj
         Ew0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dQHPa1jl42Qnqzrk65PfWAhCFFrh3E/g4lPOBwYjb8=;
        b=fUpZEwJytInNQWZ84y/plf4eLdUl3TPdaAakvXOWVjyTi+R7ZxkAq2BpOPesDuWHkB
         aARk4dzB5AIhZ+PThhqD869VZpBlftG0mpjZyBgq98lJgC9EQGH8Jfx3InXYTVAP7hlJ
         51zaHKyuVhSiK9xMiBIvqTs34vx5rZZMBQETXTf8PYHunkyvVQVaCVxFU/bdEewdahmi
         ckbV134qzf+1IF5yDoXXhUWvvI8tC3oXdbANUMLUn91CCplqMqJbQEFIo+zldYcLeiyy
         2piGcB5r4fv6L93Cfpj9zPO1LHrxMAxb2SzvmL3h2bW4I7sx/dlHid25ROkxLgNwhDI/
         lGfQ==
X-Gm-Message-State: AFqh2kpz4IgljekaQXet6M3lhuPrPkUBT4GeE1hvfDiumv28ps7oSW6y
	tQ4lwpOXaygLGTwgBbs2wqvk2NyVmjM=
X-Google-Smtp-Source: AMrXdXvZqmkDL7kZ8wXQTfeP5V2UyD0Km4eAxWFpTozsnEnza/4sSABOrH5+KA9TaD1bMoip+b6xNQ==
X-Received: by 2002:adf:e10d:0:b0:242:cdf:ab91 with SMTP id t13-20020adfe10d000000b002420cdfab91mr2122831wrz.56.1671657447018;
        Wed, 21 Dec 2022 13:17:27 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bx25-20020a5d5b19000000b00225307f43fbsm16312442wrb.44.2022.12.21.13.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 13:17:26 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 10/10] oeqa/runtime/rust: Add cargo test
Date: Wed, 21 Dec 2022 21:17:06 +0000
Message-Id: <20221221211706.25347-11-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221211706.25347-1-alex.kiernan@gmail.com>
References: <20221221211706.25347-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174950

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


