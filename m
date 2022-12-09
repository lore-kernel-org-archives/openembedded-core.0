Return-Path: <anton.antonov@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 603DAC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 09:50:28 +0000 (UTC)
Received: from cam-smtp0.cambridge.arm.com (cam-smtp0.cambridge.arm.com [217.140.106.49])
 by mx.groups.io with SMTP id smtpd.web11.9465.1670579422518934327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 01:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.106.49, mailfrom: anton.antonov@arm.com)
Received: from atg-devlab-kelpie.cambridge.arm.com (atg-devlab-kelpie.cambridge.arm.com [10.2.80.92])
	by cam-smtp0.cambridge.arm.com (8.13.8/8.13.8) with ESMTP id 2B99oJtq005633;
	Fri, 9 Dec 2022 09:50:19 GMT
From: Anton Antonov <Anton.Antonov@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Anton.Antonov@arm.com
Subject: [langdale][master][PATCH v2] rust: Do not use default compiler flags defined in CC crate
Date: Fri,  9 Dec 2022 09:50:08 +0000
Message-Id: <20221209095008.563491-1-Anton.Antonov@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 09:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174440

Rust crates build dependecy C libraries using "CC" crate.
This crate adds some default compiler parameters depending on target arch.
For some target archs these parameters conflict with the parameters defined by OE.

Warnings/errors like this can be seen in the case:

cc1: error: switch '-mcpu=cortex-a15' conflicts with switch '-march=armv7-a+fp' [-Werror]

Lets use only the OE parameters by exporting CRATE_CC_NO_DEFAULTS.
https://github.com/rust-lang/cc-rs#external-configuration-via-environment-variables

This patch fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=14947

Signed-off-by: Anton Antonov <Anton.Antonov@arm.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 2710b4325d..0f72d685df 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -401,3 +401,20 @@ python do_rust_gen_targets () {
 addtask rust_gen_targets after do_patch before do_compile
 do_rust_gen_targets[dirs] += "${RUST_TARGETS_DIR}"
 
+# For building C dependecies only use compiler parameters defined in OE-core
+# and ignore the default parameters defined in the CC crate.
+# https://github.com/rust-lang/cc-rs#external-configuration-via-environment-variables
+
+# The CC crate checks for CRATE_CC_NO_DEFAULTS existence not value.
+# Even empty CRATE_CC_NO_DEFAULTS will be taken into account.
+# For rust native recipes we still rely on the CC crate parameters.
+# Currently it's not possible to export a variable conditionally,
+# so, let's export it for class-target and class-nativesdk only
+
+do_compile:prepend:class-target() {
+    export CRATE_CC_NO_DEFAULTS=1
+}
+
+do_compile:prepend:class-nativesdk() {
+    export CRATE_CC_NO_DEFAULTS=1
+}
-- 
2.25.1


