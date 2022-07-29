Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86801C3F6B0
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:48:28 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.62.1659106100708962821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UvLmmrca;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id p1so4788109plr.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WuNj7qEXCwEZr1Go1iAHqEPVaT3DFVkMbaz+XsXYrgc=;
        b=UvLmmrcayfbjMcyyqbxVhShIo3JUxcpztRSHw8D0qDJ6ycRGBmgz7HuTu4pNnVek81
         Fx7HKF/UekIidLN8rkved3v75PVYhYt+Ya1T41V+HyendZ9oNEdKzsR48BNHLyDD8+K5
         BF31ENyAocmMUzfjPEf+uiKjKlz+g7X/4MA2E4S7gMq7jHO5Ab0GBIQJw6z+v7aonjsf
         7soQSml6S3tUdc0hSgxp78qkPCu1ZoE6VyQKCkB02ZCvIA6jsCiowr7yT960o1TvP7HN
         dBb3Nj2G1beaGNZCByokUnEhsR2x/1xi2s70fz+NkoK/a4kqfy/nMQcmAVtlhUxUOxq/
         ZlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WuNj7qEXCwEZr1Go1iAHqEPVaT3DFVkMbaz+XsXYrgc=;
        b=IpnlcHnqj+h4LfWussRyn3LqUwHhO4D9RLcYldCjtamiZIoQVE1Eqfkt47v1TR3Hhm
         hOWQZxnEh1C7IM66TdEsdrUgO1hJZitm3hhcwrPP355eMff0oHi2w1ypgl05ypm0E/aG
         l/lT5mfJnDB+8Ag4QmwO53UwPJkxWWh/t4NN7s9hmlWisvEc5Eoq8Kf8jdXUYreKMC+/
         /lzcmcFQkQJhWF0Y19yM0IwD+b/LXdQDOgM1aKi4YmOMaoWBLSVhrZh8rLplNZ2XrnKz
         TBUPaEF17iMtEMV6muUJN48CFRQTpOOF3BbMNvWdZGBIg5AXqKE1TTm3ALV1Fam5VBlt
         i+1w==
X-Gm-Message-State: ACgBeo2SZa1VQiUYYvmZTXUpEmG3hwvcEbKhoBGJPzUriRL9pv5jnWGK
	QgwnOY2J8iCX5/7z7oG+M5Y7lXZb5Gck7FE6
X-Google-Smtp-Source: 
 AA6agR4Uzo+VzjsZqZkiJsbUDlkbeezbLwmfAtupKtWfgcVqOWlPblkg8TBGRDybIWehBtvl6x+duQ==
X-Received: by 2002:a17:90a:65cb:b0:1f2:4c5a:93e1 with SMTP id
 i11-20020a17090a65cb00b001f24c5a93e1mr4555954pjs.188.1659106099681;
        Fri, 29 Jul 2022 07:48:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.48.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:48:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/29] udev-extraconf:mount.sh: fix a umount
 issue
Date: Fri, 29 Jul 2022 04:46:40 -1000
Message-Id: 
 <aa6621dc1bc37d3e9a2aae3819619bf4e6c33bc4.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:48:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168659

From: Ming Liu <liu.ming50@gmail.com>

Only touching /tmp/.automount-$name is not good enough, it must contain
the mount name, otherwise umount could not get the path from it.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ccea69032329f3ba43c727d9eb71b1d063b89824)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 43acb3a7a0..b7e86dbc0e 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -89,7 +89,7 @@ automount_systemd() {
         rm_dir "$MOUNT_BASE/$name"
     else
         logger "mount.sh/automount" "Auto-mount of [$MOUNT_BASE/$name] successful"
-        touch "/tmp/.automount-$name"
+        echo "$name" > "/tmp/.automount-$name"
     fi
 }
 
-- 
2.25.1


