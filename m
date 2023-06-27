Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048E7EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:34:56 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.7703.1687851291785530525
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iIUH0C5T;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b7f92b764dso10852215ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 00:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687851291; x=1690443291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LjGMQXBRPkXLAIYuW+xoJYj/PKspDgXpQKsC0Vr4ShU=;
        b=iIUH0C5Ta7G/6/wmacDtfZdVWdcHn0Se3rjTGS/q33I6cW+VtPsSO/X/3JGZXkZdgA
         PCaODyyXG/srzSDJtN8vAIGnKRb4Vxg27aY+nJ1AJl08YQTKj9ch8MFdao1swRrDvi7G
         YYfsZhB+n6AIxmrSBv49+4/zOrGGWE2JHH3cidW7CS7b3VThbdd0rN7MT94cVLYwL4ml
         gk/WzAr8hZNAPmhIHYRtmx1Ox6PZvCZ+fs/iEejBXRACRU6DxXpfUVDD/t769tRbSI2i
         UP0F62UbKP6EAmME8lQkcdDOZm46asu5CfsiqTCbFdKyjRd9+YXHPls+lcNkotyh4m5H
         gIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687851291; x=1690443291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjGMQXBRPkXLAIYuW+xoJYj/PKspDgXpQKsC0Vr4ShU=;
        b=BLtRMx6JWol6r+QCFq+fHn81Nyr/uld2khgWvmlYckY9UiCedsZDQQgssF7WEDPCj3
         o5+UyyEK/weL/H/fSJeSsEl3SU9vomyhIWD7lDGREj572jh5dFAHBveyKdy0yZXdBJN1
         +advepvE9CGpvt1Y6Mz7a6KKaVh0UqpesNfhz2+DSPDZ1Ox0PaYlycjD4N7Wz5pYpNjg
         oiKe6DOyIunrrcW2xrdikU2uxOVrlrXV0LuN0pRkBGOnIXDeXRlvYmSYn27IuNfVarTh
         uPL2vBFmpuxXMVcbYfHyKzzOGTXexLDYdhb18PSGssIvIB5L9sxMXT1h3U+AnnsN9mfb
         745Q==
X-Gm-Message-State: AC+VfDyZLft7iZpa5qU3ep/vMuCBHT/F2z2Jdjy1LETHqwNcIpRzhP5t
	D3w1MyVOv7RfcT2ixyw9pam9AuXYNG8=
X-Google-Smtp-Source: ACHHUZ4uYOVsQloLL5SScHpOz5TgCpCrtNCJMs40RpC5pxwwGoh85IIKtxe9mN+i7P6tMp7XCcQrBQ==
X-Received: by 2002:a17:902:8ec9:b0:1b1:753a:49ce with SMTP id x9-20020a1709028ec900b001b1753a49cemr5253122plo.53.1687851290801;
        Tue, 27 Jun 2023 00:34:50 -0700 (PDT)
Received: from localhost.localdomain ([223.233.81.169])
        by smtp.gmail.com with ESMTPSA id f3-20020a170902860300b0019f3cc463absm5360341plo.0.2023.06.27.00.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 00:34:50 -0700 (PDT)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-core@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][dunfell][PATCH] ninja: Whitelist CVE-2021-4336, wrong ninja
Date: Tue, 27 Jun 2023 13:04:28 +0530
Message-Id: <20230627073428.23120-1-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183476

From: Ross Burton <ross.burton@arm.com>

(From OE-Core rev: c2dd2c13ff26c3f046e35a2f6b8afeb099ef422a)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a106486ad7900924a87c5869702903204a35b54)
Signed-off-by: virendra thakur <virendrak@kpit.com>
---
 meta/recipes-devtools/ninja/ninja_1.10.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/ninja/ninja_1.10.0.bb b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
index ae3f3f1ea8..755b73a173 100644
--- a/meta/recipes-devtools/ninja/ninja_1.10.0.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.10.0.bb
@@ -29,3 +29,6 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# This is a different Ninja
+CVE_CHECK_WHITELIST += "CVE-2021-4336"
-- 
2.25.1


