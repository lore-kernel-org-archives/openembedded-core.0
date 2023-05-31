Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F21C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 18:48:28 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.2494.1685558905562368454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 11:48:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bdiNFT+C;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f6ef9a928fso44419865e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 11:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685558903; x=1688150903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AzMVZCODreH6tZtTtuGGxpaxuxCa1RqhVV6lHwWXFYM=;
        b=bdiNFT+CIlzD/C4il+/PvQhqbRMaJzbewtvPmVmZvp+bLP3vKHNTvvaEM3lBLcLAku
         Wz0s95pedzHVO9pDmGnC2jN4ve6ldEbL46wOMZYB2vWR+QZ8YhXoXD98ldX2ZvK9Yu7z
         lD9wiBWrx/MIYpuZGVDvEDYcujyxukYByXT2DmY9LdNYE4Y/ecCO//xJKeBCT3lLYPPT
         J8izaAG/1Jc7aL6rZBOmOt6R8mtOztm83Bxpo4dP5+5NyWcK7CumQAkE1cV0b2WQfsdK
         0UvAzyQIDVddkpQh2xR68nx4u07N/pimDDkUkq1fddufXrHFCMUwNqbNjggZWnu3dfLP
         Wdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685558903; x=1688150903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzMVZCODreH6tZtTtuGGxpaxuxCa1RqhVV6lHwWXFYM=;
        b=SLffXxrOI02wAFRuLOeL9a9ocaBV1FfOudfArixElQqxMX2CQnz6/pXEywhPGnkF08
         +xVJK+IK7Ai5qV9Q8CgPOXFGNXZPAEJTB67vx5/kD1ti0fitWIxryhQyjPAShCFMXp9D
         +Bwv4zMrwoHDyIEBiXoSRZy4LB/wJFKb4ImJW6qKfHqsf+cqGhSZ35mlpOBjabL286/n
         Jo4tZo3qj1tvYOs7VLC0jGwc8/wHNMaQ1I32Qq+e3EUrWHd9PLWvyK1tlGm082a+QDRZ
         ErweYugmxlAABZ0Gc3Y1nW4b2plqUsk1CTdwTEM1Rv28FH9to+v1En4eHsEbZTBtRrbu
         DbeQ==
X-Gm-Message-State: AC+VfDxRkZt82aOZe05vCnXxVpzLqwht7eLlAyaO6TUAro6CvUvVXhW7
	+XeNlBC82AOkBN2VbObo1770Y2QunUqFzA1H
X-Google-Smtp-Source: ACHHUZ4SPDCs9ccAV8pc6uxY0Nl+A9Aim265i/jIEc3s2+qqdSAiNCPozwafAs7DEm6ycKThP0H61Q==
X-Received: by 2002:a05:600c:2287:b0:3f4:a09f:1877 with SMTP id 7-20020a05600c228700b003f4a09f1877mr83366wmf.23.1685558903522;
        Wed, 31 May 2023 11:48:23 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-cafa-c8b1-7dfd-80ae.rev.sfr.net. [2a02:842a:2e:7001:cafa:c8b1:7dfd:80ae])
        by smtp.gmail.com with ESMTPSA id n4-20020a05600c294400b003f3157988f8sm21270053wmd.26.2023.05.31.11.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 11:48:23 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: f.lahoudere@technologyandstrategy.com,
	e.aubineau@technologyandstrategy.com,
	j.guignard@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [master][PATCH] meta: lib: oe: npm_registry: Add more safe caracters
Date: Wed, 31 May 2023 20:48:19 +0200
Message-Id: <20230531184819.35329-1-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 18:48:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182022

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

NPM registry cache should support caracaters like '(' and ')'
Explanation: NPM packages can contains these caracters like : @(._.)/execute

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 meta/lib/oe/npm_registry.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/npm_registry.py b/meta/lib/oe/npm_registry.py
index db581e280e..d97ced7cda 100644
--- a/meta/lib/oe/npm_registry.py
+++ b/meta/lib/oe/npm_registry.py
@@ -11,7 +11,7 @@ import subprocess
 _ALWAYS_SAFE = frozenset('ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                          'abcdefghijklmnopqrstuvwxyz'
                          '0123456789'
-                         '_.-~')
+                         '_.-~()')
 
 MISSING_OK = object()
 
-- 
2.25.1


