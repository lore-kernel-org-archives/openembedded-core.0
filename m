Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66200C433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 00:10:22 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.1143.1646439021437893554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 16:10:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KvhMNmbe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id u1so14803034wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 16:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rbxsYYTzHIZ66K2m/HEFm/Z6JOA3yztgPg/SOG0pQsM=;
        b=KvhMNmbeGmY4DQvOtUQoXHOP4yGUrv0ZlD8Ff/u0A+YD+wOZPQ4D6O46rMqw7+XbRx
         /Q9vuh1gt0dq2YPNSLsBcb1gRSidsKzc72oSUQUGFNOLue3V1bTn9OA2QqtKRRVo/CaC
         jW7LY9BCGk4ubbcsWrG7fgr8Sc2Bkb7QvVYYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rbxsYYTzHIZ66K2m/HEFm/Z6JOA3yztgPg/SOG0pQsM=;
        b=OMgTbg7/07AK5bq3Laopo+Y/ewwbFgIb3lbASSa7Lh5bhNZ2Rh/es7/6xfOyJDVkun
         F4MRhKL8B2YgtEkq27Tal43um29Y9AsmT9wjRUZ9vScJrip1Ej8lebdxyNBV3IUJyF1z
         ipZaUyRmeODiZXNnfEP4dVIVYSbBw0DbRyw1+BNZy11+QByujP2sHsoThd+K55RQYrzw
         0qkdbC+xAkJ1zWnifrKMA4ugZOnwxOjvp/ftowd6r0UXUGl7szVab40B0OOkU4//BHOQ
         4RXviMcPq2LgN4XRkmuIadCaTKw9doDhGVKXw64rWV46ZHl+FR5SACio9t0kDh5KCWnF
         hFPg==
X-Gm-Message-State: AOAM53071T8jVIlxXYj8Cud4g77R3ywJxvwhT74BvHWWpdO2r6poQtV5
	3cibk7R1Vh8tgB/fip4MopkaFGfgjpJuPM/7
X-Google-Smtp-Source: 
 ABdhPJyXrOiuh65WiaGKbqq4F95yNR6sc7FBBWdI3lhms99PPMl0iOqztLguEy3BLi5SwBNjopnEfQ==
X-Received: by 2002:a05:6000:144a:b0:1ef:d316:aa3c with SMTP id
 v10-20020a056000144a00b001efd316aa3cmr750740wrx.602.1646439019419;
        Fri, 04 Mar 2022 16:10:19 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:58d2:445e:5b81:1f43])
        by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c3b0500b00380da3ac789sm7388577wms.1.2022.03.04.16.10.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 16:10:18 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] layer.conf: Allow sysroot dependencies on perlcross-native to
 be skipped
Date: Sat,  5 Mar 2022 00:10:17 +0000
Message-Id: <20220305001017.394135-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 00:10:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162762

The only thing which needs perlcross-native will depend upon it directly
so we can optimise this out everywhere else for small space/speed gains.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 935c4f6b9b7..ea57123601c 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -105,6 +105,7 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
     .*->gperf-native \
     .*->gtk-doc-native \
     .*->texinfo-native \
+    .*->perlcross-native \
     libarchive-native->e2fsprogs-native \
 "
 # Nothing needs to depend on libc-initial
-- 
2.32.0


