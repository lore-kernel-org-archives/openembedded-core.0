Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E6AC7EE2F
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 16:33:34 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.64275.1686587607278838142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 09:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ocovymSX;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51480d3e161so6761789a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686587605; x=1689179605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BuKE6yjpYhrRIGKnxAEYaF+fivw3EXvONbzh7RNmRl0=;
        b=ocovymSXecrO9G66+psdGhAekM14Om/yaUY1ddkMgzHfkXo/w+P8P/82JsZz1eN3Xa
         EdRAP388WI4Tx4Mkwhn+sOGQ/Ji93th/du9Bi3f3vcK0nhHS17vNQog16XA4KhiIaVEn
         25VjkzJWZDGTbkEcI1HNEDpwpby7MVJR3IX+bnHCaQaUKq28ub240JMbdUXMQ6oG2yOe
         T8bxDvGEwECksvtBM5ER4GuX1TOHMvPkomWgAnLx10Ms7/FPDrB/UfFC8zRW67UdJsc8
         Y+JQ/mIHLKmoyvFzoy67fon79OoWXneelEFxxYKAh+DaHDS4MGUM8oKvwmBQwTjeTTh8
         qt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686587605; x=1689179605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuKE6yjpYhrRIGKnxAEYaF+fivw3EXvONbzh7RNmRl0=;
        b=ec7WvbgrtW/mMfMwDXEv/88fokL1bZIerLUbmA0G7m9w3SV6GGHmd6BZ24JsYahwCl
         2FzzuzdnaqotlRcnrJJWP6W+U0IX7Ai4C+cciPxG1yDsZv0ZpdUWpz0aE7PZ45mjsRSU
         +NCTi97hZuMo2HfXFSaY33sQ43gKdS9bLegDiTTgEtAAg68H260Pg0CVr/QYoTSXegWi
         TnE+ePYVRMtfh+rOr8b1t0wyl681KmAhCc7Uz64ENbEEWYNMnyODVOJ3qtLVCjJIAQRf
         QLKfUF/onCc+zZEOmfLit8uC69s6tEdCCu+wmqnv2sG0u6moMsfIUyHJinX8A9IpuXZB
         cvUA==
X-Gm-Message-State: AC+VfDwYWUz5b6Uu/OjDOdLuOgX3C+W/jYSjGIrLQ1rTR8wPOQJkTvmb
	K3Jka7anaT7V+FWyNV69UUzgJgkZ868=
X-Google-Smtp-Source: ACHHUZ4rcLCmbvuUmSHmIhewStLj1fIvpv/FQ9qcBd+APzZHSOvpobJMaiF896KrIUr8M2Ake2gSBA==
X-Received: by 2002:a17:907:2da4:b0:981:a949:2807 with SMTP id gt36-20020a1709072da400b00981a9492807mr3751783ejc.1.1686587605360;
        Mon, 12 Jun 2023 09:33:25 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id kd14-20020a17090798ce00b00965a0f30fbfsm5443766ejc.186.2023.06.12.09.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 09:33:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] libstd-rs, rust: use bfd linker instead of gold
Date: Mon, 12 Jun 2023 18:33:19 +0200
Message-ID: <20230612163319.3988533-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 16:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182683

* it started to fail only after the upgrade to 1.70.0

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/rust/libstd-rs_1.70.0.bb | 5 +++++
 meta/recipes-devtools/rust/rust_1.70.0.bb      | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb
index f4e5abc0cc..f23db79733 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb
@@ -45,3 +45,8 @@ do_install () {
 }
 
 BBCLASSEXTEND = "nativesdk"
+
+# Since 1.70.0 upgrade this fails to build with gold:
+# http://errors.yoctoproject.org/Errors/Details/708194/
+# ld: error: version script assignment of  to symbol __rust_alloc_error_handler_should_panic failed: symbol not defined
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
diff --git a/meta/recipes-devtools/rust/rust_1.70.0.bb b/meta/recipes-devtools/rust/rust_1.70.0.bb
index 83f9bec68a..8669291d08 100644
--- a/meta/recipes-devtools/rust/rust_1.70.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.70.0.bb
@@ -350,3 +350,8 @@ RUSTLIB_DEP:class-nativesdk = ""
 INSANE_SKIP:${PN} = "staticdev"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# Since 1.70.0 upgrade this fails to build with gold:
+# http://errors.yoctoproject.org/Errors/Details/708196/
+# ld: error: version script assignment of  to symbol __rust_alloc_error_handler_should_panic failed: symbol not defined
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
-- 
2.41.0


