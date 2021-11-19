Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FFAC433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 11:34:48 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.7703.1637321686911459213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Km6YMynO;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id w1so41443790edc.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Nov 2021 03:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jz/0wV9+/ORhjmbPirPzK2Psx99hFxjDy6rDr8HWssk=;
        b=Km6YMynOIc2w01qD1SO93X5UtRpIQCzDQ/r3y2Z2Ron/hQD/Rh/E6ylYC6hCLPOkVc
         IYrQgPoJW4nU1QUg5MRTpT6O+E/aGLB80v2uLXqEjudIrbX9HPvX4zJuGn9jr1ppJeb8
         GYOAgdZdx43+cQYMz5AuREeTKbT5YfUByTNWonv2anabIbshezGbxqHMM7HmPZ6dsFlO
         jNt9HRTmVxPsb94SirtwhbVoCsQddUlfdoEaxdlIJBiTnWexn4rHUXXT8bcJ36D9/zj1
         5TtJJ7Xx4byLisefJi94dj1BCGOaMMuMvdHcDmSXfYPhYYiYq89nUlXAoUxp6fw7WeFq
         AGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jz/0wV9+/ORhjmbPirPzK2Psx99hFxjDy6rDr8HWssk=;
        b=h3ioQOXIC8ZzoyKb+3ntiYbhpGel5apUZEaLr06qV/4MgLY9ERw0qjnXINZMWkjaaE
         +zwm4Lm86wAH1tSAWrnxy2qSFSsOQZ1dvvHstZ4HYq8OmLSl8HOf991cl1nlyoXPc68C
         xm7qbliU0cNpyNmZ2Oqcu+k3x2EzJ9volmDbJxB98LzOWFCzxph/2/vnv/tXHMEc9BWE
         ry0tqgqxXMfxl0PSSUktu7GyNtRwwbabNaAom6TH6jkVbE/xREvSxw7eflDD4Iovd9zg
         6mkPomBVFdfdv0v7TUdb1bNUr7TkcBaBXE8PiDBA0iOdP0JaC4ZW4SjdJ2kILT5IFBNg
         TDHQ==
X-Gm-Message-State: AOAM532yaWpx7BDg2/OHmwfObTag0I8U1EQISZqAm6GYh9hK8tJdgOSO
	7dR7cDzAMkwGUX5gPJ7aBbQkrL4pFOtXLw==
X-Google-Smtp-Source: 
 ABdhPJzap16gZCSk1OJ6pxuCzXIcmqm9KXfqf1lpZ2cxzFzOps/9AMMAlcRMpL5cxmhLT7TjC5YvTQ==
X-Received: by 2002:a05:6402:510b:: with SMTP id
 m11mr23230559edd.165.1637321685204;
        Fri, 19 Nov 2021 03:34:45 -0800 (PST)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 d18sm1347483edj.23.2021.11.19.03.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 03:34:44 -0800 (PST)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Subject: [PATCH v2 5/7] kbd: add nativesdk
Date: Fri, 19 Nov 2021 11:34:27 +0000
Message-Id: <20211119113429.502652-5-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211119113429.502652-1-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <20211119113429.502652-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 11:34:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158511

From: Luca Boccassi <luca.boccassi@microsoft.com>

Required to build systemd tools

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta/recipes-core/kbd/kbd_2.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/kbd/kbd_2.4.0.bb b/meta/recipes-core/kbd/kbd_2.4.0.bb
index 7cb45eff77..7efc7af312 100644
--- a/meta/recipes-core/kbd/kbd_2.4.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.4.0.bb
@@ -43,4 +43,4 @@ ALTERNATIVE:${PN} = "chvt deallocvt fgconsole openvt showkey \
                      ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'vlock','', d)}"
 ALTERNATIVE_PRIORITY = "100"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


