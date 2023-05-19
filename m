Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB34C77B7A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 09:58:17 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.21962.1684490295119664127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 02:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TZsznH4O;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-510eb3dbaaeso2656339a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 02:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684490293; x=1687082293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M/BBRN5QV8Ck3YxX3B+isWig5WxfttEgE2Z5RrBj5w4=;
        b=TZsznH4O+lmsIf/esU8hRPYEyhy5BC1tkNSjEOxa9u2XMLlWSZ14dWx/by1JgyasvI
         jgKp/Fv2Py52Pb8l6WcyeAyvem7sDeMk6HGnqJ//lG/xw994rLR74Q9yRLh06nfCrKqq
         rfM9bG8m3eyAyfKwJ2pdmjKNZhkUfsj8v0OCVSRDxCGDvS4zl7M9ADAiZtsaRNk8VGc8
         I8hDoLznHVxPu25EqbtVFycu7tdvpuud2RZTDrKuwRdQ5aMhPDHVKnXdUFtKu3yAvmSd
         kW21jfleraExCOlZhxZRATY3ksLu9Sg4JFE596tY0O1M1cr8Cu0bP6b+Ve5Ff60yKGj5
         3llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684490293; x=1687082293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/BBRN5QV8Ck3YxX3B+isWig5WxfttEgE2Z5RrBj5w4=;
        b=NgHQQaL3vePeb5/M/WH5faavANksokFDpA7+WxNd/JttP6dYQR+mbIqN760x5GM0cs
         Y7y5EsnimU/ZjXibzs3mmUcrNGghEmVwnbxTfLot2nwx2S6TjhAYN2sn8goW4cu8lX6H
         Fe5w0N+RC1PropUTXE1tkYHmqzw5Qfr2zi/IMMJVK0r63KMM5UAmDQEQgBtehwoGHaDm
         5RVK/fTsa2e77rZD3U874RYZ5NPEDyLe1egYwxX8DeilEWppru5IGpUoYoS2ZUktYmLj
         2ijkYWIfaPWbIQMzCwXx9NqXrATEy8gRgl4VNGZXSCvHB8IXCwD1qcb+QxxKgUokXqH5
         JkYg==
X-Gm-Message-State: AC+VfDy/u6l/wk6qG5ieseyz5HAUk8tQPz0Nqqg27YbJGAilDaJP5y9n
	5QBVGg4ji31AQ9R/+UYTYtulE0/N20U=
X-Google-Smtp-Source: ACHHUZ4JLNyHHSq2Zz9Nj2HY2PvdYtIPcsvMTgsQ/CAPlP3YoRdpKZ98iheBs1UUq1r8bLY7dGAQVg==
X-Received: by 2002:a17:906:6a28:b0:96f:608c:5bdf with SMTP id qw40-20020a1709066a2800b0096f608c5bdfmr1403662ejc.64.1684490293079;
        Fri, 19 May 2023 02:58:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w3-20020a170906d20300b0094ee700d8e4sm2077646ejz.44.2023.05.19.02.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 02:58:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 1/3] gdb: package python support separately
Date: Fri, 19 May 2023 11:58:09 +0200
Message-Id: <20230519095811.1387602-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 09:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181543

This avoids pulling in the whole python stack if only
the main package is installed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 9db61b785f3..d03f744a845 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -33,13 +33,17 @@ EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
 PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
 # Use --without-system-readline to compile with readline 5.
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
-PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3 python3-codecs"
+PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3"
 PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
 # ncurses is already a hard DEPENDS, but would be added here if it weren't
 PACKAGECONFIG[tui] = "--enable-tui,--disable-tui"
 PACKAGECONFIG[xz] = "--with-lzma --with-liblzma-prefix=${STAGING_DIR_HOST},--without-lzma,xz"
 PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils"
 
+PACKAGES =+ "${PN}-python"
+RDEPENDS:${PN}-python = "python3 python3-codecs"
+FILES:${PN}-python = "${datadir}/gdb/python/"
+
 GDBPROPREFIX = "--program-prefix=''"
 
 DISABLE_STATIC = ""
-- 
2.30.2


