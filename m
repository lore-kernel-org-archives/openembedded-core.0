Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A900E77179
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 09:02:19 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.33101.1733475737603947990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 01:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=EkkT2KbZ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.52, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e1c3e1c50so1836068e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 01:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733475735; x=1734080535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kAwNTWvghpspQQWsMUGKK7K/jr3wymOMnKchSGnaHxY=;
        b=EkkT2KbZUjpA4UFZqo4LJkyDZL1lRqoO/CbbyotCFMcEVqP8ROTsUwKTmtVj2il/zu
         lF0E7E30++dK8KONfbJHEsa675pPANUufkogk/2B8HBXihA6017T3yxa3fPz/34FGtLa
         JtGYjrxxnvLZTiHFyiYhoOJxBlGBXm+dD5SaDFapt37B4WeQWmCwkb3oXilC5BpGN70h
         3bt+NyYBEyZql3mv0iRl1klUaI6qGjMVZ2JoTEl8oloK8Gbmg0C9rOEWh2S/UUjtz770
         MGz2UEjEPZ/0ZhUNfRDO2dYLdx4cqJNtepPBslnxhXNAuDHXE7Fq/lRdQCrZSMEGtLkW
         3SAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733475735; x=1734080535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kAwNTWvghpspQQWsMUGKK7K/jr3wymOMnKchSGnaHxY=;
        b=NdkWa6MeobIYOTSNVfc+idPULc3T4VsYwM78LRce62dyZR6+ePrl8eK/q00lKV90MG
         SiIL+oHBK2v1Ff3nTLN1Fuvtnc9spSuP4QT0HcsY693Ef7Giwyp1Kx5hp5mke2ZY842Y
         D1+PvdNSmIu80AbTrGwZS7psuiCFWO7nCOELMo+NOEL3KBGKQEgzKN/JukZPV1EyAXow
         xAWNUScYzvcqZOpcWp5C/j+PYrlIIYa34c6EnEWY//7dPPVoWkEvTxMFqznc+FHU8Hyi
         LxXFtjuKz+6APQirDRsBMICpCtn/ry/2RK/UMVR4I//vDx1zZ82wOFUazyMEfiWkcfHv
         /wlw==
X-Gm-Message-State: AOJu0YzI1u6/+M8U/o9ATu7v7S6rzhkeLug2bX6mPGC9mk5xWsejW+eE
	/eJNDTtC4pSFWJqIFurCsPoYDYPiC8+bcyX85Fw1wh4hqljkbddANZeuLHGMU3Jq0gRMp5MwQAf
	F
X-Gm-Gg: ASbGnctarRbfeYyEI8BTbvESMMwfIGk/OVwpWDNPKk1c4Opm0ZKex7dP60jAhUREnXw
	quNlEek0uPs+GJQe+6H4BNe/FwZ2IXGWrt4z+AvPS16XhXGtfR274tNzYvHGYwFL4E2BMDPxU/1
	ggXaF7V+oqnW4/+szJsYqr0Begi1tt0OCVyYre54ouhi5wSGhjHtellqSItCkkJFQiyMyQzfKS9
	rt9sqOynEoMsUAchu6cSmU+wnsC0nBSubBMpg+E314+H7w1hQ==
X-Google-Smtp-Source: AGHT+IHn/xEyKgMAcrt1BmrxSk03U0V/uNxfuz0V8f0bd02NvANQhuByWTGp1WK2NjIXI/GDsHfI5Q==
X-Received: by 2002:a05:6512:1246:b0:53e:2841:6ef1 with SMTP id 2adb3069b0e04-53e2c2c23c7mr833610e87.25.1733475735235;
        Fri, 06 Dec 2024 01:02:15 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6dc5:5621:fbd1:6903])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d526b131sm89647645e9.7.2024.12.06.01.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:02:14 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-core@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [OE-core][PATCH] inetutils: increase alternative priority for hostname
Date: Fri,  6 Dec 2024 10:02:10 +0100
Message-ID: <20241206090210.12634-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 09:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208407

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

If the users specifically asks for inetutils-hostname, it's likely they
want it to take precedence over busybox' implementation. Increase the
alternative priority for this package's version.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta/recipes-connectivity/inetutils/inetutils_2.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
index afb0462c61..d8fc7069ac 100644
--- a/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
+++ b/meta/recipes-connectivity/inetutils/inetutils_2.5.bb
@@ -146,6 +146,7 @@ ALTERNATIVE:${PN}-traceroute = "traceroute"
 
 ALTERNATIVE:${PN}-hostname = "hostname"
 ALTERNATIVE_LINK_NAME[hostname]  = "${base_bindir}/hostname"
+ALTERNATIVE_PRIORITY[hostname] = "100"
 
 ALTERNATIVE:${PN}-doc = "hostname.1 dnsdomainname.1 logger.1 syslogd.8 \
                          tftpd.8 tftp.1 telnetd.8"
-- 
2.45.2


