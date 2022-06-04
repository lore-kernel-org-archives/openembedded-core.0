Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC880CCA485
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 10:26:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.8746.1654338390176030581
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PE4cdxI1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 n124-20020a1c2782000000b003972dfca96cso5447066wmn.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 03:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5vKWe8o7SX6Vr8T4eIXZy7ArXnBj6GjW8SN5H5HFYo0=;
        b=PE4cdxI1+CxpuMjp9XffE8MjsdLf9rBCw8s1LxcWirgsdy8lbSAoGM+L1iLMGGvEZg
         JfFogpJTAarKjyKYiEEbShJ/0psdmjwpT+j0nA8SXsZPBkP9SssfV2lKH80Q6wCmyaXy
         y8pFRxSGkSprCIHe5g3gdsmfmSENbBg4rGQ6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5vKWe8o7SX6Vr8T4eIXZy7ArXnBj6GjW8SN5H5HFYo0=;
        b=fT5Xmt+eLWF42+2QeRr95qKcyu5iLmL6QgQyWKspVtvbG27J5QBx96F5V7vh/QxJj/
         f/PGb6QdWZpPIXlIkaerWeV5ljptvX9DoyN0mbcVAOagsj64e25alFPzHM8D4R7JIdnN
         5IRc0XEZ+KADr6BaU9qAPP9rfSjqsnlIY+bEZV2pQW7TT+MhKOr7uejPHAFeKDQ2gDML
         2qVAQmJVodiN0jiy44qRjAi3rvs9d5vVStOS00iUW1BcHd/M7krl/qn/f7lPAsgqZBD9
         VJSKlAST3qNMLCcauCWJSzXhOmbcPVDZntXHVF+Lh+ofrvKtVZk5VqJ2ivErpZcxinqx
         hghQ==
X-Gm-Message-State: AOAM531DDr8fCvlGaatLDAo99f4LR+PD5Y6ZkUBT2ra81i1st5ewRVGB
	dgegrrxG+kxwuatk1PzLOVdlqI2w6kMTsH0s
X-Google-Smtp-Source: 
 ABdhPJx327QVNTwiG8G1sqIXSatPH2UBDgYzA+C6cFkYTy4eJPHZ+7sYIuM5xwR0I0yFB3kdsLwF7A==
X-Received: by 2002:a05:600c:3b29:b0:397:4f6d:5119 with SMTP id
 m41-20020a05600c3b2900b003974f6d5119mr13218793wms.129.1654338388425;
        Sat, 04 Jun 2022 03:26:28 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b17:e3e6:3e93:a118])
        by smtp.gmail.com with ESMTPSA id
 t15-20020a05600c198f00b003942a244f40sm16323151wmq.25.2022.06.04.03.26.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jun 2022 03:26:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/17] dnf: upgrade 4.12.0 -> 4.13.0
Date: Sat,  4 Jun 2022 11:26:10 +0100
Message-Id: <20220604102625.199845-2-richard.purdie@linuxfoundation.org>
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
 https://lists.openembedded.org/g/openembedded-core/message/166548

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/dnf/{dnf_4.12.0.bb => dnf_4.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.12.0.bb => dnf_4.13.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.12.0.bb b/meta/recipes-devtools/dnf/dnf_4.13.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.12.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.13.0.bb
index d621e72d4ea..bf89ceb2757 100644
--- a/meta/recipes-devtools/dnf/dnf_4.12.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.13.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "956b5c74bab2affde27f404e7aee98c10818b188"
+SRCREV = "ef09e48fc3ebbbaf4dfa478e6e0532706506f091"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


