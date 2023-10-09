Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17589E95A97
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 10:51:29 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.58250.1696848681170717456
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 03:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=PSNHSwNn;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=b2qPMr3q1nHQbo0srNb03ZkGpUMk/Gyeio7aBN3FkiI=; b=PSNHSwNns6dKqjTcrRT5p8t/ad
	vUPmz3sJoP0+Z6ZVxa/TiKm7/LbAEpnDt86icoorrZ1Z/Pqcp7C2LRdE2j9u7Oiyea5b9UMmegmzE
	5bEbyoyqGVtp16yoWJjVHMjSrllfFwJEM5i5vbtJHviUv875DWvb45VJQU5FQ6x6rwP9WCgpDDt3Q
	1l24Je1RJeJKBjv0c8C06MGeDtwWcjnrJiBU5j4JH/3loEBVwmBBtDx9NEQAsLGn40yPuqw7IuGNz
	KWMT8vHE4KiPlDwbU5c8pq9KLMxH6CB2Mb+3PhMjJJNZSyZHqVdifj+CloWAdfKZWPIAa7L1yt35d
	xc8GhTLw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qpnr5-000N2i-2r; Mon, 09 Oct 2023 12:51:19 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qpnr4-000C3o-Qw; Mon, 09 Oct 2023 12:51:18 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	kasper@krinvent.dk
Subject: [OE-core][PATCH v3 3/3] oeqa/sdk/rust: Add build and run test of rust binary with SDK host
Date: Mon,  9 Oct 2023 12:51:14 +0200
Message-ID: <20231009105116.4169222-3-sean@geanix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009105116.4169222-1-sean@geanix.com>
References: <20231009105116.4169222-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27056/Mon Oct  9 09:40:11 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 10:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188834

Add a QA test to the SDK to test that a basic cargo build works for the
SDK host.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---

Changes since v1:
- use SDK_SYS for compiling for SDK Host

 meta/lib/oeqa/sdk/cases/rust.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/rust.py b/meta/lib/oeqa/sdk/cases/rust.py
index 31036f0f14..f5d437bb19 100644
--- a/meta/lib/oeqa/sdk/cases/rust.py
+++ b/meta/lib/oeqa/sdk/cases/rust.py
@@ -33,3 +33,25 @@ class RustCompileTest(OESDKTestCase):
 
     def test_cargo_build(self):
         self._run('cd %s/hello; cargo build' % self.tc.sdk_dir)
+
+class RustHostCompileTest(OESDKTestCase):
+    td_vars = ['MACHINE', 'SDK_SYS']
+
+    @classmethod
+    def setUpClass(self):
+        targetdir = os.path.join(self.tc.sdk_dir, "hello")
+        try:
+            shutil.rmtree(targetdir)
+        except FileNotFoundError:
+            pass
+        shutil.copytree(os.path.join(self.tc.sdk_files_dir, "rust/hello"), targetdir)
+
+    def setUp(self):
+        machine = self.td.get("MACHINE")
+        if not self.tc.hasHostPackage("packagegroup-rust-cross-canadian-%s" % machine):
+            raise unittest.SkipTest("RustCompileTest class: SDK doesn't contain a Rust cross-canadian toolchain")
+
+    def test_cargo_build(self):
+        sdksys = self.td.get("SDK_SYS")
+        self._run('cd %s/hello; cargo build --target %s-gnu' % (self.tc.sdk_dir, sdksys))
+        self._run('cd %s/hello; cargo run --target %s-gnu' % (self.tc.sdk_dir, sdksys))
-- 
2.42.0


