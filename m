Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4D8C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:24:32 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.23306.1750875868190726049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 11:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A/CjAyJ2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.216.43, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-313a188174fso1259657a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 11:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750875866; x=1751480666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0FwAQ/a+A/vArjAsxTBS+9iXqh6ObvMdZHjS3jjuv/c=;
        b=A/CjAyJ29VBoTloyBu7L9bjkmQReXxxml1dFW2rfESyzF29OjvGV9LMQ8hO+Q8GVc0
         VSWoXo8cVHgWRnQyA7R0rZA/OwKFec3UKevMjZbkaLrGGoAAaReUvnQaqMQDz8kbHLnu
         KdSq82vzt/MotjlFaMUCoVBKzHQLMK74JtX1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750875866; x=1751480666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FwAQ/a+A/vArjAsxTBS+9iXqh6ObvMdZHjS3jjuv/c=;
        b=oDQXzdmJG5CBwsAs1DKXG2tr+9LgwaAtjxdRjEyfDYnSbuejyJk4HZGlvCzm6Zk35g
         mmnSZmWb0K87Jq+9QzKammCP/X+CQET0wr85g8KxkNL8lhxQCQi77mDvd3LecFRp4kRA
         qBZzB8FLBGw1pCikcJgAm01hgO1i3Wdt+qVvKKiuPMX/oIRDuL+vKy8UkXyXdwkbqJaD
         monz6ZYt3pEZxleAUX97O/9wbi/Q3G+cjq4CENVUlUYiRzqlVkhEbdbVUblGcSnldfld
         b8c1gFZrRfiUfHneDUfXwRpPykBKH5J/JaSQ4es8hQhzlcIzuECeMQAEC4nUeAeCoAJJ
         8Faw==
X-Gm-Message-State: AOJu0YyagSjRMAb5B9Jdh3h0uFc7iuC9qIfcVzOV860pdlgcy0hpq3IO
	AE0aDtcVxkFbP1ZCXIEyKRts51Q9mM146HFNwSG9qIo3Sppd2NC6rZi5LrViApKbbxmfGcNk48P
	7j5jj
X-Gm-Gg: ASbGncugu35dU8tsQvim2tZ4eJlbBBqwKuveXMtZAwm8Ylp3lWeeVM1a9ZUDHRPd5CV
	yRlDCoyUGhzhrQbTgrKmJxK0dCzOMcqzkrxLV7tl2Z2/1GXQBNToKf/U+JgvB1v9ySOLdif8Z6u
	XL+prJa7XKGNoi7YciVOKNiH+EHb46tL+c+K3K+GfpzAjyf71JHu1w9D3lI5gWpMXdGDtgISiZe
	eruGyqXvvLI871GfOAWsvRQ+9csw4pifJm7uVCYaGDmagek+virnZ75CxAT0r+ZTU7bSudyTlrg
	Y4vu6S6nlIUYbCIQ3LJmLkp/K1/w9NFEkFL2KiNtA6lU1Y8BmawzaqV8TGVIlwmaYQGfljJ4A4B
	aJjE6IA==
X-Google-Smtp-Source: AGHT+IENTfpeScZ1QD8ma9X5S4GDfHwdXrgaZjEawUq+hQ6D7NayxdqnZ2+v9TDdl2c9gbiCWxqI8Q==
X-Received: by 2002:a17:90b:1848:b0:311:abba:53b6 with SMTP id 98e67ed59e1d1-316d6a0db93mr762802a91.14.1750875866108;
        Wed, 25 Jun 2025 11:24:26 -0700 (PDT)
Received: from yoctolap.chateau ([97.115.154.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83c5f0bsm138325425ad.56.2025.06.25.11.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:24:25 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH] yocto-uninative: Update to 4.8 for GCC 15.1
Date: Wed, 25 Jun 2025 11:24:04 -0700
Message-ID: <20250625182404.42964-1-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 18:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219328

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 3d0f1fdccd..dabd604e8e 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.41"
-UNINATIVE_VERSION = "4.7"
+UNINATIVE_VERSION = "4.8"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "ac440e4fc80665c79f9718c665c6e28d771e51609c088c3c97ba3ad5cfed197a"
-UNINATIVE_CHECKSUM[i686] ?= "c5efa31450f3bbd63ea961d4e7c747ae41317937d429f65e1d5cf2050338e27a"
-UNINATIVE_CHECKSUM[x86_64] ?= "5800d4e9a129d1be09cf548918d25f74e91a7c1193ae5239d5b0c9246c486d2c"
+UNINATIVE_CHECKSUM[aarch64] ?= "0d75ae3cc6e8245be40f55d48612285248ad331896ca3f4c772ed2fb34239fcf"
+UNINATIVE_CHECKSUM[i686] ?= "2cbfd7ad3e1362538764999dd4962eb2511211867ae17a327b65631f64f38e31"
+UNINATIVE_CHECKSUM[x86_64] ?= "6d5e28258176c52b9eecf882d4553033fa700902e60ba80d4b7ce0edacbe41d6"
-- 
2.49.0


