Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 909A3D2E9EB
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 13:17:09 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.59040.1731331019217988018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 05:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=DkHqY6pd;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53a007743e7so5366323e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 05:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731331017; x=1731935817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Tv+fJhw4OPZRxNJl7wQgRQbP8RGj2pujsQAFBwm0sY=;
        b=DkHqY6pdZ7CtV2mbgEA/rULzac3ZEHoAu+gH7HrM8L5aGxoBXnWuYCactibFGmQRyj
         q4K1+l1NxXGPB9CJ1CMR/Nze5pZxE7DwV9u2224XLHVs9CfPk6vQ7R+KsiibuDyJpe4U
         Dnd6zN2fODfCwLR5iNXLTdQCuFRHV4bVlai6A3qbNlvZqaLmws1kPCNvkuwyK9myrpSF
         6w4bJkNZ9g7P1Lt9X2ZHpEFgcFlZqx2KhHvzCXh6/CnkNSpolJj/kdN0CtPi/Q2rd3Sw
         0625+uH9MhGFBuXPtfeSNXQuzqqJhPLqNyWH9eipjzCzAzQ025IzBumFyfWjTOeqa/2R
         SNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731331017; x=1731935817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Tv+fJhw4OPZRxNJl7wQgRQbP8RGj2pujsQAFBwm0sY=;
        b=O7EvOJpqwzhje4MI0p0wy+z5JaPOrGkRETo55JhJFZupXuOQnAyRBQ4ty7pyyHhjsx
         MH1M6u3IwkDvcP+Z1NRB/t8NZqpNIygNYJsda0f9bNt11M+4H1q9YJYA0P2pxvzE8eTl
         6ZYZzGClmgs/enHBFHcfDimaN3/4Nc8i7NSwaXtW1WRPIiuLwWecU4NpKMKKFiHrl17N
         r/y1JKVDf7uCw5k8pTBbJkexixbctuaw23W31z5VVUhx05fo14xaXMvnNQ0HtpKbiMEd
         /TUq/FJBjz3z9zjstwZZXs7ZAXB7U68zgXtYuabKqa3l/9S6qZoAAM+G1LpCZDvJbQPq
         y1gA==
X-Gm-Message-State: AOJu0Yx5dzgDmup6CYf+XrzH1SswNh5LJdAALroujoGLbmA5MiEpbmEY
	L8tcSSfZs6dyI41hjIpxPLR02R1nILNC8S5ZBy/5hgfZSTaQGMT+NQqPyzo6l2yJwJkemNhl2IX
	i3sM=
X-Google-Smtp-Source: AGHT+IFIPGnR1Hq/FZaeWLulLQqA7JVzF5lduDpBNnMU/C5hpjTjIsZ2pWPfqfWJnRwjRsZVAAlLiQ==
X-Received: by 2002:a05:6512:3e15:b0:539:8fcd:524 with SMTP id 2adb3069b0e04-53d8623fa76mr5339669e87.30.1731331017350;
        Mon, 11 Nov 2024 05:16:57 -0800 (PST)
Received: from localhost.localdomain ([95.214.66.65])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826a9dc9sm1515554e87.208.2024.11.11.05.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 05:16:53 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/3] testimage.bbclass: capture RuntimeError too
Date: Mon, 11 Nov 2024 13:16:04 +0000
Message-ID: <20241111131604.364308-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241111131604.364308-1-mikko.rapeli@linaro.org>
References: <20241111131604.364308-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 13:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206955

runqemu can fail with RuntimeError exception. Non-cought exception
causes cooker process leaks which bind to successive bitbake command
line calls and that can cause really odd errors to users, e.g. when
build/tmp is wiped and cooker processes expect files to be there.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 19075ce1f3..a9b031093a 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -371,7 +371,7 @@ def testimage_main(d):
         complete = True
         if results.hasAnyFailingTest():
             run_failed_tests_post_actions(d, tc)
-    except (KeyboardInterrupt, BlockingIOError) as err:
+    except (KeyboardInterrupt, BlockingIOError, RuntimeError) as err:
         if isinstance(err, KeyboardInterrupt):
             bb.error('testimage interrupted, shutting down...')
         else:
-- 
2.34.1


