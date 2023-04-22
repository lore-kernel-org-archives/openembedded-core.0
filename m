Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEF5C77B76
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:59:59 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.10440.1682179198601195398
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=WSorTCr1;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3010889c6ebso1662447f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682179197; x=1684771197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UN5mzQl81QbDfi7zGdBPYH8iMm58vkm8uQ9WWrA00nU=;
        b=WSorTCr19W4yuZKURrLXoXkb3pVVBtZFkU5b3mZkphPa8lNT7FFzT5r6wtX5BLvQgP
         nz0ybTGIdznEuJL9sm/NI3cyZ4Y/VIWNcxNZHf5IWfpaSJeRO6ZAm9uGPNLA4h+15FIE
         dMf9S5BKX8YlXqtnF+IHTViIuwt6XatGl/7gSRa1PvcqyUfx7/UhTfaz6VA0GE1RvPph
         T2c1tyeFWuuC3OQ/MoQf3Wj7e3fjpUVxuSI44LEvTVSJ87egDHdF58W5dIhV9P1DiGjo
         4KPagTi1xEgbx34Mohw4cq+kj3zxjRP5LFDAXAjwvODPoSWyrSHxcr407ih12yCGwyaV
         NyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682179197; x=1684771197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UN5mzQl81QbDfi7zGdBPYH8iMm58vkm8uQ9WWrA00nU=;
        b=RH77wBLeDAGo6YER3E+7KvGqytUzFx4QdVQasLUFAa5mChZV6EmHIos3rwUrF4ZR28
         7b26GoFbeSK2HZfpwuj1DJ7gzZlM/r4Fgg3F7I0wn/EzgqTRFFJ0kLd3HxXUznoUBJRC
         wmH5Gx+QPEQAIgcfTMK2tq0GqdwnYjfldsV48S+oV/rKSwHAYYCvkTHrH1tWhQ4O5IuJ
         Zzh/PHUawTsPJ5h3L84Q/iOi4S2G7knL9HAjrSeU6xjJIFoPc7l3qdITwF1S39mYUQD+
         bkVG6tugYe39rGFOHwJ5mPcSRGIJVtLcWQDI/bBaB3yAod4ZA+R0zwIyfChaj8dFYeAW
         fA5g==
X-Gm-Message-State: AAQBX9ciw/DzmJBKOohueJBNrfD00R7x4yZgSMtFiFP+dPk4uPJrfj2Y
	QfhRQgU11ILivzvmkbpDejPR1+3MvrA=
X-Google-Smtp-Source: AKy350ZeInoA8xmhe9EWltRPSlrKhiTVY+/6HT5Qu/4rGTX7qETCUSiGT20HVd7t5/h3wUoHpTO2kA==
X-Received: by 2002:a5d:4fcd:0:b0:2cf:ec6c:f253 with SMTP id h13-20020a5d4fcd000000b002cfec6cf253mr6270247wrw.20.1682179196760;
        Sat, 22 Apr 2023 08:59:56 -0700 (PDT)
Received: from work-pc.. ([2a01:e0a:8d5:c6c0:446e:1477:ec70:1aee])
        by smtp.gmail.com with ESMTPSA id e29-20020a5d595d000000b002fddcb73162sm6798184wri.71.2023.04.22.08.59.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:59:56 -0700 (PDT)
From: frederic.martinsons@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] zvariant: add ptest feature for zvariant test suite
Date: Sat, 22 Apr 2023 17:59:43 +0200
Message-Id: <4f1ee72f98af8396292171efcf08d3db1efa44e8.1682178812.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178812.git.frederic.martinsons@gmail.com>
References: <cover.1682178812.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180322

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 .../recipes-extended/zvariant/zvariant_3.12.0.bb      | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb b/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
index 4285d11b72..6c69c80940 100644
--- a/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
+++ b/meta-selftest/recipes-extended/zvariant/zvariant_3.12.0.bb
@@ -7,6 +7,8 @@ HOMEPAGE = "https://gitlab.freedesktop.org/dbus/zbus/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b377b220f43d747efdec40d69fcaa69d"
 
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'glib-2.0', '', d)}"
+
 SRC_URI = " \
     git://gitlab.freedesktop.org/dbus/zbus;protocol=https;branch=main;subpath=zvariant \
     file://0001-Tweak-zvariant-crate-config.patch;striplevel=2 \
@@ -21,10 +23,17 @@ python do_clean_lic_file_symlink() {
 
 addtask clean_lic_file_symlink after do_unpack before do_patch
 
-inherit cargo cargo-update-recipe-crates
+inherit ptest-cargo pkgconfig cargo-update-recipe-crates
 
 # Remove this when the recipe is reproducible
 EXCLUDE_FROM_WORLD = "1"
 
 require ${BPN}-crates.inc
 require ${BPN}-git-crates.inc
+
+# zvariant is an indermediate product for the zbus project
+# and so, it provided only a static lib (rlib) which fall only
+# in -dev package
+ALLOW_EMPTY:${PN} = "1"
+RDEPENDS:${PN}-ptest:remove = "${PN}"
+
-- 
2.34.1


