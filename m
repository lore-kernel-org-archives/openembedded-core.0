Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67594C433EF
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 12:26:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.19908.1654431962512286182
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 05:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NfH0t4mR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 h62-20020a1c2141000000b0039aa4d054e2so8662180wmh.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 05:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zZLpGVsgqVtPUTOiB+rR1S4z0wuWshCkLBZLc/eb6Bs=;
        b=NfH0t4mRwtZa8k7xV2UasehLMq2mOc1lgDZKO6cgKYTxqJU5FbJfO9Y2Z8BSqG9Zay
         9FGSH9XHAwoNn9uVBuTlYh9hHCgzQr8Yr9wHC2xwdxnnxoKx3d6y4EFbF9zH8lDRFhck
         yS+H4ZHxKcVpp+3L3uEtfA0M0Wsr6yeY0xovk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zZLpGVsgqVtPUTOiB+rR1S4z0wuWshCkLBZLc/eb6Bs=;
        b=lHMqnjHG2YWDrlSzQD7vhGR2sWZmSx8I/2cV6vFnFPDpjBmJuGDqFu+IftOT4374aH
         /hpT8Mdr/LAH6bSA4GLS3xZcTc7198BVNmuRzmTyOJLgR1F4C+vtCHQ8dmyq0qxRHisE
         Izs8iHBrdtbGF37kWU8MBWEdY9XvoRLcuT/nTgGFDtL/5UEl8Sa70QI7GXgREvhNlXKa
         Y3Mu/oetaWPk0zqnjXDRQw0rw5bf+aMGiB25FAqnniglhKQqW75glFSlfD/M0D6u/PGi
         VHjj3HruMAIHPCBjtfFkUpjDsFtxUe9yNw8WNgRnL3V72MOoRh9pG8xQz2OZn4rCeRLe
         Bnzg==
X-Gm-Message-State: AOAM533BsEz9ED4Ua/3WZLskPfKEtKnofUS80Fcxdb7BeJs2iyYV5Rpi
	gkcVhl/jNKKwgrL+S6rvNzVM09qpSRf1tw==
X-Google-Smtp-Source: 
 ABdhPJxOXxkK4587CuZ2WEgI9+ovsCaB8MN3AB2eya8kH9MplznOnach/M8DH2HWjLfsITD0BQuWrw==
X-Received: by 2002:a05:600c:154d:b0:394:880f:ae3a with SMTP id
 f13-20020a05600c154d00b00394880fae3amr46301418wmg.13.1654431960869;
        Sun, 05 Jun 2022 05:26:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1a6f:63e8:c3d9:1249])
        by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b003942a244ecbsm12455927wms.16.2022.06.05.05.26.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 05:26:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] glibc: Drop make-native dependency
Date: Sun,  5 Jun 2022 13:25:57 +0100
Message-Id: <20220605122558.270399-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605122558.270399-1-richard.purdie@linuxfoundation.org>
References: <20220605122558.270399-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jun 2022 12:26:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166577

Now that our make version is a minmum of 4.0 we can drop this dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc_2.35.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 6ea5b1efb59..96fe39c548c 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -16,7 +16,7 @@ CVE_CHECK_IGNORE += "CVE-2019-1010022 CVE-2019-1010023 CVE-2019-1010024"
 # Potential patch at https://sourceware.org/bugzilla/show_bug.cgi?id=22853
 CVE_CHECK_IGNORE += "CVE-2019-1010025"
 
-DEPENDS += "gperf-native bison-native make-native"
+DEPENDS += "gperf-native bison-native"
 
 NATIVESDKFIXES ?= ""
 NATIVESDKFIXES:class-nativesdk = "\
-- 
2.34.1


