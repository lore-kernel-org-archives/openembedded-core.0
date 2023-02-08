Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32168C6FA95
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.3136.1675840927596606671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=epqY6pMI;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id u10so9596780wmj.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkTfkzav96O8F5Jn6KQOddVzERFyhxUmQYBPxoK15bc=;
        b=epqY6pMIQ741Z3ru+BKSuwDme61iL8HyVesiNSg1FtePvFpARQYEW7LdxtN7hs4fsD
         wQQTQLr6+7auF7Zpn3u3tFz2dPLk1kEDaTdfVvd8snGwIeXCgjVw8eI17V9fufwIb1Jt
         rOMzmsw4oWhBSzc0e48DpYFUOgbE6trdRCIw6YL9KtTHKRh29JHXftyOR2/QQv1nmaKJ
         T6mvFRkVkMycax0qEMpHhh46bjhthmx+JKydtFmuAWEBkVoKUbzMXFy+qLNnDQUP2huz
         bMhHbwIKU7KAldda2Q+mx4W7Y1uDJ++wH3h+91yuqA/hydmWb+KVEdnM8wyyB6V4J9vA
         c/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkTfkzav96O8F5Jn6KQOddVzERFyhxUmQYBPxoK15bc=;
        b=KloZP1mJOJ8fSCbmzBxeNf6dYQEFNk2lThaLfdv+Y4eAlExqip8i/FQnSgokL/243R
         KqsJPKkGWZ197lNMYpexaivWXfuwjh6e+dM1kFAyfoMRIvfnIpQz1W/sN6q9gyTsfNGY
         0HQ44+AuHWW0LhGqx5jzzhxatBAY7UJw4uIjmGuMz2t0KyaXlYE7Nqhl8BFwH7p5g1UG
         IbBX+Let08HMqqMouBy7kUqgOX6RCDoJAfv2JkhHRuczUxVSf/GP8AzF6rs7D02DoxlJ
         eWw8Azz06c4am8Sv8Q5vjPkAc978c0x1YSb0nVLQQkJ6BLpHaPJrMXBpVrR48oU2Ug6s
         p29g==
X-Gm-Message-State: AO0yUKWSyAgVdXDP3QYu7Dkscz1R3IhXF5FpsdFtqHvDoNjyJNE9k1ig
	emPUDW57ashZaplGG4RiydWny2M6x5Q=
X-Google-Smtp-Source: AK7set8l0s9E2+AVyFjcQYpFfyKvdddA/jlehoT8Njq0FFIeLcdkxFh3/I+YGjXUP8M20aH6IE5ERw==
X-Received: by 2002:a05:600c:a697:b0:3e0:1ab:cf2a with SMTP id ip23-20020a05600ca69700b003e001abcf2amr5455551wmb.39.1675840926124;
        Tue, 07 Feb 2023 23:22:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/52] pkgconf: upgrade 1.9.3 -> 1.9.4
Date: Wed,  8 Feb 2023 08:21:23 +0100
Message-Id: <20230208072143.2930292-32-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176872

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../pkgconf/{pkgconf_1.9.3.bb => pkgconf_1.9.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.9.3.bb => pkgconf_1.9.4.bb} (96%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.9.3.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.9.4.bb
similarity index 96%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.9.3.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.9.4.bb
index 453da89c3d..ab0f371093 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.9.3.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.9.4.bb
@@ -20,7 +20,7 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[sha256sum] = "5fb355b487d54fb6d341e4f18d4e2f7e813a6622cf03a9e87affa6a40565699d"
+SRC_URI[sha256sum] = "daccf1bbe5a30d149b556c7d2ffffeafd76d7b514e249271abdd501533c1d8ae"
 
 inherit autotools
 
-- 
2.30.2


