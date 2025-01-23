Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0046C0218B
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 18:38:42 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.18587.1737657517456478550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 10:38:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=i8f456Zj;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LQ4A8JgmaqZbXL+g5I6EPSwaxJe7yxD/wuZ8EU4HIw4=; b=i8f456Zj48utVEeImCoA5bY/iB
	yMs32vNdkoO1RbbirqeDbhv3dMGL8EYtD0JYHKwb/Ndd4Kv0wDXyf8xjbARQViKUQT9V9PZ6y3r6e
	L2ZjR8IOv4SEHylWb/v3foOuagarNcKbZHvdzJoyWKgXDDqmYLhtFDNUIMjusU4vgS1AIKS/+qDWG
	hxHgNRn0WXu2m/R+9JsE7Vkr5FNmffi9zll+aiLGyO7Qv4j37e8MDX/JXPabWG+Jwrdt8jF2zW4J4
	MplcM+p7A/c35aa9QsUhiQU7dQAaSTnKrTkIVKHsIhUrD/gxw8ht1E8o74TrBXzT2RJDUGo9Phbkf
	GwdOz2Eg==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <sean@geanix.com>)
	id 1tb267-000PQk-1f;
	Thu, 23 Jan 2025 19:38:35 +0100
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sean@geanix.com>)
	id 1tb267-0001tL-0q;
	Thu, 23 Jan 2025 19:38:35 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [PATCH v2 2/2] oeqa/sdk/rust: Add a crate that needs the target and SDK host toolchain
Date: Thu, 23 Jan 2025 19:38:09 +0100
Message-ID: <20250123183812.2247598-2-sean@geanix.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123183812.2247598-1-sean@geanix.com>
References: <20250123183812.2247598-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27527/Thu Jan 23 10:44:17 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 18:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210203

Expand the QA tests, to test that the target and SDK host toolchains works.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta/lib/oeqa/sdk/cases/rust.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/rust.py b/meta/lib/oeqa/sdk/cases/rust.py
index a54245851b..4b115bebf5 100644
--- a/meta/lib/oeqa/sdk/cases/rust.py
+++ b/meta/lib/oeqa/sdk/cases/rust.py
@@ -31,6 +31,7 @@ class RustCompileTest(OESDKTestCase):
             raise unittest.SkipTest("RustCompileTest class: SDK doesn't contain a Rust cross-canadian toolchain")
 
     def test_cargo_build(self):
+        self._run('cd %s/hello; cargo add zstd' % (self.tc.sdk_dir))
         self._run('cd %s/hello; cargo build' % self.tc.sdk_dir)
 
 class RustHostCompileTest(OESDKTestCase):
@@ -52,5 +53,6 @@ class RustHostCompileTest(OESDKTestCase):
 
     def test_cargo_build(self):
         sdksys = self.td.get("SDK_SYS")
+        self._run('cd %s/hello; cargo add zstd' % (self.tc.sdk_dir))
         self._run('cd %s/hello; cargo build --target %s-gnu' % (self.tc.sdk_dir, sdksys))
         self._run('cd %s/hello; cargo run --target %s-gnu' % (self.tc.sdk_dir, sdksys))
-- 
2.47.1


