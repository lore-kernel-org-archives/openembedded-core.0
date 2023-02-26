Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E521C7EE2F
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:02:46 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.69587.1677430956817460407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=l8MhcfUT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id nw10-20020a17090b254a00b00233d7314c1cso7732463pjb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWzSKx6nI+vmiL8fx93n5TH7au1OwUyLw0JdENbtbN4=;
        b=l8MhcfUTKnzcUaRgI82Z+rTpbxL+CyfNogamsEz+R3foH/iT4Bb8evWNaJ3wNf6ARb
         MNC55mdllhypD2T9nnbo+raGriYNh8es7SHgcgSDuxcX47uNfUxuYlAAHCqfCpN7gUR/
         vkJm0o/1dIuqn1NQpRfwSLAKgUiwVeuSdrIwiHV6TCz9PV1rf6iYqGbMO7MrOpGaEIc4
         d/bJrw7lCjrxdlq4HfSik+ymwxMQymnTHKNncPvtqHR08WAXyZXoe96Ie2zuqQLgk3jH
         DiRtim28W5lrsS4/m5TEcIf11NRitA7ACPbl3FwN3TmCiEQNukXmJmb7Gd3iS/HFUhOj
         BNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWzSKx6nI+vmiL8fx93n5TH7au1OwUyLw0JdENbtbN4=;
        b=BmEUdPOsMB72DWu90bPWSDK3B7Y+HvhQe+NU4P68v1FdlAwmjJFkt5rFsf3qVg9l+6
         3HxDKxYH4wu1UMovV0eAV8u3G0a64+5kzkEKNObmnUs6Bj42euGWWeLbvNE+iwo3HLgQ
         8+GvlL6zNSE3jHd4YvQ0ckdzp2Mrd3O3/g9NDgrrSe9UXbkKZld7fJu144o9chBrzKFa
         P4VZ4uHK/RLOHX3lDT/Ew4TkHw9gZv1m/+JtTCObn/fgSQT3nPttYQ7QOs6X6Xt7UIFw
         85Tb8Ihrhq9sce+ibraLgYl3PbuLIjSIMWMv9NMrrhjAPJQTJUg2mYXEZ5+wBDMlCg0p
         D1Yg==
X-Gm-Message-State: AO0yUKWURdJ7aOU/OGvOuBFtzzwywwWwLKlo1KgFkfhTHtGCQF5QvQp4
	x0DA4WIw83O+6lzpzMkVDgvAIQsEf6bDmFiFMSI=
X-Google-Smtp-Source: AK7set8dcs6oqk47WeNDKUJpG8ExpyzTrHdB8+xkd5jIyb1dCZicBvJTbTT75czgjSbV+6OLRXmPYg==
X-Received: by 2002:a17:90b:4a4d:b0:233:cea2:dac6 with SMTP id lb13-20020a17090b4a4d00b00233cea2dac6mr22385989pjb.47.1677430955801;
        Sun, 26 Feb 2023 09:02:35 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:02:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/28] vim: update 9.0.1211 -> 9.0.1293 to resolve open CVEs
Date: Sun, 26 Feb 2023 07:01:59 -1000
Message-Id: <855f629bcd2caed708f2ebd19a81059fed546428.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177741

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d77dbe499ee362b6e28902f1efcf52b961037a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9bc6881fce..fcb5cf6334 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1211"
-SRCREV = "f7d1c6e1884c76680980571f1cf15e0928d247b5"
+PV .= ".1293"
+SRCREV = "0caaf1e46511f7a92e036f05e6aa9d5992540117"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


