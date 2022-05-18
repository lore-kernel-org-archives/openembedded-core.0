Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DD7C4167D
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:16 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.3576.1652871537727940583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KcJ35Fbc;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id y7so1540909ejr.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mijcRck/owa0L6iEFeexoKjcxLwdHxF3xLi8DkhXXvE=;
        b=KcJ35Fbc5pg6hV0GNp1qfiVP4RG+c0CKk+S9QqSy1Tn7bTCObOKGbUUJwueHJ7tPhj
         4YlCIbbklOWMkdW5Xshy/o7NAxsBROjmtIaFODzvUyRVbakRSG/roflbgQHek8oawDb5
         KIeAO7CWYK/YTigaFcldlp4UAHHLJvdXXKGglYfF9SZfUOcmhFMsSVTEIJjHEhomackj
         KiWo1eSLgrryQjpsOxTj2hL4FWHalL28mvxBk1/Oo6YzQb5UeXWoyB4IWWeWjz1fpukh
         t7qqh1lDtZwAf3+hmwbqpummx+gF9D/KDLSVJU1kEn8Pi7+NWQGvi5Hdp47szKkHHuby
         AL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mijcRck/owa0L6iEFeexoKjcxLwdHxF3xLi8DkhXXvE=;
        b=0O1WbiuuZkBY6MKXl2EBaEkMiU5kNrBrIIZxvrDqU0KENqwcdcYWt7FuEj90PdLyt/
         N6bVr+v5ZyeoXEbt4I1WUxVIt+h3CGaWtGjd8cdWCZW9s/GNR1ldtR6wyukkggTaz9Yj
         9mX1ZSS+873DSaXBCh2XclkL/IJW4gmSUt2JnLdxZF68FIxvszz5wTGU7Xqjtkgblz75
         BvFPPIVbtD0nf1sZJ0vrOB2lItLV60v6Ki6n7qI1K4UBSCvF8sHZykM8r9aipekHemzF
         TaclyydVSRRYVSQzzGTxQR6F6hIfmv6UWxdtTrdXzCaCcYZiDhX4lYxN1WbrX3mpl4PO
         uo3g==
X-Gm-Message-State: AOAM530V1t1m4l8wvLtITdkLDtjbIQH7bvbYIx71mM2/joq8L3uP3a4Y
	hVmRA4/tKy/Nn7z7CGv31QafeN2i/xE=
X-Google-Smtp-Source: 
 ABdhPJyMFd54pxtXUQbIyAAA7/Vw1R5B14siKt7QVF+IBIF7BejJzF/dQvWpTsK9Z6vwPk8Jop1ZqA==
X-Received: by 2002:a17:906:9b8b:b0:6fe:55db:14e with SMTP id
 dd11-20020a1709069b8b00b006fe55db014emr9297515ejc.327.1652871553976;
        Wed, 18 May 2022 03:59:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/49] gstreamer1.0: upgrade 1.20.1 -> 1.20.2
Date: Wed, 18 May 2022 12:58:20 +0200
Message-Id: <20220518105843.3299331-26-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165823

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{gstreamer1.0_1.20.1.bb => gstreamer1.0_1.20.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.1.bb => gstreamer1.0_1.20.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
index 81b94928d9..3aa9aa7048 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;striplevel=3 \
            file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
            "
-SRC_URI[sha256sum] = "de094a404a3ad8f4977829ea87edf695a4da0b5c8f613ebe54ab414bac89f031"
+SRC_URI[sha256sum] = "df24e8792691a02dfe003b3833a51f1dbc6c3331ae625d143b17da939ceb5e0a"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.30.2


