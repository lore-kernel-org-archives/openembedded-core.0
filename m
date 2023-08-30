Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3E7C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:49:09 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.1294.1693417748723723341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YOxhFU8k;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-68a41035828so4196342b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417748; x=1694022548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVGkMPOKjqtIYdhgbFoAvZtLQfBl4WTfGH/oYvj5j4g=;
        b=YOxhFU8kx3d8EY9inYljB4YgaPP7GqACHvn5jbsnd6R0iBgyR/4UM71cbQ006HvQVU
         ngDI6Rgp6vBct0a3NkjEY9qGBZx2FaKWJ9TaAhPgMJrN9sqn+DSkqLe1aU10KxYg3wWL
         uKN3oeNznppvHHhUD5DaYzMpyNnqLgrfNMX1OXsBINkWRS/pg7E6LyNla+dPsQfRYsno
         p7a+cKA3xqkKf9CRjCl1oztThP/7CiSBAkVajBWKeKVcy5gQOnCmS05av9NG3kn0P0Rg
         vOpRId+/N5Z+Y+TpXXODD7p7m4oFdYDprWTl12BoR23TE85f8GODtEX7gVTw2c1qC/Sr
         eaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417748; x=1694022548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVGkMPOKjqtIYdhgbFoAvZtLQfBl4WTfGH/oYvj5j4g=;
        b=V00L8aG9nQkRQaBoubDNzTSu5W2AyQu7Jr83uHXsV2UdmNJkjrm+LrZU7nPbp9Ep3i
         5MKe3WnB6dldbkcILTqiZ7FCkdtjRFw0D/dn9fJZQBCvft6VZ4GHXtlMVGV+Hr4w3Kks
         pku8xiMF0fBOpRdszY3yAYoE/B/bKl38Se38c7DASS3izsKx/RfLJYqJKnlEkQBLQnqp
         pWxBoCYviW0sFRoWlu7/0Yc6+H/KLFTnU3Bntr2i4avpc+nXd4xxvy1IVJ96hqsF56MB
         tlpJgmB8DhActIFs5ScG5fVPyNMZDhd07z7/uMNXtpSyVHj/ngJT6iFyYf3wmhZaRzTh
         xLzA==
X-Gm-Message-State: AOJu0YyRNYIisEDorjyjxX8yvGXCLXb1xku2jEkRhjpxoogUum/iXj2f
	P231HjJ0RDKeGHdXY4r6eDNYgewk1L2ywosomno=
X-Google-Smtp-Source: AGHT+IF6AxGN/YtKr3d8gePBENuCqrbhB95Aiw77h/cil5mr+QYaz6CMXXLfZzq6iUCYaeEcBBXcng==
X-Received: by 2002:a05:6a00:846:b0:68a:3458:8e25 with SMTP id q6-20020a056a00084600b0068a34588e25mr3173305pfk.29.1693417747843;
        Wed, 30 Aug 2023 10:49:07 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.49.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:49:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/20] wic: fix wrong attempt to create file system in upartitioned regions
Date: Wed, 30 Aug 2023 07:48:21 -1000
Message-Id: <47b395fe2dc393e82d0a42cfab96d134c1397a43.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186919

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The kickstart parser defaults fstype to "vfat". This leads to an attempt
to create an empty file system even for regions configured with "--no-table"
if used without fstype when no --sourceparams given.

The fix tests for fstype "none" or no_table in Partition prepare method.
This will omit the file system creation an the potential error for small
region with --no-table option.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db771a4cd36bf291a8b68edfd905e03243f2c8b3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 382afa44bc..29b9dc4457 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -133,7 +133,7 @@ class Partition():
             self.update_fstab_in_rootfs = True
 
         if not self.source:
-            if self.fstype == "none":
+            if self.fstype == "none" or self.no_table:
                 return
             if not self.size and not self.fixed_size:
                 raise WicError("The %s partition has a size of zero. Please "
-- 
2.34.1


