Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BC8C3DA49
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:18 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.15456.1720960749956818696
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hBWI5oVH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fbc3a9d23bso24112465ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960749; x=1721565549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2PM3Ha5wWJGx9e+S5y7qs5bGrc2tRU2Twlq5CQ5F9k=;
        b=hBWI5oVHk4AUGSg9j/IOP6+YWbm9DiYUoKt2lDQrN21WfPI0TxWi7BPRtrbH/bbvL+
         QemJE3QkX5XFY5Pxi9OGCe60YCSbxmVCf9rJCn6RGM+WrDZozasWKmSg/FOutxEJwv3g
         z3AlNDUjaecB3ZQzjEXoM2ZM2O5Snx7NGZy4PYaQFKvyPvcqmDu+SI42qZJdXJCE8I3d
         ppJzsulQ/Ewrt02fmiXknHAQDfTj5Xr0R+zgIt0QpBi7k4u9WaOzjt/lKYwWfG/+JTMG
         Aw/b8hYDE6Xg7oW06CTAietlr2DgG0M6CXt2SaZzFqH8BGXM8tcla7No8cEk3853vec+
         s4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960749; x=1721565549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2PM3Ha5wWJGx9e+S5y7qs5bGrc2tRU2Twlq5CQ5F9k=;
        b=rVxTVzdadws3CxG2tT2H1zt+N2pZA26YVhUHVCoZAk8Cez7uGC9nwoWJrZqEFqdAhq
         NYAlQ/0dUfFmKAznh5+mtEd0BTL0ROwLlfv3GisiMilbn0Y3f27qEJ1bvemZLVOPYzAK
         h9A21K9dfAJ380F8dDo/EJvx4mszMt3P6OttvrsHz4OW8gCG/+eOG9ngPPIe+8gd0Oah
         mqiXXC0Dmjcx3CkR7NqpE39NSTdptbsFA0JMvQn2KHo7jE3PJA38xK8yadEP4BUWCoaV
         aELwQNuttoVlV6tjm5yXOIIVN4YcKJheoCPCTnfKKq9tqVndA4fJQnckNrZko8cBWyAw
         SuPg==
X-Gm-Message-State: AOJu0YwQHsfR1tgNCblKcFrr/Tt0FcOtHEuLUg4/f4duWiFmuOFklXGJ
	TQu0A056SvMnganERIr44yxVR2/tHasXoBG9gJ4oW4FHKaxW7xhdUfi4nOYnOmiK5xHWZBLdVAf
	Zm+o=
X-Google-Smtp-Source: AGHT+IHWo/blsEZZyvAOHTs1Cn2HmodEN50IYn1twsQIFDd6ZKT3LrYVQMoOngf+bL4CWq4Q8xXJWw==
X-Received: by 2002:a17:902:d508:b0:1fb:4f2e:8b7c with SMTP id d9443c01a7336-1fbb6d250famr138250695ad.7.1720960749269;
        Sun, 14 Jul 2024 05:39:09 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/27] libcap-ng-python: upgrade 0.8.4 -> 0.8.5
Date: Sun, 14 Jul 2024 05:38:33 -0700
Message-Id: <32e8402f9fc71a8a66c48932ad9f88336afd98cd.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201863

From: Yi Zhao <yi.zhao@eng.windriver.com>

Changelog:
https://people.redhat.com/sgrubb/libcap-ng/ChangeLog

 - Remove python global exception handler since it's deprecated
 - Make the utilities link against just built libraries
 - Remove unused macro in cap-ng.h

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 98151fbd4864fb5c6728b7faed0ad83723f962ef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{libcap-ng-python_0.8.4.bb => libcap-ng-python_0.8.5.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.8.4.bb => libcap-ng-python_0.8.5.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.8.4.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.8.5.bb
-- 
2.34.1


