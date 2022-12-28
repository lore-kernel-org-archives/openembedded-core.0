Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69443C3DA7A
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 15:24:05 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.182573.1672241036553355207
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 07:23:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XHsnGgHv;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id bs20so13114703wrb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8NxucXV6rn0spdM+T2O1RQX0uQD3s/Ct+shKCIlKQ4=;
        b=XHsnGgHvzSFYn9PdTGcLXhVSPD2OP00KG5AivhdWG785pfcjwzwci9uHpkAIAeXKPO
         crI9H1fsjy4ZkGNf+KAkgu4GBGG5HS2jWvQ46aaoQbmS5+uxOAoMZ/S6rsZ+stfvcC4y
         +ujEY45TGJHIHj344K3TOiouC7oI/ZDnZvLC3CSGMN+o722VxLRaeX9UzjVNXNVn7lbL
         EwJXH9dayN130Vwv7xJGJxDgJzpLYb3pGOabjFkaF/9/2cgceNSBl1fnuKrJo+fSsUZ0
         8lmVLHfquLTXgiV8GdBT+clZwTXTUoAkLfbwLqXNAd89lw3jUzUxlevCij0Olbhwlq0V
         /XhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8NxucXV6rn0spdM+T2O1RQX0uQD3s/Ct+shKCIlKQ4=;
        b=hAMaQ+tr9utDHWswpxuu8gvlNP+qC7qDDS4DY3KpQMcXU93vXftBreAxB+P5TZovrD
         gkETIxFtH+Eq6DLD0Sn8CasS9xVEbMziz5BJWzw+4B55BL+EQ69pbqNYHARr7KDbgnf7
         DI5zqhxw/4JwhQ7DXzgzjWl/S9N1xkA7DjwTXqXaLO9lwcMVylTNjwy4TjIsVJFYQkCT
         1pwkE64HWYLzsXrRzdUSIyfR78rgnq+ATkJ+LGuXYSqloADqLo4WIVeI0v1ilJd9sL1z
         g7iffHF0jpJ4B3sT8Lc7mEWMuMFWQrxQroZEqEo1Wmjorj7JKs/5Sr2xNUfq6L5EeF63
         vrfA==
X-Gm-Message-State: AFqh2kqUWIqx9ARvfaDWxENTg694gbpHKx4sxa3ZjRTWZF/tF1rmKJmc
	E7GxYlVMBnNY26ZYA0t/b7sWY8Uh49Q=
X-Google-Smtp-Source: AMrXdXtRnhEQm5rAX9NgsXm1//gI/4lAz+C8LGAzDcOm2I4igt4d5hY5/ZGOv6iFC0Imq0Y1MkCNZw==
X-Received: by 2002:adf:d084:0:b0:278:29ac:f894 with SMTP id y4-20020adfd084000000b0027829acf894mr8396124wrh.64.1672241034819;
        Wed, 28 Dec 2022 07:23:54 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id r17-20020adfdc91000000b0027973315213sm10884893wrj.89.2022.12.28.07.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 07:23:54 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v5 12/12] oeqa/runtime/rust: Add cargo test
Date: Wed, 28 Dec 2022 15:23:34 +0000
Message-Id: <20221228152334.25449-13-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228152334.25449-1-alex.kiernan@gmail.com>
References: <20221228152334.25449-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 15:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175082

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


