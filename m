Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A56C43219
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:02 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.4221.1667832917636303752
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AMQPqjSS;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id j15so16600946wrq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=errNiaWuZj2d0L/69XgexUtK5OW19MMiX/gtM7yn4aQ=;
        b=AMQPqjSS9pSMSG2sFg86OCysTxhpGabuQu2fcNzi6Dv0q4EUxKCErwQdJITXUjoza2
         2br3VA+Bq7/XwTj3VPp1mQhi6EuE11BiJDRI3pBThkWddOmEJzBP6pzUOmWSsh6VRz9+
         47lUg6MgW1RyqZY8FhZKlJf8JFEXC5lMgr8sOSt9V1mYwapVfZM4ISnosAF3qkWM/HoV
         aiHs58oVBh/7VYaO9YJN67tIy4tJM+b0YJhvyW6wQP4TDP4KvQSrZmE0n1bUzLaEqOhJ
         /+Guy2Mt6g+IDEHwOnJG3CYlTk6b6kT/bvrxBCCSrxIRISKcOBY9/QwIpWa1//IKu9E+
         zFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=errNiaWuZj2d0L/69XgexUtK5OW19MMiX/gtM7yn4aQ=;
        b=uqPr2fe0/YoC/WW7MCqSL+DiyOAYDNSV11zJOcVI+eRi2uDRkApQpBKWyXCAU5NlW+
         e9Ma2m05LSKF/lz8Fd2pVif3yhHZnVKKehJ8zKQFU7gOQ76AG3eX/DAY4yywLRRe3Nld
         hLx271KzHkRoeNge6OY44ONvLU8D3SaoYas60C0AoGAKoHtcSIOBtQ9LcghzJW2Q8o9b
         Xl48b0aMJ9P0e21duuUkvpeGmFDT+qQBset+Nwq2hiV8zNkW4/QzfnLykFGYSLDKZy+M
         q7N6PUb9/cmzJHCou8baRv3sZzEWT1ansa/+YM3HfX2GIVq+BH/bG02yWjD1a7yHm6H2
         CWEg==
X-Gm-Message-State: ACrzQf2m0vWAa8AnF5JwYl79kDcX7byOy5VvKgn46CdgIi5HNV7SuhZM
	ARI6VJGrCpC2+fjFGsRLsnIqQg1Xp2Y=
X-Google-Smtp-Source: AMsMyM6L9xC7aPsCrcpGtQ9AJ/zzohD5PwHN9v1WDqQACmkURaKJh0qAemvjJsw9k//8QuZ3GpwDzQ==
X-Received: by 2002:a05:6000:1d93:b0:22e:5d8a:c8f8 with SMTP id bk19-20020a0560001d9300b0022e5d8ac8f8mr32063442wrb.324.1667832957508;
        Mon, 07 Nov 2022 06:55:57 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 40/48] pixman: upgrade 0.40.0 -> 0.42.2
Date: Mon,  7 Nov 2022 15:55:00 +0100
Message-Id: <20221107145508.1051404-40-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172890

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{pixman_0.40.0.bb => pixman_0.42.2.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.40.0.bb => pixman_0.42.2.bb} (93%)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
similarity index 93%
rename from meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
rename to meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
index ccfe277746..d26d7f581a 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb
@@ -10,8 +10,7 @@ DEPENDS = "zlib"
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz \
            file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
            "
-SRC_URI[md5sum] = "73858c0862dd9896fb5f62ae267084a4"
-SRC_URI[sha256sum] = "6d200dec3740d9ec4ec8d1180e25779c00bc749f94278c8b9021f5534db223fc"
+SRC_URI[sha256sum] = "ea1480efada2fd948bc75366f7c349e1c96d3297d09a3fe62626e38e234a625e"
 
 # see http://cairographics.org/releases/ - only even minor versions are stable
 UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
-- 
2.30.2


