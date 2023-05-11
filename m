Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10ADC7EE25
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 23:22:28 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.11660.1683847339848998143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 16:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=llE3xjkU;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-50bcae898b2so16368095a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 16:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683847338; x=1686439338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AC2upMy89IOj399CB7oI9EnAqmWjl3TSQTL/GMNUeyU=;
        b=llE3xjkUaDj71fmOUtw3RYHq4FnJ6/1t/oj1Wh4kaBLk8PdOinc5mrYlc7R2UUlScL
         mqE8qu+CiOm2mse6ExHGd9/UjWK3x21cFpXMxGtWcwQjElU+fZK0DESQemi4jARqwXZU
         xGN1ABZKpFmOZ/zgcda0W0dYKfCc0OikC9gpn/MRq3Gd05W/myigfbl5NLCNl18submm
         zV749CDUlY1W4iuUgrC6tj8z+TnuSNQxB7zatwVlXet5esqrIWItCEUd+4cep8Nh2DSv
         1+iifmlxbl47s9XKCrKnGRIp7ML+VmlvWfzeuy7XPDIEoX3+cjn/n1B4FFQF0ewzTwTp
         YSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683847338; x=1686439338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AC2upMy89IOj399CB7oI9EnAqmWjl3TSQTL/GMNUeyU=;
        b=Aeto6QzyO671Y0NDr6imA8Px7GKilBDlLRF6JC+WZBIJAOTPZCNY/Y/pZ2TnwZv1Pg
         /0OY8nelwooe1gm8kIyOdpIzYtGFtePA9MdbC8azxaq1Hw5YrlP6CwRAzB7kdQ5HZO2b
         cGAylGQbCjxahGcNbIw23HYBTFmSw7rryh5PxiRU8uPV5kxUjitF9xmMyhKv5DUq9yXK
         qR1xYZM3Lwv1XI1VDOLrwV50IOHfRO+btuz5/wCfQDdJU8J+wjtC8cMwCinVZ7mocspU
         Nkz3FPmc+U7TGLjeo0B6WeCJZtBxae7UUbwk4TAMdOFovcokVyejzC991Erux4hYcQl9
         JDiA==
X-Gm-Message-State: AC+VfDwsvWBszMuEKSA6Hln9Q44F8qe9r8lzgs9rQiiM+e6o4a37Kdmr
	vumIpje7xyYmkNfeOJA42n0ltuEbeeo=
X-Google-Smtp-Source: ACHHUZ5M1XdjrSDHhhXvkqE6uYRAgW1ThFUOFcs4P/HKJx8a9tyZp07cUKa3m1Xhnsf36+krOOPUig==
X-Received: by 2002:aa7:d8cb:0:b0:50b:d76a:7904 with SMTP id k11-20020aa7d8cb000000b0050bd76a7904mr16580914eds.28.1683847338218;
        Thu, 11 May 2023 16:22:18 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id n25-20020a056402061900b0050a276e7ba8sm3480162edv.36.2023.05.11.16.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 16:22:17 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	alexandre.belloni@bootlin.com,
	quaresma.jose@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v4 3/4] perf: make pkg-config available
Date: Fri, 12 May 2023 01:22:13 +0200
Message-Id: <20230511232214.993328-4-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230511232214.993328-1-max.oss.09@gmail.com>
References: <20230511232214.993328-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 23:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181170

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


