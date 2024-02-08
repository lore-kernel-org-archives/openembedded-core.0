Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA3BC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 18:56:47 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.3627.1707418605957090053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 10:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aVLMZsVF;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-511717cfa62so115655e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 10:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707418604; x=1708023404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iaFTy6TZY6ccy7pTgQcw85rd9fVngpIIr/tWHSKJ9F8=;
        b=aVLMZsVFO1mVhC3yw0+I4I47PXVeEryty3YncVHCAW9oa0XItqhIXLCE3H/gDhv0GS
         IMUSE7gQuO+6xvbK9GvBWpNW5ZZCuZROzNScCUpc1wkat+ebnO/xDy2QROCGtPBpcBMB
         4EM46p3bTqsjfqNF6hP5SgkHQ6fa2f10S//fOmYdSud5/lFPSlLUKYKtlYY7V03J6NXZ
         Gab0l4tsT+Av8FwbOOia0pSnqm4q1IKg24J71fr6RUZQ5jAUzDO8aYcebjQX8UuizuKU
         O/TnKLVB1j6uBV0UTcF9HxL/yNEx98GRGSQ0vP5DcLOCOy3MwKwSMqrPt9Gf1NK+INck
         QSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707418604; x=1708023404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaFTy6TZY6ccy7pTgQcw85rd9fVngpIIr/tWHSKJ9F8=;
        b=M+ZoKHCme2vfdPFN5MVF5U/novl2kqbMEWA+ES1aWxo0GO/wTe06aIP6aIiwpCssAa
         09/00UltLxb/PjpW7SxiU5a0nFIzj5eiIcy6k76vKdVAtEZv1UIXp12LOZ7wgYkImQ6I
         V7v7AXNywkC+yAiNQCFS1WO6ZNu7PH16QjoE/TC2829Vs89eyV8oYNu9zPnBUEuD1b4O
         zhT2D3DV/TlbP0m2YXMWccDOeOEVrniZGNAPn4O4PYjssIbDLFTPPTn8oXEq8xtDYL19
         9ZSsE9nIKZmalvvI9cG27XUvp3V2ohag8UtwCJF04sRr8tTaFUzTjOB7j+q59Z8f6wHm
         sc7w==
X-Gm-Message-State: AOJu0Yz3vwA6NpWJGKj7SfRGxdr5S2eLckbsCs4lBlDPTOtXaaYMKJ11
	Sw55u29Eqfh9OXnJ4mInyCJQCsF4/7g5i05uftuzHt0L/BjzMZ8ZKd3I9jdA
X-Google-Smtp-Source: AGHT+IHpMvy1yjEFmtjTVxbRM/8rjDOa04HS2/5p4QuMpZZUh0dAq280gOwGbLkuQNhnbS1uwrDzgQ==
X-Received: by 2002:ac2:5e2d:0:b0:511:4860:425f with SMTP id o13-20020ac25e2d000000b005114860425fmr96141lfg.17.1707418603892;
        Thu, 08 Feb 2024 10:56:43 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id gr16-20020a170906e2d000b00a3843b13729sm341807ejb.35.2024.02.08.10.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 10:56:43 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] shadow: add a packageconfig for logind support
Date: Thu,  8 Feb 2024 19:56:41 +0100
Message-Id: <20240208185641.2969396-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 18:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195172

This was causing host contamination in particular, where
libsystemd was installed on the host.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/shadow/shadow.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index b8e5e285c45..16b99a0b60e 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -74,6 +74,7 @@ PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
 PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux libsemanage"
 PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
+PACKAGECONFIG[logind] = "--enable-logind,--disable-logind,systemd"
 
 RDEPENDS:${PN} = "shadow-securetty \
                   base-passwd \
-- 
2.39.2


