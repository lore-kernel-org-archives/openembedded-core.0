Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB799C63697
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.29149.1649683316583307430
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 06:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ldC2PuyU;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id g18so5881081ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Apr 2022 06:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fWq6fkfRs0BBrsxwziW2cSjaiym9MVjTtL7Pb1dkDFQ=;
        b=ldC2PuyUwpFFODoRzxFcuyeKYA/w8NHybjUX1EwBhojdqnOwoSrJfrK1zmEHwxW1lh
         7Re9S68r+QUuRWcBARGPcSrwpkLaS/Xy7N5KFOe76kovpJJ2irXNrZ39Aett393oaWtu
         74bK2Wv9GLM8Uqx1EWolqC9Rr37M/hdJybTE2nlPZBd43apeVWAgLNyC/7MXkgFD4kBs
         idCNdIYnAN0/ey1pAC/Kf2xiPh36s5396+D7d4PvpSECNu5gLbr+i93e0q2DxR3HGRmi
         BH5SDk59BaEcDZDiaM5ObRYUvzCnSe2X8fDrWCyD50baIeQyaeZqk3NNL1Be/GO7eN2W
         OtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fWq6fkfRs0BBrsxwziW2cSjaiym9MVjTtL7Pb1dkDFQ=;
        b=27xZc8+DBqnWLUOLTKVdC0MtufKtr2x9h22aQMcvw2ayr6Ys6zjGt3HnKsGpGQDRTh
         fPP4uheo/874cQbdheXvZ6LQdFA0FX+9mPjxLQL8/lmjaWFCxUqkoqPghUUvoTAl8yae
         EKaU/y3vHBIFQSN3pk7ohCs6x8AhvnJiQFKNmhOQPjk5k0iF65/B13JZZTaJAehhm6nW
         tvgGklFnI1q/r3dlf/pSy6cUk4bNsLEG8eaZxIuZnM+rKjkqOwJ+Y/jC4urKuOU1fxpx
         HC3NiXz5GRTG43V4x3wDBwgnZ27hp/P+jDCllC4bHJFVZSxO9hxjwGnvJcFMXg+hIusn
         tsxg==
X-Gm-Message-State: AOAM532GJFzJQUG5sq0eUgXzZb90lgfgTjNcnIySbXbMITCw5u0pzMMh
	iEKGxXRZkqHNE7rSDni3vydPgtvuLH4=
X-Google-Smtp-Source: 
 ABdhPJxZmKhxRM18GhzIG8r1xL2ozE2oj3zc1vSd6jXjjk3LTJ2LH+xUG3rEmhY+4Vf/Jgxdnjj0OA==
X-Received: by 2002:a17:906:3acc:b0:6e8:8900:1bc9 with SMTP id
 z12-20020a1709063acc00b006e889001bc9mr5594893ejd.608.1649683314789;
        Mon, 11 Apr 2022 06:21:54 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-253.retail.telecomitalia.it. [87.5.19.253])
        by smtp.gmail.com with ESMTPSA id
 y26-20020a1709063a9a00b006e0c272e263sm11949385ejd.71.2022.04.11.06.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 06:21:54 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [oe-core][master][PATCH v3] libarchive: upgrate from 3.6.0 to 3.6.1
Date: Mon, 11 Apr 2022 15:21:45 +0200
Message-Id: <20220411132145.3603723-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164224

This release contains security fixes
including CVE-2022-26280 fix.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
Update v3:
    Instead of backporting the patch upgrade to the latest release with
    the CVE fix. Thanks Quentin Schulz for the advise.  
Update v2:
    Change title from [meta-oe] to [oe-core]
---
 .../libarchive/{libarchive_3.6.0.bb => libarchive_3.6.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.6.0.bb => libarchive_3.6.1.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.6.0.bb
rename to meta/recipes-extended/libarchive/libarchive_3.6.1.bb
index f078c8ad03..c795b41628 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.0.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
@@ -35,7 +35,7 @@ EXTRA_OECONF += "--enable-largefile"
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "a36613695ffa2905fdedc997b6df04a3006ccfd71d747a339b78aa8412c3d852"
+SRC_URI[sha256sum] = "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.32.0


