Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1E7CCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 10:29:23 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.28579.1761560955937401090
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 03:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm2 header.b=YTUDIpX6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-1328017-20251027102913e1674db07700020783-gffbsj@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20251027102913e1674db07700020783
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Oct 2025 11:29:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=aOm3Iw84z8pco1U4Nfvei+oK2MYoAP18JLJjkAXR33o=;
 b=YTUDIpX6uAxed3zYv32N0SGB/pDkCEjqQ7/fxDYZAlriYbFiyLigQxQRLUd5HP6B937ICq
 t6vT6QsKO/4TgzLYm/zlohb4xYY0VD9TT9YznKtAEI/h9PeLdKJ3QNRthFQIZLRgMi5XGtjh
 CZB3f21dRh3O7kfOh/WY3gL27pXjdQEh29aK733b11U5HQOgkC0JoTmdfALNByjFsZwbrBco
 3a6XD5XMBGPbWmBosFiJYFPlBma0N53EbZayxgongTexP9oZp0JSC40I9l8ZlRJshTGeqdMm
 uXzTNZpgGWhlReIxK/z2rZQoFikEZ09KkAnHK6mKq0SFmX1QrBriJhTQ==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH 3/3] oeqa/selftest/rust: strip debug symbols from test binaries
Date: Mon, 27 Oct 2025 11:29:00 +0100
Message-Id: <20251027102900.65173-4-peter.tatrai.ext@siemens.com>
In-Reply-To: <20251027102900.65173-1-peter.tatrai.ext@siemens.com>
References: <20251027102900.65173-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 10:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225327

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

Strip debug symbols from test binaries using RUSTFLAGS='-C strip=debuginfo'
to reduce binary sizes from 300+ MB to ~140 MB.

This is especially critical for PowerPC mac99 which has a hardcoded 768MB
RAM limit in QEMU. Without stripping, test binaries uploaded to /tmp (tmpfs)
cause 'No space left on device' errors during test execution.

The size reduction also benefits all other architectures by reducing
memory pressure and upload times during testing.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index ab3094af87..2cc1284bca 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -122,6 +122,9 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
             cmd = "export TARGET_VENDOR=\"-poky\";"
             cmd = cmd + " export PATH=%s/recipe-sysroot-native/usr/bin/python3-native:%s/recipe-sysroot-native/usr/bin:%s/recipe-sysroot-native/usr/bin/%s:%s/hosttools:$PATH;" % (rustlibpath, rustlibpath, rustlibpath, tcpath, tmpdir)
             cmd = cmd + " export RUST_TARGET_PATH=%s/rust-targets;" % rustlibpath
+            # Strip debug symbols from test binaries to reduce size (300+ MB -> ~140 MB)
+            # PowerPC mac99 QEMU has 768MB RAM limit, so we need to minimize test binary sizes
+            cmd = cmd + " export RUSTFLAGS='-C strip=debuginfo';"
             # Trigger testing.
             cmd = cmd + " export TEST_DEVICE_ADDR=\"%s:12345\";" % qemu.ip
             cmd = cmd + " cd %s; python3 src/bootstrap/bootstrap.py test %s --target %s" % (builddir, testargs, targetsys)
-- 
2.47.2


