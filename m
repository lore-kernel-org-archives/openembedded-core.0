Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6068.1794231915957764798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=iobreePs;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: enguerrand.de-ribaucourt@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A79DF3D8182D;
	Mon,  9 Nov 2026 08:45:14 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 5X6HOSSophhh; Mon,  9 Nov 2026 08:45:13 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 510993D80F35;
	Mon,  9 Nov 2026 08:45:13 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 510993D80F35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1794231913; bh=PK+35z7NuDY6/Hc6QVCzbAzBh2WYdnTziMjtFpSGdmY=;
	h=From:Date:MIME-Version:Message-Id:To;
	b=iobreePsaN+IsRj3WKDkJMkuPCHqKDzjmaVxBvnsRalkKtaAjexU5vgpp9iwLWpPL
	 eYaFu0En5IBrkGvMhZDjUZwrgAObKD4lZvj+MbRmskaNdxvufk7DrPdCUaxTGFnKZT
	 wk2AsPnMLGbfUoFqFiaUqXghWh+FNrVIBbtTQI9F9giadLaBC+tLRWElwVw3+eoLcw
	 P1v4zO667VRpd3c1JYicdaUAeTnjPsYdndsBeRy5FJbRmwZJFkbBHnmCMwBrXzwKbJ
	 jyOUmQRFJ+aUVJ7GVfxClhImUFvUSwjf5KdsHTQt8a6RhQwOMBWJo6KG9FF45wNvQ5
	 Kppd3LT1TnFvw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 1hHneJxsnkpS; Mon,  9 Nov 2026 08:45:13 -0500 (EST)
Received: from isabelle.rennes.sfl (80-15-101-118.ftth.fr.orangecustomers.net [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id C74643D8176B;
	Mon,  9 Nov 2026 08:45:12 -0500 (EST)
From: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
Date: Mon, 09 Nov 2026 14:44:18 +0100
Subject: [PATCH v2 01/18] cargo-example: add minimal selftest fixture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-devtool-ide-sdk-cargo-v2-1-d56134000561@savoirfairelinux.com>
References: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
In-Reply-To: <20261109-devtool-ide-sdk-cargo-v2-0-d56134000561@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
X-Mailer: b4 0.16.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249828

Add a minimal Cargo recipe to demonstrate the ide-sdk configuration
for Rust in the selftests.

AI-Generated: Uses GitHub Copilot
Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
---
 meta-selftest/recipes-test/rust/cargo-example.bb     | 15 +++++++++++++++
 .../recipes-test/rust/cargo-example/Cargo.lock       |  5 +++++
 .../recipes-test/rust/cargo-example/Cargo.toml       |  8 ++++++++
 .../recipes-test/rust/cargo-example/build.rs         | 20 ++++++++++++++++++++
 .../recipes-test/rust/cargo-example/src/main.rs      | 11 +++++++++++
 5 files changed, 59 insertions(+)

diff --git a/meta-selftest/recipes-test/rust/cargo-example.bb b/meta-selftest/recipes-test/rust/cargo-example.bb
new file mode 100644
index 0000000000..cca56d8d81
--- /dev/null
+++ b/meta-selftest/recipes-test/rust/cargo-example.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Minimal Cargo application for devtool ide-sdk selftests"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = "file://Cargo.toml \
+           file://Cargo.lock \
+           file://build.rs \
+           file://src/main.rs \
+          "
+
+S = "${UNPACKDIR}"
+
+inherit cargo
+
+CARGO_BUILD_FLAGS:append = " --features ide-sdk-selftest"
diff --git a/meta-selftest/recipes-test/rust/cargo-example/Cargo.lock b/meta-selftest/recipes-test/rust/cargo-example/Cargo.lock
new file mode 100644
index 0000000000..27cb8ffd40
--- /dev/null
+++ b/meta-selftest/recipes-test/rust/cargo-example/Cargo.lock
@@ -0,0 +1,5 @@
+version = 3
+
+[[package]]
+name = "cargo-example"
+version = "0.1.0"
diff --git a/meta-selftest/recipes-test/rust/cargo-example/Cargo.toml b/meta-selftest/recipes-test/rust/cargo-example/Cargo.toml
new file mode 100644
index 0000000000..e8a2e1dde4
--- /dev/null
+++ b/meta-selftest/recipes-test/rust/cargo-example/Cargo.toml
@@ -0,0 +1,8 @@
+[package]
+name = "cargo-example"
+version = "0.1.0"
+edition = "2021"
+
+[features]
+# Used only to verify that ide-sdk forwards recipe Cargo features to its task.
+ide-sdk-selftest = []
diff --git a/meta-selftest/recipes-test/rust/cargo-example/build.rs b/meta-selftest/recipes-test/rust/cargo-example/build.rs
new file mode 100644
index 0000000000..f0733b3d38
--- /dev/null
+++ b/meta-selftest/recipes-test/rust/cargo-example/build.rs
@@ -0,0 +1,20 @@
+use std::env;
+
+// Fail the selftest build if Cargo does not receive BitBake's cross environment.
+fn main() {
+    let target_cc = env::var("CC").expect("Cargo config should set target CC");
+    assert!(target_cc.ends_with("/target-rust-cc"), "unexpected CC: {target_cc}");
+
+    let host_cc = env::var("HOST_CC").expect("Cargo config should set host CC");
+    assert!(host_cc.ends_with("/build-rust-cc"), "unexpected HOST_CC: {host_cc}");
+
+    assert!(
+        env::var_os("RUST_TARGET_PATH").is_some(),
+        "Cargo config should set the OE Rust target path",
+    );
+    assert_eq!(
+        env::var("PKG_CONFIG_ALLOW_CROSS").as_deref(),
+        Ok("1"),
+        "Cargo config should allow cross pkg-config",
+    );
+}
diff --git a/meta-selftest/recipes-test/rust/cargo-example/src/main.rs b/meta-selftest/recipes-test/rust/cargo-example/src/main.rs
new file mode 100644
index 0000000000..7066010f51
--- /dev/null
+++ b/meta-selftest/recipes-test/rust/cargo-example/src/main.rs
@@ -0,0 +1,11 @@
+fn fibonacci(n: u32) -> u32 {
+    match n {
+        0 => 0,
+        1 => 1,
+        _ => fibonacci(n - 1) + fibonacci(n - 2),
+    }
+}
+
+fn main() {
+    println!("fibonacci={}", fibonacci(4));
+}

-- 
2.53.0

