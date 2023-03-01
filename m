Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41B3C64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 00:05:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.9783.1677629136609231038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 16:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=TT/i3IDJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id j3so7535394wms.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 16:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1677629134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IaJRjx8DO3+CfkPICYtKaHnIPJf6PzkdcAGWK6KfbB0=;
        b=TT/i3IDJ2ny3l54J9qXLguzb53FjiLt+LZPZiJApISOlWWevwitNq3QBrpaL7GcvyL
         y0dw/KNB5f+7eazKcbx2n6nt9D32si3OWEE4TwjT4h6a8MQz4VS31L2TPxlbR1gQmCKO
         DhkaD9bZy44tnFpmxq/YylG90oaAM7aU8JGeH069HlmAEA214qxfjx7NDyMwUW52fecu
         7gCq6pASjTCmyL8vOIIPIJIPSnsTGGoWh3g4vC2dOc4f0hWbtomdx3wow568M26V45lY
         5sChWW1R4cRr+nPZLrQ5VelU5O5FOePyRZLXDElDyLkztg1f5nqEx1yVCEi2mxWmehPL
         r4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677629134;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IaJRjx8DO3+CfkPICYtKaHnIPJf6PzkdcAGWK6KfbB0=;
        b=jG18WgVQh4vWzXTVxFn8YBm2TxwAD4z/BFMwau3v4bbByKiTK4Z4zcSlIeO1pNkXRe
         xxj9lX+5cHp79RRdJxk3b1SR9H6KzrvcugOICVHAHOdTH7Yz/DeWUcpLQ6hRhvpAeBVz
         k/BKMiGb6opzpsW/0q8UWJ2YjN2BHKGFcClF/D50lcrOnNm6l1wHJnvY10+3Tw/Fgn0J
         RRWDUvfucZgIt5Fff0r5ndeB9j12LEOP78JF27VLQ/fCWsj0ZxgoOdKXRoeUf6BU2ni5
         XOqtT6K47oKmt91wVoqOxhJWp5E+xfwpRs+P204NN/aIdVQuMB4SXatWW2tpW3Xs4d5L
         oFjA==
X-Gm-Message-State: AO0yUKWRO6ePGWa91HelxFs5GonHOhFJ177PIwFnJ8UQYXQG+vulkdEy
	F6++vYnJaoVtwD2vknRFs5bq86VVziH8LAH1
X-Google-Smtp-Source: AK7set91vV5Xdl+L8XFvoDwQg0W7NTdCai5UpOD8eOjmuBvbjSn5wndcf3PPWGftO7ArdYrc+oXB6g==
X-Received: by 2002:a05:600c:3583:b0:3eb:399d:ab1d with SMTP id p3-20020a05600c358300b003eb399dab1dmr3556568wmq.16.1677629134540;
        Tue, 28 Feb 2023 16:05:34 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.mpl.intranet (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id e26-20020a7bc2fa000000b003eb39e60ec9sm10941072wmk.36.2023.02.28.16.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 16:05:34 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Pavel Modilaynen <pavelmn@axis.com>,
	Mingli Yu <mingli.yu@windriver.com>
Subject: [pseudo][PATCH 0/1] pseudo_util.c: Open file with O_CLOEXEC to avoid fd leak
Date: Wed,  1 Mar 2023 01:03:02 +0100
Message-Id: <20230301000302.93660-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 00:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177860

Hi,

The following patch is the work done by Pavel Modilaynen in 04-2019 on
[YOCTO #13311]. Then, Mingli Yu tried to get it merged in 01-2020 without
success.

I just added a ref to [YOCTO #13311] in the commit message.

Best regards,
Yoann

Pavel Modilaynen (1):
  pseudo_util.c: Open file with O_CLOEXEC to avoid fd leak

 pseudo_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.30.2


