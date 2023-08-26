Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26CBC83F1A
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:16 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.10485.1693064349684774676
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hmHIpp5f;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68a3ced3ec6so1519550b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064349; x=1693669149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LDY9A2Cepxq6x43GnF+JwZ3HYRsCfT6k7Nj05aVNZk0=;
        b=hmHIpp5fnHqR+QSya88/yETk6MDg2ztLFjZbexfBdKQPHH11dChrRjDww/r0PAOUnI
         o4IEWpRGHUudU6Y8nRUGEEfFZDciFi0w2MtAtMyMVp8n3U2HDkzRkhnal30TLRCiIi5P
         AFpcTV7Xt9A3KeqVd5ZhqGYY7xzsi5WJ9RxB/pagQtNsrb/9r9PluZYLGPejI1f4C0LE
         V6mAxcsMORMZrgcziHcoIKBs0eRJAVNYtjAauRTjlAdVOOzmJm7L6J8ZS384Qne335nu
         W2QOhmOCJD4H7BqBLTaI8mMrcg406mV5AEYB9bg7JWzZT/APFXqFCgRVLjTn2lXk6kcS
         gx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064349; x=1693669149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDY9A2Cepxq6x43GnF+JwZ3HYRsCfT6k7Nj05aVNZk0=;
        b=VfIu83U8fxH3AqsZyyB7CCWMHmxm+/wc6QFvJu2HyQTxTyfSgwAen0fp4mJLy0D9UL
         U0StDMMo6lRCfpERqz9hPDEsM+DmeU6eTl3bWhrd6KAgHffPDWLT829d8yCJbEj32SoI
         k1khwqO9eTRqjWEEgm3d8hNN0eI26GIdmWiTuIdXTxps8MqjPjd15i3MLnqah/Gk5VNX
         ND3kU0Ah66HBYjN+H37ilKaARqh77Upz4hzzZ1GRZtd/WZJY6fNMmw8YcswL6Ug5L7x6
         91n50SPPy0cpJ3nkI2kg8S3b+5RvkTcscdAL2riw5DNV9FIY/e5GwgYlkFXCfK/BsXBi
         flSw==
X-Gm-Message-State: AOJu0Ywq3J82ouCc1psYuZ5PhKaBzfNnfK79teQFbNjdctEdEZXNLgnI
	8AaZ16+dUzk8xC1hgK+ATrduXEUylcEL9diLlC4=
X-Google-Smtp-Source: AGHT+IGM/0pN8zbZYNSbGirNEp102ljRr+QbLLfcNGbsd2ymmfyLV8Xy/Pv2XBWn7TkP/E//ykEcjQ==
X-Received: by 2002:a05:6a20:5511:b0:140:cb66:73c0 with SMTP id ko17-20020a056a20551100b00140cb6673c0mr18543999pzb.58.1693064348746;
        Sat, 26 Aug 2023 08:39:08 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/20] librsvg: upgrade to 2.54.6
Date: Sat, 26 Aug 2023 05:38:37 -1000
Message-Id: <295eedb61d8224cc4bbb0ced1864db0a6a74ab1f.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186750

From: Chee Yang Lee <chee.yang.lee@intel.com>

update include fix for CVE-2023-38633.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../librsvg/{librsvg_2.54.5.bb => librsvg_2.54.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.54.5.bb => librsvg_2.54.6.bb} (97%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.6.bb
similarity index 97%
rename from meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.54.6.bb
index 59278d1b16..b917b76041 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.6.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.pat
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
            "
 
-SRC_URI[archive.sha256sum] = "4f03190f45324d1fa1f52a79dfcded1f64eaf49b3ae2f88eedab0c07617cae6e"
+SRC_URI[archive.sha256sum] = "0ee6174140b5fc017e19a75c26e8c3324a560bf2c37f7abd3da06bd58542bb03"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.34.1


