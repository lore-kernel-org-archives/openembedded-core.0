Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D50C41513
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 13:07:56 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.9074.1718111267567763634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 06:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jScxctFY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2c2ecd25e5aso2365043a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 06:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718111267; x=1718716067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L46MHHje+fscvJe3u7fg/B47wrrXLFYcEaKykHlrvj4=;
        b=jScxctFY6O+SmGyb4BbKkH0ojVZuS8AHm8huiQHCcZaj9zbkcT4ObA6Hztd/oFdqwI
         dWWefYAJBZ6flKDxRjZLsCc9tHG4FfE49javxH0eEOFrZ/5HIe8bokpwz1dmJdzYdJAI
         ZHA0gmMWkkpm0zqBme5cT678KTZXdP85ShS3UitwpWxsOnDEdI0xWOhdET4LYzjdgtFP
         fnO+Mbee4pC/bm3/JHlyoaHsiVHKZcRujJ6hQyZJXjPyMQ3yz9h0ygqAg/zUsE+U5nS+
         SGrQP14qCTuoc+VXseR7o/pwz8a5D+d6PrxruxNu3XYkdtGvf9lslJtwlQFhzuWnAgvf
         Nvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718111267; x=1718716067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L46MHHje+fscvJe3u7fg/B47wrrXLFYcEaKykHlrvj4=;
        b=b1+ictstTVTQhHQ8YWG7nDbnWRWJ6OrN4kXVvyQowVjijx4D+Rg8ShmRC6x+eps5tU
         6xIKnfjh6bKyOWpDKE6/JSFVTwLtHA3QmWML0+lbt1aYO2bn5hOKeOnqm/CjsfBqPakj
         qa/u1rsVjTwGcmYbIyKGSGnt8Q2fZmaOhQK/H6L6QAJ/y16bScwIAZ1cdP+5W5upEX/h
         4VUPpQGwrS22XYRQD6Dz14Wo9xsNOs9Mt8basn4KJvqqz9/GgHGJU5YqjpChjBYLrV0G
         IsFH9ItCqZlwnOJESYev5wjbHQuDqd+ayyZBH7gVz+xYKUut85/5PqnFezV0sy2qcNWE
         YJKQ==
X-Gm-Message-State: AOJu0Yz2tAgsNy1JGbLO1CLMuYwwQe70R8tEUfaAzNHmzjLPp4WGYKvH
	A48KlhwN5Kaqh0wbckk2+dySgJWe8UjjPJUpRiyqp7tc8mcUgo+wT1b4sObazH18kPFN8cHzkTe
	H
X-Google-Smtp-Source: AGHT+IE5pi9doesXKjeRsSuPZqlPA2yVS5pY6HWOWa8tg1BZYkz5xaOnBz/8Cn5UHwzbuWF8+fyQnA==
X-Received: by 2002:a17:90a:c28a:b0:2c2:fd6b:cfa with SMTP id 98e67ed59e1d1-2c2fd6b122amr5970328a91.18.1718111266802;
        Tue, 11 Jun 2024 06:07:46 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c3076dcf04sm4380915a91.48.2024.06.11.06.07.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:07:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/10] run-postinsts.service: Removed --no-reload to fix reload warning when users execute systemctl in the first boot.
Date: Tue, 11 Jun 2024 06:07:22 -0700
Message-Id: <bdad9d3df6e9e4834803a60af24c072b39d5cbf8.1718111104.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718111104.git.steve@sakoman.com>
References: <cover.1718111104.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 13:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200516

From: Lei Maohui <leimaohui@fujitsu.com>

This warning is because after systemd has been upgraded to 255, reloading units operation is needed even when "enable/disable" units by systemctl.

(From OE-Core rev: 28a7064403f2433ef3cb4d52b03dd73437f2d665)

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../run-postinsts/run-postinsts/run-postinsts.service           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
index b6b81d5c1a..1ce19abcaf 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
@@ -7,7 +7,7 @@ Before=sysinit.target
 [Service]
 Type=oneshot
 ExecStart=#SBINDIR#/run-postinsts
-ExecStartPost=#BASE_BINDIR#/systemctl --no-reload disable run-postinsts.service
+ExecStartPost=#BASE_BINDIR#/systemctl disable run-postinsts.service
 RemainAfterExit=yes
 TimeoutSec=0
 
-- 
2.34.1


