Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AD8C4167B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:44 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.143580.1671132095288241778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1uOpJDvl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id js9so174576pjb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DKRsJtwV0v+NVcva+4gPktHjYJwGWSmOy4Zn9DlcNo=;
        b=1uOpJDvloKX/vGFJVvNCXuwuqbpgkOcIllH3SEm9/+bv88oSR0BiUwRQ9sKjWjiTJY
         m3qvqF3TP1gvaKDW58ywdaMTZHUlE8weAzDGRZHb/aN++luesQxHz6G06J+pcKJIxQAZ
         0LE0ACJSncE9a7Xc3cxGictyYsWyO6Sn1qaVblUSkAXlHVGrhFVB+T4c5o+aDyUFLvxl
         8ljJTslSU+Iw46lHy5pjXoWjU+m46BaDfRxX5xGRrkI3QPxl+ZfiuVWeeoWfNuBiQFeY
         N+RbCQurlIJKGwjuAtaglj5xhuhjzSzZb7hhnhf0+oC6JPwmpC6yRsaL3GG6PRV1BRTS
         GObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DKRsJtwV0v+NVcva+4gPktHjYJwGWSmOy4Zn9DlcNo=;
        b=4r7MEduMLXQ8WZtetmPWzemwQG2GH/R5y3WacxtquQvgMvwY1/9onGTnMq7RUB/tQX
         7LPJem4evPQJVYlYRinJk0WOCcYxaXFRqiC/N/Eiz3gJsjDDCIvgBV2N3g8yOdAUD9mX
         PwR2or0tdPnvNLdVg99jDrqQS2Rwmg4MlAeqxiv5nEbOMB2n55b09+F0GScHFI6Z/UcY
         l6kw1GZgTdhwC3IRVUEjfhOySgf9QTe9y5PDFGhTyouJmxoQSrT1/0cGQX8HR0d6QUff
         PnwLkwmGyqn+e3AEsCz5Q2L6mjh431bRK2SFbWXiju/pZe4/R7+VwGCfozOqgcHGrZjm
         Utog==
X-Gm-Message-State: ANoB5pksfEEB3WsBBJVpiTIGhDidX7LpJQ/4/pEfIiHIT4xFdNG0yGAb
	/Me7eTjM74ZM5yVAyZjLJ6V+IrG4OXTHStnunus=
X-Google-Smtp-Source: AA0mqf7q/nolApmvJxyaXbpiFLB5tSqalgtU7lfWa2+TBqai/oobs3MMq6ALPv9k8hzoLhRopFeG7Q==
X-Received: by 2002:a05:6a20:9c89:b0:a3:9598:e5c5 with SMTP id mj9-20020a056a209c8900b000a39598e5c5mr34209341pzb.35.1671132094183;
        Thu, 15 Dec 2022 11:21:34 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 19/30] lsof: add update-alternatives logic
Date: Thu, 15 Dec 2022 09:20:43 -1000
Message-Id: <3217ea61a1721df1b26f6e0695f03a50f21ebac8.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174611

From: Alex Stewart <alex.stewart@ni.com>

Some distributions (NI LinuxRT) provide both busybox-lsof and
full-featured lsof implementations. When users install the full-featured
lsof package, the full-binary fails to replace the bbox-binary in PATH,
because `lsof` contains no update-alternatives logic.

Inherit the update-alternatives bbclass and assert that the
full-featured lsof package has higher priority than the busybox
implementation.

Co-Authored-By: Kyle Roeschley <kyle.roeschley@ni.com>
Signed-off-by: Alex Stewart <alex.stewart@ni.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit e2893fa692a6e91eee09fc04c8c03fe27c718a58)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/lsof/lsof_4.95.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-extended/lsof/lsof_4.95.0.bb b/meta/recipes-extended/lsof/lsof_4.95.0.bb
index f380de0b6b..80128369ec 100644
--- a/meta/recipes-extended/lsof/lsof_4.95.0.bb
+++ b/meta/recipes-extended/lsof/lsof_4.95.0.bb
@@ -19,6 +19,15 @@ SRCREV = "67d8c828e7bdc01ba93f8ff79765dd424da0c9d7"
 
 S = "${WORKDIR}/git"
 
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "lsof"
+ALTERNATIVE_LINK_NAME[lsof] = "${sbindir}/lsof"
+# Make our priority higher than busybox
+ALTERNATIVE_PRIORITY = "100"
+
+
 export LSOF_INCLUDE = "${STAGING_INCDIR}"
 
 do_configure () {
-- 
2.25.1


