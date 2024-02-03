Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2E1C48297
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:14:53 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.23466.1706987692356251821
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XjQugqgg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5d8df34835aso1304013a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987691; x=1707592491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yOHOf2mhClIugQG1tB+2JfT3Le+rPrOWI8NOtKFGpos=;
        b=XjQugqggDYU3bfe8AI11kXaBU98E8Z7/6pQpNeQD3ndoxEH/DmuJcD08+049sku4Fl
         q/0oGre6Ca71lt3nCBc+N8YUMVf1N97iyq+HJWyQiFLVA+vmX/l27UvwT7I+IvumxhpA
         IgZQ5KRod0yAhPedYKOxuDyPdFpX+U0rI2VGJdrtWOTjjWY0lJJL3wcQ5Ad3PpnbLfQ2
         xPFDgAz7oYKUJSqf9CNYFw6WZn1TEeoorxF9rIuWRy/gFb3N4l/3ZDUABHxqleygSblA
         r9YKag24omdCxetNPmiNlJL3qkDgeJjpVk0qEyrh3Z+LslX6tTzyrub8VDTbZy0wq9Wl
         RqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987691; x=1707592491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOHOf2mhClIugQG1tB+2JfT3Le+rPrOWI8NOtKFGpos=;
        b=PjmqRBg96gCRUyVC5d3l6H1LxISeaBDn+tqp+Q9uMPers4irglVzTOZktwiXvmXpCk
         WoROyteyTqcslZI5MCMtuHs1EOkAQRUXtqt0Y1BAtb42BwIKx6bZLZhIP+qnOyI2y7gT
         CcaqSca1EIlk3P4hWNRPy0dF0cho8T0XnCzzjPyOGd27ulx/ceJpQF5y42tYPhEJ4mcQ
         omLIgE5de5r7G2QE0Jkh36xUkzDAuTPSObMqEeHMZhCN1KtodxzgW0O5JtzWbJVkyiSG
         P5KM/gf8x9jVLPYXcd4YqK9f1PW4+fn47/Yoxgi3fHWXerGOf6aeFTHebTqltCZdOoey
         7ruw==
X-Gm-Message-State: AOJu0Yx12NPVfByrqwVETShyKGIMnw6T9u9tYtrOmr4lRk1Hp3TFMccf
	isVPjLKNq7OZnlEzcc12amALcBuc2gSjwmUVik2bp1yebzreu68ZI+EjfCJ7MTABsZzT/s8fnaW
	a7O0=
X-Google-Smtp-Source: AGHT+IGvt33YpJjFUNCwqeAWm48xmufBOwMN4cceg2mhCwd2MCmlUIZ6BF90+Hb8OKhVXuNx5VuXvw==
X-Received: by 2002:a17:90a:d30f:b0:296:5e20:48bc with SMTP id p15-20020a17090ad30f00b002965e2048bcmr3050253pju.10.1706987690818;
        Sat, 03 Feb 2024 11:14:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.14.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:14:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 01/15] glibc: Set status for CVE-2023-5156 & CVE-2023-0687
Date: Sat,  3 Feb 2024 09:14:28 -1000
Message-Id: <a7b92c9c675c2c111e0b41121c1232b2e79de4ea.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706987549.git.steve@sakoman.com>
References: <cover.1706987549.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194845

From: Simone Weiß <simone.p.weiss@posteo.com>

Set `CVE_STATUS`for those CVEs, they have already been fixed with the latest
pull for stable branch fixes done in rev
e444d2bed0ea140a574414fcd5a689867e8ba312. Hence the issues are fixed
already.

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6e6fe23c95f1d0a8a0503cb71557cf3272bf9945)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 0ef4289557..eaa6d53181 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -10,4 +10,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
 CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-4911] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-4806] = "fixed-version: Fixed in stable branch updates"
+CVE_STATUS[CVE-2023-5156] = "fixed-version: Fixed in stable branch updates"
 CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
+CVE_STATUS[CVE-2023-0687] = "fixed-version: Fixed in stable branch updates"
-- 
2.34.1


