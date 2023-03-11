Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7B1C74A44
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 22:42:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.55879.1678574518565887263
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 14:41:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GE0aFGW6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so5613775wmq.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 14:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678574517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0tgsF6ffO0kvkz2Prq4bEyyOZCTO3/YZVLBOLkOoe3M=;
        b=GE0aFGW6p2+HmcyQUTufym3SjY+gdsXTh/C21VR9x/kDv3GaLbCXz46qhsEqYAxIc0
         LXJjtZKafFYXprW66SjdH4LT3oy0CHI70/cfDg6+8wz1uvdQOG6Dx7RYPpzO0uj2YKmM
         QvzcJlT95rTitSv/+39mPLezlgC4cfV7e28pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678574517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0tgsF6ffO0kvkz2Prq4bEyyOZCTO3/YZVLBOLkOoe3M=;
        b=tot02SKzlM3sGL3Dr4nTC6biZm2i/8bO5N26HyLmd/cucocVj5MtGzDHG1KVl+qczJ
         vDgYJUW9bNRnVh5WALPNbjo5hRSudHjBMK8BbuTsrVHX0vZNnN/72M1wqPwiqxkiL/AX
         azv02S5rqzhNvXNf4x91QQDIgODE+VbbBHqkpG0llJqM1IwmUzmkYO7D9c6TzWuIm6t4
         SSzLupSjzEEfI25pxX+xpG99ggSCjditp8phZDxDWj3h1sxXBU61Rd6tWJ9TcAZxug+i
         jsUVaGTIWKoD2qvJBwfqt/UHtEVRN6iFBFD3n7k4Mh2UpyRCHf14GGv+FBLsDKogbQ0d
         /LoQ==
X-Gm-Message-State: AO0yUKWhjFRF7VIa+6DytW3HA0r2Hu3dr+Cy5+v9c5hEJ1RU4VrVlql2
	A+asTxy+hqODIY6H2q5Eo4DIX5NTVSFjVsRgSZI=
X-Google-Smtp-Source: AK7set99UdGUOLx8xGkjhJ0d5QjYk6SpO8i5/G2GC3IYcNH4ukAMIoea58Ord0/nhQ9r6iag/7nBLQ==
X-Received: by 2002:a05:600c:4f07:b0:3dc:3b29:7a4 with SMTP id l7-20020a05600c4f0700b003dc3b2907a4mr5100396wmq.0.1678574516649;
        Sat, 11 Mar 2023 14:41:56 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003dc5b59ed7asm3933164wmz.11.2023.03.11.14.41.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 14:41:56 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] gettext: Add missing bash ptest dependency
Date: Sat, 11 Mar 2023 22:41:48 +0000
Message-Id: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 22:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178367

Add a dependency on bash to fix execution in minimal images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/gettext/gettext_0.21.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/gettext/gettext_0.21.1.bb b/meta/recipes-core/gettext/gettext_0.21.1.bb
index ec80a89e490..b80ea9276ef 100644
--- a/meta/recipes-core/gettext/gettext_0.21.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.21.1.bb
@@ -182,7 +182,7 @@ do_install_ptest() {
     fi
 }
 
-RDEPENDS:${PN}-ptest += "make xz"
+RDEPENDS:${PN}-ptest += "make xz bash"
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
     glibc-gconv-big5 \
     glibc-charmap-big5 \
-- 
2.38.1


