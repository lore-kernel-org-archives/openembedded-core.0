Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B2FC00144
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 14:24:23 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.7275.1658845457546019442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 07:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DTsmN5Yk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id h9so20428916wrm.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t0ziEwlbPtSSA68On0TM05PIVtcwVvRlfV2RTtTSV4U=;
        b=DTsmN5YkGYWxmrCX64cKs+66Ne5nY9mhpAvrzNszMAmlOi5REoKFiA/IA21J3skXSI
         Z4GwE6lJ5ehn/x90lBExHpBJ0LtBaAS71sThaK653R2S2Y+/+TNsl0/tGsMktR03YuMa
         YulzldfDjfENMMuUGRBGvl+fW+jshKAs6R4PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t0ziEwlbPtSSA68On0TM05PIVtcwVvRlfV2RTtTSV4U=;
        b=S6hFxXsC6McDUDebJisPiIbh8Xt/iaUarOsnMGnzclLJfP+SXxU0oEr6MmpqQ3oKYy
         24bvReW5tUsBTPOvVKG1CagtDpNmSVCWMZFtOrrJ4q9jCJ9ClUO5tlUud/U3lUac8Dh/
         56fIbFDzyGc0+bo8a0cxEjM9NY0LgJDWtNpndUp6C21RC3wmzJEjRh+DUc/22lEcmLmF
         NbdxGWaTOkmuShx7QUvMS7N9V45wXZxC6+7HIzongJIK6PjMqM6/ewodqhVvI+2zqhM4
         RH3oLa34etJmeYE1WMWuN2B8PpI4AjfofKl6Zrw667CUkAqUfE1/RUErx4Qa7z/BJMYY
         BCSw==
X-Gm-Message-State: AJIora9GCZhVXusHOAlWb7SkDeAC1lTWTlUvHB3UYoP0t90OlqqrTtmp
	PUKUtdinjb9+7Vk6kgybfE2MNtSbqUgCZQ==
X-Google-Smtp-Source: 
 AGRyM1uKcrsnRmMky5aHUtvh8G9/0RMhOKyrw1H9GB1b6cy57AcyrfX0SFEmR4/dj2wOjps63Gu5zg==
X-Received: by 2002:adf:fe8d:0:b0:21e:bd7d:da9f with SMTP id
 l13-20020adffe8d000000b0021ebd7dda9fmr414018wrr.144.1658845455466;
        Tue, 26 Jul 2022 07:24:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:289a:8162:dbfe:813c])
        by smtp.gmail.com with ESMTPSA id
 w10-20020adfde8a000000b0021e50971147sm14522654wrl.44.2022.07.26.07.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:24:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] oeqa/sdk: Add basic rust cargo test
Date: Tue, 26 Jul 2022 15:24:12 +0100
Message-Id: <20220726142413.2262729-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726142413.2262729-1-richard.purdie@linuxfoundation.org>
References: <20220726142413.2262729-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 14:24:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168508

From: Otavio Salvador <otavio@ossystems.com.br>

Add a QA test to the SDK to test that a basic cargo build works.

[RP: Tweaked to work for multilibs and updated to match toolchain changes]

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/cases/rust.py               | 33 +++++++++++++++++++
 meta/lib/oeqa/sdk/files/rust/hello/Cargo.toml |  6 ++++
 .../lib/oeqa/sdk/files/rust/hello/src/main.rs |  3 ++
 3 files changed, 42 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/cases/rust.py
 create mode 100644 meta/lib/oeqa/sdk/files/rust/hello/Cargo.toml
 create mode 100644 meta/lib/oeqa/sdk/files/rust/hello/src/main.rs

diff --git a/meta/lib/oeqa/sdk/cases/rust.py b/meta/lib/oeqa/sdk/cases/rust.py
new file mode 100644
index 00000000000..c122b64d0c5
--- /dev/null
+++ b/meta/lib/oeqa/sdk/cases/rust.py
@@ -0,0 +1,33 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+import shutil
+import unittest
+
+from oeqa.core.utils.path import remove_safe
+from oeqa.sdk.case import OESDKTestCase
+
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
+class RustCompileTest(OESDKTestCase):
+    td_vars = ['MACHINE']
+
+    @classmethod
+    def setUpClass(self):
+        targetdir = os.path.join(self.tc.sdk_dir, "hello")
+        try:
+            os.removedirs(targetdir)
+        except OSError:
+            pass
+        shutil.copytree(os.path.join(self.tc.sdk_files_dir, "rust/hello"), targetdir)
+
+    def setUp(self):
+        machine = self.td.get("MACHINE")
+        if not self.tc.hasHostPackage("packagegroup-rust-cross-canadian-%s" % machine):
+            raise unittest.SkipTest("RustCompileTest class: SDK doesn't contain a Rust cross-canadian toolchain")
+
+    def test_cargo_build(self):
+        self._run('cd %s/hello; cargo build' % self.tc.sdk_dir)
diff --git a/meta/lib/oeqa/sdk/files/rust/hello/Cargo.toml b/meta/lib/oeqa/sdk/files/rust/hello/Cargo.toml
new file mode 100644
index 00000000000..fe619478a68
--- /dev/null
+++ b/meta/lib/oeqa/sdk/files/rust/hello/Cargo.toml
@@ -0,0 +1,6 @@
+[package]
+name = "hello"
+version = "0.1.0"
+edition = "2021"
+
+[dependencies]
diff --git a/meta/lib/oeqa/sdk/files/rust/hello/src/main.rs b/meta/lib/oeqa/sdk/files/rust/hello/src/main.rs
new file mode 100644
index 00000000000..a06c03f82ae
--- /dev/null
+++ b/meta/lib/oeqa/sdk/files/rust/hello/src/main.rs
@@ -0,0 +1,3 @@
+fn main() {
+    println!("Hello, OpenEmbedded world!");
+}
-- 
2.34.1


