Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386FFC433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 10:22:09 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.7339.1634206927758681188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 03:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=clTYK+k+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id t2so17828319wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 03:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vGpXDmJuMDsvplLtb2QVC5TM5nFLy3oxYqIvn89Y4SI=;
        b=clTYK+k+rVzmAs2w12KwkTUDiTANx0Qbe8szoJF1RuC3nb7sGcOYCdozIBLk8ODvMs
         VtrbytuQM1tCyowp8/hslGsoES6gfz/3iyGNKoVlAOru0JN/94Yv3B0IQ89C+uUzuHet
         Uh8kV8Xq5Zvf9loFrPNQkGeV6HUbnXa96wvJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vGpXDmJuMDsvplLtb2QVC5TM5nFLy3oxYqIvn89Y4SI=;
        b=UBgKfCPhz1gq2hDM9hcBPFJ1na9jfpRST7ay3WyBNxlayQgRo1z6/HXmLbqQ73w6MD
         2JfUzhCe5iBrHMhS441EU/QDy/hV20YgRp+9oGF6pljpXTOfI5yoYjrgCn/IpdqLzgJQ
         +JwheWY9tgAD0i9iHgeKFnHxdXwq6CpsLeH7ED7LD+cWob9g7BRQCINbY6/VyGOX1Fgh
         EVZH6NPa9OU7A+e+SChwUNBWJbF8+bMuc9268dIMebd5UhpvG164DuBxIl/1N8a+jFqt
         suJYIKbKeYBL27ot9fjaLcLPq/M0ydx3mqMy8eP6DqSh7Cite/5IoVIMj6DfUY90JrzM
         fUXg==
X-Gm-Message-State: AOAM532sy3k/LQpcoyBv6TcSPYz4QoExRMZsGwYL/WmuxgBqY8LUS//S
	Rd7nGhOYoIXNAXj/6T3JpMe/B9Uxun00DA==
X-Google-Smtp-Source: 
 ABdhPJyVo3zreDS2B2Y9fodLI6dmb408/aoFPTsgYNhlD7XzBqMU0uyYqKyA6YqDPZg59N4/NMq4pA==
X-Received: by 2002:a7b:cb10:: with SMTP id u16mr1214671wmj.65.1634206925860;
        Thu, 14 Oct 2021 03:22:05 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 n11sm1906704wrw.43.2021.10.14.03.22.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 03:22:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto-dev: Ensure DEPENDS matches recent 5.14 kernel
 changes
Date: Thu, 14 Oct 2021 11:22:04 +0100
Message-Id: <20211014102204.2904559-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 10:22:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156932

DEPENDS here should match what 5.14 is using.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index f58b5ab0b86..005b6887789 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -38,6 +38,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
+DEPENDS += "gmp-native libmpc-native"
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64)"
 
-- 
2.32.0


