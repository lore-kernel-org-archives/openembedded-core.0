Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2383CCCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:40:49 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16216.1762159241018777550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:40:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=cHAWO2m4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1328017-2025110308293467eb0a3f76000207b7-pfgdhq@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2025110308293467eb0a3f76000207b7
        for <openembedded-core@lists.openembedded.org>;
        Mon, 03 Nov 2025 09:29:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gVAY2HqQ8bsJFFgeRn8jXXgbDO8qi2Y9I3nLFnZHfVo=;
 b=cHAWO2m4uVIKYzH7CmzkPjkQtR4fnI4oAn+0oMqtOrqrk3ju811OBd7xKSi5CRExW7VpIe
 hs0oufGvc9vyfwfJm/Jr5RKd0fMY2aXd+xou0IaIZh7lx7hMystabUS4dEHYzDKpEoXSWcr4
 8NF0LXjmVidVOo05rAU2r/mjxelybgTtAT1oAH4sHHpI0nhvwXb/LkmehTvlCjz4Z6c4vW+Y
 +VL1USh7frmhpNdp1FQPLVrAcMdy0e50Km1G7j4dHS1z/z4CbplVlk2G/1iPrhxjctfuYdSh
 yx9KcPPVj+V85932Uz9vWawjTdBuN4dduPNu61B2N2fyPpfDF/uSvyew==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH v2 0/2] Fix Rust self-test failures on PowerPC
Date: Mon,  3 Nov 2025 09:29:09 +0100
Message-Id: <20251103082911.1792759-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225636

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

This patch series fixes oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust
failures on the PowerPC (qemuppc) target.

The root cause is that the Rust self-test executes 'python3 src/bootstrap/bootstrap.py
test' in an environment where recipe level RUSTFLAGS are not propagated.
The test binaries use LLVM's compression functionality and require explicit
linker flags for zlib and zstd libraries.

The fix is specific to the rust selftest and involves:

1. Passing -lz and -lzstd linker arguments via RUSTFLAGS when running the
   bootstrap test suite (this happens in the test harness command, not at
   the recipe level)

2. Adding libzstd runtime package to the QEMU test image (zlib is already
   present by default in core-image-minimal)

This approach is more targeted than modifying the recipe or wrapper mechanism,
as it only affects the selftest execution environment.

Changes from v1:
- Replaced recipe-level changes (WRAPPER_TARGET_EXTRALD and wrapper fixes)
  with selftest-specific fix
- Focused on the actual execution context where RUSTFLAGS are needed (selftest
  harness command that runs bootstrap test)

Peter Tatrai (2):
  oeqa/selftest/rust: pass zlib/zstd link args to test build
  oeqa/selftest/rust: add libzstd to test image runtime packages

 meta/lib/oeqa/selftest/cases/rust.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.47.2


