Return-Path: <setairidis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7889C7114A
	for <webhook@archiver.kernel.org>; Sat, 14 Jun 2025 21:03:49 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.17432.1749935028261045611
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jun 2025 14:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SBV2vLsh;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: setairidis@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ade33027bcfso517921666b.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Jun 2025 14:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749935027; x=1750539827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PR6IynR8lAGxG2+bYIeWpyL2lfyc054Qmg0/QKvDK6w=;
        b=SBV2vLshhBLoEfHyWyEPSsO7fo9qutFCrnObaYyCND/64j5Tp5yyxaA2T4VWQZlVdA
         PESldsGCptN0un212dso6J7v3pzU6AB3FIXXL2bs404x0trXVztjaEHRwMnGe3KSNiRS
         3OMy4O8sUU5iCqCM3uZxG48hHNjfhsh6RSPV4hHW0A7+4QoFQwMSiKxSqcTLNnonE7lc
         lGa+mgdtQGRq1lmuzdnzzt0+alSfC5HuZcA9vHrN7XGBFpmgWtXisHrIlSINgrdUqr0Q
         3OLX41zlNVFHwAbrQOwrZ6/4PwmgjmPpg/Fja4xEmL2c6TQiuqqmSJJ6p80TpMhiGV+9
         j9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749935027; x=1750539827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PR6IynR8lAGxG2+bYIeWpyL2lfyc054Qmg0/QKvDK6w=;
        b=NX+LDEdrLu6U2w5y4QZnTVIeJ0VYLpWBI/ZrKZtbMUl4kpuFMYhT+NWhnVtr6HaiPU
         LXOjwMlQN0rqs4Ben92OCi/EF00oLeKlLfEuqZhR9yfW1yg6AK8OK9+qv2gHm9krF1Mk
         moLSBs9t4gVy6j5Bvf1LRLwnRTm5SXJ+M1wGpfxvaE42qewcFYvEYwp4Evgg2rclurno
         jywpPaDk+O7MN4Z0eqOxMvf373s8Cgpl+Z1GctFZg/7WtTgrJpmx28jfwpoepwdnAet4
         WFFfch9YvboI8VF2ey3V9n2mJ01bOn49uIJuL/eePMmS0x+Yfn7Jt933y9guvXVe/d4a
         fwrg==
X-Gm-Message-State: AOJu0YwVYfNRad3kp3LhHt8CMa/UvL2Q2XTeB78D7WtrXg2AbOAaHa8S
	djj6ENFRWzJakI9CMj9FNu4v2pXlF8DKKqHoWwPQvDj02d8JPCuBUqHiPWAm4MjaU7M=
X-Gm-Gg: ASbGncvqpI1q1Qo421+J10GMGT9YDZodOCIugqyOO9Dv8I+TfTwyWg86st8yaxCCvZD
	tbGocoWtML5gP7JnbeZ/MdASmLD90djmu5DyrvXhpvyocQPgZh0DgqXzMtkKOCWZBRM7jxIHCw6
	2e2NbKGlViKuXqfu1blQzA8H1yr+gOqOZ11LsfWkwPB14zCbd2AvYWhM779leHGTDfYvBxk+tZO
	5iktii4ItW3YJLHjHvZMiyiF9zmejkNTfU1RYkwZ0XlLXAxgMIdJileymCUH+SHAxALXsl0B9eJ
	b9K7y5YvML7LRGqtHEGGCJDJ/66xxsRDTOA4oXfRBHv5Ia4WIF9PmNC3Lffdg24Cij6JQ3Izejf
	DglD0pnYrWqKNXGf7UdZ8bdEmSKHpX04QxttE4dCT1gGIK0YhgpBYRWLbdQA=
X-Google-Smtp-Source: AGHT+IFfgg22QDt+seIDncOZ3YHXOI4sZhcMQrCAF4ZY++y7cCIUr5iSJH8IbbW0pRYUngPQrWaErg==
X-Received: by 2002:a17:907:6ea0:b0:ade:31bf:6119 with SMTP id a640c23a62f3a-adfad29fcbcmr313044966b.12.1749935026343;
        Sat, 14 Jun 2025 14:03:46 -0700 (PDT)
Received: from DESKTOP-LR19VKC.localdomain (ip-095-223-184-217.um35.pools.vodafone-ip.de. [95.223.184.217])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c1fc2sm365722166b.59.2025.06.14.14.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 14:03:45 -0700 (PDT)
From: Savvas Etairidis <setairidis@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Savvas Etairidis <setairidis@gmail.com>
Subject: [scarthgap] systemd: Rename systemd_v255.21 to systemd_255.21
Date: Sat, 14 Jun 2025 23:03:18 +0200
Message-Id: <20250614210317.1303-1-setairidis@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jun 2025 21:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218644

Pumped PE property to two, since this is not a version bump
but a rename. The recipe was accidentally renamed with a 'v'
prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.

Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
---
 .../systemd/{systemd_v255.21.bb => systemd_255.21.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/systemd/{systemd_v255.21.bb => systemd_255.21.bb} (99%)

diff --git a/meta/recipes-core/systemd/systemd_v255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
similarity index 99%
rename from meta/recipes-core/systemd/systemd_v255.21.bb
rename to meta/recipes-core/systemd/systemd_255.21.bb
index bb9dc3da33..aee677bc87 100644
--- a/meta/recipes-core/systemd/systemd_v255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -2,7 +2,7 @@ require systemd.inc

 PROVIDES = "udev"

-PE = "1"
+PE = "2"

 DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"

--
2.34.1


