Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE94C6FA8E
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 19:30:52 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.27877.1677267042925543984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 11:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZJWDmhEt;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id bw19so193906wrb.13
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 11:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=etBzamodxLEyY1fmDez1voAQP9Ku8Zt/G9eFZdOf9Po=;
        b=ZJWDmhEtDZCXzjDr9ETb88k+mLQznSFmn3/TwU2WGnn41O6gBtsdlS2ROjr7eIydr2
         cYfTx9PKyJFCqc98lTNRO+ZVo59NZr7ERQgwJfvQE0JbBglWVj3icgoYq0s5wxQgFD9G
         NKQKfQrttFCDodzpHTcJ324QQtFy8N4CdNN175MuAP+/lOOkhtZEY1IDwR3eVYYDMh+m
         N47Z+zw3OJac/XRDlvdiIV4SHHOJJGSc4iGIkdxCkHvSIMaL8vjjqEfgpEm8nq60++dx
         vplz/qA+RifooOoSMC2yDr72zK3R4WijIB79ky+gFwvc/87r0+tfLMvF7eFJf9iJSb+v
         qSBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=etBzamodxLEyY1fmDez1voAQP9Ku8Zt/G9eFZdOf9Po=;
        b=NY+cIMnaai72FjsqVHUOmGo6d3z4Zpob8srrfL88AZn1cyMGaxw4+pwePb31ZqClyt
         i5mFw0OiMNVlL6qOeQ8Y3bcMtFuO7qZb8gMSFrYEgBiRQwcKkE8tgyjGiZYLY5GuKdkU
         IT+/shw7Ok9yZj8NE35hSnTLMdmrn1N0Ip+Y17HAkam51QfgUd3gKvjUoFpjKmRk5/I3
         9c8kewb+0IVBPgZYmakAVm6yCE8Ru+tc09HmgBRHajh662YKDbyqchOvnmuHPnbvjvHC
         6JFcbvUG8vfWniFnKVbCh5Oeq3+riA51YOtWIMMhKRmjWR56cvUeDYEe4gxuk0oYDTRO
         mqtg==
X-Gm-Message-State: AO0yUKXQJxTpjccbkdTrW10kRX+17ZEinTwAgNMX3JAn62xtfk705kD4
	HK5YJpN8Ntrmd3b+b+DGGkhoanh88+jxig==
X-Google-Smtp-Source: AK7set8ay0LbAbNaNLKyeDMYFidV/zvtotmqGoWwlUzwFO5dUSWXjN36vSLhTsxDOMddax6FXiYZ1g==
X-Received: by 2002:adf:ea83:0:b0:2c5:6180:516e with SMTP id s3-20020adfea83000000b002c56180516emr12797781wrm.39.1677267040904;
        Fri, 24 Feb 2023 11:30:40 -0800 (PST)
Received: from localhost ([137.220.119.58])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d51cb000000b002c5804b6afasm10770867wrv.67.2023.02.24.11.30.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 11:30:40 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: add user for systemd-oomd if enabled
Date: Fri, 24 Feb 2023 19:30:38 +0000
Message-Id: <20230224193038.157297-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 19:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177710

From: Luca Boccassi <luca.boccassi@microsoft.com>

systemd-oomd.service has:

User=systemd-oom

So we need to create a static user for it, if its packageconfig
is enabled.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/systemd/systemd_252.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_252.5.bb b/meta/recipes-core/systemd/systemd_252.5.bb
index 64a3efa1d4..4eca622352 100644
--- a/meta/recipes-core/systemd/systemd_252.5.bb
+++ b/meta/recipes-core/systemd/systemd_252.5.bb
@@ -417,6 +417,7 @@ USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--sys
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /sbin/nologin systemd-resolve;', '', d)}"
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /sbin/nologin systemd-timesync;', '', d)}"
+USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'oomd', '--system -d / -M --shell /sbin/nologin systemd-oom;', '', d)}"
 USERADD_PARAM:${PN}-extra-utils = "--system -d / -M --shell /sbin/nologin systemd-bus-proxy"
 USERADD_PARAM:${PN}-journal-gatewayd = "--system -d / -M --shell /sbin/nologin systemd-journal-gateway"
 USERADD_PARAM:${PN}-journal-remote = "--system -d / -M --shell /sbin/nologin systemd-journal-remote"
-- 
2.39.1


