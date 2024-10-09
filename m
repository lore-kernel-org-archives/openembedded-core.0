Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CAFCEDD9C
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 14:13:11 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.17672.1728483184813866368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 07:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g4/UQcDB;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42cb806623eso65171395e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 07:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728483183; x=1729087983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NPpbU/qviouyGTQPIpdQMs78Jt3kd+LuUptPT2C+Ud8=;
        b=g4/UQcDBHoKTt7tqqlGeHkp34BTKdZMBH5xSjwZqG4wyRHDcUcpvcpLDTpkVE/jXix
         HqkDL5ZOZrty3081/9pPDWQPHU56v/bxMGfAjejihLoAGIMWlAxVlfHTiWtpEVg+lSRh
         6X8WfaeIVokIWgKXhaCVsoz3PXRyiNBYCaTwyFiZUM2pLUoIsBN04C/QTpDF7VD4J63G
         2Hz6HdDhndQWD9B2xaYPOEi8v9Gchhto1PbvmG05uSO8x/uv8zr6xB+2huhEdI5g13NK
         oUWM+kzabcaLxX6FTKeqXJ8z65xNIfw2pKI3m7b09zibN8vmkEONITGPHm3yM+WZ9H8I
         yntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728483183; x=1729087983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPpbU/qviouyGTQPIpdQMs78Jt3kd+LuUptPT2C+Ud8=;
        b=pPvdCu6vxStntkZSqaoPcaDkkf+feD0KrcH22urYnFzChzSSXD5XQSGkztBbDQDEGN
         t54yRSBRh/siuqkxaknvols+4ytMykh4FfNhg/Ppb4EIF+np/Ie6Zjj80WsD2nqpK5ms
         apskd5PGshXnOmuiRWU8zMrLSHQNMU1h8QXKYzYTUmkW0uUX9eMbNP+4M9GTkyO53jvx
         ThBM1XDCCrhYe1Vd7HWVytToDyGijUdH+8aVF1FEPQpIIiEge5+AgZOPJYliJ5V5J250
         JMF20O5rF0fKROhY6q8MOCknIL4zGvW4G9ZRRHPEgCWIAVi/jddF43BcHkUk9QcwpZyi
         Bw/A==
X-Gm-Message-State: AOJu0YxgWdBU4vNmCEdx+TamfgBTp8A/kc9S3O3ms1HvkZIdiHqNfrIv
	KymFGPDE8l3ucRYJbSg/6kj72E+vsc8H40zBYx5NglLo0Y4XAxFBt7BDfw==
X-Google-Smtp-Source: AGHT+IHH95g3lGD0UHEOBd0bskrktAilq0O3HNXG3fP4KfLIq6BwXkY1kwddSn5EBR1b6GbLzpfXyg==
X-Received: by 2002:a05:600c:468a:b0:430:5356:acaf with SMTP id 5b1f17b1804b1-430d70b4121mr23294165e9.32.1728483182836;
        Wed, 09 Oct 2024 07:13:02 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d32fcd05esm3527590f8f.84.2024.10.09.07.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 07:13:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] syslinux: Disable error on implicit-function-declaration
Date: Wed,  9 Oct 2024 16:13:00 +0200
Message-ID: <20241009141300.1214369-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 14:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205359

From: Khem Raj <raj.khem@gmail.com>

syslinux has vendored copy of ext2fs/ext2_fs.h but uses ext2fs/ext2fs.h
from e2fsprogs package, however, ext2fs/ext2fs.h has dependencies on
ext2fs/ext2_fs.h coming from e2fsprogs package as these both headers
come from same package, here syslinux uses ext2fs.h from e2fsprogs but
supplies its own copy of ext2_fs.h which maybe out of sync and that
results in warnings about implicit implicit-function-declarations
e.g.

recipe-sysroot/usr/include/ext2fs/ext2fs.h:727:16: error: implicit declaration of function 'ext2fs_has_feature_gdt_csum' [-Wimplicit-function-declaration]
|   727 |                ext2fs_has_feature_gdt_csum(fs->super);
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~

ext2fs_has_feature_gdt_csum here comes from newer version of
ext2fs/ext2_fs.h but missing from vendored copy, hence the warning.

With gcc-14 this warning is treated as error by default, which breaks
the build, so lets treat it as warning only.

All these functions are never used in syslinux, so functionality-wise we
are fine.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 0e4a23c1b4..4b4b6d4b64 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
@@ -48,7 +48,7 @@ TARGET_LDFLAGS = ""
 SECURITY_LDFLAGS = ""
 LDFLAGS_SECTION_REMOVAL = ""
 
-CFLAGS:append = " -DNO_INLINE_FUNCS"
+CFLAGS:append = " -DNO_INLINE_FUNCS -Wno-error=implicit-function-declaration"
 
 EXTRA_OEMAKE = " \
 	BINDIR=${bindir} SBINDIR=${sbindir} LIBDIR=${libdir} \
-- 
2.47.0


