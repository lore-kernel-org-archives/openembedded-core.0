Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEBFC7EE26
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:34 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.30325.1683300033434856161
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=wsDF2Jff;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-64384274895so1448793b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300032; x=1685892032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGiU7/1HRHbLrbwnuV1Kq6LH3G1mc5R4QJ+FAJCLBWE=;
        b=wsDF2JffjAzo3xAGI3BP+CcQT3R26+APM/ohs+6jhYMQVdtFqUHCkP0kr1ve6PujQc
         u7aIceKARamxd11zX5DyObDpUa4lMhTgMqcSmYATuUCk6P84KfaYhwWfEgvGyPvfwAnF
         nbRm3qbhkhPw3S7Nd9lpX2s0xboSAj2aBsF3LGPiYnuWMI+SZ/eFi7p9CqXSsbq+tkxW
         eUV0l3mvHjEu9Jk/JDlPEtJ57kkZvw8dHreG+5t4esg/JiWRhIf0WYGhl+VGnWsCxVdD
         KycgJSIUmXhXtrBMDRn5GAfIMDnVWlW/jsIeOoXkQ7I0tUZaThqJYS2sw30ad/BpaSSr
         2+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300032; x=1685892032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGiU7/1HRHbLrbwnuV1Kq6LH3G1mc5R4QJ+FAJCLBWE=;
        b=K4ZXqUFpiaGzv+/3o77k4et167bWsd6Q+kKByUpercien+wihLJJKnVAoCHkBVTs+o
         Eo5e7eWeuG9onX2gGsYzTDnqIx3nPWaAYw3WVT57tX0sVMv3Yik18zEzBFFqouAv2XPV
         gNq6rVjxVx/qxYZ6SYcX76gze0mcotQ1GkBTJQMpisHSWNs8JP30f5WUzEc1FCGBw4rD
         3sWl7kY0qgZ/Ygn32PMDAKbaoNKSkdD69DaeWXMie3YghvmXQyX0o8QnWqd5ZJK5zSBV
         PxhkEuAmXbsmBBKcYTDkMiJTCbCunIHVThbXRKG2/l0eeHO33b7vRgNd9FdXbrB0ZOVh
         8eQw==
X-Gm-Message-State: AC+VfDzBfQ3aaewdYf05rG6pMrd+Mon483GDsNndSax7ntrerJIMBt8F
	imTpvFR1C4+7xIvmdyqvJPDN0hDaqfcuuAHhgMI=
X-Google-Smtp-Source: ACHHUZ4e/ywh08jvG2/7wqFdWwT+HCaFBNgWI8PwCiudxyyQUUvpHenjf7fOJtuy/H6tENR2pG/Iig==
X-Received: by 2002:a05:6a21:587:b0:f8:8879:747e with SMTP id lw7-20020a056a21058700b000f88879747emr1976668pzb.59.1683300032460;
        Fri, 05 May 2023 08:20:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/35] texinfo: upgrade 7.0.2 -> 7.0.3
Date: Fri,  5 May 2023 05:19:28 -1000
Message-Id: <62eb0b5a7393d6192a309c1d309e9b22bc652be7.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180937

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* texi2any
  . fix performance regression when Perl binary extension (XS) modules
    are not being used (e.g. with TEXINFO_XS=omit)

* info
  . further fix of recoding of UTF-8 files to ASCII to avoid text
    disappearing from nodes
  . avoid possible freeze at start of a file with '-v nodeline=pointers'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 87bb580f6a02468d372254480302a60faa965131)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../texinfo/{texinfo_7.0.2.bb => texinfo_7.0.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/texinfo/{texinfo_7.0.2.bb => texinfo_7.0.3.bb} (97%)

diff --git a/meta/recipes-extended/texinfo/texinfo_7.0.2.bb b/meta/recipes-extended/texinfo/texinfo_7.0.3.bb
similarity index 97%
rename from meta/recipes-extended/texinfo/texinfo_7.0.2.bb
rename to meta/recipes-extended/texinfo/texinfo_7.0.3.bb
index da455df4bb..b149177b72 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.0.2.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.0.3.bb
@@ -35,7 +35,7 @@ SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            ${TARGET_PATCH} \
            "
 
-SRC_URI[sha256sum] = "a9c646bc4f6bb31843f129f8408a3a627334575faf7b22ebc416be5cb1570553"
+SRC_URI[sha256sum] = "3cc5706fb086b895e1dc2b407aade9f95a3a233ff856273e2b659b089f117683"
 
 tex_texinfo = "texmf/tex/texinfo"
 
-- 
2.34.1


