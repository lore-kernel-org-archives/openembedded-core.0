Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B210ECD6E6
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 18:51:59 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26542.1770835913717077091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 10:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OpVCL7Sn;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: colinmca242@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6610e72112bso2547115eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 10:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770835912; x=1771440712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKZCx+7P76cHqvuBogCDWExEHXlreMOx5gP5x3N5zZo=;
        b=OpVCL7Snu91uKCAzAHy9Zfe5DR86C6TtXitmc/4Syw7aYHTi6JRwhsp3FMEoGydPXv
         0rdyiQjIuvbsgbdmyIWcWIEmG/7SuArnUYL7MwXqVyqwGGJZNOsXeBpBihsuFiKH2v+1
         cuQf2nUls9KAlfAJda50Ah7HjL5SryBMey8y9pMEQvL+ggx0kmz49ZpFPLzLSNJtIg1Q
         jRQsflmiPjvrqqcObMZYFpCvEThWXiOilGkmlqlKMr1aRj4OakVUwrP5KFBUOtFfz8EU
         wSafcJFQ2avzDALmdXnVjAMgJepeblWP38/VGbueRu+EVwG9+CTt0YEZkZo/SJKOdIGS
         VydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770835912; x=1771440712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oKZCx+7P76cHqvuBogCDWExEHXlreMOx5gP5x3N5zZo=;
        b=RodSryGktKINjp6i8xxUNIo2SLZikD8fupqx8PY2zFEcjR2DprHy0dClvg/wwq6Olu
         vNxxhQ+CfJD8Acx+caY0iZD7SUmq3oxn8zYW8j3/WTmjSO3MWGnOC1aLiaZCBQvPExb0
         Hq7NNnbi+PHUTBTqM6rYLLi8G8b9uxY0fEZKtlA8Q9KUqfJnHfI+ppHq1srHl9DWw0vt
         IRSUfo4vvzTgRJhOKCODuF4wB6bOGscoz7doMLV2k+m+0ie1OVbCXqldgOImUbe3Jg63
         5tU/c+1HQQSm4YCUCRoFC7AD8xOWQbfKf42AgXRG7XC6Y8e+nQZGvT0JqCb3kfpeLRkc
         Lpxg==
X-Gm-Message-State: AOJu0YyzSEx/YahsBTzYPiussT/Pj4wSCRQUBxjcW5zaTz8wGK0CnxAG
	/v3Tmd2ETegVmPz+uA7vLNSKV0I6DiuTrsyF2g/AgXyeHI/vU7H/MTJcfuah+A==
X-Gm-Gg: AZuq6aKoIPzSnSpBZQtqv3Dw+MIK62F4IK/luhHVXqD6bbwTfLIleu5CIaV6nnn5Mr/
	TeaDKjRWDF0WpWxIrA+KjoZK+L1lc/vxXVtYXEbq4nlbT1zH1jM7VTtdXj6jvIiCqCimeHDW4iN
	L5iOrP0xLvw9RKRaIkoCUQQh5XdlCoWU94R86OCnOElmoMY+oSvzlto83Xf40PCQVYaNdGZaNFd
	1h3zWEci8sgwM3t5Ukotn2yhYorzP9g/TXpc3rwxpkgEX+ZDgR38rewlGcQqswu1FoH9bzBtIyQ
	1kRCWUDR29IOF7Pa8qYiZ0Egp1/flOkTeSgvAmR6XqsQa40YOWyyiFDByzJA9XSv1EievrZ85YV
	x5t0unUofgNlD2DgNGhwbuCi/dc/h325BrcOkjGLDm3FlaWSPISYOFVosTyUOX5iNBV5N3bUnkO
	L8B8SoCzs/8WyngtrPSHk=
X-Received: by 2002:a05:6820:80e:b0:65d:56b:4b42 with SMTP id 006d021491bc7-6759a557797mr93728eaf.48.1770835912596;
        Wed, 11 Feb 2026 10:51:52 -0800 (PST)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67475fbc91bsm1356092eaf.15.2026.02.11.10.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 10:51:52 -0800 (PST)
From: Colin Pinnell McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [PATCH 1/3] openssl: Disable TLS 1.x by default
Date: Wed, 11 Feb 2026 12:49:15 -0600
Message-ID: <20260211184917.1045939-2-colinmca242@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211184917.1045939-1-colinmca242@gmail.com>
References: <20260211184917.1045939-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 18:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230998

TLS 1 and TLS 1.1 have been deprecated by the IETF since 2021. Disables
support by default in packageconfig, requiring users to explicitly
opt-in for these deprecated protocols.

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_3.5.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
index c0d02b617b..6b9ccef0b5 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
@@ -29,8 +29,8 @@ PACKAGECONFIG:class-native = ""
 PACKAGECONFIG:class-nativesdk = ""
 
 PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
-PACKAGECONFIG[no-tls1] = "no-tls1"
-PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
+PACKAGECONFIG[tls1] = ",no-tls1"
+PACKAGECONFIG[tls1_1] = ",no-tls1_1"
 PACKAGECONFIG[manpages] = ""
 PACKAGECONFIG[fips] = "enable-fips"
 
-- 
2.53.0


