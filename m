Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE71E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 06:54:58 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.14205.1733986489564674706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 22:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M3ogKSzT;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38632b8ae71so149678f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 22:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733986487; x=1734591287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BAmG3Rdrm2/+mOTyhTX0jbF06SPTTDDdR3hHVPP2x1M=;
        b=M3ogKSzTJHfczpiPqbQw6t49noXSqAJwd/KRaIxDJNxe3NTDaUL+/u8BRUrYEpSKZ9
         Akd0HF6U2wvnekTflipTdwIwLr5NivYYqvxIWhQZ9nZSo8vRDNptP4UmE4mjguZCrTq+
         Ui9KvhzZ0vHJxITP7iBUnKH9BJclPiUIQQHd3T72vMFD7uwxW9IHMKdJ+73dznV4jNKE
         aizb7wzuQgBQi2tJ2CWBJ+6g1Lj14KGIcadQtsPn2kiRlsfr3qcD+BdkZ/F257i3Mp2M
         VEP9dDty8glAJiJooccQOqLLIWYYoAIbCOKlpcW/efL74SaKH2w30CMM2r4YPwbxRNEo
         cSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733986487; x=1734591287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAmG3Rdrm2/+mOTyhTX0jbF06SPTTDDdR3hHVPP2x1M=;
        b=u/Nh52Hc2swApHn/ZEa15OzAzRTi2fMM7gH+XLiiYaI/35ZSdjVuQfWG7XEsmr1aBk
         vW1OKKzZjKP+NhmggptsYFgLbdYiuv/lskkpS9OKrgq2jFbZDbeXKbdhuWWG+vkK/NrV
         71RwfRgXeTyvGf1dGOK3KkjJAxENLsou+WThqq4jEQWk2Gr/lOv8OgndmMO5EKN2Vf1V
         cKs51bK4QK5JkaUIzPvoOZyuEUOfL/NqH0xkcOVHYZj8KUMhbHuyMgkfqLAFCUQuafud
         0rEtpzf4oi55mS1YQQjSwQnjd5tDRPyVuZ/yf8hcnwx8OnIg5i5Py9bgY3IvQWaNaVKj
         Lmpg==
X-Gm-Message-State: AOJu0YwxiHbWNuG6VDsa3vk0pQzYqBTsbOP1WuLQqCZednamjsz4pKk9
	2cCtXKwLfGsfz1m1OuE6NGlGtjqwPKpL7eIjHxQDcLi/XiFXNqjvAxE45w==
X-Gm-Gg: ASbGncufWw5TsOpKobOO+OlmpaCTMPKZtFFlBOonTShfb/6CFWIcMvAtjBIrhBh6esI
	u30KiK71ONW+YLOWfXsO1JN0zLEXMM9983SwFeK5SCrJQhJSo12BbY3flPYsP9OLBBiCeUJgha1
	BdUDJkbXFCMERp/n8pqnWF3SBq8pWQizLkYBcaGz43dcO8xTb9P7ceGKelyujpwBlM01aeB+djc
	Md6HTOuARP3W29XO4/CzZNRWExASt+AXaFuwJa9j648vjJF6FuZPIxUTwZO0DvV0AKWRw==
X-Google-Smtp-Source: AGHT+IEXL057Adn9s7x5wFkb0+i0LEFFvSllH2ahhlUZoTfdgGXzKCJvchbQvV0rKwC1jZ5gDO1MJg==
X-Received: by 2002:a5d:64ab:0:b0:381:b68f:d14b with SMTP id ffacd0b85a97d-3864cec3b5fmr4429837f8f.45.1733986487040;
        Wed, 11 Dec 2024 22:54:47 -0800 (PST)
Received: from voyage.lan ([2a0d:3344:23bc:5a10:70e8:c835:72ed:f8f5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514d35sm3154021f8f.74.2024.12.11.22.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:54:46 -0800 (PST)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [RFC v2 0/4] Allow choosing the NVD feed
Date: Thu, 12 Dec 2024 07:54:18 +0100
Message-ID: <20241212065435.15582-1-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208621

This series is allowing choice of the NVD feed to use, you can
configure them using the NVD_DB_VERSION variable in local.conf

Available feeds:
- NVD2 (default) - the current NVD API v2 feed
- NVD1 - the old NVD feed (deprecated, but still working)
- FKIE - the NVD feed restoration from FKIE-CAD

Marta Rybczynska (4):
  cve-update-db-native: restore
  cve-update-db-native: update structure
  cve-update-db-native: add the fkie source
  cve-check: allow feed choice

 meta/classes/cve-check.bbclass                |   8 +-
 .../recipes-core/meta/cve-update-db-native.bb | 405 ++++++++++++++++++
 2 files changed, 411 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/meta/cve-update-db-native.bb

-- 
2.45.2


