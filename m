Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AE4C52D72
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 19:02:47 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.2177.1692298964413623576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 12:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=WZzgDmW2;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6424c61c80eso802046d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692298963; x=1692903763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fSJv06S+ovs9wUewtchQkQgc9sVhQT+YWpi2UAlH/g=;
        b=WZzgDmW2XbuuBNS6VeMULnp9Gi5hrnmejulnFHObDzoW1ZZgTsd38XDS52DHNQop6E
         l476/jr6vF2p72sc0bzYt+AfbN/hXgx6rwIoC5jSaafaL3VUenplsyNHJkfVrUPgy3Cw
         UJ+aP0mxNR37CY5CaxZvmZFrZRg0Z1aBbZwXkDr4R551akCcsXGWBYm8tfEKN/kLWDK2
         AW5YTbdFZBn2ZIHEG9jT7s4ZLzeMkdFt+67WfNEBnHRCDux/n08NBHC6q5tJtrL6b25K
         YvcDI2S7ZiO8vK5538PwqJAolhMw7Tg4MHr0/mn/3Rn2V5+IhahQVwggGHEhfZh7h1dJ
         /hIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692298963; x=1692903763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9fSJv06S+ovs9wUewtchQkQgc9sVhQT+YWpi2UAlH/g=;
        b=XxXDeG5wXNx0kRfBn2VmFL6Xl+7UdR36axUFsfV0AFzLk6lxnzN4YCGNbZU+7cHIXw
         nicG7KQRZ6bP9xphvCuOOz3j2IrenwBLqHmZ2dLX1jzbhO3DTeqOwZgt6vp6TW6xeTVY
         D4ebWXO5IssiAXtzz+FBbSrLB8yJqYEl2cZzVQQfkBr+6A1RRhmTRRVjAUDi5BO48Krf
         ihMBGg/lA0xwpfaHY0KocgYfPB7OYu4Jjf7JlQPUA9n0MJFkp8wNIDOuPkH/7sSncsV8
         HRE+CmtIr7Ac9ncKJ0b5SxlClgPGX4E2W1X4ON4f3tayukk4+20qquHUN+2+A6taO2yc
         74AQ==
X-Gm-Message-State: AOJu0Yy54fBpqsDGN7/FsNxtRnwjP0LusPixkMwZEIjwYj6CyuEFnX3N
	QOUaL1I0kuUerMDIzyTIxmZse/D+7wbtpwZvsDU=
X-Google-Smtp-Source: AGHT+IFXUFu5Dk+MhNTAdRcqtOHUitZelrYL58u6R5bzZALabXiJqbD3SJMkPqK0aa1yC+B3GyEliQ==
X-Received: by 2002:a0c:b28b:0:b0:63c:da35:b375 with SMTP id r11-20020a0cb28b000000b0063cda35b375mr397037qve.4.1692298963267;
        Thu, 17 Aug 2023 12:02:43 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k17-20020a0cf291000000b0063d47a29e6fsm80998qvl.55.2023.08.17.12.02.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 12:02:43 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/5] python3-dbusmock: upgrade 0.29.0 -> 0.29.1
Date: Thu, 17 Aug 2023 15:02:37 -0400
Message-ID: <20230817190241.2302457-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 19:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186334

Changelog: https://github.com/martinpitt/python-dbusmock/releases

- spec: Update License: to SPDX format
- Test fixes (thanks Marco Trevisan)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-dbusmock_0.29.0.bb => python3-dbusmock_0.29.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.29.0.bb => python3-dbusmock_0.29.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.29.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.29.1.bb
index 64e0ae8811..09bae0e19f 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.29.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.29.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "3efdb3d800386b65e8854d8ee4538764241382b4e664423ad7d959c9008dd408"
+SRC_URI[sha256sum] = "b03590057c236d352c38973f4b71ae2c97b3a1cb1dc6f03278ce4072a3716a74"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.41.0


