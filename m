Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D291BC3DA41
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 23:41:28 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.1615.1689118882002180872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 16:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=M/lNLQPS;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-666ecb21f86so5698712b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 16:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689118881; x=1691710881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKCzo7gGCj4FPWIHdkYTHLvRU7GNk1Sa+GcM/FieoSQ=;
        b=M/lNLQPSTucVTsDMuUtpPz3wseur2imxIm6bsgdBltD+i0R7fHTbBzxoAZ5t/Y+c3P
         pe0p+S2W3S/H0ynix8sj+Ir379rGbMStUhsrugjYiafkbkICPe2ayOgdpHPBYRoL0JKa
         l3q+S/yqkSFGcIunMA4k6dIjeJeoWikqENGMFh7k9C2MzUobbXKRrJmQ3R/iTClsKVKQ
         uyuxO/YhAYNHEnvfLwvvH90hjGjloK7pC8PQNsKhjl5nOUV2gFlFFIIok/ZpIsBdBuwU
         3abRCASK0pPwj36RVf56by1LSBlygqNsPQ1YIYJZ/hat3GwHRD1omLad90mnPyqw2lpP
         h6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689118881; x=1691710881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKCzo7gGCj4FPWIHdkYTHLvRU7GNk1Sa+GcM/FieoSQ=;
        b=Q0jpz7pHJnpL4pHH19fpdzrLtkBVcTS6NmlmoH/EGdMG5yLGFoqZhzjU+IHlMCaDy4
         jxxQ2aWa654xuuKV3Vf5/wSdLPaW+HENMPa9utTrzK1gCtXJS0CUijvReC5ReWKqPDID
         EhP8IRpBNd6EsT/XDyf2kVfRKD0xIbyMqjN+qzhpowfOJtQEmYvP3G7tKGjlpRczoJA0
         iKRvv38S4/jbaJoCIz50qVruXMAIT0uu7Lsy2EQhzRK2uKPf1EXpv5ewod6fiX90sOHi
         JA//AqimwaNq2bWDp/3wrCaLmAAjRKkzsGyyXjsFLEnOGp5jsBVqYIdb+6xdid5Q4m4Y
         ZYog==
X-Gm-Message-State: ABy/qLYs64BqlGSltGwc4PM+czuriuahHjLPGi9K9NEHVeIzgmjDN2Vm
	LjyU9owBnBS8cUVZ5ACXW6BAVb9AXKI=
X-Google-Smtp-Source: APBJJlF2CdftGO4URZ/ctgsDi/xHZYLxD2UMOi78Rc5yLJEFfAQkQst6LxMflEBIH1aiM0a/gAjYaw==
X-Received: by 2002:a05:6a00:198e:b0:66a:48db:8f6a with SMTP id d14-20020a056a00198e00b0066a48db8f6amr19978665pfl.12.1689118881199;
        Tue, 11 Jul 2023 16:41:21 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::b82d])
        by smtp.gmail.com with ESMTPSA id i19-20020aa787d3000000b0063b7f3250e9sm2263133pfo.7.2023.07.11.16.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 16:41:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] Revert "site: merged common-glibc from OE"
Date: Tue, 11 Jul 2023 16:41:15 -0700
Message-ID: <20230711234117.2924622-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711234117.2924622-1-raj.khem@gmail.com>
References: <20230711234117.2924622-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 23:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184164

This reverts commit a2f942c22e31fe15fef1b44a0e5cc548a60d43a6.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/common-glibc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index 7ba91e03c04..958699b143f 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -12,7 +12,6 @@ ac_cv_func_getgrgid_r=${ac_cv_func_getgrgid_r=yes}
 ac_cv_func_getpwuid_r=${ac_cv_func_getpwuid_r=yes}
 ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
 ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-ac_cv_type_uid_t={ac_cv_type_uid_t=yes}
 ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
 ac_cv_func_strtod=${ac_cv_func_strtod=yes}
 
-- 
2.41.0


