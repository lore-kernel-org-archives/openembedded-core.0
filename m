Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BBEC27C5F
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 21:45:03 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.32286.1718055901997007524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 14:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X+KZJogP;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6f9ca219760so639246a34.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 14:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718055900; x=1718660700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SMAlzOhmC5V5D6n57qUfI3t7JQfT1ploAWkki2f3fEo=;
        b=X+KZJogPyCYe5YqCLxzSx+H0vAwY7Ex76L6gvSxkhT4/Y5K2KdLNRknWgU5AfuZJZR
         zlEXBmEyeIXDV9TihGGX9//4UAzPjZ3zN8/1JfV6nqH1BLQtf+ObQz1QtJlPLqp/Z4ti
         NIaz2p7uAqcoSlMEBlzZCDvbkyttcWvBOOqZK377HqYZKsrGTykUfmhV/yy71/+u3YOJ
         75aO9tB5zEQyvSMeDbONiee7L17FQBdhmExQcnK4PzI1gsOFLHJYvgqSaqhO3bI4Nukv
         FhffZLk2E3RWtv1lzp67+e1rSfyyXLyjKVHRwGDpbrtc1aEtLwRYb789ov5QUZAY3ApN
         8JcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718055900; x=1718660700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMAlzOhmC5V5D6n57qUfI3t7JQfT1ploAWkki2f3fEo=;
        b=Q+AnAs8KUVl5zWN1MQWnYN1XAuo4ZmqY6k3JytcN4JuHr0haa8802rBTCuhjfBie8c
         cRM1rVOpe4pq4A2yMi++QRKicqDHd3fykkDDOv5rxnC6xLGLO6fdyoKv2Bmf7JI8lsX/
         MfKr540IVNf5h11umt1mCAmFHCZw0GgiJgc+XHttgMMtQLJ+eaS1nLnStYSpEN5Aadlh
         ikODI2GLOx6n5GYCGHvZ9i7Kyqb9vyw5PNWPqAsPF2TRWG4ZEcIlGwRXdQns+lXdwm46
         kyUHB+SKyoRb24l/xhaoby51lz+EqrzmGOX0iOW2JHIb2t3hdQJSN43RlJjrx39KPtid
         xnfQ==
X-Gm-Message-State: AOJu0YwXhE8eWSDVJSPZerlqHTAvW2StFv8Be9wPPe40GlbGQ0776iFE
	R0Qb1rXjou32bH/FHlxIB4zKmQIuO6ZA4ypSXc1PBqOi8FtVMFHSesedKg==
X-Google-Smtp-Source: AGHT+IGCXpRR6mD2Ox85P203tSQXlml7vYJYL4Aol4i+F2aXbyGQdMVk48CkkX0owvZBK5OQQmxOlQ==
X-Received: by 2002:a9d:69c3:0:b0:6f9:c290:cf7c with SMTP id 46e09a7af769-6f9c290d1cfmr3036922a34.20.1718055900048;
        Mon, 10 Jun 2024 14:45:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::2cec])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f94dc70d48sm1888631a34.5.2024.06.10.14.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 14:44:59 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 0/6] Add SPDX 3.0 support
Date: Mon, 10 Jun 2024 15:41:46 -0600
Message-ID: <20240610214456.2757397-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 21:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200484

This patch series add support for SPDX 3.0. Currently it is not possible
to have SPDX 2.2 and SPDX 3.0 enabled at the same time; users may choose
to specifically use SPDX 3.0 instead of 2.2 by doing INHERIT +=
"create-spdx-3.0"

The default version is not changed yet, although that will likely happen
soon

Joshua Watt (6):
  classes-recipe/image: Add image file manifest
  classes/spdx-common: Move common SPDX to new class
  classes/spdx-common: Add SPDX version to path
  classes/spdx-common: Return empty list from extract_licenses
  classes/create-spdx-3.0: Add class
  classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images

 meta/classes-recipe/image.bbclass           |   61 +
 meta/classes-recipe/image_types.bbclass     |    2 +
 meta/classes-recipe/image_types_wic.bbclass |    1 +
 meta/classes/create-spdx-2.2.bbclass        |  261 +-
 meta/classes/create-spdx-3.0.bbclass        | 1284 +++++
 meta/classes/spdx-common.bbclass            |  280 +
 meta/lib/oe/sbom30.py                       |  993 ++++
 meta/lib/oe/spdx30.py                       | 5413 +++++++++++++++++++
 8 files changed, 8046 insertions(+), 249 deletions(-)
 create mode 100644 meta/classes/create-spdx-3.0.bbclass
 create mode 100644 meta/classes/spdx-common.bbclass
 create mode 100644 meta/lib/oe/sbom30.py
 create mode 100644 meta/lib/oe/spdx30.py

-- 
2.43.2


