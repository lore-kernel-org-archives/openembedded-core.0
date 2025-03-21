Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DAFC36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 15:04:40 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.2136.1742569474974057825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 08:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3ZQ4ikYo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22548a28d0cso17684895ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742569474; x=1743174274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DULe9Z/WD20Bhia//JJW2sjsUz9fmlv0qfjRuu9k28=;
        b=3ZQ4ikYon85zs+vzMgv3nArCFDIw4g8v29G6QdY2T6cC0PP8BTNiX7HEXG3rnD3awg
         1Xr5myQRWXC/s+oRF5k0zD5islGZqlI57iYb09ii9PItYjSCS4Czpr5x5s5uBs/RGF9a
         lEiUw/rBsmANI/bOPcN0XPN0WXrrnL16I1y9oFnv3GZ/EgHclXno37EkUsqacMKHHevi
         OBN2YexPiNE5DnXN/7BIzwNj5wyyyETBjt2xxOXB5ET98B7hFsWBxgMSjlfx4vS9EKUA
         4kSw15Hs1dBMr9r27HNfKqCo6Es1WkrjlDen5aFpy1FmL7gaKUesofITD2CqqY6Tzzw+
         ROkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742569474; x=1743174274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DULe9Z/WD20Bhia//JJW2sjsUz9fmlv0qfjRuu9k28=;
        b=j/7VoTsXDYcST1Ttq1Hb4588Z21NNpD0N+Ih+ueg9gFpdEd8h/1XSRpgyRDWXZigXP
         tmk7fwIGtSee5SUfRiZ7CA9wqlaV+PYpIeQVp8BJM13a0rfZgLH4R72B4kH06YdbjzDA
         0We2b2YmiIiZH9AhIV6dGoifiJ7wtkC6TId6woo+ip8nd/RFTNEvy5UQLLCvitiafAX3
         y6f0OnM+5qZ//Kn4WvCCaXFvchxFC5caDg2FgNCj7HFQp2/lqeggehB3ysh4lupp7Wp7
         CA5Qi41ttFJ+PYgwCLvMSPuCa87ATj5EJAIjtSInDLIoBUd24ichpmuSL8p1m0+GhkRi
         CoQA==
X-Gm-Message-State: AOJu0YzgsaS4GbW6eKqzJ8G9Y6kBNcLUuqL+fnLy9zvc3EdajqXdInOi
	I2v4TSt28LzcP5tO25IEa93fNz4A1ksuNjsCA20AMhdA5ZNDj1eojvszj8r8Hr8+yM2Jedb8RbL
	5
X-Gm-Gg: ASbGncukRZzE0E23oNKsYyc2ibfcEY+MQ84SsQDB6B2EiV16BlTSjUt9dl5Z66vDQ3S
	4lET9OmaWDV5HevZr8RpkQnAs43M48Rol3s3ViUthpDO3jsKLttwnlbZ/47TQlrcMSsILz7u/EV
	1Q3sFJCEG2efmB7HYPXJJXZ6NiQJLRxUaAGNgZBED8aP+5RN6VvU8JIUCwQzQbaLKZPciX0nkef
	FSrxXgyuUlWaTp3gi9xx5q/GWC8uxwRjrMIvx1h1OtHtj5QVhsLvqcG0jaCOeCpNzsUkl5bBOxS
	4/RwEB033TAzjL11eBeIe/JfPhmGIuHmYYe6
X-Google-Smtp-Source: AGHT+IEdPBsB+M3vgBSCfN+8tCHPoHU0KzEUZ30SD32x6VHn6I4QHdFR4Ek1ZcLFiNOwJXycMQIbmw==
X-Received: by 2002:a05:6a00:170b:b0:737:6e1f:29da with SMTP id d2e1a72fcca58-73905a3599dmr6394210b3a.21.1742569473854;
        Fri, 21 Mar 2025 08:04:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2534:4cdb:e422:e636])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd5788sm2076620b3a.50.2025.03.21.08.04.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:04:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/5] icu: Adjust ICU_DATA_DIR path on big endian targets
Date: Fri, 21 Mar 2025 08:04:22 -0700
Message-ID: <345ebe7046eab4a0588aa33c595f48cfe90f899e.1742569342.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742569342.git.steve@sakoman.com>
References: <cover.1742569342.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 15:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213476

From: Makarios Christakis <makchrbiz@gmail.com>

On big-endian systems the preprocessor define ICU_DATA_DIR
is currently being set to a path ending with the ${PV} of
the recipe.

The PV version string has changed to a '-' separator
since oe-core commit cebe8439cdc656d53355506a31a3782312bf03c5
whereas the build system installs the data files into a
path ending with the dot-separated version of ICU.

This causes the ICU data file to not be detected at runtime,
consequently breaking any dependant applications.

We therefore substitute ${PV} with the dot-separated version
string of ICU, as returned from the icu_install_folder function,
on the ICU_DATA_DIR define on big-endian targets.

Signed-off-by: Makarios Christakis <makchrbiz@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28cdc0110def011e3d690da1d591076385267ef7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/icu/icu_74-2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu_74-2.bb b/meta/recipes-support/icu/icu_74-2.bb
index 53853e24a5..3a4e197308 100644
--- a/meta/recipes-support/icu/icu_74-2.bb
+++ b/meta/recipes-support/icu/icu_74-2.bb
@@ -26,7 +26,7 @@ EXTRA_OECONF:class-native = "--disable-icu-config"
 EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"
 
 EXTRA_OECONF:append:class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
-TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
+TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${@icu_install_folder(d)}\\""', '', d)}"
 
 ASNEEDED = ""
 
-- 
2.43.0


