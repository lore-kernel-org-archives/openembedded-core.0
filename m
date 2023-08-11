Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A92EC001B0
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 10:44:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.39835.1691750648908903295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Aug 2023 03:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VAjHORiN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fe1e1142caso16960245e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 03:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691750647; x=1692355447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s9V/nmtSlj/EY0ENg6M7e6i/3sFWh3sHKjx77yQ6FB4=;
        b=VAjHORiNYXuxPIx4f+KbjqBmHfn1Mx4I2vLeusupWUPbBwElbcbLNOrUgcyIJSqCAd
         I777k/Y6kdpTXBMmXeYdd8BRI8WFm8TKiEvG91kOy1sIREZW4Sj4rEqjAtcF3uw0cXKt
         g6edhIxN8QkCIuJqv0RwJcaU+9iymV2iQrKPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691750647; x=1692355447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9V/nmtSlj/EY0ENg6M7e6i/3sFWh3sHKjx77yQ6FB4=;
        b=d59z/WzY7K4NeUxWVBGnR+XuMvXc6NRXzTbwRkDsow5SYhOGXtX/RfT9kuBbvif48G
         C29GR10n3qjDxoGvU7VCVXgV0leGun2P4guBQDpG89UGVTuU0crB6viCvoGc+CyHcqA4
         iizA0WHEeybdSGXj0OuFhy7DNE0yYvgM/QHFUMIGvvOPoBI1j0uMQlmBP5t0FTkM4ZtI
         zoyxtx0WugycpWs0o4NVTP4KeXRI0+1/IziALug2n8BvYZZMZvwMeun4nvJ6E5fes2/0
         DD8xlmsC+Sk2CNq7NZXlnBbR+LhkzwZDkuD55XB78Mn8wh9u55LlohHxV10yXTOZMr9+
         Y17g==
X-Gm-Message-State: AOJu0YwJ74HWPYKd7+nqv3Xg5EMkZABGRPJhX876EnLR6EZ3+TpLVBZd
	TaUUdn3Fv0X8up4MDcdGu94+AD6vaJqdyk2kacY=
X-Google-Smtp-Source: AGHT+IHJr5jt95Lsm/HVquPILWOb80XTPszeIQyvx3aUV9gTFxiOcMFY3iCRZ34LCBplhg4Y+jSU0A==
X-Received: by 2002:a05:600c:220a:b0:3f9:b8df:26ae with SMTP id z10-20020a05600c220a00b003f9b8df26aemr1254617wml.34.1691750646806;
        Fri, 11 Aug 2023 03:44:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:abc2:839a:7473:990f])
        by smtp.gmail.com with ESMTPSA id g7-20020a7bc4c7000000b003fbdd5d0758sm4801011wmk.22.2023.08.11.03.44.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 03:44:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] conf/init-mamager-systemd: Add usrmerge to DISTRO_FEATURES
Date: Fri, 11 Aug 2023 11:44:05 +0100
Message-Id: <20230811104405.17148-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Aug 2023 10:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185835

usrmerge is now required by systemd, ensure this is also added to DISTRO_FEATURES
when systemd is selected.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/init-manager-systemd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
index 7867d900283..595d1f2644b 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -1,5 +1,5 @@
 # Use systemd for system initialization
-DISTRO_FEATURES:append = " systemd"
+DISTRO_FEATURES:append = " systemd usrmerge"
 DISTRO_FEATURES_BACKFILL_CONSIDERED:append = " sysvinit"
 VIRTUAL-RUNTIME_init_manager ??= "systemd"
 VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
-- 
2.39.2


