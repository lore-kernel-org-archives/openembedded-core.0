Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719ACE8B377
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 22:49:02 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6562.1770158933402392189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 14:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=UVko2+MM;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260203224850d472491fbb00020706-xxndmi@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260203224850d472491fbb00020706
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Feb 2026 23:48:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6Kq4FZr44VG6LACSL9bptMd/K1VVt1cPK9LndAgmNtw=;
 b=UVko2+MMP2LvEyhiWJBf0ZfrgB9O44xn6HGDhykiTUyHfhBgJBUWmEdqvkH9eS23x4Yk3v
 OlVeJh7VKdl0FiN9E/oO85h8J8ZwByuMprod66KxYPDXZhVneP8TT5da12TCLsQ76Moi06MH
 4sa12kS2+w56ZTKMJ0KwlGWNXNwdJl1BXajVvKOfBb0w4DYOdAxjiWj3QH3X3dT4dYYb/fLA
 Z8zsH4eT76WvzPGA+nDr7hSkC3Agwp7U7bqLJ+E/wy+7iPDMw2ekLmT0yr65rfYuGXVa4LBO
 OjbsdCD/ATRqhu3zfox9z1HN8AXMTp/+RKawOGwbAVEQ+FXpz+Af6LIw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][whinlatter][PATCH 1/2] webkitgtk: workaround compile failure for large debug symbols
Date: Tue,  3 Feb 2026 23:48:41 +0100
Message-Id: <20260203224842.1920969-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 22:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230489

From: Hongxu Jia <hongxu.jia@windriver.com>

Originally, we move space optimize from recipe webkitgtk to
yocto-space-optimize.inc [1], it caused multiple build failures
if not include yocto-space-optimize.inc

For qemux86-64: "relocation truncated to fit: R_X86_64_32 against `.debug_info'"
For qemuarm64: "relocation truncated to fit: R_AARCH64_ABS32 against `.debug_info'"

According to the suggestion of gcc [2], pass -g1 to massively reduce the size of
the debug symbols to workaround the errors

Remove duplicate setting from yocto-space-optimize.inc at the same time.

[1] https://git.openembedded.org/openembedded-core/commit/meta?id=007c4aea10e13bd9b2d66d016c25f31c2709cbf6
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=15444

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: ab4a673f7f0809b7bcce19914ff7c60ee9fa2bf0)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/conf/distro/include/yocto-space-optimize.inc | 3 ---
 meta/recipes-sato/webkit/webkitgtk_2.50.0.bb      | 7 +++++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-space-optimize.inc b/meta/conf/distro/include/yocto-space-optimize.inc
index 9e092df32a..b83ba426e7 100644
--- a/meta/conf/distro/include/yocto-space-optimize.inc
+++ b/meta/conf/distro/include/yocto-space-optimize.inc
@@ -8,6 +8,3 @@ DEBUG_LEVELFLAG:pn-clang-native = ""
 DEBUG_LEVELFLAG:pn-nativesdk-clang = ""
 # With -g, qemu workdir is 10GB, qemu-dbg is 363MB
 DEBUG_LEVELFLAG:pn-qemu = ""
-# Pass -g1 to massively reduce the size of the
-# debug symbols (4.3GB to 700M at time of writing)
-DEBUG_LEVELFLAG:pn-webkitgtk = "-g1"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
index 5389bf17db..a8d0a094b3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.50.0.bb
@@ -174,3 +174,10 @@ src_package_preprocess () {
 
 # Clang-20 issue - https://github.com/llvm/llvm-project/issues/132322
 TOOLCHAIN:arm = "gcc"
+
+# Pass -g1 to massively reduce the size of the
+# debug symbols (4.3GB to 700M at time of writing)
+# workaround error:
+# qemux86-64: "relocation truncated to fit: R_X86_64_32 against `.debug_info'"
+# qemuarm64: "relocation truncated to fit: R_AARCH64_ABS32 against `.debug_info'"
+DEBUG_LEVELFLAG = "-g1"

