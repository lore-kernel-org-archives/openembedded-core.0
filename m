Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.730.1610496241506202237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 16:04:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g4y0xDza;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id md11so21133pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 16:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uo4ZWoTZ7JMJsm7ihyZatpRTWWQS3v/HUWkVcs/mtzg=;
        b=g4y0xDzaWNOxOIiaWJP4U8EtwlGS3tT4xgkGJ2/p80GCkj678KqqEv8WD4PmA5QpCI
         6xiszifsDt1IaYgXFzA5j0UattJrLqkSokCIYKNLOCBPMoE8f0VGtrXWvXCcK1gS0z9L
         ErVrjxNlY4AKATjBHEz14MP2HBOAxwUPgkQ7/Gfzj/GZBI6h6NvrkhrDVQHdcM1CmxxH
         pgsGII+edTUgdElvfKBWWcRxuQDmp4pMy1UiwufwxZ2gc/BXLG50ZSO8X5o8JX/ZkDp1
         vtzFmniAx0BlDHiCz5DaKjneGTx7r4WKtzmQme8yy2HQ+JhllHU/T0GqSrBfnk+HY6a+
         AtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uo4ZWoTZ7JMJsm7ihyZatpRTWWQS3v/HUWkVcs/mtzg=;
        b=WRmDjyEbLvwlfW+hAp3HSB2yc30TmcHfYdsIuZgZMW9bs4oh9Mnl/9kloNZ8qiBSA8
         s9NcO0FSyNCgGb5sOae15v7yRQFU3HF3MDX5aWWDvqoOsuav/77tbYKMp1tzzYr5Jv1B
         xOqp6DQgDAaW1YTocvHVzcF/+hwUS48g1pMoRYeBd9eQOu9A7BxCXZvLPmA9gbSIJjid
         4EF1v/onhr7DA9HOSbJ9jox7TTFSZo8W+sonkGqbZtx8QDEk7w2bM8/gzuPLt2m6K0AB
         jI84FpMIoMjjvVFhv/OeVrXXOp8UD2whJu9S9jXNaSlVbKj11rVLghjhLQBqiUpsvoAy
         wnLA==
X-Gm-Message-State: AOAM531CgzmONXRHZoRrNwQfIUiD4BfBgI2d3D4KwWQtb2yk4Ztsk32I
	j2PHGxt3aTBYo3LXBZmNsD2yZR8R1ONOuQ==
X-Google-Smtp-Source: ABdhPJxMpox1iLBBd8fdbh/Ei01iSg2Wp6AytME1MaB43VErz0HC7Be+4ekaR65nZ6RgC0pIxer/QQ==
X-Received: by 2002:a17:90a:fc83:: with SMTP id ci3mr166151pjb.145.1610496240731;
        Tue, 12 Jan 2021 16:04:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::248c])
        by smtp.gmail.com with ESMTPSA id u24sm163607pjx.56.2021.01.12.16.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 16:04:00 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libyaml: Enable static lib on native/nativesdk
Date: Tue, 12 Jan 2021 16:03:56 -0800
Message-Id: <20210113000356.3976908-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Helps building static tools which depend on libyaml during build or
shipped with SDK

libyaml is MIT licensed so static linking would not be as prohibitive

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
index e39a7b9083..778e091638 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
@@ -15,4 +15,7 @@ S = "${WORKDIR}/yaml-${PV}"
 
 inherit autotools
 
+DISABLE_STATIC_class-nativesdk = ""
+DISABLE_STATIC_class-native = ""
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.0

