Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FF0C61DA4
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.3841.1676835070862692901
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dR/uY4q9;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id c3so883883wrb.6
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPyC+If3oeUpZI9zp2AC7MGzyYtLNlOtHAtGYN3vuCw=;
        b=dR/uY4q9fPB7pBtauJEel5ptXOekxqrlB01bij+EQAy5t+7NPGZ3zPlQU61VobzlZC
         gwLICpC8A7LggqdA8K8ZcetW0E3L3wM9w074E+SSgs3i804DMduO0A6WG8wGSXL9qjTf
         DnpVpmDx3rqoYti2+aadfJMet16ZTdQP9T6AfkV1yCZzn9/XrUmcgs0tH2zamN71+/gV
         te/hu2OEdidcuP/mKaawZLOlbDgqgeem6gRj10TiBS8W/5ZUq3syFoukt8DBIEbaxHNj
         OfIhYJkfCF/zyZgmNhtgqjMneUjyzc4MWcbIqEcjt15evKurMlNcdf3MbKuY5U44bngF
         BZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPyC+If3oeUpZI9zp2AC7MGzyYtLNlOtHAtGYN3vuCw=;
        b=bWJGIh3C++NLcFvfSM8cvDCbJfY7xGk0g49VBs9a/F4/w5sc2BTZQ1jBMS7qbqcNY3
         QjMwEuMERR7Ercd7wNzlzsxm810NmMpy7RmmpClJuNooeBA/924nEH4UarfSGJ7GYmyh
         yv4vouTBpShW0Wedqz73xf1MFhjAd/vZU657Uu8BWOy+5uTtptSJdxLimrWPPeqVFBs4
         6RjzIj3Wy3My5dKrdm2xx7lOfylHWhfLSMPPJpiWiCSwepSENNR7pRTzYN4Edmz5aFmo
         XQ/3HXtQOHi1zKewHlcGb72oshvtd39Njngk5TF88KaUeWWU7HSwwrubAJWsTJ9ezF33
         N4hA==
X-Gm-Message-State: AO0yUKWHdCtjVVNSDCXd0c+KUKpKFGXR+vWkr/adKXSXFRrKx9lwSxxC
	PtX6wMNpWURWbknj0u4Egg1JycY6m0Q=
X-Google-Smtp-Source: AK7set8GN0+d6Y8jbw1dolNwVNPeZ+NDwds8IIWqsD18YrQM6DQeIp78hC8WSm3QwkJN11x2836TRg==
X-Received: by 2002:adf:f78e:0:b0:2c3:ff6c:82e with SMTP id q14-20020adff78e000000b002c3ff6c082emr1846292wrp.22.1676835077371;
        Sun, 19 Feb 2023 11:31:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/39] curl: upgrade 7.87.0 -> 7.88.0
Date: Sun, 19 Feb 2023 20:30:41 +0100
Message-Id: <20230219193101.338397-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177362

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/curl/{curl_7.87.0.bb => curl_7.88.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_7.87.0.bb => curl_7.88.0.bb} (96%)

diff --git a/meta/recipes-support/curl/curl_7.87.0.bb b/meta/recipes-support/curl/curl_7.88.0.bb
similarity index 96%
rename from meta/recipes-support/curl/curl_7.87.0.bb
rename to meta/recipes-support/curl/curl_7.88.0.bb
index 0b4d649f54..749bda815c 100644
--- a/meta/recipes-support/curl/curl_7.87.0.bb
+++ b/meta/recipes-support/curl/curl_7.88.0.bb
@@ -7,14 +7,14 @@ HOMEPAGE = "https://curl.se/"
 BUGTRACKER = "https://github.com/curl/curl/issues"
 SECTION = "console/network"
 LICENSE = "curl"
-LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
+LIC_FILES_CHKSUM = "file://COPYING;md5=db8448a1e43eb2125f7740fc397db1f6"
 
 SRC_URI = " \
     https://curl.se/download/${BP}.tar.xz \
     file://run-ptest \
     file://disable-tests \
 "
-SRC_URI[sha256sum] = "ee5f1a1955b0ed413435ef79db28b834ea5f0fb7c8cfb1ce47175cc3bee08fff"
+SRC_URI[sha256sum] = "fd17432cf28714a4cf39d89e26b8ace0d8901199fe5d01d75eb0ae3bbfcc731f"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.30.2


