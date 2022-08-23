Return-Path: <mateuszmar2@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C69EC38145
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 09:29:50 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web08.29747.1661246984566191993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 02:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C4ATGgPf;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: mateuszmar2@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id d23so14506068lfl.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 02:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=pUarqAM19df5isbRG8y9s/uFISWPsQUENoLCnR5Gsmg=;
        b=C4ATGgPfAWS5eZcYaaT6kbCHMOmTzOtim2d9p8aBC28pXyp9rU1sjAe035oMoYDhNq
         SzUlCUxM3eX6bm/EWE7OlDpvoQHtSsQ0dHU6dSTG9OGgHXqmPmrrc3MdQ30MmcIFiDdS
         hth7DDH3u7crno6nqzL1KEIEyty9pnAZN3ZpWYsEkR0TLVIb5v24iwxYMLcTbdtd8aI0
         633hpJ0ug36B6D5UAnDaXcGS4pijGz62nyH9itqWvFWZ+3IFU0PfbOa0c0U8lmd5dfIo
         9Iyi8pqzzNn67wsywbTA5joDXjUGiAsDZ9FONVo0qNLh/hR90/j4kMWtLZaOKpwTY4CN
         z+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=pUarqAM19df5isbRG8y9s/uFISWPsQUENoLCnR5Gsmg=;
        b=GVu9OGJKcYvs7hbH5zZyCciJg/8w7/pXauV/NC/zwCx+TDWTA/MSN2dE4dzNUjAnkP
         bJTs+z9owpluIKcUFSa32IB+T6t01WQtd/tlax1xoWdXy6Z7vJXQ0k/EVWO1LbY9Y4p2
         JuU270XE5zJNS9loDbec/G6XDVdlyAOksBtzIkE6n7GZwls/L1Uh7j9RaawY124RqUda
         sspeSJXDnd+U4+12iCO/NyHMW/z3THaSyxv12AiO90nUYzrMt/vyntLmBHfmzHGHn9rc
         JSJ0l/REFEm/4V7JYH/ShK1vDJdqQh2/auqSd/p2yq3p7TM4ZRdS6F/iqsnffFMb7a6e
         E7HQ==
X-Gm-Message-State: ACgBeo3VdtI3kGnHyQh/tOx+nxMVT+UcRZLa9+rJIz9twGBJpVKAB91N
	YG6OgOEPR5SEgNj5c3a00WcJ/JxHB2A=
X-Google-Smtp-Source: 
 AA6agR40uolwEzbfNsfmDRUYE9ElF/aORx3Vou1S7ja23r7acQXlRXkjFT5g8wCGR08e3M0hsBi89Q==
X-Received: by 2002:a05:6512:3982:b0:492:ea6c:b977 with SMTP id
 j2-20020a056512398200b00492ea6cb977mr2098363lfu.264.1661246982498;
        Tue, 23 Aug 2022 02:29:42 -0700 (PDT)
Received: from mateusz-gf75thin8rd.NAT.wroclaw_krzyki.vectranet.pl
 (178235146065.dynamic-3-poz-k-0-0-0.vectranet.pl. [178.235.146.65])
        by smtp.gmail.com with ESMTPSA id
 g5-20020a056512118500b00492f1755d8bsm487380lfr.243.2022.08.23.02.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 02:29:42 -0700 (PDT)
From: Mateusz Marciniec <mateuszmar2@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mateusz Marciniec <mateuszmar2@gmail.com>,
	Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Subject: [PATCH v2] util-linux: Remove --enable-raw from EXTRA_OECONF
Date: Tue, 23 Aug 2022 11:29:09 +0200
Message-Id: <20220823092909.2885-1-mateuszmar2@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 09:29:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169699

Having both enable and disable flags for raw is confusing.
Raw should be disabled so --enable-raw flag can be removed.

Signed-off-by: Mateusz Marciniec <mateuszmar2@gmail.com>
Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
v2: Left --disable-raw flag to maintain the current deterministic
behavior.
 meta/recipes-core/util-linux/util-linux_2.38.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.38.1.bb b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
index 8a7b47a0c6..50ecc106dd 100644
--- a/meta/recipes-core/util-linux/util-linux_2.38.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.38.1.bb
@@ -69,7 +69,7 @@ EXTRA_OECONF = "\
     --enable-libuuid --enable-libblkid \
     \
     --enable-fsck --enable-kill --enable-last --enable-mesg \
-    --enable-mount --enable-partx --enable-raw --enable-rfkill \
+    --enable-mount --enable-partx --enable-rfkill \
     --enable-unshare --enable-write \
     \
     --disable-bfs --disable-login \
-- 
2.37.2


