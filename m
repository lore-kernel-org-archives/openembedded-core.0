Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8B4ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 09:21:48 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.5428.1662974501631630941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 02:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gwAaVqfu;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: ptsneves@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id f14so12836722lfg.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 02:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=041AxFnJfE1D17htN9WY/aIfRjQc9YD0mOspJOGvBro=;
        b=gwAaVqfu4K8buAjHn8vnhAhkqvhsf4m/MBelkhsLslpEaCt7mDKUiBISfvzCescUy8
         G+fv/mAlfQLrejZgRSLDhYb5hwA9cmoJ8HS6kMxY3HgiAWF6CQsWFLqpR2+fQuQ31rMq
         DqWiGx/aOkwO58KZe92in4OBysu2eaQLYXfiiRc5NQbOFnflHf4J5lS3wmL/WgvAZwlt
         ofZOR9RRY76bpTQnVAQRSkgXglhGx9KTYex7rcQ9Vkwpt6Oz1KRR0Lkg9GiNBmme3Mgo
         kceaqhRIXYj5M8mjUP15LVirA1uuaBKUMVvlF5vl0zpttCV+x6Xsr6Tv21oFmWp0RWSK
         tY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=041AxFnJfE1D17htN9WY/aIfRjQc9YD0mOspJOGvBro=;
        b=X6PgcaT7kRBC6jjullXd0RbrWRH2/VVT9g6JXQKliLh/OJXhmXAlGWeOHZAhewK0I5
         0SsVEq7HmMomRkf7UkSNopdtF1EEFPQcw77UDgnEd3zuJM0EFPI9vCB60ohvxJj3d064
         OtSa7yO1fjjh+bovpLw9cvuQKWL96BFEj/WL/VESTKfRfrDSKKzVv1XeeNxZZdoAlNwy
         q9BKEGtpuC+XldoDBDZE1BUs9gq8OLNhj/oDRri0XrGmqk5fjF03ClO9St2hBFv+9LuH
         FOW2c9wu8+gHljYXdLiaMVLM9rHfhIq8S/BiFspmoozB/J7d1n+pS+rEFtz6QeiJrMmZ
         z4lQ==
X-Gm-Message-State: ACgBeo2P73CgG8dOKZixi9Vnt2kiHTi4QdUhZ/QeJa7paAqfp6fj9afE
	B0KC2PKIxmiQvYRPZot3Pe8CE3k6bv95
X-Google-Smtp-Source: 
 AA6agR7bPKDyUCZJwVwJiy1McQq+MZQPa5hnvyTizgh/6xO2Ahg/0/uK2IYIfH2TmLGZhQ2jlOGy8g==
X-Received: by 2002:a05:6512:33c6:b0:497:9df1:a25a with SMTP id
 d6-20020a05651233c600b004979df1a25amr8108562lfg.562.1662974499445;
        Mon, 12 Sep 2022 02:21:39 -0700 (PDT)
Received: from localhost.localdomain
 (031011128148.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.148])
        by smtp.gmail.com with ESMTPSA id
 c7-20020a2e9d87000000b00261eb75fa5dsm983614ljj.41.2022.09.12.02.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 02:21:38 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paulo Neves <ptsneves@gmail.com>
Subject: [PATCH 1/1] watchdog: Remove unneeded tirpc dependency
Date: Mon, 12 Sep 2022 11:21:22 +0200
Message-Id: <20220912092122.2020942-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 09:21:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170533

watchdog code does not have any dependency on rpc code,
therefore the dependency and flags to try to use it are
removed.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/recipes-extended/watchdog/watchdog_5.16.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index 26fcc10487..6031dcaa16 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -28,10 +28,6 @@ UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit autotools update-rc.d systemd pkgconfig
 
-DEPENDS += "libtirpc"
-CFLAGS += "-I${STAGING_INCDIR}/tirpc"
-LDFLAGS += "-ltirpc"
-
 EXTRA_OECONF += " --disable-nfs "
 CACHED_CONFIGUREVARS += "ac_cv_path_PATH_SENDMAIL=${sbindir}/sendmail"
 
-- 
2.25.1


