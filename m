Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB541CCA47C
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:39 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.8735.1654338394504867958
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H8mBYQPw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id u8so8953615wrm.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uxoAzAWzIeD1N/+WKmqYtJzw5s+XeUDLvv8m/qLrjfo=;
        b=H8mBYQPwKgHilBoQG+qeyTqLXAxPUhiXHgY9GgYTmaEL0d5vmPGSmWQmpmqC1rU02B
         NIWbx8NAJLYI442xoqdUph0EzZWVZcu8mVcxw1zl/XRXYrNp530n32O2X8L5gWIEmOXh
         7qNHR3tX7OxmoM7IPfrYMkdBVYJpbidVywq1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uxoAzAWzIeD1N/+WKmqYtJzw5s+XeUDLvv8m/qLrjfo=;
        b=W7I6Q0VTjE/aHBWkRtYCCH1AZEE07ow1Y68LgRZXNIFKEPspjrQI741OJg1F4N+1bb
         cmxr3Wwitie6aBB5V9P2ghqk/bxUVw70K+lDV7f99zP3te3OJ8CTV9w+TUxg1wNS4oh/
         r8xir1v6TLXjA+S2AaO4t23vvQT5E5Ru7An9l8tML/QAlbGb6PEaHiT3mKyDSFXz12QP
         NwOpDsncTislbU1xOggjJ6ZGaMXtgnNTsLjErZQjbgaV+vzegi+X9fJuJW8hBX3lYDFc
         qnKVWxxjBCiwp9aypc6Xr0vLEmufku+ifGl47kXrXk77rjP9FBfis50SZSy6FTS10zjC
         LPqA==
X-Gm-Message-State: AOAM530Pfu5Pa/M6MqkA2mgiB2B27NnXa7Uk7bMhXukxqoJaPwwtI9o1
	4S65RoaVWIqiOLWIFVZDCD/E/ygl5PRrHWx1
X-Google-Smtp-Source: 
 ABdhPJx/16YVyGMgj2VXj1A77n3hY2OSHu1cRRLM+JqceUMSBJ8lRLGFyxkhG1FHVhKgVJws1k1+IQ==
X-Received: by 2002:a5d:6488:0:b0:203:b628:70d2 with SMTP id
 o8-20020a5d6488000000b00203b62870d2mr12250628wri.83.1654338392861;
        Sat, 04 Jun 2022 03:26:32 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/17] sysklogd: upgrade 2.3.0 -> 2.4.0
Date: Sat,  4 Jun 2022 11:26:15 +0100
Message-Id: <20220604102625.199845-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
References: <20220604102625.199845-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 10:26:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166553

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../sysklogd/{sysklogd_2.3.0.bb => sysklogd_2.4.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.3.0.bb => sysklogd_2.4.0.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.4.0.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.4.0.bb
index 7043f3d391a..4e6da70e4a5 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.4.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "03c2c9c68d5d02675326527774e7e9cba3490ba0"
+SRCREV = "7dc4783af8e8e0d200d38a87b6a4bc9bbec5ce92"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


