Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31098C43217
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 16:55:23 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.1045.1668704115521632287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 08:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bU6KOaBy;
 spf=pass (domain: linaro.org, ip: 209.85.219.43, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f43.google.com with SMTP id lf15so1568622qvb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 08:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0l2RdEL2n2ob3kQio41SkgZwPGvE6MCLDUlUn6daJQ=;
        b=bU6KOaByEvYg3OPUMFJ7jqbadsEOWy2NEU6O0bkJBHFHXC2b960iCaRFgm6m15/qJa
         o7Ivj7ZvwzOUeosHQHdQbzraVAq9n8y7URU4QwlXSV6q1rokRjy5/woCaWHxFANtjxaF
         3X9NgFtD43pT3sFsfqyKN5nMHj7nd8baANKqh3dqrHwwjoxEcgs21UteotZPs4BruqMC
         P2liyz1B2ecZmlB1dQ63m4xBnRtbrbUWIyvuZ3b6dlTUqQBodW7KLYbDytZgDoINh/cm
         vse51QM0y6lsIcEpF9HL9MkZE35aOU8Yrl10Y/78H9am2zaKuz7mNvNctC2BxxBvRYJC
         UOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0l2RdEL2n2ob3kQio41SkgZwPGvE6MCLDUlUn6daJQ=;
        b=J8Muq13Qvrwv0QwArXMK/G3FEfapDBN0cg6ylsLAPb1Sof9BHd95stDGksUWn4vH4Q
         QVlpVnpbkgkrlnVPGHebAOprzmsKZW0wxHjSQIzCHvauePqk7BIXwB0yxEStiF0i+BB/
         e9gdM4WEIlJuAaiA4CkhqrND8U2+PEFS99IjojkVWpdqq+K8xl3CaxBbqlNt1NgqACNo
         42gOQjJZ0XAlX1uvs4uTHCAgFh/zY/F9pkzfZn3iSp0SoJYfsrhgOtiSeGC9PPTQNVEf
         xM/1TrkHqkmC2eoTpyDSvGNzLrvM35lY/PjmcWGSpLGe8MTWnZ5MvjcRO2idHTcoRg+J
         lCJA==
X-Gm-Message-State: ANoB5pk8WHId8tYHgKLgmitED2avzX0571cG5i0YwmOwXoeOkvPO3DfH
	E9WMsw5Le3MkI/Apzw/n8x1fEl9qF14DKA==
X-Google-Smtp-Source: AA0mqf6ysrtVHIQfu05+dTM3L1wx3RVCo6LmLq6I0cK3u6VQmgwid2w6XkVvR4+5qdQBK5wNB9jiuw==
X-Received: by 2002:a05:6214:aab:b0:4bb:7313:3859 with SMTP id ew11-20020a0562140aab00b004bb73133859mr3167320qvb.105.1668704114672;
        Thu, 17 Nov 2022 08:55:14 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm785081qkp.74.2022.11.17.08.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 08:55:14 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH 11/11] golang: ignore CVE-2022-30630
Date: Thu, 17 Nov 2022 11:54:56 -0500
Message-Id: <20221117165456.1029099-11-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
References: <20221117165456.1029099-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 16:55:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173444

The CVE is in the io/fs package, which first appeared in go1.16.
Since dunfell is using go1.14, this issue does not apply.

CVE was fixed in fa2d41d0ca736f3ad6b200b2a4e134364e9acc59
Original code in b64202bc29b9c1cf0118878d1c0acc9cdb2308f6

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/recipes-devtools/go/go-1.14.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 4c10104aca..2cd3c9311a 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -72,3 +72,6 @@ CVE_CHECK_WHITELIST += "CVE-2021-33194"
 
 # Issue introduced in go1.16, does not exist in 1.14
 CVE_CHECK_WHITELIST += "CVE-2021-41772"
+
+# Fixes code that was added in go1.16, does not exist in 1.14
+CVE_CHECK_WHITELIST += "CVE-2022-30630"
-- 
2.25.1


