Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C3BEB64DC
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:20 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.26468.1688656031691820507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=moCAXtJa;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1b852785a65so5823575ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656031; x=1691248031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTRTgq2m0QYWC3Rku6iIlIfMuSlc64nKa4V3ZLCw9z0=;
        b=moCAXtJaV/EiSwP9zYx8slPRJjGRhHRTnjTc0Bf+N3WNBrbFIlUzO3OJ5525IfzNk1
         IGWj/QoB10g2MzsrPB/Kb3z8ZhGw8fVwBaX8BVLc/rmKgCEMoxwL3QvKvo5RRPiExKlz
         98pBp/ivUNThndU6jaXkxxZnjavvxwiW5Gz+Jmsh3w1Zzv7qRmFCnx5pkf6m642JTEtA
         vCANE7BGV+v8LI3zBq8RDWy6ZaaDNr+dopU0Zr8c/GCDYYYuMKRsHsl2VKxRJv5vHAIm
         SbtL/0P42e3kKXfB40DUcqpVg2sQ9mgve5Z9lw9nxmnFCg8ydUJlnuWHnhftxL2EVlnY
         UHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656031; x=1691248031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTRTgq2m0QYWC3Rku6iIlIfMuSlc64nKa4V3ZLCw9z0=;
        b=Ejw3dukFk6RryH417G4GXDxwkzPg7+i4vpyiH86GMX0bXwEHEOeyIxBEp2A6s/LhJQ
         Y7VAk6BVnENZ7exDvuLjcosnwDndzHil0HJi2KMYp/vj/92QLH+6SDS0ZaAqIf8UCXk4
         qSN/PXbQrkwwfbmYoh7xqEzX49a4UPldTJu9Z4sbt4RJQXAcBM5R7rbbYsn3NtfEtfny
         lSBjVPUG2qn7xR1hNVm0mjLFQ4YsTYjsPBVWneUWf7Bdw+9tgZCUI+aZ8RJSwXCwPAha
         7THLtYJUhuPq/kOkIKxKAtXrQX53uGOmwin7ga6v3UKe/YVktiD4vaj4kEKesVwLsRmH
         pHPg==
X-Gm-Message-State: ABy/qLZIkQsoe0m+zDh9YmYVUG32Elac7tfQlvAjWV0APlFVo2lO0maX
	/wqrMZqlfRuCSSpaxvtKQBAJybCPtHaLppeL5a8=
X-Google-Smtp-Source: APBJJlF29L4t2BLDd+ZUEcZWc5NGYnqiOaqbMAAFKOFOd2JO5I+bKgt7aWZJ0PECrrN075ZF2Awmnw==
X-Received: by 2002:a17:902:dac9:b0:1b8:76cb:c6a4 with SMTP id q9-20020a170902dac900b001b876cbc6a4mr7813584plx.21.1688656030743;
        Thu, 06 Jul 2023 08:07:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/28] meta: lib: oe: npm_registry: Add more safe caracters
Date: Thu,  6 Jul 2023 05:06:18 -1000
Message-Id: <d3c1638077d4acbd61e7770c8e1d299ea33df638.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183968

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

NPM registry cache should support caracaters like '(' and ')'
Explanation: NPM packages can contains these caracters like : @(._.)/execute

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 6110d9e24e43e286781afd1b3634a4ad1a2050d0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/npm_registry.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/npm_registry.py b/meta/lib/oe/npm_registry.py
index 96c0affb45..3f70e4f5c8 100644
--- a/meta/lib/oe/npm_registry.py
+++ b/meta/lib/oe/npm_registry.py
@@ -5,7 +5,7 @@ import subprocess
 _ALWAYS_SAFE = frozenset('ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                          'abcdefghijklmnopqrstuvwxyz'
                          '0123456789'
-                         '_.-~')
+                         '_.-~()')
 
 MISSING_OK = object()
 
-- 
2.34.1


