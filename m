Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE63CF2591
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 21:35:59 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.40928.1728855358637711139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 14:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bn0UpTp0;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d4ba20075so2317359f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 14:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728855356; x=1729460156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EV2m/tvrSDaXSOF4tUJsxX/VScA6rBnR5NwrZWzvPuk=;
        b=Bn0UpTp0pQm7IvUeZ7Kt9DN/kTrskNkPgI6zjuoOOnX/NS5wCuB2XOyDIMVBZIwReQ
         Z0k4Qb72UH9UOItuVXI2tdk9z+2MmV2VOnhQ8jXcWtfavHZxLbLPmz7XZJHiAAJAgisf
         jGMKW8A4K0XcvHgqYpwNMps6rXKlCrNIDMDRdkS4/mF8SKSHih/aDAajVF1W6CFAD7Z1
         Aj04xgieQNBBs3ifGw3CRrDwYxcoycm9hMKdIpaiyMU7wYAdTa43u/z/dyncDgrf+pwB
         ozhIghOvLulZFxBWArZLF8/HD2UlzhpAyHO7bIRDb3E2XucmeuIZ0k3OaxwR3S9JgPgV
         AhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728855356; x=1729460156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EV2m/tvrSDaXSOF4tUJsxX/VScA6rBnR5NwrZWzvPuk=;
        b=n6Y3MctaZVsApnM/DQ5dgaJ8vDtapz+NyNca9XC9TaSOAW0Efo+zmRQia1UO3tO1y1
         qt4PNB5fMArlJqLOKhu3lwoUuWzJIu0c+iM8wE7VDeaLTTQxzfgYr1Vt7enGfzOPbhlr
         kYIfXRBO8zla5ioDaOu5RbubZSA037k0l3ty0fG749dttVKqwRZ1QAwPIjo28jfCRY6y
         4wx/yIQHLvs6yy4VTak6y1TW/jCrMkeJy49vP84QEog7k4a0kNDYfenk58Dfru5KR9SD
         lcNX5HR/smcY3pRS+Kga8NOy3AFGyDtjorU3Mb5GPEavAoT9ZWrKEXYHBmn2pcKFibRM
         gQYA==
X-Gm-Message-State: AOJu0Yw/os4sqkwE9VInEe7ym9euE28Hc8GZ0Gmbz8yq+xtbntni6s19
	eTY+U57QQG1w+8XHts8fSxrz3WdXspZHRHXelNJNF6tLWgA7ahdEbYjxHw==
X-Google-Smtp-Source: AGHT+IFe0MNer+dU7SLvm/4FUAFcFVQhggXoTftEop+RQxFVqC/k9Iabv5qFaOf3Y4s4qpad4SF7Pg==
X-Received: by 2002:adf:f98a:0:b0:37d:4aa5:eaed with SMTP id ffacd0b85a97d-37d5529ad5fmr6617067f8f.41.1728855356296;
        Sun, 13 Oct 2024 14:35:56 -0700 (PDT)
Received: from localhost.localdomain (ip5f5af7df.dynamic.kabel-deutschland.de. [95.90.247.223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8928sm9678159f8f.7.2024.10.13.14.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 14:35:55 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH v2] ethtool: upgrade 6.10 -> 6.11
Date: Sun, 13 Oct 2024 21:35:15 +0000
Message-Id: <20241013213515.91881-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 21:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205729

Release notes:
* Feature: cmis: print active and inactive firmware versions
* Feature: flash transceiver module firmware (--flash-module-firmware)
* Feature: add T1BRR 10Mb/s mode to link mode tables
* Feature: support for disabling netlink from command line
* Fix: fix lanes parameter format specifier
* Fix: add missing clause 33 PSE manual description
* Fix: qsf: Better handling of Page A2h netlink read failure
* Fix: rss: retrieve ring count using ETHTOOL_GRXRINGS ioctl (-x)
* Misc: man page formatting fix

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../ethtool/{ethtool_6.10.bb => ethtool_6.11.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ethtool/{ethtool_6.10.bb => ethtool_6.11.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool_6.10.bb b/meta/recipes-extended/ethtool/ethtool_6.11.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_6.10.bb
rename to meta/recipes-extended/ethtool/ethtool_6.11.bb
index 8a7b2607f3..c4808c5856 100644
--- a/meta/recipes-extended/ethtool/ethtool_6.10.bb
+++ b/meta/recipes-extended/ethtool/ethtool_6.11.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "2b266c45c0fe00e5f5b462ee4e795879fa4247003bf73c5a07a2279d801be058"
+SRC_URI[sha256sum] = "a8bee475d991939cad182b7dbcf3a1f139aeed8cb0add73d72084cd71d43282b"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.34.1


