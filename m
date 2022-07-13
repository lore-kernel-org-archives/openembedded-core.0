Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A12CCA479
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 15:41:57 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.23673.1657726906671960166
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 08:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FCXlj/lN;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id r14so16102846wrg.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lzH17ZWw+SxicGZEBkbxW9TXsWAtuOL6x4kJAd0WgNs=;
        b=FCXlj/lN6gDJAX7pEbr4utH23H+HVZXC3grFYDSmUbt5jX9UKoxmpzOo9LQ79q7ShF
         yNV8F+hoKG7wAAgRe+m4sGdxra8CIgNee8tlGtdzCKK+Zd0CKzwpMkQl9AZMpnnbFSR7
         0cq6oUeyYKfUZfD68mQGZ2hPxsFbFebV6y/JAeg5AEVrbW2GiXdVcg8ThNOOyhFClIwW
         Udxac+wqEea228pb82E42lZjYo3fAb/5BINunajKAmBilhWObDvgTiYaZwjXB7pY2rGW
         kdiKAFQW4cSvXjT3JMygDKvZBLgj73Ve+kaV0F1Sy6L7/NbRYd7rbVeyhaK8z5hkdhBZ
         vMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lzH17ZWw+SxicGZEBkbxW9TXsWAtuOL6x4kJAd0WgNs=;
        b=iehCQG6Xj2x7I6LDiJ3e5rvdh7OaOLarqqdzuUM7cmsJdDiYzV2+Kwd3zmTypyEqFo
         lSW5ApuK87xFjdH1Winv6U4JBvu5a0g4560j0SHiSyzlCEJY3/49QveJYH8fKbKlbW67
         My8Dng+mh8siyiaQKYkaOiNg7zETvoPoQio+unhFljdJ0fH38RHjtQYSRC5ejhgVDgkF
         x8j/jvIpUIw33Tq55oDP4AJ3UCN7iLZhYULyMUyzy/tCszqBZK8JnT7TRrihEcEMvXiT
         AKrtVor683FghPhPGlidTwu3MdRSRuXhCkaq7PgGAamuKh8PpswepVIRB3cnr2eOnIcN
         QxFA==
X-Gm-Message-State: AJIora/9JTKCm9xPgVdeTaYxjxBE071RInXkdtleTb9BhSgptjD7hPHK
	HHwcfguiOBGeYoJWnsCwYuiM8U+wlrQ=
X-Google-Smtp-Source: 
 AGRyM1sw8gL8N5Ks2lPvMM6pkqyR/3mPjyQkoS6C0OJVnIRKHZJ0+v/QtoclYUrAwqtb5aeZTb/P+g==
X-Received: by 2002:a05:6000:144f:b0:21d:a3cc:a6fa with SMTP id
 v15-20020a056000144f00b0021da3cca6famr3922814wrx.191.1657726904732;
        Wed, 13 Jul 2022 08:41:44 -0700 (PDT)
Received: from localhost ([2a01:4b00:f41a:3600:360b:9754:2e3a:c344])
        by smtp.gmail.com with ESMTPSA id
 l16-20020a056000023000b0020fff0ea0a3sm11182883wrz.116.2022.07.13.08.41.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 08:41:44 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] poky-altcfg: enable usrmerge
Date: Wed, 13 Jul 2022 16:41:38 +0100
Message-Id: <20220713154139.101744-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220711202929.3839971-1-luca.boccassi@gmail.com>
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 15:41:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167959

From: Luca Boccassi <luca.boccassi@microsoft.com>

Ensure it gets tested by the CI

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta-poky/conf/distro/poky-altcfg.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-poky/conf/distro/poky-altcfg.conf b/meta-poky/conf/distro/poky-altcfg.conf
index f03306e798..57a76e8bb9 100644
--- a/meta-poky/conf/distro/poky-altcfg.conf
+++ b/meta-poky/conf/distro/poky-altcfg.conf
@@ -9,6 +9,8 @@ DISTROOVERRIDES = "poky:poky-altcfg"
 #DISTROOVERRIDES = "poky:linuxstdbase"
 
 INIT_MANAGER:poky-altcfg = "systemd"
+# systemd will soon require usrmerge
+DISTRO_FEATURES:poky-altcfg += "usrmerge"
 # systemd isn't suitable with musl
 INIT_MANAGER:poky-altcfg:libc-musl = "sysvinit"
 
-- 
2.34.1


