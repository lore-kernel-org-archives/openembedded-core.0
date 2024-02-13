Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C30C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 21:43:47 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.26195.1707860619451489494
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 13:43:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tJbOr3CY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e08dd0c7eeso995470b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 13:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707860619; x=1708465419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0gVPT45VySEFHKGAiNZzfxdMnAiOysXhhKudxxzZhY=;
        b=tJbOr3CYIdWeE5C1Y+/LoSzN2+rXzOZe+8Q4vCn4csB+zWJ3TqyAn7q3MpQVOPnNiR
         +NHXsSSQuzBwkeyfq3tbIel/W1k7P5GYAQdWmcMCWJlCR7G5RNGicXVbb16XWkAwwcaH
         4F4KjuuWNd/9JXNHo860DKysqf4ZYPSR4N7lYsj8ZaDdO+AmUavjhoUMLyi596kIENFi
         pjG88UHZbJxfWXNNJABX2LzIfhE31Y8wIDt1NI4YdIi6dQgqlNUnnqW+bsaYH34Jvc25
         GCjM4VaT0a/+w4+VrSVEdMnX2IiJeX0xn0j6hrCeQ3F2YISmRKBpuoXZTPVJAubyPz6f
         G02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860619; x=1708465419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0gVPT45VySEFHKGAiNZzfxdMnAiOysXhhKudxxzZhY=;
        b=NFk6t12InxeV2hVfJXUtHyCG9mPtk40BE4ZqGzeiWNYtfbk/aDmpJqe1Ny2VKKpWJR
         1ygLxyyymxEqs3EOYYqDVC6m0JGbKoUrx6uqL74Vr4gTBgmbAIsIV8IvEqg/ow3F1XAK
         oWdt9HtDKQLudfCA6HcddHru1oN6RcwROqlf+IDZuKDmUsnb52x6oevm3OvppvRT3yZq
         AB2cOfR5r+xfvT6oqBwqEAATeB71e+vPaYFox69k8HJSuiJNqI1/WUH8juiqjHd4jnYF
         eULWeMOiAT6dctp5fMlfrZ8WscN0QbKyNjqdydMOw37Yj6VSgmus+FDmk+IWiOp8jBh8
         yZ/A==
X-Gm-Message-State: AOJu0YybUSCLXy+pfvkZIJgYUop/prTLzfrNPTCElH+vMJnPZDmsRpl0
	S7VQ0wz3xuueE4FPUYMAriJJ2M/lhZY38XeOesMxSJBDSmJWZcIZMBzSSvnspMbhKgn/+7pFiU6
	n
X-Google-Smtp-Source: AGHT+IGSAbrURs6iQ1gxZcHsqeaXNnygh1MHBqUN5XiFPM41+9wU1/lRo4EVNlXi/gGuaWnm4iYm3Q==
X-Received: by 2002:a05:6a00:189c:b0:6e0:6a53:e380 with SMTP id x28-20020a056a00189c00b006e06a53e380mr642614pfh.22.1707860618745;
        Tue, 13 Feb 2024 13:43:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id x37-20020a056a0018a500b006e04efcfbc2sm7767327pfh.74.2024.02.13.13.43.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:43:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/7] curl: ignore CVE-2023-42915
Date: Tue, 13 Feb 2024 11:43:21 -1000
Message-Id: <067740c834a98cd8f5cfff7f73418d18b8e1249a.1707860435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707860435.git.steve@sakoman.com>
References: <cover.1707860435.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 21:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195430

From: Peter Marko <peter.marko@siemens.com>

This CVE reports that apple had to upgrade curl because of other
already reported CVEs:
* CVE-2023-38039: not affected, introduced in 7.84.0
* CVE-2023-38545: patch already backported
* CVE-2023-38546: patch already backported
* CVE-2023-42915: reference to itself

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_7.69.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index a8e6c4f3ee..980b4224a8 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -72,6 +72,9 @@ CVE_CHECK_WHITELIST = "CVE-2021-22922 CVE-2021-22923 CVE-2021-22926 CVE-2021-229
 # This CVE issue affects Windows only Hence whitelisting this CVE
 CVE_CHECK_WHITELIST += "CVE-2021-22897"
 
+# This CVE reports that apple had to upgrade curl because of other already reported CVEs
+CVE_CHECK_WHITELIST += "CVE-2023-42915"
+
 inherit autotools pkgconfig binconfig multilib_header
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls libidn proxy threaded-resolver verbose zlib"
-- 
2.34.1


