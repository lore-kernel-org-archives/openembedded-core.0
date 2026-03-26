Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D5310A88FC
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 18:15:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55231.1774548900155409861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 11:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g64KUUDh;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so13249185e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774548898; x=1775153698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xYx6+4w7jX3M6Aoup4NUI8Mc3h5JJeX9em16Jcc7Fk=;
        b=g64KUUDhpap6MpM/03fX/7Qle524GmX755yJJjqvS5l28olIRaZlJom3TU7rTkC7hg
         2rIZ9QHuPPwpIpFEJmE6hrNt4WnXdMV9sWXDBLc5VfZqByD0hNDY8adUB6cPNTT3M4wk
         pkRYpWM2QYi0gfkgHE1wzAN9Iju3Cn4G+L1nu4qSsW5DqoKvZqCa+FyqBK1Ht2cxLeiq
         VkGde/Piqy1beajTB7KRviuNlWWUk6w7QrSrZf3yPbXovjF6wzsVwFmnxXHg2LgCpmJ0
         LpcwbZnGBOtnLRxKYOfjkruYwMCP1Grz7pTQXgUb677BNDAwQgqb/kADtGwWe9YbwYpt
         Oi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774548898; x=1775153698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6xYx6+4w7jX3M6Aoup4NUI8Mc3h5JJeX9em16Jcc7Fk=;
        b=pbZWMSwyPY+2mGKEd9r3OB5PBGaT3zaWcjQNgsh6hfO4NzRCaVZJ7yH8DAAgiATFod
         GdPSUrTWGJ7auGQILx3YsGlQkuy+9VSdNXAF+qHgUx6XiDmAdhnLm9JGL3EU2+HQ2fuQ
         lINPljnV6dGJc3+Of5SPactyi4p6Fphc2jitKlJTsdofvai7E8Aq/JgyCctdXtMacioK
         CTbjet0O64vx2wTmuew6V3vGoy2/bF1HuNMDea8rFRuXXKJa14g8HQpsO0Eilf7P958c
         jA0FNJXY8Zv8lnydjF/VyodBalOTeoYI94//B6HcYBIocj8gJaVibSFTak/4fExgMu8T
         z09Q==
X-Gm-Message-State: AOJu0Yy84sW9d8dKmmB7S5zl7dWFtOWB00tqQCDT/WUpi3UD3L0voo8q
	cNUitYHZqnPKubw3WRACWAxplw68RujsGnT+hl6YX/wkTH6gKYkMcdyzogBc3v96
X-Gm-Gg: ATEYQzxy+eH6f7KnulkURYtJzHKyTbv3Rgl3+TWT7GjURyAQmGs59Vn3wSpi40pum6S
	2aKIe9nqC3UC6vEK1fgx40dHP1nd6gUO5etoHvvQS5j7WvIt8o/3fCXV7903oKSGiHVeforB4D6
	hFImnD7dNQyKfI/VIxzbMecxnTWuWw8GTVJAnH2Cg+77unV2ei1jdP/g3NoJP9yBoiamCXcEB1q
	pzDxCKV53fMe9KGwRgelrCTsHLKmkqqy4zJtf6/EYHn/Wnxd7bfzxce0jVXyLWaM+9Dwqx9iJW1
	UVIr2s+082RkZ4g0BpFg9o8Ai2TQQDidKks16BQi2jzkmPQWgI90Vy6e5oPqfjnTASXVFUi2HdW
	7uWzS4Kiarqd/KxH6dtDYC9fzPvKH1GCG5hJK3aWhNtGt8rA9AyDiNza6f4hq75wRiBp+KDHdSG
	YDg/czDL29DLI1wouzg8N5uI7NdA==
X-Received: by 2002:a05:600c:a112:b0:485:5c6e:8a38 with SMTP id 5b1f17b1804b1-487160429dbmr106570755e9.17.1774548898427;
        Thu, 26 Mar 2026 11:14:58 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872093a98esm18979105e9.33.2026.03.26.11.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:14:58 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 4/6] yocto-uninative: Update to 5.1 for glibc 2.43
Date: Thu, 26 Mar 2026 19:14:48 +0100
Message-ID: <20260326181450.1262870-4-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326181450.1262870-1-martin.jansa@gmail.com>
References: <20260326181450.1262870-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 18:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234038

From: Michael Halstead <mhalstead@linuxfoundation.org>

yocto-uninative: Update to 5.1 for glibc 2.43

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index e9dc6c8640..d97c96f631 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.42"
-UNINATIVE_VERSION = "5.0"
+UNINATIVE_MAXGLIBCVERSION = "2.43"
+UNINATIVE_VERSION = "5.1"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "a25f2174d0cefcb22af005e9bc72ac01ae83b011c5b6d6d5bf00dac979877f76"
-UNINATIVE_CHECKSUM[i686] ?= "959cc2539b692f9b9862825c7324a0fe4d061fca742f6c259f67f581c59af956"
-UNINATIVE_CHECKSUM[x86_64] ?= "96045e8b1e242c8a849426a8506c7043f354b39f2bc0035192780e8205e23e9d"
+UNINATIVE_CHECKSUM[aarch64] ?= "4166237a9dabd222dcb9627a9435dffd756764fabf76ed7ef2e93dc2964567ad"
+UNINATIVE_CHECKSUM[i686] ?= "761502cc9aef4d54d0c6fe9418beb9fdd2c6220da6f2b04128c89f47902ab9ae"
+UNINATIVE_CHECKSUM[x86_64] ?= "2b63a078c26535e0786e87f81ae69509df30f4dce40693004c527bd5e4ab2b85"

