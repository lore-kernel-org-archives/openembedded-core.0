Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277ADC27C79
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 17:03:45 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.26499.1718816619680684843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 10:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VnlK0Xa0;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: gudni.m.g@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so70770411fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 10:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718816617; x=1719421417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WMf3iNxr6ekd6L7L8uc8vj3OmFTtOs8pCq/Yts1t+mY=;
        b=VnlK0Xa0l7bIzRcFRhdg+KH3MJUL9g3F3S2ZCXV8oWWc9ls0Kk4AoRN71mTrkg4ugT
         +pEx73Vyf1birA4G9IzVPvumQdb+PfZU5Tb+s7/FE1l/Iz+Ml/nQIt9aGHOg1lAvpIjI
         AfaxhcwUzUsA/Zcz4J9lXQ9qB+HkwVr7QPqaStaMKK69nMGz2mvpigPjTXhuGw3HWrbD
         re88+W47nnr3ZJAWih/If30blj6IS2sh7zrDwXIMlXb/gfDKDLLCICPUouafdsrQhEu6
         Y/NBYR8UdXpR7Lc7phqJrFuSX6SPEHH2zpjoQ6/TDse8JU+pzi1KT0WI8rliqw0ws2fn
         Pn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718816617; x=1719421417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WMf3iNxr6ekd6L7L8uc8vj3OmFTtOs8pCq/Yts1t+mY=;
        b=qPV0Bgc5ECE5nu4olVY6THlPBVjtZD3Ohqgq4H18mWcQSSahUjv1YZYcMehg32pK8B
         1R/vquQIkQDgb9NLrtQxa1RMKWFym2j5jIZ4gCMTc7i5InD+VC6TC7ebMTKoSZJhrw6f
         d1r2ainT3UJlRzxJ5sofWO9zlDmqDnUOb0A5M8CS7OPTX8OH5Hpmd3GU+yrJ80R4xDxr
         hrsbBrQebdBMVES5PGUdGKb02bEz+RNZK5WkiCxcO5wdH68DffGo7ofU6nVV0llrHnBN
         EviXWl7nzpif0WiyAiaooxuMAHfy7W7GuVl6yFt/bTVpLuHd9d8xjgD+QWNneprFxaMZ
         ZqpA==
X-Gm-Message-State: AOJu0YwR7hqxjwTDfwdL1LystcF08lYRtbRotlSJQCEc6V30dF1C24cY
	CDNGc1l2sduUuaeau+Ufdx27aIwZd2PzCRMnXzo3NkiZyXWO0jQcRVR8Ig==
X-Google-Smtp-Source: AGHT+IEJdy4a/xFWsHoT9rxx0R32e7CLUThN6ZuGW8D7lkaFHIWt46llndMMB31vQekeSxo84w7Rcg==
X-Received: by 2002:a2e:9c95:0:b0:2ec:1042:fafc with SMTP id 38308e7fff4ca-2ec3ce27719mr19994891fa.0.1718816617025;
        Wed, 19 Jun 2024 10:03:37 -0700 (PDT)
Received: from gudni-virtual-machine.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef970sm270901475e9.10.2024.06.19.10.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 10:03:36 -0700 (PDT)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH] python3-setuptools: drop python3-2to3 from RDEPENDS
Date: Wed, 19 Jun 2024 17:03:07 +0000
Message-Id: <20240619170307.4351-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 17:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200926

2to3 module was dropped as a dependency in setuptools 58.0

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-devtools/python/python3-setuptools_69.5.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb b/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb
index 8261b09d16..cc6256db80 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb
@@ -16,7 +16,6 @@ SRC_URI[sha256sum] = "6c1fccdac05a97e598fb0ae3bbed5904ccb317337a51139dcd51453611
 DEPENDS += "python3"
 
 RDEPENDS:${PN} = "\
-    python3-2to3 \
     python3-compile \
     python3-compression \
     python3-ctypes \
-- 
2.34.1


