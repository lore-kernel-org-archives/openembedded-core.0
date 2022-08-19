Return-Path: <mateuszmar2@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F20FC32771
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 11:34:10 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.2065.1660908841467440963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 04:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eOu2I+C4;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: mateuszmar2@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id z6so5742206lfu.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 04:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=c2m8dJfBViOd6Elzq0zQHRU+iOyYFj9kthRz64wSlZI=;
        b=eOu2I+C4NRjLZemG6yw/o+x9Cve0JB9X55OZgz+zgfWIj9eEoDvE5NYJPmxeVnbbMO
         oi29ktckSBOPqltvyhIv56USD78/n/rY9eMNsiZLDPHFeWovgfy1xvIDv9T5D+O9+q8S
         KQhU9XgD9a2N3perC5OrbmFlBC+bxKmWo+nT3CwU291G/4OPD0vjZfPsDqcFomfEDrzQ
         EFzG8lSFH2HGnyjZWUrwBy1jx8NNAaqS+hyLswRTT5NKjT2LswLDrUqB/u94H8ZVo9xn
         KU2RQuCLA7C8DWWJbcecTGLndIXFQrbPy03QYs/AB0kE2uwmRJeVJDD9ZsO4bjLbizFf
         lfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=c2m8dJfBViOd6Elzq0zQHRU+iOyYFj9kthRz64wSlZI=;
        b=H7WX/Vf9ACnpVehdx+yftWJKvKZ1dfZhNXg6gbKBvFVKRjftV8Iq6E6O82mnoVOerG
         0xmH4ovraUDfUc1/l8iMlSzUpIp/ov+JW+5F8gNAvXANR3l7m+7KyUl5GfAiU/JvnoFl
         XqIQaGW2yxWnA75VTUXI+e3hDmtgqxux2FiB3jVxV3XFLQ2qVjFjjdWH2pw9GSITXfYK
         zCPcIvB+srjoPkmmt/QBRvx0mqoW/8OWnWbD13YpIoe3AuBknBGfdnyvO7Q2crKFBu6n
         A8CHLe7KwWQDhmmNPMjvL9Z0QBnYlFYwgqGo9TV8A+x3sKPb1WtPP+JskdDKdn6imugC
         V9tA==
X-Gm-Message-State: ACgBeo2ByG6guCEpbbmg8mxMOTXU2FvvNMyqskoLK8NvVyGChaSqB8ki
	huVyEhXZaQNvy7nHeXgjKTA28CRUm6g=
X-Google-Smtp-Source: 
 AA6agR7cSEy7zrGumF1CU6rvgnFTHxv7tjWYWV0TnpsZO1uFleQPdCKN8X9FL39VlCckWLUol9YPWw==
X-Received: by 2002:a05:6512:458:b0:48c:d0dd:a56 with SMTP id
 y24-20020a056512045800b0048cd0dd0a56mr2291502lfk.574.1660908838998;
        Fri, 19 Aug 2022 04:33:58 -0700 (PDT)
Received: from mateusz-gf75thin8rd.NAT.wroclaw_krzyki.vectranet.pl
 (178235146003.dynamic-3-poz-k-0-0-0.vectranet.pl. [178.235.146.3])
        by smtp.gmail.com with ESMTPSA id
 g1-20020a056512118100b0048ae9114c73sm605466lfr.243.2022.08.19.04.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 04:33:58 -0700 (PDT)
From: Mateusz Marciniec <mateuszmar2@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mateusz Marciniec <mateuszmar2@gmail.com>,
	Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH] util-linux: Remove raw flags in EXTRA_OECONF
Date: Fri, 19 Aug 2022 13:33:36 +0200
Message-Id: <20220819113336.3167-1-mateuszmar2@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 11:34:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169624

Having both enable and disable flags for raw is confusing.
Raw should not be enabled so both flags can be removed.

Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/recipes-core/util-linux/util-linux_2.38.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
index 8a7b47a0c6..a93ae83cd6 100644
--- a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
@@ -69,12 +69,12 @@ EXTRA_OECONF = "\
     --enable-libuuid --enable-libblkid \
     \
     --enable-fsck --enable-kill --enable-last --enable-mesg \
-    --enable-mount --enable-partx --enable-raw --enable-rfkill \
+    --enable-mount --enable-partx --enable-rfkill \
     --enable-unshare --enable-write \
     \
     --disable-bfs --disable-login \
     --disable-makeinstall-chown --disable-minix --disable-newgrp \
-    --disable-use-tty-group --disable-vipw --disable-raw \
+    --disable-use-tty-group --disable-vipw \
     \
     --without-udev \
     \
-- 
2.37.1


