Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C66C52D73
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 02:29:04 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.50957.1723084138173420039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 19:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t7UBfN3d;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2cb63ceff6dso440559a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 19:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723084137; x=1723688937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAiNHU4x+jf2llgDOVxeR2LehWq7D9ueFAbs9flje3k=;
        b=t7UBfN3d3UQwlE4KVRXk9NM3yDbPvv82Za2Wxltvkb2cdwmjN83XIIQdIzDSaHxebl
         pN2gBYUr48rjEK11P4oeydvyT1QK70qwsiCPcXEut4amwOXsGKUgr64rCAk/IHyrbaok
         VCNZJnvxcTM+F1EQSxGsqbAJNrjEWCo5ZBDzYVH+I5TZhguUvihQHKzRIhWpsNhgYRlZ
         HAnkfhkaLWUG5CZAeHSeXK4i0++sKmgaCPSrf0Ki/LMi0Z8CaTgJqAShbYEjVKcodO4d
         gVu4IbxhhMMFBRkpLn67MMBhpud6JSUW2PXw1J9DOoXUgcrrz1xxHzgQ5ODNc78jIWWs
         b0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723084137; x=1723688937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAiNHU4x+jf2llgDOVxeR2LehWq7D9ueFAbs9flje3k=;
        b=VtU40PKD7e7/8J9CjiSX4Q9+BnoN3WhTF4UkHZScpdZ2j2HZ+1/pA3MJQT/DFZekop
         WRPdUYUpH2RLCZ0ZdTFMp0B6hNycxFVA/BhTlh0YgDrMFvWVYjDBUi1F14eeUHGwUxFT
         eR4b/lhBFhshaAw/++seAJRSKp/37AtrHapxNEMoDPWVrg0Ym2ISLT8SxSmdjoqKv7jD
         Yh0a7c7PGeo/keV3SArix6f3etUEQsEgIXEb6d3z5+/e0riSCIjAZ3MKGAnoBGudlKLr
         VOzaXK2+LwWLoEd4eQ6zSR6iRuXQj1qrzAAKpB3CuHt9uuHp4MJL5hgLEod7GGrmu1bw
         D1sg==
X-Gm-Message-State: AOJu0YyT7rrO/Arcl702AuFpM/WOEqopG7fE+2XflohBrjc46p9G+y+P
	RjYHKMwxtPA2r4SPCZDh5shZWfQfzn/hKqvu9YcwYA4uacEK4ImuIXYDos4cfy3WNPjnMihth4A
	TKB4=
X-Google-Smtp-Source: AGHT+IEOY5bLIErnYmRYr6H2ncaR4CXaEbLGWcQp33XgyoWQDwABG626yj7exQs0m7aErwYepfioNQ==
X-Received: by 2002:a17:90a:6846:b0:2c9:6d30:81ee with SMTP id 98e67ed59e1d1-2d1c336ef03mr603141a91.8.1723084137510;
        Wed, 07 Aug 2024 19:28:57 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b0c796sm2269198a91.33.2024.08.07.19.28.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 19:28:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/10] qemu: set cve status for CVE-2023-6683
Date: Wed,  7 Aug 2024 19:28:39 -0700
Message-Id: <422fc84ddbe46580dc6d647eff62c4dbc8551e63.1723083840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723083840.git.steve@sakoman.com>
References: <cover.1723083840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 02:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203103

From: Peter Marko <peter.marko@siemens.com>

This CVE is fixed in v8.2.2 with v8.2.1-55-g480a6adc83

https://github.com/qemu/qemu/commit/480a6adc83a7bbc84bfe67229e084603dc061824

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 41af9ca045..3643b9a544 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -74,6 +74,8 @@ CVE_STATUS[CVE-2023-3019] = "cpe-incorrect: Applies only against versions before
 
 CVE_STATUS[CVE-2023-5088] = "cpe-incorrect: Applies only against version 8.2.0 and earlier"
 
+CVE_STATUS[CVE-2023-6683] = "cpe-incorrect: Applies only against version 8.2.1 and earlier"
+
 CVE_STATUS[CVE-2023-6693] = "cpe-incorrect: Applies only against version 8.2.0 and earlier"
 
 COMPATIBLE_HOST:mipsarchn32 = "null"
-- 
2.34.1


