Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E38C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:32:42 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.6291.1646731961283015278
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JVvFIxmP;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id d10so37771197eje.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z7pTdJkbBHxSZe6OKjV2DclzsmO/wdjwD2dEz0lfJjY=;
        b=JVvFIxmP8eSS5iv3kDPx6jvQzlA2yE3HTEgEuwgEdoQiNaJWfmDUoF+lVrACPzd3SG
         3GcLMHHsVvq1tcHRwExpdm3jzX6yrWitmcmB8n/FPyNTyPo+r3nHqMLoulnduizwBG2+
         rn8A4vujc85l2HXYDNtR56vtYwoXwBo1/Q5A4JmLlV2K0LNGEDGGjesmTO7ekBaMkdUk
         lQnQX6Vyub0Cpm7a0A0d1W+atatYCTor8+csRuJDqPmTJUTYAOmqkqunTieakcL6itTz
         3v7j+6MiyRTBSaB5Z6fyLXAwakdGxI6hzfSf84PnSH/SLTIJ5ip8nM5LjPDi50cGFs37
         gNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z7pTdJkbBHxSZe6OKjV2DclzsmO/wdjwD2dEz0lfJjY=;
        b=nIMTan+4gsNsO9rqOgHNUTrJUfW8l0enDwYgTGcAy60zgRdAOkdTNmWU2UvhB24GYA
         i2A0rSSKkVrDAcs0pkmqCYwcyFu7CffCqbdzspwn9KaWQT9Ql49bTXeanJT7zfFU6o8x
         /HKWkZpUvu4ASax31md0CC5lUMi3O9gjSNNFt1Xf38kdjv6vsWvLwsX4407rksqyM1xW
         /oF1PvaFsdZ4Qqzc8t3tnmS9rgE2n86Svwu/f9Kx4j8Ohb2NHC6hl+EPIgNgPhP0EKP6
         btMc0rz5EM4A1S6DltnRvaDresX88X82VVXDdxG1xv8x3CCes7WOKNEF+yymtP5fMjMV
         Q+mg==
X-Gm-Message-State: AOAM530mRld+wJhvIQ34aBkO0kkoZtR6H0HQKglZBMp245z25HJj5No0
	zeItGNF2oy1jWJSo926RqT4GZNtLCVw=
X-Google-Smtp-Source: 
 ABdhPJyZCxCklvR5I3/9W+D/gPdmAeqLaha6i6fuNfpLBlsHNmzHl7WaCTKfmQXCosBG6j65IfGi+g==
X-Received: by 2002:a17:906:2991:b0:6cd:ac19:ce34 with SMTP id
 x17-20020a170906299100b006cdac19ce34mr12598724eje.746.1646731959874;
        Tue, 08 Mar 2022 01:32:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm5640178eje.92.2022.03.08.01.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:32:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/16] sysklogd: nobranch in SRC_URI is no longer necessary
Date: Tue,  8 Mar 2022 10:32:23 +0100
Message-Id: <20220308093224.3436483-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308093224.3436483-1-alex@linutronix.de>
References: <20220308093224.3436483-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:32:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162892

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
index 0682ec1d63..7043f3d391 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.3.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5b4be4b2549338526758ef479c040943 \
 
 inherit update-rc.d update-alternatives systemd autotools
 
-SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1;protocol=https \
+SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https \
            file://sysklogd \
            "
 
-- 
2.30.2


