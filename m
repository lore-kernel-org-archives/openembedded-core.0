Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26200C46467
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:58:25 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.15129.1671202697712081318
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lt8YGwwQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d7so2540724pll.9
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozumjGNh/K0l7v4DraZEN9r6poZs3YJzXZMGihHpCXI=;
        b=lt8YGwwQZvzxy8qdTDGM84nhWYUnG2u1Oy1lK5icVSdmPhn72lVKwsGa2WrW52F87t
         YaUTd7A8HG8Q2qbtK9XoWbS1W2EhUx/0Rbuhs4gDSeWh6QVPeMGc5MPzgiFl9WFdcFVe
         6UNMG1P4SMfDEnCMtjzSBjGmB1rJNnA0fTBgZF9LxRRipJ9csGH4DHXfkzVuw/hYgrKu
         yD7GzBdJ0T8gwrxSJBBsULc5QuJCjo6H+5M97kkc9v7B/bQwjJ33grqfaEcaxkJTxFvs
         R1mAvJY++5qcA/6f0UnVTw9ke0bhNM6rDfr/XIxTOeSaKcxAxkfqh0lUAK1rC9Ux+IjQ
         DKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozumjGNh/K0l7v4DraZEN9r6poZs3YJzXZMGihHpCXI=;
        b=xLujnLiiEfgb6DcaNLMP9Ip39UNJM+AStSlnMWWpbGm5pPlfel3DkmHo0PXLg0siQ+
         J6g3K5CtGb3mFXMDeSpwggGBYZg7eYuZwNCLRukA43lBWS1EVafsprK/HuMF3Muz1lza
         afCPhQRomohZJw+xJJ9UB4PB0lytcrN7thwl4tHGhyhsPDooI2X0e5oD/gf9Ixn/XPLg
         BFxupBgs3eMWnv+Unb/ewREWHZGRcnAikPTBTumAru3JWDzYcE3gGF/XJKjYDO+vFeaN
         JxVxEvwdUiebRg6rg3jb1yV2lxtG0SbpgsKMA5+3dILYLCx4LQvg62xzgo25b/L5NjcO
         rUAw==
X-Gm-Message-State: ANoB5pl4s97rP+dEA+iXSzR/8kc4a5/uCnUO/eGFHoJtPgLJHJOySq5C
	wIWIw1xRmjdz5QFgmr04Q7jHHjylEocVd4TQA58=
X-Google-Smtp-Source: AA0mqf7snLlNGhoSbZd4tgXsEcfwndsFwX3E4SCsD3uoYH8/P9B/0PsNqR03Gmdxm5C/aoLet5/tkA==
X-Received: by 2002:a17:90a:ea09:b0:219:8d8a:a608 with SMTP id w9-20020a17090aea0900b002198d8aa608mr33893596pjy.43.1671202696710;
        Fri, 16 Dec 2022 06:58:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r21-20020a17090b051500b00219eefe47c7sm1482230pjz.47.2022.12.16.06.58.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:58:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/13] vim: upgrade 9.0.0820 -> 9.0.0947
Date: Fri, 16 Dec 2022 04:57:48 -1000
Message-Id: <64c323a444f43a7c7b3390720c4d1eafa3b982ac.1671202568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671202568.git.steve@sakoman.com>
References: <cover.1671202568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174753

From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>

Includes fixes for CVE-2022-4141
https://nvd.nist.gov/vuln/detail/CVE-2022-4141

For a short list of important changes, see:
https://www.arp242.net/vimlog/

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 160f459febc7fb36cc0fe85c63eb26780ace3bfd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 262c97bf0f..1e5ef1c811 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0820"
-SRCREV = "03d6e6f42b0deeb02d52c8a48c14abe431370c1c"
+PV .= ".0947"
+SRCREV = "cc762a48d42b579fb7bdec2c614636b830342dd5"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


