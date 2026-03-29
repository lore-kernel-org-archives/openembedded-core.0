Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EF9FC9812
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:38:09 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38378.1774823888171094286
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0+6fS7ja;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48374014a77so45818535e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774823886; x=1775428686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+DU1DQqJCo0kg1Hh2Hy+9t8f8niQx7kgij3NS70Oi8=;
        b=0+6fS7jaR7ykkfyvmvLFbYMPZDJw/FBDtrhT0BlZ4ajjI7hmIy7erPBgLYN+emGb69
         TLrS0JLRrlRu8FmgTZ3mzHEvTEd71b7ZF+gkN1Vi+UY+O7DGimNd87I5v6tZHauPJ7TN
         JOehkbrduQHAHXJzipCrqv+bUHfCLGUuliuS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823886; x=1775428686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P+DU1DQqJCo0kg1Hh2Hy+9t8f8niQx7kgij3NS70Oi8=;
        b=dD5v2NH1bktwKcTg1JMSxMg5hL9V1562wDBXIjst7NW8yxNdnf4/sg8weki49yDkLg
         P/asn7unr9uNhRzkZA82xPyj8G93pQKMGGsK5dWq9wbyEoXSV984Lup2LUusj5DBVoL8
         +mKMR9fXb/vk1/PY8mfv9EOP65zAaCHLdp/23K83RMY004P00Q5hXyomr9lbzWbExOOQ
         nWEXSMlS/Z8OKNdC+UeMI/SDkBNG0hT5c9SIcoNvLNRnYaiSWM1BwJ9F/856cWuhEVMn
         OFkzaotgkbDOSlCataK23L4B/3pyWiA5ptEEOpN0nJOB3xrxEh2x8EMoO9Hs70H6GbYT
         Yqjg==
X-Gm-Message-State: AOJu0YwjzDzgugp7GxjPbA4VAQl8NIDlQdDv+9J67V8Wgp+zSGAyAosf
	7QK5uK1pMHhKlMMoQI8numWUbjXceF/+DkCfIDgrTvx52Ik/MNNMltKr3h70Y8BpnnZFFcm7BGl
	FlBglwag=
X-Gm-Gg: ATEYQzwKcBghcaRYBeQ4qmUhMYN7eeNjfz/U38kGc6znO2VG7P6YrY6k15K376QlsCU
	6YPAUfdicPhLENx5/aNH3xg3vPcJv4tAUhCQe4kMUZda5V6DI/sUS1VxYq0+G8Uq3LOZQF7kOe5
	kqyPN4x9fFuKz3XUF53FM786K0qBMiTmdfh3EbCD5WUAcV9HSiAeyju0vR04PTUVen7/8MFgqVk
	WZY+P2l2r/d8QC0u1Q/hBymer+y74WXvxFpibvmXbWexmjc+d0y8WwD5KTl8soH1T27bj25iK+V
	VHcLFGrsShWv93mPSLS17jb4QqJ183Q0FVUe5tQVGP77rTIO118PjozTMei+00RBfgsif4/XTvQ
	pqPnliLnf9fXXiYzZlQ5rgggyc4HTZJ0Da5KiGwgA88m08Lf8DCynq06VGxQHLXWu74SJxQiQt6
	UkfR31vPZrQdxmon47y/4QAe8JVLDODittgjgBMSQcArrbGJV/RqTWqbzFgX5zdoxbsnb9KGcp/
	ZaSeBoHFzHuxE0U+J8tlbSI6kg=
X-Received: by 2002:a05:600c:450a:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-48727d774e6mr181781565e9.14.1774823886317;
        Sun, 29 Mar 2026 15:38:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2471ee2sm13038542f8f.29.2026.03.29.15.38.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 15:38:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/16] yocto-uninative: Update to 5.0 for needed patchelf updates
Date: Mon, 30 Mar 2026 00:37:38 +0200
Message-ID: <2e2985c52dfdd9601e97477f26fd6c442b418ba5.1774823430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774823430.git.yoann.congal@smile.fr>
References: <cover.1774823430.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234164

From: Michael Halstead <mhalstead@linuxfoundation.org>

Solves some segfaults on relocated qemu-img binaries.

[YOCTO #16003]

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b322bc5387f3baedca5c71ccecaed08d2b046eab)
[YC: fixed the commit title]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 3ced03d4771..e9dc6c86408 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.42"
-UNINATIVE_VERSION = "4.9"
+UNINATIVE_VERSION = "5.0"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "812045d826b7fda88944055e8526b95a5a9440bfef608d5b53fd52faab49bf85"
-UNINATIVE_CHECKSUM[i686] ?= "5cc28efd0c15a75de4bcb147c6cce65f1c1c9d442173a220f08427f40a3ffa09"
-UNINATIVE_CHECKSUM[x86_64] ?= "4c03d1ed2b7b4e823aca4a1a23d8f2e322f1770fc10e859adcede5777aff4f3a"
+UNINATIVE_CHECKSUM[aarch64] ?= "a25f2174d0cefcb22af005e9bc72ac01ae83b011c5b6d6d5bf00dac979877f76"
+UNINATIVE_CHECKSUM[i686] ?= "959cc2539b692f9b9862825c7324a0fe4d061fca742f6c259f67f581c59af956"
+UNINATIVE_CHECKSUM[x86_64] ?= "96045e8b1e242c8a849426a8506c7043f354b39f2bc0035192780e8205e23e9d"

