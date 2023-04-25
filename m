Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D36BC77B76
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 13:58:18 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.80360.1682431083433556809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 06:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=J7aqwLMH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-63b64a32fd2so7617157b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 06:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682431088; x=1685023088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/Q7XZ9241wL6co8T3NtKavvmsjEXsPjTNExTOBWxFY=;
        b=J7aqwLMH2gDZu1ocMx9AA04q2qIWi+oHvk+zcVPDlCZrNpphCWnZuUJ4N/nm3K1ECF
         wVudXfVVd6rXM891xsV35Cs78yHieg4e4v4RHJyh2GqKADX2WkCyn6Xb79AhPNymsaKP
         1KB15IJzJVUNf1cTLkCYanSm52jS+Yp5tE3pSFBbSVrHW8v3qJleN86saL4e2qcMgJkL
         8Rhsyr1mnUdeCeoPpisHC8D3818cT+bUalzhMwVLi/kK/HM7qDO0lKnms3l8onjFf3bq
         D/gCUV1E8EGY4mxW+PVcPFL8mDfAHvn/GFbYb/R+o3+3NdyK8Lny8l6wFMmGcvBYjOK8
         ssqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682431088; x=1685023088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/Q7XZ9241wL6co8T3NtKavvmsjEXsPjTNExTOBWxFY=;
        b=XMg2c36XOew8jbJecfzLcAT3bMu54mxwxBzE5goqVErXDFUjXoUb9EvmFHPgnPUmrz
         cJBgxXdVqIncaxFinCPTFHekFEVXTxaJts37A7ExQVde0sVJthRmdahSvV3S7l1AQIyi
         +pE06ZQKCKsTeKv0i4eXKy/IdzDzSFEXNSnliek3TOClbI1GNmEvoSpWy27MB1jQUdPH
         vGZji/dstyg0Vjy1mU5tP9buZ/u4fnXUa3M0ciwpttDyWlZuB+y4NAD9YQZsQDAY+AuH
         sN5Gvrz/dlBkPu9n6F9zIzAoW4AZcs80rn1naa+Eg4ov13OAY5FeQpRDqPsV9xn+LNxL
         K/ig==
X-Gm-Message-State: AAQBX9cGcOMCZlFrGjC8q95R6hgDi4pyd/N8m19eMdPdB5DlR30N02oH
	w1er0OwsfbK0CHYRcWZ45ms53xSmzVYZwOwry+0=
X-Google-Smtp-Source: AKy350YUc/ArKu84KmI2iDHQHkNvUQ4xyMYo3y/vQxJ51arEJODocVY5v0qC8zkAOTxi3p32pIeYnw==
X-Received: by 2002:a05:6a20:e191:b0:f5:4d31:6193 with SMTP id ks17-20020a056a20e19100b000f54d316193mr7124126pzb.37.1682431087580;
        Tue, 25 Apr 2023 06:58:07 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b0051b930b2b49sm8229117pgv.72.2023.04.25.06.58.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:58:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/10] busybox: move hwclock init earlier in startup
Date: Tue, 25 Apr 2023 03:57:38 -1000
Message-Id: <0f8cd527966f22c3fa19d6efd7ff1524f3630976.1682430831.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682430831.git.steve@sakoman.com>
References: <cover.1682430831.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 13:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180382

From: Chris Elledge <celledge@siteworx.io>

hwclock.sh had default update-rc parameters which made it run after
other tasks that work with the clock such as connman. This causes a
time obtained by NTP to be clobbered by a potentially incorrect time
in the RTC.

Provide non-default INITSCRIPT_PARAMS to have hwclock.sh run during
the rc startup before runlevel initscripts start.

Signed-off-by: Chris Elledge <celledge@siteworx.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3012bac35ada9a9f66d9e6e2fecaee09527b9d44)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/busybox/busybox.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 62dc839245..f5d7c3f9c8 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -34,6 +34,7 @@ INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hw
 
 INITSCRIPT_NAME:${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME:${PN}-hwclock = "hwclock.sh"
+INITSCRIPT_PARAMS:${PN}-hwclock = "start 40 S . stop 20 0 1 6 ."
 INITSCRIPT_NAME:${PN}-mdev = "mdev"
 INITSCRIPT_PARAMS:${PN}-mdev = "start 04 S ."
 INITSCRIPT_NAME:${PN}-syslog = "syslog"
-- 
2.34.1


