Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CC7C742A7
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:45 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.8617.1678229299776983764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=lVpYIuIp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id y10so9089366pfi.8
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wytZlLu0Ig0rEbfKLnp2o0A1PVjrSZhINot1fOt8nmc=;
        b=lVpYIuIp7BC1JbHi0SGrzHyjAlZy7uayZ/BkINFwSH4ZSB/Yua0N/yYMi1dbuhc2bo
         7+ORqk0H/p0S10IYaRqFfK8hT5kZ7j+rfyHMRUwzCqN92E6feF17kGTwtZNBB5cNMaRY
         YSPdO0C/Xx1tV0SISRbUQkQBhHHPOCtgtV2kTvsPurD9vneU3nhHvr0VN60OzyPNe6jd
         EbkzscHWo1T8d4XGxZwVGXOrCC/VqJ/rnyU+/u8knvs3Tb/ndSOJrQVqPom0pGVaJZfN
         GgzKwUGXvA4jlf7g01NGiPe0oY7uWnfi2cywp/FlCO8d+kPbavdxZdztZ+mwziLqMRPh
         zD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wytZlLu0Ig0rEbfKLnp2o0A1PVjrSZhINot1fOt8nmc=;
        b=LwSWR0GBtA3xxcOAUjWJgmLbfdll6kPp0BqCzJ2jaL+x8fkUmyzkWcEID+e0GZR5it
         N2uMANVNLoZKMk4Kiuu5gjy3JeKWazib2KK0PSneNhLefbCpDEMVKfMotB0hZTQS1uT3
         mjiN32lwgvdPNEUgE9unVSOGdTmxoC5IJRx+YuNvNDE3Treba80H3MF4qcbqQKaS4l5d
         x8ZloGF1OsJeaQlk75T3Ycr1C0NaDGURSHa/vM8TO7rFi+ylWSkw+nCC+LJqWNa/KyRF
         4/dnguoL7ZwbtaQW7K+Fm+TUdeM65WgPlpwZHQWGOXcmEn2+MnuOYfbxOoqxQXeEgoML
         kmnw==
X-Gm-Message-State: AO0yUKUUtZjpdVEeVajC2WKs8gYRNCCpqcrTxrEfhPlJRkjKObvYJsJK
	ycg/TKrz43oKvFd/DpQ5rJZ6of0oybus6rvt8I8=
X-Google-Smtp-Source: AK7set8HThcLDCyI2sAa5AdrjaM8cXZzym9d7L+pojI0y3DP3SMuhmdhnc9We3uE+PjqO8YsLJK1lA==
X-Received: by 2002:aa7:96f9:0:b0:593:2289:f01c with SMTP id i25-20020aa796f9000000b005932289f01cmr12122017pfq.25.1678229317897;
        Tue, 07 Mar 2023 14:48:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/23] linux-firmware: upgrade 20230117 -> 20230210
Date: Tue,  7 Mar 2023 12:47:45 -1000
Message-Id: <f19ceec135e6afd2a31367a28744eb413b3d2e42.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178133

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional firmwares

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8e6134d39b840d96e1c37d3df21a522afea8bc76)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230117.bb => linux-firmware_20230210.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230117.bb => linux-firmware_20230210.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
index ce0c90d4c5..fb1ea61906 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230117.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230210.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "05f1d941972cedadbf667c05f6010378"
+WHENCE_CHKSUM  = "aadb3cccbde1e53fc244a409e9bd5a22"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "df11e25ba2fb4d5343473757e17a3b4cef599250a26b1f7e0f038850f0cb3d64"
+SRC_URI[sha256sum] = "6e3d9e8d52cffc4ec0dbe8533a8445328e0524a20f159a5b61c2706f983ce38a"
 
 inherit allarch
 
-- 
2.34.1


