Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5125E732D0
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 10:20:06 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.14117.1695982797359549279
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 03:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=o6wvuFnp;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=jdgX0+DILbkxcZFbJQb93uQ6wgLo6ZnUCVkx3ZV5fAY=; b=o6wvuFnpe7yQ6F1E9vUr86cV1b
	B20HQv9wewWjoBxgbh+0ZD+eGHoVx8cHjjlKqyHWCTGrEmz+xbkkx7UL/5Z0Cnx4PfLv+Lu2VBKzh
	10jUU5I9lSYysscdRDghr8pLyd3LNcWP7Kfwqdq62+bZUQJAFg2k/x5OPmy+oIOc3+7UiMoOhpsrH
	CsBqXuh0H0XV1tcxPBmrt2zYvBZ0nPIxe39t8yBczNySYGt8lke8vO0wd8p3j/3ty99dbBQFUN18I
	IDUy2VZyi7BLfowrzgojnpJ5NK02hS8H8FbrH3+/5dSvOZhqkKAdBLod7oVLWq1Zl0eSL+NoRTEy4
	ZdYStItw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1qmAbC-000EYK-Eh; Fri, 29 Sep 2023 12:19:54 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sean@geanix.com>)
	id 1qmAbC-000MOV-6h; Fri, 29 Sep 2023 12:19:54 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>,
	kasper@krinvent.dk,
	alex.kanavin@gmail.com
Subject: [OE-core][PATCH 3/3] oeqa/sdk/rust: Add build and run test of rust binary with SDK host
Date: Fri, 29 Sep 2023 12:19:23 +0200
Message-ID: <20230929101925.1442545-3-sean@geanix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929101925.1442545-1-sean@geanix.com>
References: <20230929101925.1442545-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27046/Fri Sep 29 09:41:56 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 10:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188398

Add a QA test to the SDK to test that a basic cargo build works for the
SDK host.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
I know that `cargo build` and `cargo run` is kinda redundant for the `cargo
run` command. But I guess it's easier to see whats happening here...

 meta/lib/oeqa/sdk/cases/rust.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oeqa/sdk/cases/rust.py b/meta/lib/oeqa/sdk/cases/rust.py
index 31036f0f14..9404078b1d 100644
--- a/meta/lib/oeqa/sdk/cases/rust.py
+++ b/meta/lib/oeqa/sdk/cases/rust.py
@@ -33,3 +33,25 @@ class RustCompileTest(OESDKTestCase):
 
     def test_cargo_build(self):
         self._run('cd %s/hello; cargo build' % self.tc.sdk_dir)
+
+class RustHostCompileTest(OESDKTestCase):
+    td_vars = ['MACHINE', 'SDKMACHINE']
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
+        machine = self.td.get("SDKMACHINE")
+        self._run('cd %s/hello; cargo build --target %s-oesdk-linux-gnu' % (self.tc.sdk_dir, machine))
+        self._run('cd %s/hello; cargo run --target %s-oesdk-linux-gnu' % (self.tc.sdk_dir, machine))
-- 
2.42.0


