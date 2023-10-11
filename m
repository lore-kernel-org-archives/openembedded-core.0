Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42244CD98DB
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:02:17 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.5190.1696982532168097186
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dpnGOrVz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-690bf8fdd1aso4649254b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982531; x=1697587331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFYqEa3Ya9vZORWR+02Hf4PElKQVXE988uVJkKhNv1E=;
        b=dpnGOrVzeG6WeOlfE/55fT/UJXIS6eO0E7v06utFEzKrQnC9FS45bZEqrglhWFfUTp
         hK9C3PBNfswTghaPRD0mfJJX15ZAoUEbKzNetUSvLTHfXBaAv33X0fWiYKXk7NqyBW2B
         bWa7tFGZwzOwcOmRc8rSSXbgT3whclb4fH6Z0ybJWP7mWXsi9gO/OtXDt2CV9Y2ESFV3
         0eF5quAHlEYZORgp0sICS3BNYlbfrXQ1ZOfwyZI9QmetaZOCp1YhbZrjvK6eAaVp243b
         jNdvAqHGrbhnAwe6dnepNNJoLXAyBD+qndsGhlGSMeBiBsiV5tas3f3Qz9v6WrywPuGD
         r2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982531; x=1697587331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFYqEa3Ya9vZORWR+02Hf4PElKQVXE988uVJkKhNv1E=;
        b=EO6vpS+wlQiFO3zlanXtG7Heu/bODinkbLbk514iJ4JILXRp2jpkX/q+aCy0yUThQc
         nZuKSALXahCqCor/ES2+bSS6p85TCC1/HGn3pgh39lQMiNFGtLjMFAWZO15T88ywQVA1
         MHgp61r/61zQhJvJSdXT5k2hb+fRU652WLGJ3CDBfSgFl+/b0F2proLMZ9IPm1Fa132/
         oW9VVXqEjdedcXJMs8TngwSVgk/8UPnTQX2dVLI2nGBjmgFyxuv6pIUD2OnS3POXXy2N
         yCiFP3+uJMQj57pcZiQA0tWPG4616LCHNoE+Hj+0VEeHVsiJBSoaTJQwUL1BJoC6gjxo
         TL+g==
X-Gm-Message-State: AOJu0Yw1RCMoNc9lSsjqeQwtAk7e5EeuPcX7e2oUNya0jx3NA+ixmZw/
	niL/gWMm3uQ4tya5JUuJ63p00yGnez76kbUwBjY=
X-Google-Smtp-Source: AGHT+IEVV35CxukEiFQn/cYmyxU6BEdfE34XZ1aZx013D1BEiRn0N8mzvE0KYceG6ruCP6GwAij5FA==
X-Received: by 2002:a05:6a00:1996:b0:68a:3b25:50cc with SMTP id d22-20020a056a00199600b0068a3b2550ccmr18516916pfl.30.1696982531191;
        Tue, 10 Oct 2023 17:02:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.02.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:02:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 14/20] dbus: add additional entries to CVE_PRODUCT
Date: Tue, 10 Oct 2023 14:01:27 -1000
Message-Id: <0329ca7bb29cdd77cca93c4354e8e0e5de5e37d8.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188932

From: Emil Kronborg Andersen <emkan@prevas.dk>

Signed-off-by: Emil Kronborg Andersen <emkan@prevas.dk>
(cherry picked from commit d50b395ceff3f30c30a10dba94fb340a547e434f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/dbus_1.14.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.8.bb b/meta/recipes-core/dbus/dbus_1.14.8.bb
index b6c245d40b..2dcbadd50b 100644
--- a/meta/recipes-core/dbus/dbus_1.14.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.8.bb
@@ -184,4 +184,4 @@ do_install:class-nativesdk() {
 }
 BBCLASSEXTEND = "native nativesdk"
 
-CVE_PRODUCT += "d-bus_project:d-bus"
+CVE_PRODUCT += "d-bus_project:d-bus freedesktop:dbus freedesktop:libdbus"
-- 
2.34.1


