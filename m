Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7F0D64077
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 18:24:11 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.106.1731090249163123374
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 10:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=Xq5BGoUO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1328017-202411081824054d6f0968d680b1e5d7-yci7iv@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202411081824054d6f0968d680b1e5d7
        for <openembedded-core@lists.openembedded.org>;
        Fri, 08 Nov 2024 19:24:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=cmOEYrTKd0gM+9mpaqOAK8/O2/TkEdzkicL0nodY3pE=;
 b=Xq5BGoUOJNWqAn5sumDqKswlxXMUFjatCXivS3DG6dXtkui2W5/T3iWWOKMRgnAIL5UXK0
 OxKOa5kFB2V0UnQHi1FrTI/8wt4gzmZc8aAahBOF/3dpvfX4oAXRISBiAg/FDn7xkMMVX9FM
 hyffIWqSWIN9Fniy3skLBGh5oUxwdOlk+ZUR+UfLQC1bc4nncWF1jDx/nANQ6YWDCi44Qpwx
 NJUQrcY2tnKcc6rtqrz3D5jTgLbTMKA7gvWiZnhMvOVE0dB6JWSGcn2LmX4k3jhPlgGD6dfW
 zVEje8HKg4mwWe1+R2onrsAsSa1fAED9zG0De6jXUkBuix8XTJCXPhtg==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH] rust: Add patch to increase timeout in process-sigpipe rust selftest
Date: Fri,  8 Nov 2024 19:23:12 +0100
Message-Id: <20241108182312.3642240-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 18:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206899

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

This commit adds a patch to increase the timeout in the process-sigpipe
rust selftest to prevent occasional failures under heavy server load.
The patch aims to reduce the likelihood of false negatives when the test
environment is overloaded.

Patch file:
* oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch

Fixes [YOCTO #15625]

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 ...crease-timeout-in-process-sigpipe-ru.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch

diff --git a/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
new file mode 100644
index 0000000000..b42dda8b34
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
@@ -0,0 +1,31 @@
+From b4524278985f517b0785b6f64a21380dcf1ff096 Mon Sep 17 00:00:00 2001
+From: Peter Tatrai <peter.tatrai.ext@siemens.com>
+Date: Mon, 4 Nov 2024 13:58:16 +0100
+Subject: [PATCH] oeqa/selftest: Increase timeout in process-sigpipe rust test
+
+This patch increases the timeout for the process-sigpipe rust test, which
+occasionally fails when the server is under heavy load. Increasing the timeout
+reduces the likelihood of false negatives under load.
+
+Fixes [YOCTO #15625]
+
+Upstream-Status: Inappropriate [OE testing specific]
+
+Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
+---
+ tests/ui/process/process-sigpipe.rs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/ui/process/process-sigpipe.rs b/tests/ui/process/process-sigpipe.rs
+index 11f363d62..c12d66016 100644
+--- a/tests/ui/process/process-sigpipe.rs
++++ b/tests/ui/process/process-sigpipe.rs
+@@ -23,7 +23,7 @@ use std::thread;
+ fn main() {
+     // Just in case `yes` doesn't check for EPIPE...
+     thread::spawn(|| {
+-        thread::sleep_ms(5000);
++        thread::sleep_ms(10000);
+         process::exit(1);
+     });
+     let output = process::Command::new("sh")
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 929a4a9b0c..f0681c8776 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,6 +9,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch;patchdir=${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
+            file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "ab826e84b8d48ec6eda3370065034dea8c006f6a946d78a9ba12bcb50e6d3c7a"
 
-- 
2.39.5


