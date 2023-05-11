Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B4FC7EE2A
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 12:58:16 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.58381.1683809889854282729
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 05:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jDiGi+wT;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so79037815a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 05:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683809888; x=1686401888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AC2upMy89IOj399CB7oI9EnAqmWjl3TSQTL/GMNUeyU=;
        b=jDiGi+wTaa+F5LohVU3rVYHgsytMcpfxM3VqEkUwDLItJ/gaOGLIvjg5Lq0MlDjeHj
         sIYiVRIqVSKTa/m6l6e2SrKmq735F0XilVgqz2nPEk1oTT1+R5OqaNGhkqwUyjJJGRM6
         ZCxbZ/hm26t24v+/pyScdb5gCwIc2V1lPwpd9FZoGiLBoVjMpGoOE//2Q+kwEXoPfWBl
         JGqK8yU2RplHuq8/70E7Wy3GDyL5r+tCWxU0/zJf71M+xfUJlI8XQ7j7JjR0kw/rX7Nc
         DazJa1Gcke/y1ih+9BNVRzlVAnNX/9v67h6uIs+ysNE8C9RBYg+kT6hLIYVXTQwEH5n4
         3Z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683809888; x=1686401888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AC2upMy89IOj399CB7oI9EnAqmWjl3TSQTL/GMNUeyU=;
        b=A22yoRYiTK5Gj+UoMWY49w48w9+mD8YEAcTtB2LaDCjeA/sVH51f0mxhI8rUUqIzP/
         ezaw9qrI69htTA9u4XgcJx9G6tosEPjx20B8xawvjK/5mGCAYGNRxMZv7DjflrdChtLZ
         Q6B6m7ou+AbleruoYD3vueqHE8hOdRTx43j9QlnYNlIjHXEArrIGAI1pR18/yf0GXcEr
         vJtSHCevXLceiQMbFtuzFv6OoxP1+LTAQ4brvvzUsGjDknK/HgKEzwdIxOOCmmdcqx7e
         EsMzVU4vwFIg02OHD7v5Ekdvvtzw8JfMMeJ4fTm3tg59jW8j5w+CMiqETJ6G9Wa3a4qx
         qZjA==
X-Gm-Message-State: AC+VfDx2lOBYFCmtF0u1i1VAL6U4MZsZOmM6ucTFanatkwlwyHes9+Cz
	VS3sHUC9HQ7sunzD9snieBMPRZJbw+w=
X-Google-Smtp-Source: ACHHUZ7EVYI7PkeSvKSzqFIzCunnCJCvrvl+rY+Z2qRrQTeWSBaudZXdG2Egdt7Ht1TwS7mewZAh1w==
X-Received: by 2002:a17:906:5d13:b0:960:6263:138f with SMTP id g19-20020a1709065d1300b009606263138fmr19990933ejt.27.1683809888067;
        Thu, 11 May 2023 05:58:08 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id f7-20020a170906494700b00965bf86c00asm4047223ejt.143.2023.05.11.05.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 05:58:07 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	quaresma.jose@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v3 2/3] perf: make pkg-config available
Date: Thu, 11 May 2023 14:56:02 +0200
Message-Id: <20230511125603.958144-3-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230511125603.958144-1-max.oss.09@gmail.com>
References: <20230511125603.958144-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 12:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181134

From: Max Krummenacher <max.krummenacher@toradex.com>

Fixup the to be called pkg-config as $(CROSS_COMPILE)pkg-config doesn't
exist.
With kernels < 6.4 pkg-config is only used for the gtk+-2.0 integration
which is disabled in the OE config. Thus the issue wasn't exposed so
far. With kernel 6.4 pkg-config is additionally used for libtraceevent
and libtracefs.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2f28d16fba..80199a4515 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -87,6 +87,7 @@ EXTRA_OEMAKE = '\
     perfexecdir=${libexecdir} \
     NO_GTK2=1 \
     ${PACKAGECONFIG_CONFARGS} \
+    PKG_CONFIG=pkg-config \
     TMPDIR="${B}" \
     LIBUNWIND_DIR=${STAGING_EXECPREFIXDIR} \
 '
@@ -287,6 +288,7 @@ do_configure:prepend () {
         sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/perf/Makefile.perf
         sed -i 's,AR = $(CROSS_COMPILE)ar,#AR,' ${S}/tools/perf/Makefile.perf
         sed -i 's,LD = $(CROSS_COMPILE)ld,#LD,' ${S}/tools/perf/Makefile.perf
+        sed -i 's,PKG_CONFIG = $(CROSS_COMPILE)pkg-config,#PKG_CONFIG,' ${S}/tools/perf/Makefile.perf
     fi
     if [ -e "${S}/tools/lib/api/Makefile" ]; then
         sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/lib/api/Makefile
-- 
2.35.3


