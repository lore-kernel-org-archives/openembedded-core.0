Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791CCC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 12:32:26 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.6284.1637152344995410183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R9Xq2MBR;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id y12so10278119eda.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 04:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pyzkaXBP/eWJQN5jFmoYaNHYtxCigdby3FVDSFZzywk=;
        b=R9Xq2MBRTOHerZZa/aV+WnKsk3TbviwjhxV8mipFgTnVIDYGj55/KXELRxwvIDdScN
         sBmYqxP+wXt+Ei3iRxgg6YjiJJGLAJ9FG6+tHZiwDMaMAGkLWioqmcZ+52PsClBGPtNM
         JeLNUXIR5TuxM+umwFljTwZF9nTu8B6Cgg+fHQwntwXU16fDVGNztDnQCWbNezeHI46b
         lXXWa8jVKZGHPWXeQ8Q2jnkxdN0BUfMHxAe7r9CI7bcKEPSBRLurwmbKLvkMLtf2cuqm
         DkUoK5Rn6386fAW4/rPoO32hK9YWYWh+N6zbpycvwbyP6PrACqdoaOAahSJMyxYhO2aF
         WC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pyzkaXBP/eWJQN5jFmoYaNHYtxCigdby3FVDSFZzywk=;
        b=VJwxIAVJkMvSbCZecoVPjmi+E8oGSn9zvK54K5J9HDwM0Fval2Sm41bbIcxepanfg/
         o3jLK6BqpCIfka0fFgWbSSwqdva7aOayNACwQ8ZcnVcaVqPu4QZLPH0uyVmTn1vOqEP3
         nC+8Ss9EivJWsn7jfVKkUIkNBrMG94WfsdDh2QU6PFtyHOKNE+1A+By0JBEhv9MS1n7I
         rX/RT/O3Wc9mX+TWA5Asq2Yo3fXTWHBwECgs0WhOBwgF0Ed7F7B7+G4fU1exVo37KnGS
         RHpytZgA+zI5mDOMrI4aAcvlkDqnXporf2Q0Rad7hSQ2o8qMhjJiJeW8kYGirbCMje9w
         Tk6A==
X-Gm-Message-State: AOAM531uWdNm+pxVLqYsgE2dHPNUUADtsG/uou4XptXcrjJZxYZQHY9p
	Lz6CEXvcNeU4wtTrX0YRxuHRgQcTlAckIg==
X-Google-Smtp-Source: 
 ABdhPJwtLuSq/ZVcvlORpetSsVzXnyDNy3gO/E4o191srEJnZNyf2z1p8kOP1gk/zezhTFZsXEqCDQ==
X-Received: by 2002:aa7:c783:: with SMTP id n3mr21609311eds.121.1637152343181;
        Wed, 17 Nov 2021 04:32:23 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 e15sm7854144edq.46.2021.11.17.04.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 04:32:22 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH 5/8] volatile-binds: add nativesdk
Date: Wed, 17 Nov 2021 12:31:58 +0000
Message-Id: <20211117123201.111905-6-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117123201.111905-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 12:32:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158389

From: Luca Boccassi <luca.boccassi@microsoft.com>

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index 66e28f4fc9..0f27353031 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -84,3 +84,5 @@ do_install[dirs] = "${WORKDIR}"
 do_install_append_class-nativesdk () {
     rm -rf ${D}/var
 }
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.30.2


