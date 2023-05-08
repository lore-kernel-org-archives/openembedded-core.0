Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FC9C77B7F
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 17:05:40 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.113619.1683565531015185398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 May 2023 10:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QB8hddjE;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: max.oss.09@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-966287b0f72so405141066b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 10:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683565529; x=1686157529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDu4fZTm5PGIxrZy1xrdwfbKmgDIfmGsdyw3Inf9Kys=;
        b=QB8hddjEPrlazh6eA24VH2AotxI2EuHXUvfdihMuM6AXKiNZkugLe+bbNSQYGYnXws
         KM48E9p62M1dvo+pFdFyZVb+upXoAro0ogfkI8ABM8i9wkCeQrekws1AlGm9oJLC0F4W
         Y99n6qj8cLnckqBx+kkkikQ3trCgzLGuBc1FZUHVPLAJ1ZqtaErq86CDGjlMJ97yrnfj
         G5JTiSHhxviDVeJy5dHV+Hkj7a1sHNLyzAuBgKAL19Y1SIJV0A/BpjY5KscOVI83dLl/
         zcdgrep8bMaSIUC4rAYADp0ubSLXJkfBdnqJQziXXPPA1kq9zCcr1ytIlUNKvCwsdOXq
         +qeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683565529; x=1686157529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDu4fZTm5PGIxrZy1xrdwfbKmgDIfmGsdyw3Inf9Kys=;
        b=XRHBzLgaRvG0AL+Js0J7oCIiN+eUsN3S3rqJulMep9S7lyhx50ppLzbgWQT8GizY3Q
         wzAEmzFItqyjmSpRiU93VhxSCPEirpskuUr6toCfTPnwUpL4mowH6uWU1US+pqq8eoJm
         Tq4zjBtf8B391AC8g8MCilJZ14G20pjHG0Ek2TbV+k5CgCxGUOrEqRprhA4oZcsFlZmF
         Ubh4asbuMS+ecMx/uiaLp4xa8DrqqdHjLHYjd2GXER4Kk2sda9WCB/o3RiVM1k+nnDX0
         FIeXr4Q4O9X3ZgACmABWQ8VpMmU0zakKxiSZ1FQ47Pf+L4JcHFTvkYAavi5Ikaww2jJn
         OLsQ==
X-Gm-Message-State: AC+VfDyODicTwfsofNdNZYbusuVLY64wU1oW3wDiE9fo8GEl8GRrlXCy
	PbND0Nhk1su6oy15LQ+mdFmlFFRkYj0=
X-Google-Smtp-Source: ACHHUZ7pqBnFaAWYgksTsG/7U56AINofwskeKX1X5kY7cxpjbaEafD/Yr7yl2pmk0ppyJqOzILn4Pg==
X-Received: by 2002:a17:907:6e10:b0:968:1e8:a754 with SMTP id sd16-20020a1709076e1000b0096801e8a754mr2392907ejc.72.1683565529108;
        Mon, 08 May 2023 10:05:29 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id m24-20020a1709062b9800b009686a7dc71csm213463ejg.30.2023.05.08.10.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 10:05:28 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch 1/1] perf: add libtraceevent packageconfig
Date: Mon,  8 May 2023 19:04:23 +0200
Message-Id: <20230508170423.3555574-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 17:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181022

From: Max Krummenacher <max.krummenacher@toradex.com>

With kernel 6.4-rc1 commit 6898e60f709b ("perf build: If libtraceevent
isn't present error the build") having libtraceevent is a required
dependency unless building it with 'NO_LIBTRACEEVENT=1'. Older kernels
did print a warning and build perf with reduced functionality.

Add a libtraceevent packageconfig which if not present builds with
NO_LIBTRACEEVENT=1 and if present depends on the meta-openembedded
provided libtraceevent.
Fixup the to be called pkg-config as $(CROSS_COMPILE)pkg-config doesn't
exist.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-kernel/perf/perf.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2f28d16fba..110711f4ac 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -27,6 +27,7 @@ PACKAGECONFIG[jvmti] = ",NO_JVMTI=1"
 PACKAGECONFIG[audit] = ",NO_LIBAUDIT=1,audit"
 PACKAGECONFIG[manpages] = ",,xmlto-native asciidoc-native"
 PACKAGECONFIG[cap] = ",,libcap"
+PACKAGECONFIG[libtraceevent] = ",NO_LIBTRACEEVENT=1,libtraceevent"
 # Arm CoreSight
 PACKAGECONFIG[coresight] = "CORESIGHT=1,,opencsd"
 
@@ -87,6 +88,7 @@ EXTRA_OEMAKE = '\
     perfexecdir=${libexecdir} \
     NO_GTK2=1 \
     ${PACKAGECONFIG_CONFARGS} \
+    PKG_CONFIG=pkg-config \
     TMPDIR="${B}" \
     LIBUNWIND_DIR=${STAGING_EXECPREFIXDIR} \
 '
@@ -287,6 +289,7 @@ do_configure:prepend () {
         sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/perf/Makefile.perf
         sed -i 's,AR = $(CROSS_COMPILE)ar,#AR,' ${S}/tools/perf/Makefile.perf
         sed -i 's,LD = $(CROSS_COMPILE)ld,#LD,' ${S}/tools/perf/Makefile.perf
+        sed -i 's,PKG_CONFIG = $(CROSS_COMPILE)pkg-config,#PKG_CONFIG,' ${S}/tools/perf/Makefile.perf
     fi
     if [ -e "${S}/tools/lib/api/Makefile" ]; then
         sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/lib/api/Makefile
-- 
2.35.3


