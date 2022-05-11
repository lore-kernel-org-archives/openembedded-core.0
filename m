Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DDAC433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:20:22 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.464.1652293207982169279
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ElgZngIq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d17so2719872plg.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qSn3X8wAA7X38B0UIKHDEQxKETLv2ycXwI0Mc21xjUM=;
        b=ElgZngIqYwL7ycbFkSxr/kvzs0nQV6ockBpB+6/h8O4YNnXSrfjFkgHGum/EaOnb1L
         Ex/UeB8/8GIutJwdoDPmiSmhEAU9NO7F7daAj7QOXVCR1TBSXVVX/3lZctn+X8Uwfaow
         +uQCDuZFeI6rC2xmeOeuOCTli69dIPiS3daH0dfpfczOGgcB9/RkKp9lP4FUS/lBBUta
         hCjv1CgxHYR8YJx0ENIGC3ad4XcuXijPH2soAwRD1YRoSR8NLzZSGqU+kF5sf7oM2QXW
         T2ZMpxPM4zAuq4qJeXUUT/9BR6TJtI9Sb4ETUx5LswoQ5Kc/5HoFKaZaroFv2yl1QmO3
         LpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qSn3X8wAA7X38B0UIKHDEQxKETLv2ycXwI0Mc21xjUM=;
        b=xAVG26TSFw6dUMn/d6H5juJsTPmm92ipMX7SxDuh205G7Xkv1JWb+MyocIs4fseWQg
         DEzCZSt2Zzp0P3xmct623Xn+lxDcQCkoFvHThg1HbXTnAqcyIghP1mlHWXxnl6+DdJ28
         zeWMnrKHGFp1tkCeQzpFXu+8M/ScSa4UAz+m+t+DkL4kCR3ePEmwnHTeHFs/SGrFXh3G
         hGHL6Qside+rhHcEDCbAjIY9+NeQdtKr7v6iYRjOVRibNjEn+7fQP9jViRTmFHn6+YiA
         I7pzYaeQhnJ6iOd2S5eovuuQYYghcLrbbkS7yoQDVgYcSI+S+nqGAXSGNk4tloagFZ5H
         X6Jg==
X-Gm-Message-State: AOAM532mGiw/RyfLq7QKFkFs/DfvT7barmKcksDeyV6aqhhf6Itec7pJ
	DGHfQ62O7GaUR2IzwDMDG7jJlH6YIdZHq0NM
X-Google-Smtp-Source: 
 ABdhPJwYPAGYPQv82tMuRmJkQHcnGwlr89zreSO7XSZ9Y8DUQydpirrUDrjkqV2q6N1PJI+BVHUp+g==
X-Received: by 2002:a17:90b:3506:b0:1dc:72c6:384d with SMTP id
 ls6-20020a17090b350600b001dc72c6384dmr6630728pjb.137.1652293217843;
        Wed, 11 May 2022 11:20:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b0050dc76281bbsm2126132pfo.149.2022.05.11.11.20.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:20:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/14] volatile-binds: Change DefaultDependencies
 from false to no
Date: Wed, 11 May 2022 08:19:29 -1000
Message-Id: 
 <00db62342e67b916213c3b54db23c8090621462f.1652292852.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652292852.git.steve@sakoman.com>
References: <cover.1652292852.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 18:20:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165516

From: Portia <stephensportia@gmail.com>

The systemd-unit parameter DefaultDependencies changed from true/false
to yes/no. This changed in systemd in v242.

Signed-off-by: Portia Stephens <stephensportia@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit add4dcb03dc7b034253db05f0023cb97cab8b26d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 9da23a2b912edd043037a8e2e1047f7f3ba6886a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-core/volatile-binds/files/volatile-binds.service.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
index b23355a714..4b34ebd12d 100644
--- a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
+++ b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
@@ -1,6 +1,6 @@
 [Unit]
 Description=Bind mount volatile @where@
-DefaultDependencies=false
+DefaultDependencies=no
 Before=local-fs.target
 RequiresMountsFor=@whatparent@ @whereparent@
 ConditionPathIsReadWrite=@whatparent@
-- 
2.25.1


