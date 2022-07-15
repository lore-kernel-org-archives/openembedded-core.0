Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65EA4C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 11:08:35 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.5245.1657883311216085355
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fo96PwX4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id d16so6256887wrv.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p2icZ5HOUuDXcuv8tBWR0p+Bz4QaJoUf1Zmty1+v/So=;
        b=Fo96PwX4unXUDTtW1e3mvivL+KQmYWJ7+Bn6LX6QZnjKsasiJrWEc9GeXXnmYTKITW
         IlDrUic+Q9mmZEDU4neh/6IE/XYh4Q/Qpsr093DmIhhvgM5LBR4XQs3HHW5GJ1J1aurz
         /LaCppBsri8+R25M9rAmcq1bK1u8X+smuzg1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p2icZ5HOUuDXcuv8tBWR0p+Bz4QaJoUf1Zmty1+v/So=;
        b=RmUxtFTgDNFjnpf2BMTsLpAjKpqGnAqpcHMDubEjvdpoRy29Fh4lpv38NeiDiJopJ6
         Du8wgxe6tnI7RmEUf8+ccl+tGW8K+wZBAUhi+3+JyDnoOMH8ghHRoA0wmugJ6Vs+iavG
         9MPnN9/XUNXSg2n8w681hbEHPbW9850c5v93Wqj+6fOTmVfyw8SBe1UbvQc2jIyfIX3r
         eQXRhiIQ7qAIszgt78kqbDH6J1pNYLATUnFUkdeBBya0H/HL2heYlo/sH7S3s4OYkRN7
         sHux4xuD99cYSjZ7zr19GaqdU/RhBK2hSDMr4G7IETs25q5rqEIxPJI27nxmLiGkxSrL
         2MAQ==
X-Gm-Message-State: AJIora/2hWCgdSP40AF8J9cr0C13zteI6V90Cck9BB+Ne8DGfjA/Kbl8
	+oVaxTrMVAdv8UGn4OT+q4FFq4j14+StYg==
X-Google-Smtp-Source: 
 AGRyM1uD2sjal6a9FiHwt/sA/XBgupxN7R3wwhNWaD5pC3r20LBJ9LXhxjz24odz/SXs+XRF1OhDvg==
X-Received: by 2002:adf:d1c8:0:b0:21d:a082:9290 with SMTP id
 b8-20020adfd1c8000000b0021da0829290mr12574513wrd.246.1657883309138;
        Fri, 15 Jul 2022 04:08:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ef6a:f831:81f1:d696])
        by smtp.gmail.com with ESMTPSA id
 ay13-20020a5d6f0d000000b0021d6ef34b2asm3839190wrb.51.2022.07.15.04.08.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 04:08:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc-runtime: Fix missing MLPREFIX in debug mappings
Date: Fri, 15 Jul 2022 12:08:27 +0100
Message-Id: <20220715110827.633615-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 11:08:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168056

This fixes reproducibility issues with multilibs were a different recipe
specific sysroot is used which was leaking into debug symbols in libraries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 7e920df2d34..5d74e4494d1 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -53,7 +53,7 @@ RUNTIMETARGET:libc-newlib = "libstdc++-v3"
 REL_S = "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
 
 DEBUG_PREFIX_MAP:class-target = " \
-   -fdebug-prefix-map=${WORKDIR}/recipe-sysroot= \
+   -fdebug-prefix-map=${WORKDIR}/${MLPREFIX}recipe-sysroot= \
    -fdebug-prefix-map=${WORKDIR}/recipe-sysroot-native= \
    -fdebug-prefix-map=${S}=${REL_S} \
    -fdebug-prefix-map=${S}/include=${REL_S}/libstdc++-v3/../include \
-- 
2.34.1


