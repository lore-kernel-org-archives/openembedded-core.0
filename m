Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0CEC47258
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 08:19:17 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.18560.1706861952099411899
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 00:19:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EEqNf4d7;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d8df34835aso393422a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 00:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706861951; x=1707466751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kc1FYD70rRwiLN+fhlRxJVX9FV0lhuGbkM8mgpKnvSo=;
        b=EEqNf4d7A1bvTzr24jmVn4rzS6tixwOjWfLBuLs768ROYMpS/NJjF4Cjxl7PJqKR3b
         TcomvbbSjHp7Yj4MydUeKd/1CGTS8WOempA0nvn8tvGG4cGF98m3kLNGp+ayvs2IOVRE
         Rcnydx4QrsVb3YQleFHT5JoO8/BR0ybe5qGDWXT2Hm2gCyR95QgIUgsOExC9/0MmK4cv
         WmBlIvngSiDBGLLhaSD4KaatgxJhgFMVoikKA8eaI0gxXfITafEvl0wYSXUWxYMWarV9
         I6sC1Uu/LM9LSGoOM3BoxKI3fC7yUjHoY6ppW5fyi3shDLWB3c7tBU5pXhg5SAj4BNpL
         ZrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706861951; x=1707466751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kc1FYD70rRwiLN+fhlRxJVX9FV0lhuGbkM8mgpKnvSo=;
        b=i/2TeOCWEADN8rjTRNe2VgpaMfZnGtjenHdvHPAxjdswgQMuP2Pk+TXs7kG/Xra5Ms
         ndTC/R28nbfZg7tliqdrqiDavMSH64gxnaR9Fr7DFuqsbVKfeeU919AahLKjggQ9/kG3
         OQ0wIBhzDL5adJxrbdlBGUK4/3c/W3WxmO/karfgCgG5dPz9t9KKsR1LzzuMCcrxf9GR
         5PKRvFhKQEkLQb1CcSFCWgpFbKbaJupI+LeY3MDrI30iXq3kQRmfcJ9dszuSaJ1tnyaT
         nPAjZ3nPbIIardfZjAvcytrCvK7old7+UicqCkdqtPZXFpsnA9sJhQn/AFUggVKda4uA
         H4yw==
X-Gm-Message-State: AOJu0YzmE3D9Yhk886WXhuT/GLzkvVtwJBdxT+igz1O5TlCYfDIvHB6I
	x6ne7FlMOvAC0D5aJGzoH1kXaNCDTX8wGO2EhbpTNuQ9zB+HexxdXZCOKbQJCqg=
X-Google-Smtp-Source: AGHT+IH6MS6aaZ7ZeRLReKKipTYDT3jnpC8yU3Cb9w0chI+1PeiBSctAZ1F8SyUBh/l4OGVNtlrn5g==
X-Received: by 2002:a05:6a20:a31d:b0:19e:4ab2:c362 with SMTP id x29-20020a056a20a31d00b0019e4ab2c362mr1677105pzk.14.1706861950971;
        Fri, 02 Feb 2024 00:19:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e58e])
        by smtp.gmail.com with ESMTPSA id 34-20020a630f62000000b005d8e30897e4sm1022089pgp.69.2024.02.02.00.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 00:19:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] syslinux: Disable error on implicit-function-declaration
Date: Fri,  2 Feb 2024 00:19:08 -0800
Message-ID: <20240202081908.988840-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 08:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194785

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
---
 meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
index 332655bdf98..c8e7f25d2b0 100644
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
2.43.0


