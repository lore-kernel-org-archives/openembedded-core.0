Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664A3E748E9
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:45 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.62426.1696176037481874366
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IqgZ9ol0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1bf6ea270b2so118928665ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176036; x=1696780836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i77wbwLbzp7Kgi3MdhHQmWIm5EtwoafokRl0o8nPD0Q=;
        b=IqgZ9ol0McY+dVUzEKzz8G6gg5H4qA8jzs6AQSVk+NclMbdpmjCgc0qWN0ER/bRLR/
         TlideqoQRGmckY5h4i5q6DQm92eSnNHjoUhopGaL8ACBUUtxr2VITYWBnGjcn7YHhzhv
         +as4wxVzv2WM3/sB0cBc84PvZyPFuJjQX67PJr3heu+GBJvuhBOUAVqcK1EazTHvU+Rm
         GKvc6W5fb35RetBkGvWaoHvY54QZb1zRTMrp3CGE595A7rjYzMrbC2CilZHkuFGC4U6e
         6U0GJ6ZJ334MQlYs+lcvijwB4byrQHpOHggj19a1x/g3gLVtEjp/Q6R1fdBqv03EtZGW
         KhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176036; x=1696780836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i77wbwLbzp7Kgi3MdhHQmWIm5EtwoafokRl0o8nPD0Q=;
        b=F83QJgfLpgNuSnfPJOsDARZwcbzQqain/mntT1EFDFDxjU7nt1yK/PYGKMo5Pa6M6c
         sX8XDRLwxGZDds1wQRo8f6se76b3brPkLRQZO/GuUZ2wc2ODUz9DYMBbjiQE+3r3/6fq
         TiumcDBCmN1v1rdk7gdFdn7aNVDOxnw/0QuScuf2vymiknVzqwJawy7ur0gAhoPe/POv
         iPV+gFsOXcoEWhhNeJar2dkSIDvLef+zheI9Dn5eU/9tU4gE8mm58A8DvZ5ZBNDdexwq
         2ChaQCrDMHD6GTSc8kMAUG7aC+RPEa3UPcV3xHpSCgmS0unC9GC4017R+E/6bLWD/50p
         Q5Qw==
X-Gm-Message-State: AOJu0YwJc8dTetds/1A2OaqubOGyjg6wUFaqBiHkbkPEMc8RqPsys7iX
	I0nVhdCYIMPpKOjjsj8/DfA0WKz5nYbEm+6TI5CVLg==
X-Google-Smtp-Source: AGHT+IHpmx/IRDlTTCdJcULroiH/t1boQjfpxXKslpG4d59uscmm589Tn3NJcZ5hG7h6oq+WlCI7gg==
X-Received: by 2002:a17:902:c084:b0:1c6:30d1:7214 with SMTP id j4-20020a170902c08400b001c630d17214mr6403391pld.55.1696176036486;
        Sun, 01 Oct 2023 09:00:36 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/23] linux-firmware: upgrade 20230625 -> 20230804
Date: Sun,  1 Oct 2023 05:59:57 -1000
Message-Id: <e24e87385ae4e1544f3a00df7288da68003d46b6.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188499

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

License-Update: additional firmwares

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6a36c10cd51382bd2356fe6589e4c1d3be8179cd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...{linux-firmware_20230625.bb => linux-firmware_20230804.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230625.bb => linux-firmware_20230804.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
index 6765226b9d..4defab434d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20230625.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20230804.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "57bf874056926f12aec2405d3fc390d9"
+WHENCE_CHKSUM  = "41f9a48bf27971b126a36f9344594dcd"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "87597111c0d4b71b31e53cb85a92c386921b84c825a402db8c82e0e86015500d"
+SRC_URI[sha256sum] = "88d46c543847ee3b03404d4941d91c92974690ee1f6fdcbee9cef3e5f97db688"
 
 inherit allarch
 
-- 
2.34.1


