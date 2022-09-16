Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB409ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:34 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.894.1663362505327044219
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fMKNdq5r;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id n8so9334993wmr.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=9E3LiYUdT7fLZ3yRC3kbvg2UTzMuYLsOhjSOGCQy/W8=;
        b=fMKNdq5r0YXkeeqoiH2C4d7pAwZpqbEEGKo6m7Et3PTDhOTH8o8U9XFDU8NiyDeAKt
         UPHfWtbZI+lUaYmNTGsT7fUOzz69jn+ZRUrhrxS724Ls/SwCZ7eh/nlmu8eZEuwYiR+Z
         /EjocfcJf3+zkIZadu7Jf6HeM1nItqMgH5kPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9E3LiYUdT7fLZ3yRC3kbvg2UTzMuYLsOhjSOGCQy/W8=;
        b=MFQC6R9Nupd+N0ch127x116oOfhfj9DhqywbyEY3Ps/KjhtoVpvXHKcgH5xUAxT2mX
         niRE+j7mWwOCZb7gjzOTUoGvpRaZxqq8DEISu9JD9uEFufQb6jUTVdtCaEeyMFUuSlLd
         iglgD99c5buv1z97QebaOxSMFoNR6TwtbOhenGM3Ouy6pTX/SKUcRzDk5Gs9qIHNL05Q
         8ojJFEqvF3zjJP4ru5oqsuMFhxuQLIInyBTRY3tUnfDejYgccC4AjFnJTXF7UrNVCWVo
         Ps4yHY18sXAKKsax4M4otwv25AqZsUybMnB1Yh4P+maB43+AsRCI4WavGsTK1RltVamc
         9K/A==
X-Gm-Message-State: ACgBeo3ZTj7PcU6p9uZgotjEq5CTZDE67tt/o2NFsMbu0w8UDoyUnFPk
	AqLT5GTTaf31yRrq41XWCHVs8KT0vuuJ3Q==
X-Google-Smtp-Source: 
 AA6agR5dbO4OnDMZwSLEMwmoKGsx15Krq82WU7Dx3bZ/2Aylur2cDwym/z50H4f5CSpdnihmzknDaA==
X-Received: by 2002:a7b:c046:0:b0:3a5:ff4e:5531 with SMTP id
 u6-20020a7bc046000000b003a5ff4e5531mr11583992wmc.104.1663362503393;
        Fri, 16 Sep 2022 14:08:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/24] dnf: upgrade 4.13.0 -> 4.14.0
Date: Fri, 16 Sep 2022 22:07:59 +0100
Message-Id: <20220916210818.1228761-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170803

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/dnf/{dnf_4.13.0.bb => dnf_4.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.13.0.bb => dnf_4.14.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.13.0.bb b/meta/recipes-devtools/dnf/dnf_4.14.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.13.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.14.0.bb
index bf89ceb2757..48f7e284188 100644
--- a/meta/recipes-devtools/dnf/dnf_4.13.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.14.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "ef09e48fc3ebbbaf4dfa478e6e0532706506f091"
+SRCREV = "e50875b3f5790f70720bdb670e1dd2bf4d828744"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


