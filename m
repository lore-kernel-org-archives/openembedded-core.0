Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDB8C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 23:09:16 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.680.1666048146183578598
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 16:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=O1YU+g8W;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id fw14so12332589pjb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 16:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzWdHUJK3B3PlAXTU1kU9KfC/3Lmg93Xg3pMLpICqXg=;
        b=O1YU+g8WoIwOd8T7B1LELD0bKfBkPIuDoqTcW0koMoo9vIiHT8zt1pOiTiEzLYpU9x
         I9a9MQWOzgObqvuplPs+9WfyyywTaC7WkC9OvvO3/kb+tiD84I5vSwUsbCpaabij0+Nc
         PyBNF8jSQTutVnuhbxhm3vkWJ6W7G9bLlogkK/wjqrwSHRj3Zz/O/VsF29Cf/DRkYSxb
         gmSZHddRh4obRxM9ZB5xUGs9rm85HnM6BND+zw2voy06ZLjhGhKfllxfufkXwjQXNAIb
         acjIqpVDMMr2sY2A4tBHhCgDNr9s0vmT9grStXmretgcWT1cHVR802h3NE3HB330KCOD
         DF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzWdHUJK3B3PlAXTU1kU9KfC/3Lmg93Xg3pMLpICqXg=;
        b=JwBYWRCIrTgHf/e2YF9FXheRYZmRh681Hwa3slm1xBsynq7QfwnG3so2x8gblvSC8X
         9jdfUXiixV1p7pITRSJg4GUNThY7aOYAnSVZ+TXxhtNVDcif3uZcTgKxSnJZh0WeU0AA
         bZAFJhgGiXncqkKGMIdzS6Id4xzX4ikRQTrCz/sPDaHy+KBlTmGLw+x6Axd3UnFUmdjI
         1r8t3FZF0OqbP/gf5256bKpcl/1lVUQAHL3hlkEfY/RTKSlIyzGZOULc7eGMX5NnWJg0
         67ufV2HpOUXunK1xscV94C6dLYAKZVdLpNu6TZ3Q+EHhg1xGNbHxtERpgjsgE1L8bpEL
         9auQ==
X-Gm-Message-State: ACrzQf17imhCHBc4eNTYlMAfNfxesY5n3gGcPRQ9tfBrLbSpeXrJ2ClY
	HotMyhqGUg7dVF94LmEV3TCgGtg6IQ9PP09k
X-Google-Smtp-Source: AMsMyM7s17ONPolWqINhRvPkbL9KSp4SakLBazRzOsF4oBitRqJM51nJuQhixt6M+GK87QSmzOFz6g==
X-Received: by 2002:a17:903:18c:b0:185:51cb:3619 with SMTP id z12-20020a170903018c00b0018551cb3619mr88173plg.6.1666048145271;
        Mon, 17 Oct 2022 16:09:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a694600b0020aacde1964sm10119479pjm.32.2022.10.17.16.09.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:09:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/13] image_types_wic.bbclass: fix cross binutils dependency
Date: Mon, 17 Oct 2022 13:08:26 -1000
Message-Id: <f5713addbe47eb6c998cfe1514a537acbd367c3e.1666047986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666047986.git.steve@sakoman.com>
References: <cover.1666047986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 23:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171928

From: Chen Qi <Qi.Chen@windriver.com>

Enable multilib and wic at the same time and we'll meet the
following error.

  ERROR: Nothing PROVIDES 'virtual/i686-wrsmllib32-linux-binutils'

Adjust the dependency to take multilib into consideration.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 958ee0eede859bdba659e3343856b1c226207854)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 5374d6125e..6453dd1b74 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -85,7 +85,7 @@ do_image_wic[deptask] += "do_image_complete"
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
 WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native"
 # Unified kernel images need objcopy
-WKS_FILE_DEPENDS_DEFAULT += "virtual/${TARGET_PREFIX}binutils"
+WKS_FILE_DEPENDS_DEFAULT += "virtual/${MLPREFIX}${TARGET_PREFIX}binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot os-release"
-- 
2.25.1


