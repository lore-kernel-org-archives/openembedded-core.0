Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE33C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 08:24:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.22401.1656577456331552692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 01:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dGGjrkG6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id v14so26069989wra.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 01:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/mis1+xmE8q0VBfSqgNj6bEpDOrQDb82eMtDGQZO+KI=;
        b=dGGjrkG6okd9iELnvJ3NQzUic3PEAjVfskAbwEvzRFKgmniVWZSschvAGmH88z3Xlm
         CZxz+Tkvgp/uIGv4wD6dw5KjK1LjofZeOWaYbTNt0uK2UEksXDtIPwx4FOzeIyQsx9Tz
         qoaLwVrTJ3nu2Sp2s6IJuknQhH77qcCN146K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/mis1+xmE8q0VBfSqgNj6bEpDOrQDb82eMtDGQZO+KI=;
        b=wJXkA3YxlVL8yP1pYVLi3IJTd0nx6XEvykDsNmlUhtm3GGJw2L76IbVkwSxqqslK5U
         a5fFa3cVR1eEcvNFNeklRNVVhR1UiFabunAUaUXNkmOHKQ+ZkqR17qmjV+YuRLpxyzRp
         Y3x2HrXfplaQZsDUor7nWz+aV7EKmbph6e2b677E35Foi37WrayF3XaMo4W7Fop2eaBm
         Fw4yFO3jcV2Dck6RQABRE5Ovb404KDy3/Uh0EJaoD4re61fXzurHv6oQxd7TgszK/ZVc
         xnymXgam2RGnPIQJAPrE5aJxmj5K+l0wldF6tnIqRvBFNKRoUgJ/wPLr3p9Sef9Dp/D8
         OKFA==
X-Gm-Message-State: AJIora9r/PUi6YC1NgKP/IM+r1GdYCSb0IH50AYT8LzAVwovTkMrCvxm
	Z45PUR/wIM+f/SytTXuRPwArkMQ8QHDfZg==
X-Google-Smtp-Source: 
 AGRyM1tbM20irbGWt4TdOCtY2dLjk7PzpQZoIZn7d0lyt2k2s4l8wP2D3K2Efa9kWSOaiQnR7Z+6iQ==
X-Received: by 2002:a05:6000:885:b0:21b:a423:172c with SMTP id
 ca5-20020a056000088500b0021ba423172cmr7018966wrb.98.1656577454307;
        Thu, 30 Jun 2022 01:24:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f06b:8b84:2b52:384a])
        by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c204f00b0039c5cecf206sm5814474wmg.4.2022.06.30.01.24.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 01:24:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oe-selftest-image: Ensure the image has sftp as well as
 dropbear
Date: Thu, 30 Jun 2022 09:24:12 +0100
Message-Id: <20220630082412.628328-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 08:24:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167402

We need sftp so that scp works with recent openssh. Use the packagegroup
instead of a direct dependency to ensure this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/recipes-test/images/oe-selftest-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/images/oe-selftest-image.bb b/meta-selftest/recipes-test/images/oe-selftest-image.bb
index e295943ae5a..317a0712aaf 100644
--- a/meta-selftest/recipes-test/images/oe-selftest-image.bb
+++ b/meta-selftest/recipes-test/images/oe-selftest-image.bb
@@ -1,7 +1,7 @@
 SUMMARY = "An image used during oe-selftest tests"
 
 # libudev is needed for deploy mdadm via devtool
-IMAGE_INSTALL = "packagegroup-core-boot dropbear libudev"
+IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-dropbear libudev"
 IMAGE_FEATURES = "debug-tweaks"
 
 IMAGE_LINGUAS = " "
-- 
2.34.1


