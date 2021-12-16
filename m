Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFFEC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 11:49:07 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.9616.1639655345933766003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 03:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=YPTMxsct;
 spf=pass (domain: madison.systems, ip: 209.85.215.174,
 mailfrom: matt@madison.systems)
Received: by mail-pg1-f174.google.com with SMTP id q16so22826584pgq.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 03:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DL5u+9JYIpZtLMvBFRbm00llxnLMEPuZBXc81Og5wXY=;
        b=YPTMxsctY/RVeGcjpIVxQvhawU2IVITVdURXhVHbMEkfmQbeLlsr8Y4gSbG9e3QXEN
         JZ3K1U1mbdEQxfAOcmE4tV8VatyHltqWzvY5ghJwwCxGjelkgbA6qaEAUb1zq2eSGZgU
         b+6S1ULD/6pt21TFM9PUS2ntfIy/AoeZU8qr0B+DmEL96abxybYSsoYuxRH8bJKqMrfg
         tbwjBPYLoV/qe4W/VugEafeJsmvrABEmOONY6iRgTczgKHnECP+bMMxXXiW7cNGMt8Qc
         Czp9p6ET2RWuxpqCrkI9rX/EKtrcuI2s2djrv2Dh05h9vxiTPaK0IalsgqSchVn87INM
         mO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DL5u+9JYIpZtLMvBFRbm00llxnLMEPuZBXc81Og5wXY=;
        b=2ExBj5r05vrYI/wVw96QLcj9U+7ulZXqhyCSAITj4rA436nL7stXrRR0pbwozFvXzk
         TM2CWFVP2p945K/yVZms4gKzkmNN+hwRNbrv02ni9Tg+2BpeYwaJcUIzbq2xhm2Dn0N+
         gv+LnBGlIGHIoWdzfzK8D6trP6RhgHS4tvCt+Mmg9/MNx4QTqSZuPohTJs+sXQr1aVpx
         beo4ZfNsChhRx6a7Dz2vsCNERm8+ujZm+wwRGMCg8habRzF3+cVEV/Hm163tbnePgCCS
         tf/KkbgP4F3HJl+EpXBdXPKWy9sHaRQNb2GP1IpF3kHiLQklZdiN9lJjPodv8ufwhboe
         lalA==
X-Gm-Message-State: AOAM533/VgRWgigVWvZ5OuNP05V5OVZ0r5siJYcRjvDT7R38GmSu0wRu
	q+woyPQm6RF88QUpyulHMNHcbS3BflS+mA==
X-Google-Smtp-Source: 
 ABdhPJw8SAntSZ6E8xILY53w6B+VwO2Tm5cFs0/LQ5cs9xVaAZvKPmjz8Xi6PAY62U8/m9R1Yc/z5w==
X-Received: by 2002:a05:6a00:21c9:b0:4a7:f071:eb73 with SMTP id
 t9-20020a056a0021c900b004a7f071eb73mr13631393pfj.23.1639655345125;
        Thu, 16 Dec 2021 03:49:05 -0800 (PST)
Received: from visar.local (76-209-242-28.lightspeed.mtryca.sbcglobal.net.
 [76.209.242.28])
        by smtp.gmail.com with ESMTPSA id
 q19sm5103175pgb.77.2021.12.16.03.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 03:49:04 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Matt Madison <matt@madison.systems>
Subject: [OE-core][PATCH v2 1/2] qemu.bbclass: drop OLDEST_KERNEL reference
Date: Thu, 16 Dec 2021 03:48:35 -0800
Message-Id: <20211216114836.964835-2-matt@madison.systems>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216114836.964835-1-matt@madison.systems>
References: <20211216114836.964835-1-matt@madison.systems>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 11:49:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159782

which is introducing task hash changes for some
allarch package builds, and should no longer
be needed with recent versions of qemu.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/qemu.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 01a7b86ae1..333202b7c4 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
 # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
 # qemu-arm default CPU supports all required architecture levels.
 
-QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
+QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
 QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
 
 QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
-- 
2.32.0


