Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A30C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 10:52:45 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.20640.1657709561362605845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 03:52:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DyOTGjyL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id q9so14935162wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 03:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gHYZO1QO/oDZumR/5jdI0LMVIRx3g+anRYjCvboi8rY=;
        b=DyOTGjyLfnlLGl6zWZJm+WuvP5zzwBLI7z7ZBjziWXf8vXPZWYUQSJD48mi1kcM6Wy
         LvTn/tny/fBCD0k7nMycPxfRC3ULAwyAO9aA0rediRXAiYXzh260ZDnRMAMZ0P1wx4l0
         uXD/5nwLJWouhidx/6O5vy4NaMcggGSfXCiyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gHYZO1QO/oDZumR/5jdI0LMVIRx3g+anRYjCvboi8rY=;
        b=0uY68gCG1//nf4vPNUBKOnOKMf0q2JViRxJbTXkh51hewiZXj5KbE0jtrt25+5GRVr
         j9avB7koolYI1bgaitHT+YWNe/RQxa/cyVjmhf/TxvujziuuYrJ6vhrqBdbrEDDNjrAt
         bYSmmbvvB3khVqys/icdbM+VlxldSdNAVkPJVqC1vqDN/M5dy40Go0mFy5qdkLpYB/Gi
         Ty/tTgDQGPtGesBdNOxwxS7IrhgL8MRQA3yBfbdqZPuB3wG/yj7Rr9F0ZHFLLtLvwGGJ
         +Bchaia1RDU2hKeW4VjR96HVZzS9HoaZnt8DItfu7DrJFl1msvd1OdPUYtMvDmDjMBMw
         DNKw==
X-Gm-Message-State: AJIora9SU7wEyOeCd1doGxn/86XT0F+aGBOlx28xM2sa9Z4pPl1MhOlY
	WbM7gaBCePFoKbgyn7RRDCv1gwzBXj+3pQ==
X-Google-Smtp-Source: 
 AGRyM1ve1I1LwPwdfHajo6ZGR+nfcTzXd5CCX7fMSrx0puYW2pMqobGUawSifSKuffofsgdZ12Mocw==
X-Received: by 2002:a05:6000:114f:b0:21d:6e51:6e55 with SMTP id
 d15-20020a056000114f00b0021d6e516e55mr2608878wrx.132.1657709559458;
        Wed, 13 Jul 2022 03:52:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5d1c:2bb3:e975:b527])
        by smtp.gmail.com with ESMTPSA id
 l16-20020a1ced10000000b003a0375c4f73sm1668977wmh.44.2022.07.13.03.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 03:52:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [PATCH 1/2] qemu: Avoid accidental libvdeplug linkage
Date: Wed, 13 Jul 2022 11:52:36 +0100
Message-Id: <20220713105237.307377-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 10:52:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167954

From: Steve Sakoman <steve@sakoman.com>

Avoid accidentally linking to the vde library from the host by
adding a PACKAGECONFIG for the option.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 070913b2d33..16674eb5adb 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -187,6 +187,7 @@ PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
 PACKAGECONFIG[bpf] = "--enable-bpf,--disable-bpf,libbpf"
 PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
 PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
+PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.34.1


