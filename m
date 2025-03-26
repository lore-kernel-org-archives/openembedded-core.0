Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2160CC36010
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:42 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.33411.1743020981152234254
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eTtQJycI;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so423314a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020980; x=1743625780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE/Pk6nPjgys6gYFc3WoBPFDNMy6/x1KLDNCPRsOaJE=;
        b=eTtQJycIbpB8oQ0NgiEMNrpHhYF7Z2N1uV6wCb0mcowB9dSuIHBuIFORRSXRPbNzaH
         feTdW+/dktIxDTromjuPMRTh7M27/vzaFLsFlcpAN2K8FDneBdkY5tFkm+5LRdBfxNN5
         zcTMgmDEHv5N07OXzkr7CgIyrhL7iSe/h/uIf4hFuFBsY+jsz/FHbRGNn+X/CHeZc7rv
         cVIgiokPvD4caRpyoEe2hksD9ys8BSDpRmhMes6dgVGEtzgZd+Zgb8ZRVSaK0GNX5qTl
         qwR8pLvYlEpw3p379z994EvFCxV/I4K2wbDIB0JG1aq8lkmFE/PlYv3PSCVZIkqX0Tps
         3Kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020980; x=1743625780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cE/Pk6nPjgys6gYFc3WoBPFDNMy6/x1KLDNCPRsOaJE=;
        b=KImgZlPPdJYXZju6UQZEEGcoCO3JPE3Wro4wVfFbBplsNRjaR7Ihacpgm2am2wKLBT
         Dd9D7wO1aD/Ltv+qr7Kx0YlB8d0Q1Q3mj5xujeLhZ3vysR+5/C8kLwRbTFTJWoS0KeMS
         MUgnzR+9BZPixbDDj0XgIi0NdqQRr1TlJeqjyaopUb2emWUAlbtcmfSYWmBbR4aAiUuV
         7hqJMq9SOGnjbnQp+bmAWNBt4Ox89nxZmWpD5EgyOowrbTrz97GG6wzjowiyTM0wbS5W
         Nz2FYiBdJT2mq+Y6sxZkc0k+T5wcY1EcUxy8ueU3eMOurGZ0bhDDEPxWubOqc9aATBg9
         8utg==
X-Gm-Message-State: AOJu0YwLMGTpKdtTWwsyeseCznalt25e9cE4ZRn29zrEABI78JM4p/LR
	Lgi1OPcQqaMk8IpvkqJyi4/K3IcF4LojTdxUy80m8owgh3zx2MQjpoRNAGnS
X-Gm-Gg: ASbGnctTEr6BDMvFjqCMalwriUdlsaoLhSHKVx00zOBh4wABy/JX9BJ3RbhyPZFLepC
	Sru1n/EvuqUpI+su336effWZwwsQWK9WW18dpyBfdSGu2jC/IOXBhxurLitnBFVebnClmB/L5L1
	SGK0moLZgBfvM7hliJu5XZeNO7mMpfWx2u6hMMSA5AbXbGQQe2DwaBV50lCW/JUm8x5KeQ4UvFC
	1L7xw2zSrHYbTrhsEwSO2Ak02WJ8ZDqM6cBSokaQm/0gYQTrAdF6VKKNv/IvHdwUHqs+cIIIQ5s
	DuQLI2EkNnhR+f/a/ozBD+DYuCe2Qb4pzw/fVYv91IibHgBOcfH5ymz6grSKmWUOYM4=
X-Google-Smtp-Source: AGHT+IGoFxb+lIq4ChP/D9n+k86JCAUvPMFUWpBVyEnXopXHgSm31k0gmCxCKYHXROEwQ6hsnP3WlQ==
X-Received: by 2002:a17:90a:e7c1:b0:2fe:b174:31fe with SMTP id 98e67ed59e1d1-303a7b5b512mr1803948a91.2.1743020980254;
        Wed, 26 Mar 2025 13:29:40 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:39 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [styhead][PATCH v2 14/31] linux-firmware: upgrade 20241110 -> 20241210
Date: Wed, 26 Mar 2025 17:28:00 -0300
Message-Id: <20250326202817.64437-15-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213674

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

License-Update: additional files

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 843d23d03bbfb5bdb7e82177ba97a569024838e3)
---
 ...{linux-firmware_20241110.bb => linux-firmware_20241210.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20241110.bb => linux-firmware_20241210.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
index 7b23f989e569..b3be4452ca97 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241210.bb
@@ -158,7 +158,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "cc90b04cb170ac983b67b00f4ec8f73d"
+WHENCE_CHKSUM  = "0b30c661e226decdac3acd31d83517e0"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -247,7 +247,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "32e6d3eb5c7fcb69fe5d58976c6deafa0d6552719c6e74835064aff049d25bd7"
+SRC_URI[sha256sum] = "2bb035708576d076f97d4196a1c22e0a4d33fbb0210d05428d0bf4f243e99af5"
 
 inherit allarch
 
-- 
2.39.5


