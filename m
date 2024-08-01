Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC44C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 13:30:57 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.68239.1722519053992989734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 06:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=gB74AEOD;
 spf=pass (domain: baylibre.com, ip: 209.85.219.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6b7b349a98aso46347176d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 06:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722519053; x=1723123853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ylH95QzL8XN9KiBr7LHm0LjqarKMjRus+Y1WOs79IIE=;
        b=gB74AEODjVKWakFNoCZRxB4Q1zHFvo7nseZNFUgYK3SuoHPfQOprDWMQOr4IuMhvnv
         raSeF68FTt1KxUOUnt5lqQ8sH9esVyAcIhCDC6jHQb8kohzM85RB4ckVWjAvg4+r4nQT
         e6nbre6yOUiqbkdzmPGjBTK0R9DPcD//H88XLOZ7Rrkza8envVIO5/HM4jXg4PZ6UInK
         +K8+InG3VVajXURmVnDvehzN7Qt6j/N6yaBiFI25JWJ4dv4ZzYmnQPkeWvB7CzrCSluu
         jwKMYCDDtS+9op/LqQZyavUtftCTayqEUNcsysnraG/ZHvSrA6dEiQmuZItFbYHV6YXj
         Wdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722519053; x=1723123853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ylH95QzL8XN9KiBr7LHm0LjqarKMjRus+Y1WOs79IIE=;
        b=RmQmG0zI2cOYOthqvGJWkp6RlNXKo2Ok4aAlM8YHOlmeMDhifpxMLrc6aV1xz8a96o
         kVNBQfwD5p+O5qdal0F4Rq7F9MWFpEXMQuwwmk81GKgaUrdCfHVjbG00/rMGFtIf2E0Q
         1nSGR8PFb1yWa8mMwlnEylX1e24pIrO3OBnaF8MlyONDOIAniOvz9cUSpJF0Eh57VxKU
         XByxPMhXpWqADsfKXn/9EOXOdZRg3eNdhqJ2nzYCCUog6+0z5QtAzmZ3V6nzVffRahKp
         EdPX/iQRj/ABa1KWyf5zIMbSdedjo2xj0KX141Coq/deuxEdSR5m27onuwthF6agXPhf
         kVhg==
X-Gm-Message-State: AOJu0Yz2T8944GJoa8MCThBv3aR7kW6G49oq+IYC5ro6bCmqP3VE0EjW
	1x48YaYAMRKe1dgq9vqpDcWBgFLzf9vFlNUMH7PbdGpyYg8fp+JwQNfemTNhWB5PWZ61bOyaVUg
	G
X-Google-Smtp-Source: AGHT+IE5fDmxqo6A9SmxcOISihyjEuctvU8xEwgHToBrbqdt4p81F4/jmzvsTyqqERt7gyVs1sWtnQ==
X-Received: by 2002:a05:6214:3b83:b0:6b7:9ebc:308a with SMTP id 6a1803df08f44-6bb98476815mr660956d6.43.1722519052566;
        Thu, 01 Aug 2024 06:30:52 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3f8f83d4sm85163256d6.35.2024.08.01.06.30.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 06:30:52 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] bind: upgrade 9.18.27 -> 9.20.0
Date: Thu,  1 Aug 2024 09:30:50 -0400
Message-Id: <20240801133050.2647977-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 13:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202733

bind now depends on liburcu, so add it to DEPENDS (this was why the AUH
runs were failing at do_compile).

Changelog: https://gitlab.isc.org/isc-projects/bind9/-/blob/main/doc/arm/changelog.rst

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../bind/{bind_9.18.27.bb => bind_9.20.0.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.27.bb => bind_9.20.0.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.27.bb b/meta/recipes-connectivity/bind/bind_9.20.0.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.18.27.bb
rename to meta/recipes-connectivity/bind/bind_9.20.0.bb
index 0d22bace6f..07dd38f04e 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.27.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.0.bb
@@ -6,7 +6,7 @@ SECTION = "console/network"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c7a0b6d9a1b692a5da9af9d503671f43"
 
-DEPENDS = "openssl libcap zlib libuv"
+DEPENDS = "openssl libcap zlib libuv liburcu"
 
 SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://conf.patch \
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "ea3f3d8cfa2f6ae78c8722751d008f54bc17a3aed2be3f7399eb7bf5f4cda8f1"
+SRC_URI[sha256sum] = "cc580998017b51f273964058e8cb3aa5482bc785243dea71e5556ec565a13347"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.39.2


