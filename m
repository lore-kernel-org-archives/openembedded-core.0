Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F538C4167B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 21:17:36 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.30963.1671657447042274178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 13:17:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LwfDtxHd;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id o5so16211081wrm.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 13:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQrkW3e4aR74/DLIkNV2mBNqPpH0PSvh8VIWn2sAero=;
        b=LwfDtxHdzGybbGnZAwmJ30hiumEwywPi/XiYUXy2bVusWk1q02NuUVUCOriKepyX+p
         6M3k62rhCVQvRKyush2YOXbfLxD2OBjPoOF+a/6IQ9gMd4gUUdZBkGF7tw/CI+wMRjLy
         9Ki9Hxg/Qdqcy4LZ9eWbOcjTg4kIEhn3e9X3md2y7Ar1NHb5KFvpAlQ1zwBtnjPyLLVI
         sKXBP2cJqXqMmh0PPUTl677c+Yf68RwcV4g6Ej3uFhmvkfy79EVcvtnxJu/2w+n1OY4A
         16wCm8qvnMuaEfrq/LqiXNjiz2bj3biXtQtsF6xZ62K6cjOlaKm5rbXnaSxICFph+o7r
         biIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQrkW3e4aR74/DLIkNV2mBNqPpH0PSvh8VIWn2sAero=;
        b=DpCBB4R1QiatJw2gr8kUwkNd1gXsRjKu9cDv+O7/BnUND88zXyz0EcfUvBZBt+Jnck
         iKvolqf4i7KlKrsN0q5Vuwtt64ZxPBLG0D0Mv9zsT9ZWfTUFGR8tB0uTTPKy59k5DEPI
         KeRNw0mE/61NioyTHAOswO3gNeFd1cm1TBQLyxIsLkCvo3H0a4JntyvdecLsyxJ+s2dR
         CLbHQbGfF/sJPglH8oG3gI6IbUWHoBG5sTajbdSP8wF/gFCpWBQSuCqHJHF2JtpEDTYQ
         3tQz7GHxC3WCWj+fTJekBXlgVpTmQ7HeR1to3OsFhZIYVVzioBmp42Kj+xwGxKG6YOtd
         6ESw==
X-Gm-Message-State: AFqh2kpyA37dmPQE2VJEcWdG+oagwn/VHMFpJ8YThplOnLe17vXjq5CS
	LxavECXB89VoW3O37L1vbFfXg9Yc+b8=
X-Google-Smtp-Source: AMrXdXuI7g/FelTh2p81Ceyk3KHGCY7fYziN5Etcj4yDzJ8ua1wQq/Z+Z/TDp552rGzlWRirry/6PA==
X-Received: by 2002:a5d:4008:0:b0:241:997a:4f57 with SMTP id n8-20020a5d4008000000b00241997a4f57mr2051648wrp.39.1671657445393;
        Wed, 21 Dec 2022 13:17:25 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id bx25-20020a5d5b19000000b00225307f43fbsm16312442wrb.44.2022.12.21.13.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 13:17:24 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 09/10] packagegroup-core-sdk: Add SDK toolchain language selection support
Date: Wed, 21 Dec 2022 21:17:05 +0000
Message-Id: <20221221211706.25347-10-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221211706.25347-1-alex.kiernan@gmail.com>
References: <20221221211706.25347-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174949

Use SDK_TOOLCHAIN_LANGS to allow different language support to be
selected within SDKs. Initially supported options are rust and go.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 .../packagegroups/packagegroup-core-sdk.bb             | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index d70aff22c725..104f3549d593 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -11,6 +11,11 @@ inherit packagegroup
 
 #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
 
+TARGET_TOOLCHAIN_LANGS ??= "${SDK_TOOLCHAIN_LANGS}"
+TARGET_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
+# libstd-rs doesn't build for mips n32 with compiler constraint errors
+TARGET_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
+
 RDEPENDS:packagegroup-core-sdk = "\
     packagegroup-core-buildessential \
     coreutils \
@@ -23,7 +28,10 @@ RDEPENDS:packagegroup-core-sdk = "\
     less \
     ldd \
     file \
-    tcl"
+    tcl \
+    ${@bb.utils.contains('TARGET_TOOLCHAIN_LANGS', 'go', 'packagegroup-go-sdk-target', '', d)} \
+    ${@bb.utils.contains('TARGET_TOOLCHAIN_LANGS', 'rust', 'packagegroup-rust-sdk-target', '', d)} \
+"
 
 SANITIZERS = "libasan-dev libubsan-dev"
 SANITIZERS:arc = ""
-- 
2.39.0


