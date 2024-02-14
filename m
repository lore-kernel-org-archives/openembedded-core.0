Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12FA2C48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 13:43:42 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.41222.1707918217470429245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 05:43:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Eq70a7mz;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33b29b5ea96so411413f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 05:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707918215; x=1708523015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P3j7n0uL2n+LAo0o2PE14JYZN6RcS5VbZedUJrwIv9k=;
        b=Eq70a7mzf9k5DlDpeKhsqRP3nRgpkzjfyBnFQZgSZrq761t3KYS77NBK5YTNzIhOIt
         8x4EKot85U6H/B/DShCTqKXlqgpqykSkcoodc44d3jlk0tL3rzlNC8vJhKimLuy13jEN
         bxIZ5/z49Hgol90bJdhyfqmYtuZj47ipRRKEORoNOcXZIcZA0iRFe2sV02DI6t5InTs/
         y7N7dZw7X8l4XKqGZqqkNIIEw0v/P7f7KCSU126EpKz94Myrw4d/9bGOeYTu6UhEPJx6
         nBVPURJlBrrrgrvfkdTX94H+jynKOU5DLCM2k+m8356PLnJOxHq6GG6u8sHdE0qKcToz
         6i5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707918215; x=1708523015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P3j7n0uL2n+LAo0o2PE14JYZN6RcS5VbZedUJrwIv9k=;
        b=SoodX7Q7U5hMJXFT9OU/jUOjMorsCZUtU1YzplCgvUgsaFNoNRHVSDWXPPrW9uzeaX
         G7mD+BBnH3QCGB9ZKGUjyAFmRFXaDmer1GOKBd1+4bca5gXE/1vd6Fi1Lc6ivP62sSy0
         GlcjPmVhsA2RfhLeVkrU9OAPpegfrFxGgEiouzWIsEPL3Ri/NYjCrqGIMLYxmMHzAzpB
         kof6SmRNNH7IQYWtH3lhJytXQnQLmySiRwumxzWRjbE0NAMNtL5EMQmY8DfDkxlUhJ8O
         Gj6RQn+/YiWkx1FPthsgvbHc0V8SQuLY50oYdH/fkf8dSP8QajTKJnaF+uYXNjxfyo4W
         J9WQ==
X-Gm-Message-State: AOJu0YxrTf+46c8PX27Ue7QjALKP52jQq4cp/fKIuDw1YfceAJ4dZ+tw
	+S00vNPB7XnXMteWH3T1KsCXPDmURuCP7VOHx2ltHewrwBpH3QdDJPo0CIRA
X-Google-Smtp-Source: AGHT+IGi4eC/tm9+jneSrwrlTPfDII/yO9Qg6jR2hRKO4XJP5dmaTdsbR8Njz8ZvimTdE+tP9cDxuw==
X-Received: by 2002:adf:ebc1:0:b0:33b:1b10:7ea3 with SMTP id v1-20020adfebc1000000b0033b1b107ea3mr1643367wrn.9.1707918215423;
        Wed, 14 Feb 2024 05:43:35 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id u14-20020a056000038e00b0033ce40eee9fsm2548613wrf.58.2024.02.14.05.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 05:43:35 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] qemu: disbale AF_XDP network backend support
Date: Wed, 14 Feb 2024 13:43:24 +0000
Message-ID: <20240214134324.2439400-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 13:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195475

This fix some host contaminations issues:
| /poky/build/tmp/hosttools/ld.bfd: libcommon.fa.p/net_af-xdp.c.o: undefined reference to symbol 'bpf_xdp_detach@@LIBBPF_0.7.0'
| /poky/build/tmp/hosttools/ld.bfd: /usr/lib/libbpf.so.1: error adding symbols: DSO missing from command line
| collect2: error: ld returned 1 exit status

The AF_XDP network backend support [1] requires the libxdp that is not
available in any layer, otherwise you can configure this option:
| PACKAGECONFIG[af-xdp] = "--enable-af-xdp,--disable-af-xdp,libxdp"

[1] https://github.com/qemu/qemu/commit/cb039ef3d9e3112da01e1ecd9b136ac9809ef733

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2a81870151..5d953e5ef5 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -126,6 +126,7 @@ EXTRA_OECONF = " \
     --disable-download \
     --disable-docs \
     --host-cc='${BUILD_CC}' \
+    --disable-af-xdp \
     ${PACKAGECONFIG_CONFARGS} \
     "
 
-- 
2.43.1


