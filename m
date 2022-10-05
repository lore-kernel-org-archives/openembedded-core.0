Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84447C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 13:58:55 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.23997.1664978332928739185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 06:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ik/LLXmw;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id x40so8149477ljq.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 06:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=dmhXJnbl8INBv8Xld49wP4SSbgZEj2hrMJXnUBFcbpA=;
        b=ik/LLXmwTFCg3IfRUCsNlsL9CJD0GHpvRaYC78NEBhpiQswVZzJDXvdTDYWv/l9xQL
         0Vm3XeH5LQkaPqyyvYQNwSoEmeRa7vgnWRXswMj6FESHuzSJDS6ZDEQa18k01j8UbEqx
         5sJpFoHZJVLI1L5s1lz7C/N4iPpHoXTEfACsYaadz+0NB/FbSJ4IrxVHuV1DSKN6VGt+
         plrg1G8qFmwVK0U7hG2A/ggh4W1ni1H713poqR5NH2kDv2j0g926PrzVRsWz50HcAGhv
         DOoSa6A8lWlSe60FI7GHC8Ca9XeZYPYISfVpzvX83+xLay4ZkP+d0vdTgrnpkiRAViFL
         rd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=dmhXJnbl8INBv8Xld49wP4SSbgZEj2hrMJXnUBFcbpA=;
        b=TSUREg/laFQ+p6KLIP17bMchIt12FggF7HLGvsKNpNje/BDRo5XLmGHgzSMC9Mr//B
         35UIh9ymoW6IEUMrwvMyOqsbnHeGE3Q0JGep+XlVIYM0YP8MCvIV/aZbLY0cjuuUARij
         kHfIm7GGdJc5YZL/6mCMFZLLj/sgPiPYol/qHp64ndQZb4OMnpGuek+pS1D5FoUGr26E
         M6fI1eOJ1HMyg7me2XaG/gm3ppNZLW7M1wv5q+Atx/xl6NFSAAGd5ZsfZsmsF+POvH86
         jjrcsJt6l8yb5U+mzlf5tk1blCtAv/PQ+vDdd1ehraqv8A69EtLiOnJuqO+obWC28f5c
         Ly/Q==
X-Gm-Message-State: ACrzQf1UAEybAaW3giptDeqFU/LplOM/PZlTcL9MKbQvl2L5SvCwVeOg
	lk/Ah8eBbyrFWsnaKCNIesZJF2Fwh7k=
X-Google-Smtp-Source: 
 AMsMyM7iL4AIFJBijqdcP7RY2Jpk+e/UItHyLh/nWr9zBtJ+GFS4awvdQOObpDcgqrg8TFWFoFWUzg==
X-Received: by 2002:a2e:9e8d:0:b0:26d:ffa1:2653 with SMTP id
 f13-20020a2e9e8d000000b0026dffa12653mr178709ljk.439.1664978330610;
        Wed, 05 Oct 2022 06:58:50 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:74e:ec03:59e9:b1ef:aa29:60b6])
        by smtp.gmail.com with ESMTPSA id
 o12-20020a056512230c00b0048b1b2233ddsm2353071lfu.120.2022.10.05.06.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 06:58:49 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2] bluez5: change configuration directory mode
Date: Wed,  5 Oct 2022 15:59:21 +0200
Message-Id: <20221005135921.4167614-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 13:58:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171459

From: Ming Liu <liu.ming50@gmail.com>

Change configuration directory mode from 0755 to 0555, this fixes a
following warning when bluetoothd starts:
| ConfigurationDirectory 'bluetooth' already exists but the mode is different.
| (File system: 755 ConfigurationDirectoryMode: 555)

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 79d4645ca8..48b8bcbe75 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -82,7 +82,7 @@ do_install:append() {
 	install -d ${D}${INIT_D_DIR}
 	install -m 0755 ${WORKDIR}/init ${D}${INIT_D_DIR}/bluetooth
 
-	install -d ${D}${sysconfdir}/bluetooth/
+	install -m 0755 -d ${D}${sysconfdir}/bluetooth/
 	if [ -f ${S}/profiles/network/network.conf ]; then
 		install -m 0644 ${S}/profiles/network/network.conf ${D}/${sysconfdir}/bluetooth/
 	fi
-- 
2.25.1


