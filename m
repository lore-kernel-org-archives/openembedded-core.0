Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AE6CD11C2
	for <webhook@archiver.kernel.org>; Sun,  7 Apr 2024 17:09:56 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.85325.1712509790227530980
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Apr 2024 10:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fIfAJv7t;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1e2232e30f4so33063725ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Apr 2024 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712509789; x=1713114589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qCDSglQIG0/LE8KrDvp1mEuk97tz0SGXeAoSa/2tpWU=;
        b=fIfAJv7tMvtG7m33+oSunsBoy1MM8WLyu+45YERjeHpVa8yapuCk1V5IkkI1YKQr8L
         hoq/+FohBZY4xZaUpy0yXYJu1b3INX15xhNjjyZ3YobqoFqPDk7YsFnVByzSIHGudzWg
         RJoqjDoRF/qaKF0lCvv0NdgRbxpYkBZAmtATwrh2NfUKnzjglH+KqFQqw7RdTIgSj5OZ
         +9pZX30ei4LaAB9w8tHQzyhOu/WU97//V3L9TwHqyOJqTo4L+map3HL+Jxk/f+NUA4Jz
         w+qHiFmNPOxV5Bwyq4oAzW0iCHjFurdAjo5PZuhBm5HGaHhKE8ry5t4iV8drk7lfLhVY
         unsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712509789; x=1713114589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCDSglQIG0/LE8KrDvp1mEuk97tz0SGXeAoSa/2tpWU=;
        b=tXbHfKpRnmMOlre8vXoR4gGp5X2NwtR46AFgXoRDtGxzV6F1de/S+xO2EX2sZhsij5
         isp+aCqRmAGmechFR9fd+dN2DYUG62V4w6LMsbJ+Uc1k6myI9ICTQUn3L6bwdqRJr++R
         4GbffbRm4bkmbW3SMjc1V1Pf6Yk/6yVYwPe5S4rBVeVdwzwtUGv95d6xtYd+T2i8tB5u
         nN519lRDHSDrCK8ark5u1Yjk6OB7UtZN3zZV41OFKMIYKgjDUt/Vj4SqO0P9sQE0zbOc
         qvDmvxyJbFG2DgY/d284jNvDFlIGGCDE9SDZqycT18BUyWWVur8TtrleG4b4Y5NPqktp
         5Iug==
X-Gm-Message-State: AOJu0Yzf7Zcv13DQJB5fEkKoYLX/C50IR2wr1EV4ChAdIV8B3z4wwKc8
	vGVq0xSx9SX3jMJsfO/Gsg8qn+91ZNzDYixXUz4plnT5KIPdvMI55B3vDuSK
X-Google-Smtp-Source: AGHT+IEXwknYdMCpuS7ylrRB3YDlNFyUDNKra+Kul30Ue/NEbL6dRvuVeh/aGtrnl4rYfmR04IxIqw==
X-Received: by 2002:a17:902:e751:b0:1de:ffbc:8d95 with SMTP id p17-20020a170902e75100b001deffbc8d95mr6793723plf.67.1712509789312;
        Sun, 07 Apr 2024 10:09:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8384])
        by smtp.gmail.com with ESMTPSA id n15-20020a170902d2cf00b001e3d2314f4bsm3446571plc.132.2024.04.07.10.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 10:09:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] sanity: Use diff instead of meld by default
Date: Sun,  7 Apr 2024 10:09:47 -0700
Message-ID: <20240407170947.2078302-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Apr 2024 17:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198003

meld fallback assumes that user has a gnome desktop
its better to fallback to good old diff tool which
will most distributions on build host will carry

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-global/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index bbbc41ddae9..180c6b77d8b 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -40,7 +40,7 @@ BBLAYERS_CONF_UPDATE_FUNCS += " \
     conf/site.conf:SCONF_VERSION:SITE_CONF_VERSION:oecore_update_siteconf \
 "
 
-SANITY_DIFF_TOOL ?= "meld"
+SANITY_DIFF_TOOL ?= "diff -u"
 
 SANITY_LOCALCONF_SAMPLE ?= "${COREBASE}/meta*/conf/templates/default/local.conf.sample"
 python oecore_update_localconf() {
-- 
2.44.0


