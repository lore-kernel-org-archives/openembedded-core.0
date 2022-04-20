Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62229C5DF62
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.8105.1650463744069468413
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4uOXpsC3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id r83so1736807pgr.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tNhZuHULG7JNdHeZE43oB8sIeglsu41fD/fQAZX+qsg=;
        b=4uOXpsC3OoMC214BdGFDnVuJuEYYu37ug8+Z0Yr/KGl+AJhc2Ezd5RRqAByFzshW0k
         iDY8gO3nL48nBiaHjuCcV21u8ph782/nmd5WWJ8jhjAx+6loZ1nwQSt4y8ogBj3kJAv+
         TBu5ZtfP94P1qjKYr/W5a933ui2o3yu22WpfsdJc8z06V2kAAGQXaRKM4Y2fJlGt1GFj
         NMc/U/p4YSmO1tgZwHB/cMUYWBEtkh+D3TxIuvUeGh6KYqhPIQj9WDruwqMU0qh+TB2U
         Cd1KBIzG61M8fstGM0WGPZYzzIa4JDwnGEJFe9FxvRAnEEZPWub5WhgA9YEvmnjJrQqQ
         DztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tNhZuHULG7JNdHeZE43oB8sIeglsu41fD/fQAZX+qsg=;
        b=EzvUNWXz/CfxLrk0L5Xy/okdvOyZSpUW2EAV0gowG4ZEsYwlZgioTPwa4gURHFi3Ee
         nzOL02ayHWmWrw64cZ66we2qvf6kyTasXt/DtsKlTtfMM1muYn9py6l2iz37nPTpGYly
         bP4IsXEcJZFoqbRPPmaBr4w3u5oI0WBv5B8fb+KfVKlfIhMkcC01C1D2CVuxPkeCczT7
         r/4hsljaEeEU/KPRfkcOt2B41iqzchJhORg4Z6NcmhACvClHul/RMSi0PpaXWoh3cok7
         EXCMvGBel+I6MiHjBk/uFNwBoi7JwZI32ADuErM9wUuXWtB/cACiPsvcsoDYoSh33yVl
         TXdw==
X-Gm-Message-State: AOAM531ljngH/awxsVVvkIh3f+4aOlYKQuQU/NN+4NQgFuodpVEZ84PC
	le8CxNo4IYnxTWZgkLgogV93Z9C37Q31lQVbQXA=
X-Google-Smtp-Source: 
 ABdhPJyGMdV5arDGBClalALftQMCjqdWReLevP/SFXPIHqBAsxPtwEZPsuJOJUVVMEW/kCtWeuOkVA==
X-Received: by 2002:a65:5acd:0:b0:399:24bc:bbfd with SMTP id
 d13-20020a655acd000000b0039924bcbbfdmr19510139pgt.323.1650463743185;
        Wed, 20 Apr 2022 07:09:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/27] package_manager: fix missing dependency on
 gnupg when signing deb package feeds
Date: Wed, 20 Apr 2022 04:07:59 -1000
Message-Id: 
 <4163dd61e36d7f9a7c582f912be3a46e2eea64a4.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164679

From: Ferry Toth <ftoth@exalondelft.nl>

When signing the deb package feed gpg tools are a soft requirement. If gnupg-native
is not declared a dependancy the version from hosttools is used. Unfortunately the
gpg-agent version from Ubuntu 16.04 on the autobuilders is incompatible with the package_index task
and fails during oe-selftest. Fix by making gnupg-native a dependency.

Fixes: 0b4231b5 "package_manager: sign DEB package feeds"
Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c063b658e30a24be9214abc23cd2a16c0260e93e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/sign_package_feed.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index 16bcd147aa..f1504c2225 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -27,6 +27,7 @@ inherit sanity
 PACKAGE_FEED_SIGN = '1'
 PACKAGE_FEED_GPG_BACKEND ?= 'local'
 PACKAGE_FEED_GPG_SIGNATURE_TYPE ?= 'ASC'
+PACKAGEINDEXDEPS += "gnupg-native:do_populate_sysroot"
 
 # Make feed signing key to be present in rootfs
 FEATURE_PACKAGES_package-management:append = " signing-keys-packagefeed"
-- 
2.25.1


