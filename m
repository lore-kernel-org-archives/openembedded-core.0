Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B378C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 15:51:48 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.12370.1664898699848282184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ejeO5IEm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id gf8so10667410pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 08:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=SWZc3FPqlz9i7VoVKJGuM5u18t7XIBQ1nSTMAZalQeM=;
        b=ejeO5IEm5cU9Xt130ELk6MFfdwortXqibNxbnY51VF/8EDdzscRgi7w8HdBoszEFkX
         XiYAuRd2Sk11XGqCiXUo//ss94R5QHOIzOKcXCZwU6nQkCYLRbbcdPx5dovNx2H7ijrh
         8GleE7bazC73AoNYuVS6znsR+5BsdtMuftu5w3OrUEUqnL+6TDdcAeMp7ICoP2oY9ePn
         csdY5M2fwFN+9Vp9JuQdw0eC/aODHuYs4M68O402pGZBE2z3c1Uhmqfb7DnZ1pucLNwL
         Xb3uVSb0h0tNohOcYYds2Y+B2+9rbIeaC+nbGlK1A05JqyN+1FhzHr8eYi1L41kWZygX
         agHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=SWZc3FPqlz9i7VoVKJGuM5u18t7XIBQ1nSTMAZalQeM=;
        b=XU2xWoH4ejI6XfPkQy9F4j5lGZ+b9ldl+SURurDQUFrwspT5ZWWxQPQd/95VgVwig5
         Lq+NZqQ1C/9fTxgZJSjUmC763cOK8LC0I4UZarNlgADTFLOHmNj7daFtwAbTMRc5mtSZ
         yKeS3lffBuQd+BJhFy9x3VbpQlYkFODCjwxExAiMY2F1atWhtIjXBX+pgkiSmmzjSan0
         mYWSgXkJsEvy7JKzeKOiAGID+cHfAWKtA9QlwMzgtX7Z6TqFcggEDTApL5wE00HuyLg0
         FGVVkkQNeiZa2ZjgPhV82WfEbvcMzKav3vzW/+Mui2hhSxmUnxFzpHbn1mVn1p0QXfcC
         NXRw==
X-Gm-Message-State: ACrzQf1ZVvmBParhib5mt2h9uEpuv18ISDKOylCqR4DrtwAxgjf8eB+V
	w4diRFgD92HSeXasOZjm+xA6KPs/5f+acF5K
X-Google-Smtp-Source: 
 AMsMyM4v5VIwxDdchg8qj069D056z0tKeS7NYPcWp12RODn48Goe21CvMljrgaVqVnDvDiqFmegCEQ==
X-Received: by 2002:a17:903:2615:b0:17f:6590:7fbd with SMTP id
 jd21-20020a170903261500b0017f65907fbdmr7869769plb.101.1664898698959;
        Tue, 04 Oct 2022 08:51:38 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a2-20020aa78e82000000b00561642b6903sm4464266pfr.120.2022.10.04.08.51.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 08:51:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/18] lttng-tools: Disable on riscv32
Date: Tue,  4 Oct 2022 05:50:44 -1000
Message-Id: 
 <b1883d725e2ee833b6bcbc2036df8c8287bed547.1664898546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664898546.git.steve@sakoman.com>
References: <cover.1664898546.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 15:51:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171422

From: He Zhe <zhe.he@windriver.com>

As a bunch of other assignments did, let this cover all riscv32 architectures,
not just qemuriscv32.

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 976fe5e3fb630e9daf5bbde79ee2148a7a97694a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/lttng/lttng-platforms.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-platforms.inc b/meta/recipes-kernel/lttng/lttng-platforms.inc
index 98b13b194c..900e36df82 100644
--- a/meta/recipes-kernel/lttng/lttng-platforms.inc
+++ b/meta/recipes-kernel/lttng/lttng-platforms.inc
@@ -18,4 +18,4 @@ COMPATIBLE_HOST:arc:pn-lttng-ust = "null"
 # Whether the platform supports lttng-tools
 # lttng-tools requires SYS_ppoll and SYS_pselect6 which are not supported on riscv32.
 # It's also turned off for riscv32 in meta-riscv. See https://github.com/riscv/meta-riscv/blob/master/conf/layer.conf
-COMPATIBLE_HOST:qemuriscv32:pn-lttng-tools = "null"
+COMPATIBLE_HOST:riscv32:pn-lttng-tools = "null"
-- 
2.25.1


