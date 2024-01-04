Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2812C47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 02:10:58 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.45609.1704334255543536746
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 18:10:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dB6DNkRK;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2045bedb806so39286fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 18:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704334254; x=1704939054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kJC0mUc9LCmOz91eQ+suPxc5uBHXDgMg7H7m/Cn0DSM=;
        b=dB6DNkRK0qys0cpn2a6Cn5s4KHT0rMJBSm50QFQJS1xZREMBMP5b43Tmfar/D7gFck
         4ZduRcern908ozydRf/vlQg2qQfLDX5wJIYpo0aTRpXye9OpCzhgsb0/MfbDY7y4mx8k
         aGHGAlgJU9iWyHmdjDBW2J9j+3h9UqB9RIShNawDuGi6C6QY4WTezM8LifbJc8EUSI9b
         I9YRWLtWMjxMkk4Bn3l/x7WS/quFCqn2Jnf+SL1FHEhRCaiQ7qSwRA1nRZ4Gx48XswLD
         TSFEZTIcFfkEMUhT15RBP3vuR3I6qDV8xiiPL0RA44+o5hHzi5D/+v7RQfz5sCSiryLK
         ny+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704334254; x=1704939054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJC0mUc9LCmOz91eQ+suPxc5uBHXDgMg7H7m/Cn0DSM=;
        b=Qrvjq6Im3WKi2UZv4QDQ95O/5ZpCBOQe0vZiXlMaTq+ld8sIQb+Ko94fkfrfDVEnjH
         XteTCb+nHvEETlCSW2TVClOx9a60us8oh1yrhodhFxrzSBrTz9KzcVaKJ2anUJmBKjBG
         HZ2kx2+PrVamIDw/Wr0NoRV+XCWmvwmqQUMyqSucXumCHx3PAl9KDknvIZ/MieNgKvTM
         Akatruen0fnK4ZKb+Vxzi1pALUdOp61wpEVc6qlgZpKqeq69sZgKP6FpdNGNo4+AXwnY
         5ZKDu3XgizrRQB9jA/DmCTRg12PNLYl/EjAi7rXlwuFVS0/qJ3Ikijz2QnIlgwr7sIxG
         MSBA==
X-Gm-Message-State: AOJu0YwUjX8HvWsdJIdltNok2sojW5LC4lBLF8XaFERS6MeJJ850coTE
	ff860pLGL2hjoPL6y69iujzhegqdYvE=
X-Google-Smtp-Source: AGHT+IHTn6F6RCwaSMY+GYv0Ock+JlFlBQaTthGHAmx9PapwKur051Wd7bEMR9oOaneQN1UeO/u60A==
X-Received: by 2002:a05:6870:9726:b0:203:64c3:7b86 with SMTP id n38-20020a056870972600b0020364c37b86mr25821626oaq.44.1704334254519;
        Wed, 03 Jan 2024 18:10:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id x62-20020a636341000000b005ce53bf5a82sm12374905pgb.77.2024.01.03.18.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 18:10:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] Revert "opkg-utils: upgrade 0.6.2 -> 0.6.3"
Date: Wed,  3 Jan 2024 18:10:51 -0800
Message-ID: <20240104021052.754030-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 02:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193299

This reverts commit a856192be5dd78c621478ed29871191c580686c4.

It causes a regression in creating different GIDs in image and ipk as
reported in [1]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=15334

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../opkg-utils/{opkg-utils_0.6.3.bb => opkg-utils_0.6.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/opkg-utils/{opkg-utils_0.6.3.bb => opkg-utils_0.6.2.bb} (97%)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
similarity index 97%
rename from meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb
rename to meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
index b509227e1a6..eb88b9b734c 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
@@ -10,7 +10,7 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 SRC_URI = "git://git.yoctoproject.org/opkg-utils;protocol=https;branch=master \
            file://0001-update-alternatives-correctly-match-priority.patch \
            "
-SRCREV = "589880d01969eb9af1e66120e731d43193504718"
+SRCREV = "67994e62dc598282830385da75ba9b1abbbda941"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


