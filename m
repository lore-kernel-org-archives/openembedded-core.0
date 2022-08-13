Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6781C28B2B
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 04:28:21 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.1907.1660364894295783317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UgY0prxh;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so2534923pjl.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Aug 2022 21:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=YD3N57Jo5l7mPbysdgCcF8hwTkc83gXn+tDXiD5CTlw=;
        b=UgY0prxhC4iqZ+FaWDcb0KhV7vv4sIjXoBna3FUCv7iPI4BolD83BD0TCe2GjUEY1k
         R/mW2A0d7ccX51eCnBn7lR0f7ZvYGl0vNrpCMWmVeF5Nuzkd/GdiKBahYk8ZltH4zfYX
         z6MPOMfaiPFPvestK3ePGANVl4H8evtWClD3hnUSyHs0QY7hXKbiO7/qKTE//AbCURUA
         Fts0pu/wAzBBpcwZDVG979+POU5aOFPnUCZTHnvkvCiC4stfnMf5dvN4ZPjwrmek2uKu
         QGduHpedApwIFpSrtIrzKvRD2poWB6vvof3HzWW8U9Zw/caCYs6D+xZp+8aI2nrZybmb
         +4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=YD3N57Jo5l7mPbysdgCcF8hwTkc83gXn+tDXiD5CTlw=;
        b=TmAvJVnVjFu4nFYq46UQWs0DrOMxupZGgygEzKc7xo4jtwNRZvhnD1fzOoGQnkdxc7
         Sj4z0Pm+tqSKnVZd+Ka44Bni8A4f9ti6iKzfupJ7EdgwFuKO+uj3c5DpaX67FHD0ft3H
         4oJJpNqGt6q5Wsa2B27D4u9xPrF2qxdzg4yEvWQYDxnFaQjY0M+W2AV0fHmeN/zu4DK6
         T+/eSKe0FbKtbVLvLe4o5I7E1etg7pOVz10ychR/F5X4kxegIfVI16F4MWRzpq56INTy
         cPI7/1PlF56yXw8Xgx52jSCCE3gNmaok4Mz9bnn0U4H70YfzKLSlBj+pfHYBMONkDDcn
         7ehA==
X-Gm-Message-State: ACgBeo1se6Yvcq8C9efYFuPoHDxmvqQ33ob9M8Zw7EoXMtMd/VWOE7cD
	KCuHj88LzsVqcaJrxIXtalF7XwOIASY=
X-Google-Smtp-Source: 
 AA6agR7KWgzJ2/uFmEOWnLH9sYmaUPa4te1x5Urb+veyZbwl2dwAeEG86mXZTKuSw5olaZV39rv25A==
X-Received: by 2002:a17:902:ea07:b0:16e:daf6:6087 with SMTP id
 s7-20020a170902ea0700b0016edaf66087mr7019384plg.68.1660364893264;
        Fri, 12 Aug 2022 21:28:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 h18-20020aa796d2000000b0052d4afc4302sm2536105pfq.175.2022.08.12.21.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 21:28:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/5] unzip: Always enable largefile support
Date: Fri, 12 Aug 2022 21:28:05 -0700
Message-Id: <20220813042807.3533472-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220813042807.3533472-1-raj.khem@gmail.com>
References: <20220813042807.3533472-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 04:28:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169298

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 96068eefdd2..a4d10c30aa2 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -46,7 +46,8 @@ UPSTREAM_CHECK_REGEX = "unzip(?P<pver>(?!552).+)\.tgz"
 
 S = "${WORKDIR}/unzip60"
 
-CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-DLARGE_FILE_SUPPORT', '', d)}"
+# Enable largefile support
+CFLAGS += "-DLARGE_FILE_SUPPORT"
 
 # Makefile uses CF_NOOPT instead of CFLAGS.  We lifted the values from
 # Makefile and add CFLAGS.  Optimization will be overriden by unzip
-- 
2.37.1


