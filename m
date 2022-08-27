Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEDBC54EE9
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:44 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.51629.1661624789829470818
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0idn4+f3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 h11-20020a17090a470b00b001fbc5ba5224so4962229pjg.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=jQIV3c2u05ypcqYadG64ORti4G2M0BZZxPt4QUgvRW8=;
        b=0idn4+f3V/By0Nxi/8HGnbp0XHZ+aDk5VYNFXHnoddfaTd+jA7/4Bkh4gEKsd4n+10
         fnJ2n9nF8G7pq5+8b6D5MiL/1c7z1xA63iCabaaT2Rc24TC7hVTzYueiJ/Y2jfizCrIc
         w6yOaVNzcXG9tUnY8SOYaP+/RNb226TR/PGry+0k0jYEF1B9x7WUYl/VRDEVivBLUXeD
         vMQG0pAERT38JbK1JBequUybKBTG1s4uG7y6Q5UdoSjJDs8lQYiLUYLG2JQyNyRn+epL
         +f8eDZbAa5TNsJynepUJPYtHqZcP0UL8+Hr5Uyp4Vpxu7JpItzK0mu9IQKF8uJHxKLkS
         jTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=jQIV3c2u05ypcqYadG64ORti4G2M0BZZxPt4QUgvRW8=;
        b=KPii73pjrw2lVgSDk2Y6tuaE2nkrqAlmvr4gtX2wueLuNW6sKFWCciq9tuPby2QVym
         Ileru2bejWouQ0pvNjOjcdxPhQFHCEbU2NRx0MJuNs5dyMH4gOYiBv3e5mB6sBwcViFI
         LVy3TW6GEUYr2EhAMXVI2ASNrXeDO5xOp4kU3AdiRwS8NAnbGgBtbfI2Ynq7UKigfvJr
         EGDYQLIia80ED1sXnwDr00p4hAHxzq27Aj8beNowwxAO8XPVfgJ+4SV6gmRAciYtHtxi
         p7R0dqfRyeMfL/3w83+l+0JAh1mP/ogpjiwiVwYrSZLc2nvtp17m3zt7qAcZ92GvDhuC
         5j5g==
X-Gm-Message-State: ACgBeo1sxqnfYOdkunkws/RoSHHUGzpwSQnP7r+pf+/ZgTGkqHyA54VQ
	eAd6takRrIcK3GxH7Y2chyfK7dmho0wZ5Sy8
X-Google-Smtp-Source: 
 AA6agR4MxS3oHJcNgV5cQAcBxkqWfFw000xaY5nuW6mLFys20/ZJ0mFMMcMAn+1lsvdJtQAngkzUyg==
X-Received: by 2002:a17:902:7c01:b0:16f:9649:be73 with SMTP id
 x1-20020a1709027c0100b0016f9649be73mr9240801pll.70.1661624795256;
        Sat, 27 Aug 2022 11:26:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/24] oeqa/parselogs: add qemuarmv5 arm-charlcd
 masking
Date: Sat, 27 Aug 2022 08:25:39 -1000
Message-Id: 
 <d0dc1cf15f10a4b7b8a25fb5fad460b69f4fd473.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169956

From: Jon Mason <jdmason@kudzu.us>

On qemuarmv5, arm-charlcd is logging an error because the device isn't
present on the virtual machine.  Mask it off, as that device could be
present on the physical hardware (and we want to use the same kernel
config as the real hardware).

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c03c33a4032f995a288f7287e79f43fcd3140aa1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 1f9365f3a8..a33d645155 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -140,6 +140,7 @@ ignore_errors = {
         'Failed to initialize \'/amba/timer@101e3000\': -22',
         'jitterentropy: Initialization failed with host not compliant with requirements: 2',
         'clcd-pl11x: probe of 10120000.display failed with error -2',
+        'arm-charlcd 10008000.lcd: error -ENXIO: IRQ index 0 not found'
         ] + common_errors,
     'qemuarm64' : [
         'Fatal server error:',
-- 
2.25.1


