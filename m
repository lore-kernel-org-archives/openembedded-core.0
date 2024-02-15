Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D83EC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:38 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.18125.1708013909411463036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2gMQyMOg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d731314e67so8204155ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013909; x=1708618709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/rgXKnXJugz6ajKwuHtPI7lOnDn4lsn5mkhwCqwCsA=;
        b=2gMQyMOggbLHgoDJq5T+/hMzkymiV2EP5lQFvUtii0wSawSAbkPl3khQ75VqPFO/Ea
         jgU/4Q0wZA1cWBM4pAmoFwbzssTwhq16IDCYHNvm73dwOZlFM4pEfnutNB8Hx1luzBDI
         cK+YD8n5RC+sGb8ZkmAm4QXIw1SKd3ID3TadeMztp6s7xHc+ewOXScDp3dRCVwdyQfto
         9D3+3WXCJBwxkEUnnSTYo7w72pWsDuyk0FkykmHGoFVtQvpM3LKej89JFNwl+rN1SiQc
         WZknL53CGCdN/rhdZIYMB8BTfAQuRAXaPe4tg8SCbikIItC/3Kh3kdHdgsstcN+uL2ax
         4ByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013909; x=1708618709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/rgXKnXJugz6ajKwuHtPI7lOnDn4lsn5mkhwCqwCsA=;
        b=GYA1DTAQYPwiZm5W8JhtDEY1k6ZCrkxjhACsworeAB8VJm55NZSU1EvBsAMmzjCmN6
         aTEoxZRoRgEAaCmJhVpCFTHDOFEVcI+KoSyzHFV94jUir7WLKXdUGT84AHo0lA4fKOy+
         o5jHDTn03wNSsUwJF7Id6nryUgca1/trfxbD/ldcsuYzoGjyG7HO/gkStlkfljheQmFG
         /VEZopjipMElGMLQUOnt1ewJyU4bxw7ZYIA9VpCTIyjyR3ngTtVpT2dIztJ1+vNxjfdE
         g9aq+pUCzuLhBF8wU5G+KJ8FDFS5h18m4QMKB9IYIQL7mc9sz9SYy80FKp6BOM963ugj
         SVtg==
X-Gm-Message-State: AOJu0YztrcV5jR/SZ94q85bkcA2iP/YF+/waDmiXlJsSI2wBcFgEW+oo
	IK28WQ4lYNDP8SwTZoAvffrTVZKJ30kTLznx7FgbCNiz9aoR88YAaX8y+K2bDBeN+B7hxpXBK7T
	B/iE=
X-Google-Smtp-Source: AGHT+IF3haLjodfXCsrK6gi+EYxx0ARoMtfmoWcPf75xsaL3BXqUMIdcuONyStiJm9vP3vtCWfh/nw==
X-Received: by 2002:a17:903:40d2:b0:1db:8fd6:bf98 with SMTP id t18-20020a17090340d200b001db8fd6bf98mr1983025pld.25.1708013908728;
        Thu, 15 Feb 2024 08:18:28 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 09/21] glibc: stable 2.38 branch updates
Date: Thu, 15 Feb 2024 06:17:52 -1000
Message-Id: <07847f5945ff67340803149242a629741d619bf5.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195529

From: Benjamin Bara <benjamin.bara@skidata.com>

Pull in fixes for CVE-2023-6246, CVE-2023-6779 and CVE-2023-6780.

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index eaa6d53181..212f960cb5 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.38/master"
 PV = "2.38+git"
-SRCREV_glibc ?= "44f757a6364a546359809d48c76b3debd26e77d4"
+SRCREV_glibc ?= "d37c2b20a4787463d192b32041c3406c2bd91de0"
 SRCREV_localedef ?= "e0eca29583b9e0f62645c4316ced93cf4e4e26e1"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
@@ -13,3 +13,6 @@ CVE_STATUS[CVE-2023-4806] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-5156] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-0687] = "fixed-version: Fixed in stable branch updates"
+CVE_STATUS[CVE-2023-6246] = "fixed-version: Fixed in stable branch updates"
+CVE_STATUS[CVE-2023-6779] = "fixed-version: Fixed in stable branch updates"
+CVE_STATUS[CVE-2023-6780] = "fixed-version: Fixed in stable branch updates"
-- 
2.34.1


