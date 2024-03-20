Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1201CD11DC
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:44:33 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.50470.1710953073606021636
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3EUJQeAQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e6ca2ac094so119614b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710953073; x=1711557873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFQ5WgfoA2REa4w5YqoKTxS3Dvwe6nvcE45RcRT8EQg=;
        b=3EUJQeAQEb1gTinuUxNSrATk0MUNri3coyj3K+gvAfn3ofuU/RoUifTT4G+BhIbThP
         ckvDzSkI0kwfo32B+tFOKpOVBgc2IRGg6iuSqcUcn//NismaXlF8MkBOzXiMkirfSOEq
         F03ePxJFudbsuHms6Wzpd5/h13FbLFHIW5k+a0kVm8qa3ZnFFQF99xArpYjXaBSRGyz1
         9dc/+BXTv5mDzhnxp/5v6tm4qleJLPHPw5YXqPUVJ6N7p3Y3PqahbLXlrOeBscAFYU9U
         1moM/blsYmN2mUp4g4gNCje7+VyIA6Bgl00K7gTDcGVEojlWExUnFtoSbm7p7NhEZbgY
         IErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710953073; x=1711557873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CFQ5WgfoA2REa4w5YqoKTxS3Dvwe6nvcE45RcRT8EQg=;
        b=PZqAMyritQyWkGxj+1X2olszqzUoZisISK1prNo6XkjjOEeHg5yAy6Eew9cigUCpls
         MaivsFxvOTkGAsa6LZKzZ4AIHwcgUA4LJd+HXCDQI1ks+JZaSBOke5rXOYZd/0sHkoHp
         A6qtyKdYTPk3/IbOLwbe0bgbC/erac07Ghhyl1+iiWRizc5zGRnoZMd4zUDEQ3LEH/Zm
         HbE6jl2ylKE/g5mHxxMd3kY96Hc20MjBqdtjngSxhOSTBRURivQ4Q8ZCXsIrkvbxsSs3
         0GAZBBIr0doRHjrE2zmxaMCfiuzfTeZ8t2zROUF/Zl8Tu4XaJdi3H8gTCOJbuF66lplI
         7+pg==
X-Gm-Message-State: AOJu0Yw2zHg1nW+rRs+/Do8OOXUvgdoGoPK5lYWWFE6bd7JHlVhEXNTr
	oLCAfUI5JExhnYE1TB1rS+GIblQd3jJwzJjcXJYzzWiHmFs1xu318fcGPdea1PUcVSIwaJloukT
	8L5Y=
X-Google-Smtp-Source: AGHT+IHTo+3Ag/x5me5z6C7Vz0nLTtnISudGxRvgQZV4N4xMsC1gZjwdheztb1tLsWHcKa3gEPVhDQ==
X-Received: by 2002:a05:6a21:788b:b0:1a3:560c:15d8 with SMTP id bf11-20020a056a21788b00b001a3560c15d8mr7464022pzc.41.1710953072933;
        Wed, 20 Mar 2024 09:44:32 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a3-20020a62d403000000b006e6bfff6085sm12725437pfh.143.2024.03.20.09.44.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:44:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/12] wireless-regdb: upgrade 2023.05.03 -> 2023.09.01
Date: Wed, 20 Mar 2024 06:44:02 -1000
Message-Id: <947433332468a9662cedacada1e5d19d9a664ac2.1710952928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710952928.git.steve@sakoman.com>
References: <cover.1710952928.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197395

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
wireless-regdb: update regulatory database based on preceding changes
wireless-regdb: Update regulatory rules for Australia (AU) for June 2023
wireless-regdb: Update regulatory info for Türkiye (TR)
wireless-regdb: Update regulatory rules for Egypt (EG) from March 2022 guidel...
wireless-regdb: Update regulatory rules for Philippines (PH)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f5edb6904bf16a9c52a9b124aeb5297487cd716)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2023.05.03.bb => wireless-regdb_2023.09.01.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.05.03.bb => wireless-regdb_2023.09.01.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb
index f3c3cd78e9..9187d257ca 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f254d08ab3765aeae2b856222e11a95d44aef519a6663877c71ef68fae4c8c12"
+SRC_URI[sha256sum] = "26d4c2a727cc59239b84735aad856b7c7d0b04e30aa5c235c4f7f47f5f053491"
 
 inherit bin_package allarch
 
-- 
2.34.1


