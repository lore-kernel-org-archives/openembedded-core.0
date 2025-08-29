Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3D0CA0FF7
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 09:25:40 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.9495.1756459537390883639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 02:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WpjaJ6m3;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afec56519c4so237943166b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 02:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756459535; x=1757064335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JWuY79K0WkDZhxcu+dmOADJGbDhNktEtBzUfsO5GYtw=;
        b=WpjaJ6m3ejdDCrRHSD+j/BSvxvjm/Q9RVJmao2oiGqaj561bM4WxzEeswWy61WizF8
         btAfel0fDzv4y8ZypcUxZx2i7eSH6zbUosBYjGi6CI/tIXYHpCtqXhmc5tB/VMk08J8d
         01wvEBIvGJcqESLzGLmKJ/6aB7ZCMBlHfx6KhnqS24TvhEwO66vgQUhhsi5rKTpGm+hp
         3rafyWuj29MSdz1A+IphhQw5aGjE/rEiXq+nwWVUggCO7C5bfQVxhRcvCoZoKJdq9KyF
         zZG4x417B6dkh4w0G6kFyRZhy5dPTea6ht6yyvuiv3tMxnO/nRI7YLaan9GF0CgDnDM7
         /UOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756459535; x=1757064335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JWuY79K0WkDZhxcu+dmOADJGbDhNktEtBzUfsO5GYtw=;
        b=EEhlvb1yqaX4rsiGeCw5pN7lCZ8pHgX5v7G6rs9PMdhTS6Zka/W3B1bf1pEbmNm1ky
         7OE4Z9eAphu6sy3bMXBsrgtPq4kgXfNPBaqx/CvYdYlCtOqO4r+shvuqb1PK4w3ne/RM
         pD4maYt+A5d8wfFm/OQcQmY3cXz+SgQV/P39Da+YbqbYXdBI0H1EZEyFo6PHK8zumn8h
         zTnts/cWO+G2jIE6HjkmENSV2tnbGbc78vua7aYkSBFYpKZmz1fZETxr8uPjNZ915nrY
         Gv3GXHKIb4wPUD2CTVmi0Uwlhsax0zwy5M6c6VXLOnl5/DxDbq4Byz7oRmI8eG/5pk2Z
         xmRQ==
X-Gm-Message-State: AOJu0Yz8VJTVyqLegWK9fbjd/PVzxciyeT1UpFOszGM8UUTGc4CZlzaH
	x9WD/KfZpW8vd14QSl7+fFj3Lz9ijPqpPP6shkorJ6r1neefEXQgeBt1nRzFJQ==
X-Gm-Gg: ASbGncsoq1C6S0zT87+U3fpkVB1Ht70sSm8djt+kPI7QNnKPN65r/j00h4cdZyaOgoY
	Kcfof+NehM3pL+KCNKxQ2zYZ5KIJzhNBEYV4kYNtWQDEjEdSRnyXKm/ykysyg2iN403O195bco0
	hw2uhWN2xdQSIkDeNN+JeQHMF5fBh/7ZwyJvy4Qb/4WVaE6zQCUin2+bbSaxE2tLJ9LrRF+TePW
	C0cbXiU+mGFJts3sKlQJQiYsTpSJkVs3NhlJVieg/BWleebYI4SgM4mR0H+bhAEOebMffr1hnO+
	6I6qRp+u6C2DE6XkFRGF+e9ySiER3ESvTAoIs2IYqPN7QGqoEIZUTC3DoeDIiqpulVRCDcQGuR2
	4yHCsmm04YOSvzIpQzAqaFEfXhV1hyyI=
X-Google-Smtp-Source: AGHT+IFHkyeHT3ZIFZNJBNKwtV589oBVirRWn9apIAMypaK7rD6wdbvxtF0uzRrisQ6S76LPndvX5w==
X-Received: by 2002:a17:906:19db:b0:afe:82f4:f988 with SMTP id a640c23a62f3a-afe82f50185mr1205756366b.26.1756459535427;
        Fri, 29 Aug 2025 02:25:35 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefca0a955sm157010466b.29.2025.08.29.02.25.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 02:25:35 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] hwdata: upgrade 0.397 -> 0.398
Date: Fri, 29 Aug 2025 11:25:34 +0200
Message-ID: <20250829092534.90207-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 09:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222608

Changelog: Update pci, usb and vendor ids

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/hwdata/{hwdata_0.397.bb => hwdata_0.398.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.397.bb => hwdata_0.398.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.397.bb b/meta/recipes-support/hwdata/hwdata_0.398.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.397.bb
rename to meta/recipes-support/hwdata/hwdata_0.398.bb
index bd985c2a14..a0abf4c03b 100644
--- a/meta/recipes-support/hwdata/hwdata_0.397.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.398.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "e4423c783ca7db5c9d6d4881985272849f4892cf"
+SRCREV = "4c97c196390e16a84d3394e7e6f0608046f7ba81"
 
 inherit allarch
 

