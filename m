Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CB7C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:57 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.55679.1722258827883048180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0iGKUgy6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cb5e0b020eso2551297a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258827; x=1722863627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+Er1OJEdyaJAwnLRWSkiKCDV439t5DJ7kXDIRJWeJE=;
        b=0iGKUgy6ao9GY42J2CyiyTN6zazvG0JG3xSNkONzVwnFlJk45tT4DojqMiSqdsRtd6
         foc32cFraZy7XjlMydXma0akXjzXP9ZRN7Rb5OtulPWA21L79c5g7UDw2E2mLMOESc4R
         1tQ++FidOuILH3P/Vp8ItZL2ykfSr9kPhAk5MD9wMaNV8htHLsBO3bnqlBDLxRml6qIi
         NxZTRnh16KxUfg64OJP9nuw/H9R6ymtimPSeJB8IXvf2pD3CEbTHHTLCbAQ0RV8WyKnk
         EO4lrEXSmW49btV8WRlzXha3Hdl13jD6w114DrzyBl3kkFh2yRjMGrXkRf4oLIqyYHBF
         TCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258827; x=1722863627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+Er1OJEdyaJAwnLRWSkiKCDV439t5DJ7kXDIRJWeJE=;
        b=dMHAdvGA6hy8eUvwRSnsIO4jWDBNaX4flTP8WNiegVlvyJEFM46+k5dzJ4cjcxXWYF
         A1gs0leFIMKkRv9figbcjy0BMFeAQm0TETi0EH+Tn7BLxZIB4mgvl08tiF71rt7D2scM
         ILGyXfHs54s92w1q96WInb5OxiPeU2kXfUjTyjtkOrmv66zZZ9fFk0yPDa4WRlSTiaxy
         gM59jfUtZi04PI1DPXxaQBMVy8MT8xtzus+kOjmVRn/3akuTVaJgPwHKmoqy0w5Rl1Gt
         ObW1KJWaPqebi/dum5oFX/4W3X4fiJCCoSNrMQPYf/LmXsUOkNHWWT7uY91zAVOTv5NW
         saKg==
X-Gm-Message-State: AOJu0YwLgtqCKzJCfdGsBOhS08uKF08e5b2CPtkMS0bsWPUBS3U8unUO
	0Y7ape5yiRxWnjIrE+Eb3ipW2WDBRIgYd7nkzps5OQy4WMy+f/YX6RBI3T4X9mQ7qq6UiOtQ3Vl
	8x8jH1g==
X-Google-Smtp-Source: AGHT+IGEWNackji9SmU1xGCFXah2wjb5Vcrlm1fWG+k18Lxoi9OA/WkMxkIHj26nI2hy2QKOSOYFcw==
X-Received: by 2002:a17:90a:f011:b0:2cd:3e23:fc85 with SMTP id 98e67ed59e1d1-2cf7e1d6ec2mr9673214a91.13.1722258826996;
        Mon, 29 Jul 2024 06:13:46 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 36/37] openssh: systemd sd-notify patch was rejected upstream
Date: Mon, 29 Jul 2024 06:12:46 -0700
Message-Id: <29faae166366dd022598b95fb1595bd9473d2a17.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202650

From: Jose Quaresma <quaresma.jose@gmail.com>

Still side effects of the XZ backdoor.

Racional [1]:

License incompatibility and library bloatedness were the reasons.
Given recent events we're never going to take a dependency on libsystemd,
though we might implement the notification protocol ourselves if it isn't too much work.

[1] https://github.com/openssh/openssh-portable/pull/375#issuecomment-2027749729

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c3403bb6254d027356b25ce3f00786e2c4545207)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...001-systemd-Add-optional-support-for-systemd-sd_notify.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
index acda8f1ce9..f7a1d12e8d 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-support-for-systemd-sd_notify.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] systemd: Add optional support for systemd `sd_notify`
 This is a rebase of Dennis Lamm's <expeditioneer@gentoo.org>
 patch based on Jakub Jelen's <jjelen@redhat.com> original patch
 
-Upstream-Status: Submitted [https://github.com/openssh/openssh-portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56]
+Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56]
 
 Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
 ---
-- 
2.34.1


