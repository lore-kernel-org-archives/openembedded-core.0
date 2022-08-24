Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA00DC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 06:34:50 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.7999.1661322886659056700
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 23:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GRNytPm9;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id r22so14204524pgm.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 23:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=oOlAMStPYIVVRqbKULYeqyW2dnAXWeQjex9qY0kpq5g=;
        b=GRNytPm9DGphf5XeT4JthyoDhzTu6NvC1bD3VUpbkQuVTG9s7W3Zd52pMT1IbiVmxT
         IeAhBsjLF40ZKjdG6PNjqJSiSB2339PI9gpKibM8cfTgv8S+8XGOngc1TfkGTK5PezAu
         FfGo1dwu2I9vJtwfI+CoAtrVT0Fg9FSyS89vJ8tnQI2PbAmq6NCCLr+vNkNDppuCFj+8
         JatM0q2aIWN295bQp5TIPZIwxCGPNx2vQlPwOUqbuH/6Gb5TeW1t28gqvIxQwd1VF3Q+
         Fw1EBwcrcxLdHnjj5vVa5kE/64PHMr2a/tcxiPkaAcsewUBcPVq6UDSEnZuCB6Lt8TDm
         kYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=oOlAMStPYIVVRqbKULYeqyW2dnAXWeQjex9qY0kpq5g=;
        b=P7LZWQrtN3qAN51rRY9YI16UCZArIQQoCdZkIzbVTca0chlbUBjD8FPQMQpeSONJ/q
         G8l4pe6jNMGEtRHbI0XWaCyIszOnHLoALy00It1RGxQqmmVcqW6gMP0P6rRpdJ9rUPvx
         FTCBv5bc8S8DJmDwI75jv0fIUFbdVg8AlZ1Wl52TumUsSpNQsOXlbQohDJpSuMIWPVdp
         8a/Xasvd2nxKAM2ymy5oZ2NrEIsF9GkOf+wxMqgL9LB51PzJHqDnadBz+7ANgXyJ18PJ
         4Q41GQ65JtY/bWESN8/k59ujFo6uGf6ZxNYAPlvlJG7LwqWPDZ6uta1p6mYzOr3ArCFf
         C55A==
X-Gm-Message-State: ACgBeo3go7wHAiLoKxm+YsuZmI1rve3c04YX4PF9TCKXCX6x5yhBJP3D
	Xz7+EOnRsOGRzevKQL7ssWBt70I8U+NY9w==
X-Google-Smtp-Source: 
 AA6agR6y5rmpLR9KmG5R5/bCcM4YY71TpLWnZFMHddKGndXwQ6YlIN7d7kKooS/W/TIweCyT+nmaZw==
X-Received: by 2002:a05:6a00:1507:b0:536:fb3e:7e75 with SMTP id
 q7-20020a056a00150700b00536fb3e7e75mr6120742pfu.44.1661322885726;
        Tue, 23 Aug 2022 23:34:45 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 s24-20020a639258000000b0042a3d9a1275sm8384957pgn.16.2022.08.23.23.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 23:34:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/7] xinetd: Pass missing -D_GNU_SOURCE
Date: Tue, 23 Aug 2022 23:34:37 -0700
Message-Id: <20220824063443.1774094-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 06:34:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169775

We do not get proper function definitions otherwise e.g. fcvt()

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index 62ee70d244..897417314d 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -30,6 +30,8 @@ INITSCRIPT_PARAMS = "defaults"
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-libwrap,,tcp-wrappers"
 
+CFLAGS += "-D_GNU_SOURCE"
+
 CONFFILES:${PN} = "${sysconfdir}/xinetd.conf"
 
 do_install:append() {
-- 
2.37.2


