Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34801C5B564
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:48:52 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.20278.1700174931591064198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:48:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oveoxqdh;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-543c3756521so1939778a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 14:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174930; x=1700779730; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1IEKX7nVreq8WegwxeTm8fVYJPSk3MZgy3l7E/C6GQ=;
        b=Oveoxqdhqajqd/Pgda/wHCMpM6ev9CCN4m0mfBzC2XPsLTpxyHWa6dmq4YHNL2uNe9
         0N2FExYU6BDBEquLmFaNvjOgUNBab0OFbHZ2szZqvpp4Qp52HthiAx4EYq/OGQ4HfSAO
         rPJpXiEzuIkUoIjjRFG9MrXiPnhkhAH0zXnJss9/qTY2wu+IlbL0k8LqfWiExcHV6DpX
         H9B5c/tOKxikwDpdxeS5t+DWUcqF/5+aCRIUVM0zDzDesa814rivRHkU210Awh8fKv6Q
         vtCpU3QcMGxPkMHBXDdSVXHdouZYieu8AV0DVz+t6yKGv0bwbq7aisiQSF6FAUDXLQHo
         cG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174930; x=1700779730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1IEKX7nVreq8WegwxeTm8fVYJPSk3MZgy3l7E/C6GQ=;
        b=Kcir8Vjj126BAjbNzZFKo8J0sdfHDiCd7YsmcO4+Y7bBNPUZsUFAJNuA8TeVpzGQMp
         sEvWpeXn5oN2ZEr+Z9Sex/si8LzwMpB1Y/XyVLcUXXfr7afz2t7UXpgOo1LtA1VEDRw3
         VSGJVtHMnehpeAROYh6A5B6TG52KpXWYQvzY1oyiRQbRcrs8Q94obpEkWBLwGjL7dZMb
         nqjPRapk3mJ86+hanY0CSEVvj80w7CXtrZ6peBFcXlo4F1erQgDw2B3WXceY7T7ZOC2O
         Geg2oRYMkYjx2aoJATHE0MN6gZ8dvTfuDoatNTmrkEynPdai8nyRMG/WQYvfSgKdFg4I
         jG8g==
X-Gm-Message-State: AOJu0YwII1FsmlnMHK+hjDsfHEyhIyKdt6CyyD+Mf1XDJrMf7jfj9DQ5
	+rAec9H2+IWa/vfv391FaW/W8HnSBIE=
X-Google-Smtp-Source: AGHT+IGsbXzFES3p5ZUCfqV1l3C79Use3ayoDoOBDnwIlZgGYQiRu4Ki5hiBNLBV43mlMqerEX2XWQ==
X-Received: by 2002:a17:906:40c1:b0:9e4:67f7:aa04 with SMTP id a1-20020a17090640c100b009e467f7aa04mr2712664ejk.58.1700174930107;
        Thu, 16 Nov 2023 14:48:50 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y6-20020a17090668c600b009a1be9c29d7sm120605ejr.179.2023.11.16.14.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:48:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2 12/12] igt-gpu-tools: drop PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 23:48:36 +0100
Message-ID: <20231116224836.2696913-12-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116224836.2696913-1-martin.jansa@gmail.com>
References: <20231116224836.2696913-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 22:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190826

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
index 529b374c7d..90cd09ea70 100644
--- a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
+++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
@@ -24,7 +24,7 @@ PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
 
 PACKAGECONFIG[chamelium] = "-Dchamelium=enabled,-Dchamelium=disabled,gsl xmlrpc-c"
 
-EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dsrcdir=/usr/src/debug/${PN}/${PV}-${PR}/git/ -Dversion_hash=${PV}"
+EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dsrcdir=${TARGET_DBGSRC_DIR}/git/ -Dversion_hash=${PV}"
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
 COMPATIBLE_HOST:libc-musl:class-target = "null"
 SECURITY_LDFLAGS = "${SECURITY_X_LDFLAGS}"
-- 
2.42.1


