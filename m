Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF8DC54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 22:48:51 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.20272.1700174926179959793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 14:48:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g0pkQav9;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9f27af23441so189286966b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 14:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174924; x=1700779724; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8Si5arUcqikDpmmQoApc/b/zKekCni8UtksjwpSviM=;
        b=g0pkQav9X5rkpOwrPp5+UxTzNBB/FetQgUlu2hNu/paRNzX2QWpNSeyrd11P5s5E+T
         rftu0W33iav8YiWr2gYW8Imh4ZvpuFo+RgPc4EeSjEDKMPwFgyhn19aB9c+W/ocnKTr4
         xhm/08E6oI3wzd4DFdfch77uePh3LhDrvCYVgl/ZyH/2eePcg05qDbj8VYd/nAgs4aTr
         SxvKia/kM063dPRMLh5o5Csc3o0ClDqHIeXywc2BQIOAb942wRcWsS+97xGwBVGkYFQC
         U6yPPsRonrlDwJ/FyIUQkyp+50bRpVqCqcfy4gYPYnqY4LYgNexioOQBjNKOqPclYWBK
         j6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174924; x=1700779724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8Si5arUcqikDpmmQoApc/b/zKekCni8UtksjwpSviM=;
        b=I3VhtaYXWGaOyO3QXL0AXhYdROLu30k8kJzPlWKQz7/yRTQsYiDtNg4vxqWw7u80Ah
         o4pCW6rHQseLz5mOOJXW81yxGD/sNorL2jOR0N7ZT3R8saEHPLrlxrpTil7+13drMP/K
         8XFU0yP2jeTDi/iP14ZfWFJWCMs5fT31XUKTpH7zXbgqGRr3c1CfFGY63Dh5b15LzCi5
         TAcwCq7vrSYSDC8Jekb+Ah7NExOmLyJsew8U0YV5kWuV/4QtE0N7yAFB3ainJOiQ3V/o
         rdonrtQwAOk6kRpp1Z8Z6g0qRKk0AzSCUWN/IBNPjXwGb776JJzNF5mqXx4WBKeLIllm
         e18w==
X-Gm-Message-State: AOJu0YySepzCVupwF+P4kHU6kmZyRX7b9A3f/Vdbixxvf9Xc14sfLGiR
	waG3e+RyWRB4uusXt4pLk3sbW6HVEjM=
X-Google-Smtp-Source: AGHT+IEzl0+jLl352lzMkxlkvyrB9uQbbuX4AscE5f6AOAHvbwYunmreswMABhgOgZCKiOa+OqU/2g==
X-Received: by 2002:a17:906:3754:b0:9e5:fe54:8539 with SMTP id e20-20020a170906375400b009e5fe548539mr13645652ejc.18.1700174924609;
        Thu, 16 Nov 2023 14:48:44 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cw25-20020a170906c79900b009e6279fc1d6sm128663ejb.40.2023.11.16.14.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:48:44 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2 05/12] libjpeg-turbo: drop PE, PR from /usr/src/debug paths
Date: Thu, 16 Nov 2023 23:48:29 +0100
Message-ID: <20231116224836.2696913-5-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231116224836.2696913-1-martin.jansa@gmail.com>
References: <20231116224836.2696913-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 22:48:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190819

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
index 99ed82dac4..132d4b375a 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
@@ -24,7 +24,7 @@ RCONFLICTS:${PN} += "jpeg"
 
 inherit cmake pkgconfig
 
-export NASMENV = "--reproducible --debug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+export NASMENV = "--reproducible --debug-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR}"
 
 # Add nasm-native dependency consistently for all build arches is hard
 EXTRA_OECMAKE:append:class-native = " -DWITH_SIMD=False"
-- 
2.42.1


