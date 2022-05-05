Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0610BC433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:44 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.7370.1651727153656394381
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zpvh110o;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id i27so6531171ejd.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8RHcQda0PVv3Xj5rA5rN7HKwBssM0bq0npzm8YNNyMI=;
        b=Zpvh110o0REh+HOqc0nn8OVZwzmU3qLRxPbA4nZjMP5o4rW7fyKXTzurq/yBZ9erTF
         9/x9OVnX+TdwmbQ7fk+92Efabswt77030mxpVjUe0aZgXsgs4RUQo8DkKGtFiwBa1yva
         Z+Ngc4DhnBQQnOPnVYtZ8CmtAF4YhYGaoneCPrGVRFP61hFewngkg4m3OpCUeq85JuLX
         FXdqwMf/dn5QHuOSX1oiiRXwn6WNol/kHYaIiBR33LHFoUSEay1b34WqFc5chAS/70pl
         KGoPH7cHMQXQ/uBb2LRdk9g7R5NbBDKP8l0CJpHulZLX22UMeKU7jMXSS55Gzbz+GT+J
         MW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8RHcQda0PVv3Xj5rA5rN7HKwBssM0bq0npzm8YNNyMI=;
        b=dU/Zgulp5agO5xpFW06G3XZdoLzuOVwVlni/7Wwn1i1BAmCKqWN6JGNrLzmBCrtR0o
         9pm+4qHhSCqsZDf1nOJxEE1cgIMSV+yyJ80zgB+8qCeZ/DEd9/eDSNCU3+0pqwtc7QUo
         Hfbj+ohQw4Cv12+DH9XDehSKXWfuhsZlEGl4EGa0A3VytSkm2PygE0C+Jk6hRGzNzxSW
         /gCqE2VXeVBvuNEfYrVo6nz5sjyZ0Zi/YdqOvn6XmFpD6UPCjvFtKCcfP84YOfRSFd9o
         GvreHyHYhNDJD/Jp2hd5CDHy/bAvxi32zLKUidYUJcFLFTBzeaoEPFjKX+1uZu28fFIn
         6X6w==
X-Gm-Message-State: AOAM5306W5w8FHR8cCMPHtwwcGbsbg7WfClNl2UrnxQ89iAMTFwZ0Evk
	z63oKnC46wcuJTVC9RhT0ubs3iUd/+U=
X-Google-Smtp-Source: 
 ABdhPJy716AA49YaGr7G9gqlMX5bXZXsGAfEr9bVugmAUnCDxUXVuWAS65Qjgp57lFh8+Q8VlG7JGw==
X-Received: by 2002:a17:907:8a0a:b0:6f4:2467:75ff with SMTP id
 sc10-20020a1709078a0a00b006f4246775ffmr21857096ejc.356.1651727194445;
        Wed, 04 May 2022 22:06:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 59/61] xauth: update 1.1.1 -> 1.1.2
Date: Thu,  5 May 2022 07:05:42 +0200
Message-Id: <20220505050544.651895-59-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165288

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-app/{xauth_1.1.1.bb => xauth_1.1.2.bb}                | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{xauth_1.1.1.bb => xauth_1.1.2.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-app/xauth_1.1.1.bb b/meta/recipes-graphics/xorg-app/xauth_1.1.2.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-app/xauth_1.1.1.bb
rename to meta/recipes-graphics/xorg-app/xauth_1.1.2.bb
index 48259a69ff..1ad18ef63b 100644
--- a/meta/recipes-graphics/xorg-app/xauth_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-app/xauth_1.1.2.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5ec74dd7ea4d10c4715a7c44f159a40b"
 DEPENDS += "libxau libxext libxmu"
 PE = "1"
 
-SRC_URI[sha256sum] = "164ea0a29137b284a47b886ef2affcb0a74733bf3aad04f9b106b1a6c82ebd92"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "78ba6afd19536ced1dddb3276cba6e9555a211b468a06f95f6a97c62ff8ee200"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.30.2


