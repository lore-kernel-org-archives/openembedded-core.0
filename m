Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE588CCF9EC
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 10:29:23 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.28825.1761560956236872244
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 03:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm2 header.b=eRikxB/x;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1328017-2025102710291258e8a5d86e00020799-imhqjh@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2025102710291258e8a5d86e00020799
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Oct 2025 11:29:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=W742wX+q4qUTf0RqTd5uUWH2TEl3CkU32dr3slxfa0Y=;
 b=eRikxB/xquCN3WovfQJh0fDAuTGCy/SP4TxS6GUwbiph+Tbr4ZsDiYas5EFYMtnSlQ3+mN
 GSlwwculej7YtRG5esXpbpwobwGjQLAnBHLJRN6d2NAymxcLiStLu2joq38gEazq7G9+NV3f
 DXvVmlTkNKnW9QyDhHxfXpcK5tOnpUdRIJ/U5WLC++JUM4TfnuywefRenTmJvTlxSdgXKMpT
 CS3zxYbVCkrjctxL/ZOgkzn9ELgv5qqX141PpWWFRKNsEG/yAGT8HJYwdNnYsbjoAmk6fBeY
 nuHzbXpHGZ7iMsLS/X2+qLNt7Rc83/QdtK8WIUeIMRGKaZYFl4wdGEwA==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH 0/3] Fix Rust self-test failures on PowerPC
Date: Mon, 27 Oct 2025 11:28:57 +0100
Message-Id: <20251027102900.65173-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 10:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225329

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

This patch series fixes oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust
failures on the PowerPC (qemuppc) target.

The root cause was missing zlib and zstd compression library dependencies
required by Rust's internal LLVM component. Without these libraries, the
Rust compiler build fails with linker errors for undefined references to
compression functions (compress2, uncompress, ZSTD_decompress, etc.).

The fix involves three changes:

1. Add build-time and runtime dependencies for zlib/zstd to the Rust recipe
   and pass linker flags via the target wrapper mechanism

2. Fix rust-common.bbclass to properly handle multi-flag WRAPPER_TARGET_EXTRALD
   values (this is a general improvement for all Rust recipes)

3. Add runtime packages to the test image and strip debug symbols from test
   binaries to work within PowerPC mac99's 768MB RAM limitation

After these changes, the Rust self-tests pass successfully on PowerPC. 

Peter Tatrai (3):
  rust: add missing zlib and zstd dependencies
  oeqa/selftest/rust: add zlib and libzstd runtime packages
  oeqa/selftest/rust: strip debug symbols from test binaries

 meta/classes-recipe/rust-common.bbclass   | 2 +-
 meta/lib/oeqa/selftest/cases/rust.py      | 5 ++++-
 meta/recipes-devtools/rust/rust_1.90.0.bb | 5 +++++
 3 files changed, 10 insertions(+), 2 deletions(-)

-- 
2.47.2

