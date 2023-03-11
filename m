Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA21C76186
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 00:27:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.35792.1678494446862854531
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 16:27:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aoAtEwbb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id k37so4518378wms.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 16:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678494445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pi7T4xkkinsLwYJWVjU9rBo8e9QHEtYalSvxrVxLq9Y=;
        b=aoAtEwbbpkquzAIKoGPfrOv7qvCWVebgXK558RpvOubGsncB7epCunQ6bGOIcuaZjU
         1bNBSPqDnXFTa26FH8bxR2BjIr8sC01ME9waU3PHpV0b9IzleLPrm3IOEOO1xuafP+hB
         Bd2e9MfWo4jnI3/eTGVotmcZUwOJ93fgPTNHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678494445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pi7T4xkkinsLwYJWVjU9rBo8e9QHEtYalSvxrVxLq9Y=;
        b=2mbdYM9Rcr2r8e2K1Y5R8Qul4rsWuPfKKsPM9ZqM3v8UJOv2BIOdtW4rsIfls0AyZm
         m6h4lHXpY85pdDQZtVknArn+sWAySlTHoAUR8SgiGNyymuk6MLfbslC3Fn+Ieabep3HV
         TRiu5tfYErnOL4+6hsevt2CkcJaSVMtqWn417mIRzKj9XGYUFhJX0T/m1/dCBlpW70BR
         I4aNTb28lC6SXSoJMWaw6+BVoiZ2I5XvUtg5061xJyzSD26sD2ELFWfyQNVxyJ2imYCq
         5GtYJlHqpCX561EwsPv/ECdtuYnVhHDjM5NX3oo4HlAbtvQ5HJZFCia/1+ZHDq3rcXZr
         qOuA==
X-Gm-Message-State: AO0yUKXCqQ+y/u1FXc5APNXU2S6sfIcGZxHTdIfME81pqQ5imr80l4qY
	TkShqYGQUoYnJvB+Xkp5sF/lZLYy9bV7Fsa88bw=
X-Google-Smtp-Source: AK7set+iHQEAZotfyZVRQDZQ8do7PKfrv3NKgxZajMdNAXTEFUeItW/MDq07os/CEEvpdnH5JuV9Tg==
X-Received: by 2002:a05:600c:3553:b0:3ea:f6c4:5f2a with SMTP id i19-20020a05600c355300b003eaf6c45f2amr4297853wmq.17.1678494445113;
        Fri, 10 Mar 2023 16:27:25 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d400f000000b002cea299a575sm291736wrp.101.2023.03.10.16.27.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 16:27:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/16] valgrind: Add missing utf-32 gconv dependency for ptests
Date: Sat, 11 Mar 2023 00:27:09 +0000
Message-Id: <20230311002722.3211118-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
References: <20230311002722.3211118-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 00:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178347

Some of the ptests fail in a minimal image. Add the missing gconv
dependency needed to allow those tests to pass.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/valgrind/valgrind_3.20.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
index 701dbf38332..07e50426e44 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
@@ -133,7 +133,7 @@ RDEPENDS:${PN}-ptest += " bash coreutils curl file \
    perl-module-carp perl-module-symbol \
    procps sed ${PN}-dbg ${PN}-src ${TCLIBC}-src gcc-runtime-dbg \
    util-linux-taskset"
-RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils"
+RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-gconv-utf-32"
 
 # One of the tests contains a bogus interpreter path on purpose.
 # Skip file dependency check
-- 
2.38.1


