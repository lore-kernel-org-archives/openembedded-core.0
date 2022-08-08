Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB96C25B06
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:06 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.22275.1659940973527483070
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=idR2XDfM;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a7so14839021ejp.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UfszCObIZi1yLZTpV0WsngqRhYhg2rhZpZUZKtCrteg=;
        b=idR2XDfMyCA1jbZdsQGfJOXjzrA/gTAy9cKqlF4bEbK5rkLqr1iqje6kh3BAvQBByP
         hjkqVU/1xKQRIK1JIINt/wDQkCWNez45i1lp6bPfMLfm7Kma1S7Xar7NQrHTfIEeFEBL
         L++2n4RScSuIJhBO3s8FfDmk3WURKP1dETT9cURYTPAKxyoqmQ2TbxdAd4lBs1JOfcXS
         wgmDh2roHaq5VKaJ+fWgAHv7bQ4LMJ/9CDP4iR5J1MsW2WJggEprGvnSyvLT6xdrnrFo
         gHOjDexrhl+xrTRUA/DCsfsyRz7XWfqqcxm6N+MqChLvYzF7ZPb8RH+d9lOLkm45Rds+
         v/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UfszCObIZi1yLZTpV0WsngqRhYhg2rhZpZUZKtCrteg=;
        b=WuEth05HIE7OY+ZdVMxC3krmKqIq+94km5wyg1oNvChAs+Rr3O3I+++3/TzUzBEfo5
         kv++oQOx18AuILwEEQgTxQIrdbpy4cIEFEeC3VHxI7RyJ4NEEX6cH3gUuXDlwRrF1sdX
         bsM8ZbAkPWL96dND4+oxOP1w2htAmaUDaOAjW6r129WfX8tjrCJTtHKpP2kbzwecFlFO
         Lk/+fTaRG9+B3y38JRzSTeJPGLSO4tKvOtuh1MrLkixcJtkFqJfOljoX9V9PRjy98xiS
         9SOIsfMAB2+2m8LUEwMDON4VxwsmFMvPFiTB3EaVcmN2ra7/k/nxxOtO5/Ed7iojKcYn
         Wg+w==
X-Gm-Message-State: ACgBeo3mTjRQO49qQmXaUWh1ldo3XSAqp+CYHq06FI4OURiop7h35U9r
	nHsCYITL/u7k6W4xtI/bo6CfCnahk5w=
X-Google-Smtp-Source: 
 AA6agR5c6cjM2mF+9DusgpaIxbUPQKVMJD7zXNBGod9F7y16IDHCdKiNL2or4Cn5oEAAdQ7Rgglb4Q==
X-Received: by 2002:a17:906:93e8:b0:730:9e5c:b45a with SMTP id
 yl8-20020a17090693e800b007309e5cb45amr12316274ejb.530.1659940981453;
        Sun, 07 Aug 2022 23:43:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 23/44] libevdev: upgrade 1.12.1 -> 1.13.0
Date: Mon,  8 Aug 2022 08:42:16 +0200
Message-Id: <20220808064237.3975347-23-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169047

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libevdev/{libevdev_1.12.1.bb => libevdev_1.13.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.12.1.bb => libevdev_1.13.0.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.12.1.bb b/meta/recipes-support/libevdev/libevdev_1.13.0.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.12.1.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.0.bb
index bdca64f357..ddcc4b6129 100644
--- a/meta/recipes-support/libevdev/libevdev_1.12.1.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "1dbba41bc516d3ca7abc0da5b862efe3ea8a7018fa6e9b97ce9d39401b22426c"
+SRC_URI[sha256sum] = "9edf2006cc86a5055279647c38ec923d11a821ee4dc2c3033e8d20e8ee237cd9"
 
 inherit autotools pkgconfig
 
-- 
2.30.2


