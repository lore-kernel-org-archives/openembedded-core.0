Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20927CCFA06
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:29:59 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16127.1762158597030029109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:29:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=kr750sAv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1328017-2025110308295587b31fe419000207d4-crfaut@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2025110308295587b31fe419000207d4
        for <openembedded-core@lists.openembedded.org>;
        Mon, 03 Nov 2025 09:29:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=eWorckyQbxldpIDrAqHWUKsAmDOFM6NYw5CMJeFlNzQ=;
 b=kr750sAvoIJ4XR8zcP63ng4P7ueobqW46rO9QhV2dH+XEypqPvuNxevJkbie7J2KEAe4S3
 McpnhHjKs7rWy6oumkQ5k+Lpsc51y9F6YuIG+qtDVlH3kQjigutxRbN8odGcCPff5DA31PXb
 hpvn18K41R9/zb5km+zSh1rht7isS2iv4XyMCzv8afoKxUY4Qb96/evEYehoO0IdDY5vcyFD
 0dvdMvUq42nzVSDDah6xCuVV+/WtYQJnG8BRAbSnKsKdaPH3Bu7texDqO8T/uf8M51feXVql
 mncFqxwCW/SnXtXTzJiVHxjfqniR8tE0NMkcA+cbDT74e56UcqrENCgA==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH v2 2/2] oeqa/selftest/rust: add libzstd to test image runtime packages
Date: Mon,  3 Nov 2025 09:29:11 +0100
Message-Id: <20251103082911.1792759-3-peter.tatrai.ext@siemens.com>
In-Reply-To: <20251103082911.1792759-1-peter.tatrai.ext@siemens.com>
References: <20251103082911.1792759-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225635

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

Add libzstd runtime package to the QEMU test image so that Rust test
binaries can find the zstd compression library at runtime.

The Rust self-test builds test binaries that use LLVM's compression
functionality. These binaries require libzstd to be present in the
minimal QEMU image used for testing.

Without this package, Rust self-tests would fail on PowerPC when the test
binaries attempt to use zstd compression.

Note: zlib is already present in core-image-minimal by default, so we
only need to add libzstd explicitly.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 819ff6af9e..01a98339a6 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("{} -c test_compile".format(recipe))
         builddir = get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
-        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd"]
         features = []
         features.append('IMAGE_FEATURES += "ssh-server-dropbear"')
         features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
-- 
2.47.2


