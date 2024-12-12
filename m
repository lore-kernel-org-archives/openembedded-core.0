Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B57DE77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 16:44:32 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.24072.1734021863353058701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 08:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YXkPElCL;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361815b96cso5986415e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 08:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734021861; x=1734626661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4hjuVLZ/5K/WaoiI93KOQT7qScWedFSOcLBYP6wqJc=;
        b=YXkPElCLqBwTMkx8voLeOXzf6XMkVaDDMSQEtF+3qlLbSp2QD7Cc40R58dOpmo2ZeO
         1oOzrpF9r2/WsWE+jRqpZSD518tyYls9+/qStWg90l9Or7RXxsppaiqsxXN4LXxPFWwf
         qjZmLd7Ax2O6ATQRfXXfXQraqgiftYJ+tbSC8BahEVZLDLjLD/HKTJuU0xcCu3u7Ry6d
         TTmCifxV2W53bG2+uVmisJ7RB5sBpWzAOh/BTwLNW1v1G4QtOz4lO+kU5WkCHTZPFFw5
         qNzH4E5+BVQceEFSdRqR8QX5ulnZvE7oqV+Jj2M1+LIjd2r64+IkHfjqWOPuZg9JrG6M
         RbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734021861; x=1734626661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4hjuVLZ/5K/WaoiI93KOQT7qScWedFSOcLBYP6wqJc=;
        b=aFgK7ag2028slcw9o7b4GH5TKeSFTYUzeeYWVu6oaIAR0kikWTkCz+VGKNycDiUZFH
         wl4kRvKgjqxbuQI7XBjAa1kZo38oO1JNFLCaHj9/jJ8JWMyQTuhNsY77dbleZE1drzA1
         nIZFUG7qtnhnWLqir0Il7sK7IDHiJeZ4bH3dz2IYMNLBTmm7dhxemF96AOwriaGsibZB
         VHWoD7vH15YeAo899gb1cwn0fH2m5usH5/5ysN7JkSqusDZyj/p5BFKNg4Wf8KUPm6HJ
         S85OX7KgduUOGT1rL8oFP++GA5M17bUObWtb5LhQyVvSLUHAxL05wn/ZKzISVDrG/QfW
         GQsQ==
X-Gm-Message-State: AOJu0Yw5GsWsZhNZ3TLgquoIdzr2tOHo3q6iMrct51EvrRbfNXUD5Yv3
	IBRIBacegzX6lCLZ4+Cm2bF3tleAeamxX1x6r4WATfdDUwsqbLBCkula9g==
X-Gm-Gg: ASbGncvaty/s7+HPb/b3m9fM2KpfchOqAMQ9Xi9wSY9gBgNH5Ijewq3izjWeBAtw+RL
	H1Ct2RhvYQ4TzvbOgUIkwMx2P7dh/7kwiag7Utjpu7n8OTzJbBWQZz27CFcWkJyGNTVhGvFhkcb
	obj+ymoALoI8wCAbYXnbulBH/Aph+yohWP/KZzK1fAXX5c8JZRMoovUlnvHS4ZW6+fk2F05xR9O
	QNM70ODa0QUprEaPyaOV+os6FZ7rM6yJsYhd7IOKC6uzU6hnGfkhaxsu+RibDrMG5KJTiAOl1ER
X-Google-Smtp-Source: AGHT+IFL9CCjzybPWaoxxPoYgB+JpQpaP9OlSlJBk8anQ783bds2JMNm6qV1L9N2vgmj2D3PhPvYog==
X-Received: by 2002:a05:6000:1ac8:b0:386:32cb:4aa with SMTP id ffacd0b85a97d-3864ce93bb1mr5911569f8f.45.1734021861314;
        Thu, 12 Dec 2024 08:44:21 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4815sm4473331f8f.26.2024.12.12.08.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:44:20 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCHv2 2/5] dropbear: add dropbearkey.service to FILES
Date: Thu, 12 Dec 2024 16:55:23 +0100
Message-ID: <20241212164407.2904755-3-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
References: <20241212164407.2904755-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 16:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208655

From: Adrian Freihofer <adrian.freihofer@siemens.com>

dropbear.socket file contains:
  Also=dropbearkey.service

That's why dropbearkey.service got automatically added to FILES.
Since this incorrect auto adding feature gets dropped from
systemd.bbclass this needs to be added explicitly.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/recipes-core/dropbear/dropbear_2024.86.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dropbear/dropbear_2024.86.bb b/meta/recipes-core/dropbear/dropbear_2024.86.bb
index e3f4d17896c..be246a0ccd5 100644
--- a/meta/recipes-core/dropbear/dropbear_2024.86.bb
+++ b/meta/recipes-core/dropbear/dropbear_2024.86.bb
@@ -129,3 +129,5 @@ pkg_postrm:${PN} () {
 }
 
 CONFFILES:${PN} = "${sysconfdir}/default/dropbear"
+
+FILES:${PN} += "${systemd_system_unitdir}/dropbearkey.service"
-- 
2.47.0


