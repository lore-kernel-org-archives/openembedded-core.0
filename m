Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB17C7EE24
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 23:21:39 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.11576.1683847297125367300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 16:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=P00I0QrH;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-50bc2feb320so14306328a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 16:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683847295; x=1686439295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AC2upMy89IOj399CB7oI9EnAqmWjl3TSQTL/GMNUeyU=;
        b=P00I0QrHipy/AK8x/Nfhr+h6JR9jJEd7707KYGJfq7lVI+sfuiSDULilEKbbZhZvVE
         Rn9qgfF3raClBGQnnJFXm4yydSU//o4QzCtqlHYn3KekwWOsSAdMKRc0a07QZjmXAtle
         MIRb91/7/aprYQVNfwaimrQyiPbpr5QD9EzuNeZFrtiLAuyK9LuYLMjD51o/IVgeLzbw
         aHuDOkswxUltJxGS5d8V4HW9LiO1vFB6e+1HjfoqtwX9KETfb9aXhRMYIbRV8Wkdoktt
         yGu5lkzXQBzzmLMdrZADJ6q34+0VHkqDzO85NGfxZWa2GhNrmFesoelC0AgmXgIN3Gt9
         vyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683847295; x=1686439295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AC2upMy89IOj399CB7oI9EnAqmWjl3TSQTL/GMNUeyU=;
        b=HDTGU8HElsQ6UcIVpTrMXlG4WTfRIR6YGVnGrY4bMPQgybna0WaHPqB1wrsv2tgflN
         c76myA6/FMFzUp9WnA1rYEhAPYAPwszhkZXj9VL+h5VCk560R6uNEutV/8dTck+moUi7
         C/rR7FgbwXWfgCxhXo/zvF3hL2R8MTwAA52f/esgFJCcrVm8S7ngtPkG8zE9Hbd9fIq2
         D0B1LArs7+6NMFoAohsd6WGU2r6LXgdWDfki3ufjRqFn8W+Csm3WeP+wADitDIlNrxrw
         ixOmz48VvbOHtxC7Idw7Bc6Jt8IMKzp8h/Ti1WE+baVc7vc+NacX65GJd/kAEiWFW92s
         rNUA==
X-Gm-Message-State: AC+VfDwLpNBDlNqvz9drwz29olrMBJGrWTP5r+MWH3Sqi5vgrZf8txGt
	N5qW98y+qEBWCTux+8QVnZy2elnohpU=
X-Google-Smtp-Source: ACHHUZ6fz+gmsXvvi/egiiXjTV995xBII6V8dlSvov9RoYvtuO6RjdgAI+loF5ckL/P6uNi5Ivw07A==
X-Received: by 2002:a05:6402:31f6:b0:50c:358:1eba with SMTP id dy22-20020a05640231f600b0050c03581ebamr16984482edb.35.1683847295386;
        Thu, 11 May 2023 16:21:35 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id y2-20020a056402134200b00504ecc4fa96sm3265163edw.95.2023.05.11.16.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 16:21:35 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	alexandre.belloni@bootlin.com,
	quaresma.jose@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v4 3/4] perf: make pkg-config available
Date: Fri, 12 May 2023 01:21:28 +0200
Message-Id: <20230511232129.993289-4-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230511232129.993289-1-max.oss.09@gmail.com>
References: <20230511232129.993289-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 23:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181164

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


