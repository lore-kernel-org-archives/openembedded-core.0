Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0162C28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 10:05:09 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.5101.1741687506306486902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 03:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Edac0I82;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so7847373a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741687505; x=1742292305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U78gKnHKXH8C6KMlMfNkAt0H8S+8c9z+ztm9YwqEXmk=;
        b=Edac0I82ciYRJ8ShsXZI29VWk2aeuDWAZ4w7aymVxygtDLEFUsWRPE869nNjfpCvTj
         qTgigl6t6mzfIvyP3rNH3987/3ZBS3+fLsLIfVOTQoyQImDhQwr0F3X5schCoEOCxqz7
         c+KXpTTftWmAgkscTFCLd57aPG7JapWov6nDUD33ARQ78rKvX3XiSwbRmKzP8LTX7uYL
         3HOiA125eR1vfAtLAIZFY+M9a/gax75idMJ+jOZGaVqrDVWlYG+x75KDC66rxbG0tIK1
         EHhhz/a0Gq3fOHTz0vU2Xf0bxBuQ7m1fP60WsN7axsF9GhLuIt7VOWvGWPdpwc7TYu7T
         NPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741687505; x=1742292305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U78gKnHKXH8C6KMlMfNkAt0H8S+8c9z+ztm9YwqEXmk=;
        b=Mco2AXzBqMs6SpeHUsF/u9Ktn3yNPf39KI217u4Njfpi6H1uzBu3Ntkgw47pu8GM5Y
         A39ND+tL9CPhXa3JFMukQnxsHIwelq658z+wKhyPh3XcKTIrC4Cuv7s7vk/+Iryns3Cy
         HMSWvaOSKBpGfoenaW7GgT4K3Kt8tSzXqLFJZHWyJTDhV0QEcyDqbMactfQ1UE5HUKxf
         8fo52KQ1cafs0GZpNhaMSpCbhvWqZUIWSyywToCaBp005KGmtX478qR4Ddq2p4Mju+gr
         tiFOTXZM2ihfCWlVk6yw4OKAPsTt4mGZ8jgyh+JHxGhl24sspMh8Tc7HdMiGEDbyhwXK
         Oyzg==
X-Gm-Message-State: AOJu0YweitD8gPu58MevTerT8gbpbGgK9KhpeteTmFuNDOYfU8YpJLke
	QHaCuxpG8WHZVdDvlja+lmrfP4ckjMsWQ8KkDLpwAtoFgF4lUcMZMwcd3g==
X-Gm-Gg: ASbGncsVbkIQIq++aDVklX4iI2SOTYNu9b91onPoH3qbqtYFs1sX9Todd88YaUBFRpA
	fft8lff0a7IggodEyhYq2BlfKS1GCYVU2VgT+TiTd75fGMSzysgzJWEnmNDtwf2txr3KS4yXvYI
	dEfKKKVKeBxrneaPuK76X49VVrlvi98wCzAihbWNSrGVG3gtdNsMJQVeTq4xIg5EDrb17vZCmwe
	wYtrtIBH4EnVFenGx1Cv76V5DGBNn4ynlq1X3h69Hxv7l07Jaz+4vK1/Y9mLKsjlZwUtOvQbHKM
	/GbqeIBBtQtld7TlzgGb4F8CnIuX+hERiwfccgxQ1MawtP0om6dWTmSgEM9/boXUWkf/xXcsUQ8
	0XLt/wfdGjmnZPY8a
X-Google-Smtp-Source: AGHT+IEfcZ+FRQJOQqsiwCAdReQqiYIh/DLs6nUZVl6bN5KJY2QmUqV9TH4o3YBMyEaWLthmzrOOjQ==
X-Received: by 2002:a05:6402:35c8:b0:5dc:c943:7b6 with SMTP id 4fb4d7f45d1cf-5e5e22a9290mr21446427a12.3.1741687504435;
        Tue, 11 Mar 2025 03:05:04 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c7472128sm8074949a12.23.2025.03.11.03.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 03:05:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] systemd-systemctl-native: correctly set PV
Date: Tue, 11 Mar 2025 11:04:57 +0100
Message-Id: <20250311100500.355914-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 10:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212550

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...temd-systemctl-native.bb => systemd-systemctl-native_257.3.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/systemd/{systemd-systemctl-native.bb => systemd-systemctl-native_257.3.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb b/meta/recipes-core/systemd/systemd-systemctl-native_257.3.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-systemctl-native.bb
rename to meta/recipes-core/systemd/systemd-systemctl-native_257.3.bb
-- 
2.39.5


