Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B994EEF48F0
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:30 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67224.1770970226509817974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=b9Yyx2CP;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so470037f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970225; x=1771575025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8Ah7Bea9nGPM60iLXiu8bdBTBjN6jCNWl9gDJFz7As=;
        b=b9Yyx2CPV+iOteCaIgSZP/CYjjvE7O4FhaFZ3H3SSqsjkiavWM4wbc23/Qdfe5G9TO
         zzR7NSD0tZRnatfIsOQxc4hljSzdfa91ttd1lrv1P+Ue+zwMLVuDqWZqEvMUmW3Hrc4g
         xpWwTv1vwiL7jwjf+09Jej/41S8xQE+uCnG3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970225; x=1771575025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T8Ah7Bea9nGPM60iLXiu8bdBTBjN6jCNWl9gDJFz7As=;
        b=oxz2UfL68PsaYT5+Ee6RS8GDE/GtJHgwSapSWtwpU4gDKjF+MJLJPpnyoa/hBBbIBG
         fkfzJfOf+eHPyI/QMVrEXtmpQduIcHDz8XYevQl6gFvcRkw1k0z9IzGN9F5FgXGiyx7b
         NjYH67WF9QiXo/xDmEZAvU9Qqkx5RkiRj6n42l+soHm39CrpYeS20kbjeifguAxGZWxs
         LGpMFweEtBwOl3OHrk3FIewx9sGtTCiORUtMPftwhgiaXm7RCAoVlW26epm19VzNouKp
         1RH+VF5IIlrTIE77W/K1fvxhnK0ooPBpWx+ye8J0kzY0cchx1qhbx+sQ7uA6jNGg5Gg8
         NAaQ==
X-Gm-Message-State: AOJu0YyZ8Kvb8jFUwftpBtufL1CU0yFKrRTDab4h7oIks5yqtSrGphEm
	oQqHzwf2ego6Pq1ButU0mx9XPhbz+ibK3iTcNfjiE2CJGE4uFJ6nwVda6nxpYaBtNHYte1sP+z7
	AcM2q
X-Gm-Gg: AZuq6aK3BVoEsdu/dDVxonGxUDJYwLoWVMBMYIyBNJfTRaLiTDFfMpY70qDWnoqmo9W
	VkkZAPV3MzK4fz/eXDa2+hNrQZ5BcMOKEqqHsSSuQF+FrfyFBPK8K1VPeYXrfAk4JHVSnOPP/Gp
	z9PONWMLPqJnyDlYhilMiNr8X+22GqDn1BjtsxIr2IHqyxKbggBo3yYQbjgIf2dlRu+CApqGr+f
	DD9tzb8BNMs7CGwFJpS7QpjefA6Z4E3mPHa760MRtlGRlTFLERpjU2eeGz4L7oXd4YR099dg0D/
	9SsgA/vc6vJXfS1t8/wtKpF5A7GxDEq1ywv4Cq4YCXwVOBp4e3Lt+NNMo2poZmf/2JLEbacC2Gf
	jQLsbyWNaBWjhu7S1nPbsc+h0y6mTx910EBNqTTB8MRCH9N2q0Dy65TxHpPmIhZDzLEEDja6WOC
	6td8909UiKCA0zJ13LVCvf7Vv4ILp/xDj25qhcsOfRrvPesMQWnwwS5OURo5wgUyNXqy8vdhb62
	a77NZFMTGSsG6pOKi6pj9tgF+4=
X-Received: by 2002:a05:6000:1447:b0:435:8fd6:5949 with SMTP id ffacd0b85a97d-43797919068mr1928737f8f.46.1770970224402;
        Fri, 13 Feb 2026 00:10:24 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:24 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 09/19] webkitgtk: workaround compile failure for large debug symbols
Date: Fri, 13 Feb 2026 09:08:27 +0100
Message-ID: <b543d09a01d42a4c98a59996283914d6aaf53eb1.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231092

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
(cherry picked from commit ab4a673f7f0809b7bcce19914ff7c60ee9fa2bf0)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/yocto-space-optimize.inc | 3 ---
 meta/recipes-sato/webkit/webkitgtk_2.50.0.bb      | 7 +++++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-space-optimize.inc b/meta/conf/distro/include/yocto-space-optimize.inc
index 9e092df32ac..b83ba426e78 100644
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
index 5389bf17db7..a8d0a094b31 100644
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

