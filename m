Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD66CCCF9EA
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 10:29:23 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.28823.1761560955925740820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 03:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm2 header.b=nIOP3sKq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1328017-20251027102912013d05d76900020755-x2lc7h@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20251027102912013d05d76900020755
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Oct 2025 11:29:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=B4eTQ3j6NPOvMiDVO9GcNAf/r+0q7TGiLZcUWjpo5L8=;
 b=nIOP3sKqck/ZtCHsGq3sDull06jwfpazhmLaODz3d+ms6tgRQf2X2Q+jS9tnv7zPvmiCir
 eQo9otrY4jUO8JDcSiPWEZ5fNnaDChDgdlo+DP8Cn2FP6jgnKSgvLwPQgT24ABqA6e7DB0HW
 E/CeafXckMn00HUlWUJDzWUikmY7KNXmVF+ZsJIYvgb0GAeo+FDcFh0VAJOPsl/ig8whVLWx
 sHpQdZL/uu1rC8dek5VJ76TrboVSZ0rKLHEgFPfTdJG/UlHzTmAOdqG6OGq+LmJ9Znx2EQa+
 tXk19TufVHpAeikuJM+e80LLCCk1VjUj7gVkb3TmirZThjfLDpmgK/8A==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH 2/3] oeqa/selftest/rust: add zlib and libzstd runtime packages
Date: Mon, 27 Oct 2025 11:28:59 +0100
Message-Id: <20251027102900.65173-3-peter.tatrai.ext@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225328

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

Add zlib and libzstd runtime packages to the QEMU test image so that
Rust compiler binaries can find the required compression libraries
at runtime.

The Rust self-test compiles test binaries on the build host and uploads
them to the minimal QEMU image for execution. These test binaries require
zlib and libzstd at runtime because they use LLVM's compression functionality.

Without these packages, the Rust self-tests would fail on PowerPC with
errors about missing compression libraries.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 06acf53e9a..ab3094af87 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("{} -c test_compile".format(recipe))
         builddir = get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
-        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp"]
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "zlib", "libzstd"]
         features = []
         features.append('IMAGE_FEATURES += "ssh-server-dropbear"')
         features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
-- 
2.47.2


