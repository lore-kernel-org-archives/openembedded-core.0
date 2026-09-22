Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683A0C982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 14:47:20 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12217.1790088431295170959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 07:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=a6hyiT8c;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1328017-2026092214470799d8f819490002073e-vojnht@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2026092214470799d8f819490002073e
        for <openembedded-core@lists.openembedded.org>;
        Tue, 22 Sep 2026 16:47:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=sJODKKUAfl5W8oHhJvuUxTbO2+kk+D/BdErEIQTqE6U=;
 b=a6hyiT8c3gUuUAgxwM0VWavuTuFXQtkjD/OeWV8Ss/TSu6FIZWHcs94LVqpwL0JWXk0TdF
 BDu5ZbkncjInhcYFzYhqjpOULlW0db6QLQW3cgQaQAsxqI1uViQ2Sw1w3d8aE/sp+8qlSrI7
 oS69idGWbWTal+MKBh3mYgYDmY5oya6i/AQswnJ/WUYnaBdUjQURKGxf+Oz78uZazgaAJFXU
 vtpRweVJy4mEJlp2NGfy5GvWmE5UbFMPki+89jfOeE1XHp5iIUlkgWYiR9Mg1FM8ny0AUHp3
 2ucUuko3bmqViUE4e5TgT+zZFnJfqcUg1QmVGI3HrFOyj5HSL4F0oHbw==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH] oeqa/selftest/clang: skip test suites on qemuppc
Date: Tue, 22 Sep 2026 16:47:05 +0200
Message-Id: <20260922144705.3066455-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 14:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246420

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

The LLVM, Clang and LLD oe-selftests are currently not practical to run on
qemuppc.

qemuppc uses the QEMU mac99 machine, which only supports a single CPU and
has a RAM limit below the test's current defaults. To boot the test image at
all, the test would need qemuppc-specific resource handling, reducing the QEMU
SMP setting from 4 to 1 and lowering the requested memory.

Even with those adjustments, the test run is not useful in practice on
32-bit PowerPC: running the clang/llvm lit suites with a single vCPU takes
many hours, and the run still ends with a consistent set of failures in
clang-repl / LLVM ORC JIT related tests. Those would need to be added to the
excluded tests for this target before the suite could pass.

Rather than carrying qemuppc-specific resource handling plus an additional
set of JIT-related exclusions for test runs that are prohibitively slow, skip
these LLVM, Clang and LLD test suites on qemuppc for now.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/clang.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/clang.py b/meta/lib/oeqa/selftest/cases/clang.py
index 046e46d414..93ef781453 100644
--- a/meta/lib/oeqa/selftest/cases/clang.py
+++ b/meta/lib/oeqa/selftest/cases/clang.py
@@ -5,6 +5,7 @@
 #
 import contextlib
 from oeqa.core.decorator import OETestTag
+from oeqa.core.decorator.data import skipIfMachine
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, runqemu
 from oeqa.utils.nfs import unfs_server
@@ -187,6 +188,7 @@ class LLVMSelfTestSystemEmulated(ClangFamilyBase):
         "tools/yaml2obj/GOFF/GOFF-header-settings\\.yaml$",
     ]
 
+    @skipIfMachine("qemuppc", "qemuppc cannot run this lit test suite within practical resource and runtime limits")
     def test_llvm(self):
         bitbake("llvm -c install")
         self.build_core_image()
@@ -298,6 +300,7 @@ class ClangSelfTestSystemEmulated(ClangFamilyBase):
         "Sema/fp-eval-pragma-with-float-double_t-3\\.c$",
     ]
 
+    @skipIfMachine("qemuppc", "qemuppc cannot run this lit test suite within practical resource and runtime limits")
     def test_clang(self):
         bitbake("clang -c install")
         self.build_core_image()
@@ -327,6 +330,7 @@ class LLDSelfTestSystemEmulated(ClangFamilyBase):
         "ELF/reproduce\\.s$",
     ]
 
+    @skipIfMachine("qemuppc", "qemuppc cannot run this lit test suite within practical resource and runtime limits")
     def test_lld(self):
         bitbake("lld -c install")
         self.build_core_image()
-- 
2.39.5


