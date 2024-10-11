Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B70CFD341
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 10:56:49 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.8825.1728644204086676022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Oct 2024 03:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WJWxaQHR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43115887867so12674265e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 03:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728644202; x=1729249002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1W7LQOaiIOciOkmPnU83bs61ZkXnuMtvR9Mwg0LHd2A=;
        b=WJWxaQHRHW5e0fPT8ZvyIooYVJGEwyoMH7wdjFRZILdsV6yAJw+9Xl3gKy6BGuqPsW
         034s3q+X4SIwunFyZSlp7V1AObQmcuZQI/X1eqyIjNOg5vh4dZEUbWS9WnEWUFC2IiFd
         GMb5shBCf7jQbym3TcJ2Y2TUQC9Y5G3rJk92A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728644202; x=1729249002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1W7LQOaiIOciOkmPnU83bs61ZkXnuMtvR9Mwg0LHd2A=;
        b=u9/J9r9P6WN627rlQk/qud0b/QM5wHJy2+ZPIlQX0KLTecWTdlU+jyOwoPOKPZ2rIg
         pIX/YTp2uSUfLl+1yaUYd9EHR1RZR1uVYSCcJfMR7t4cXgHk9F69H333muPfUNI+2uBz
         oq3tga6jB+++CGavvCcLCBRda7M4EhiDGX1N2PVX/4N/wDykyNq55lMTQ8u0WC//u+hU
         Xn0MEyPDPAC7vA3vl0S0gxhIayzPIIlKmgkTeFK5dF3sd6Ir+1GiPTkmca8wbBa1runm
         Zws65zK8ttUV/5l8tNm+zuFFsSqj3U9E56mtjcMx7hc1w85y6FfClB7wyEcHyCkED8dW
         6QPQ==
X-Gm-Message-State: AOJu0YxvR5UpllJduW1i4y8oTcg47AbBQ/4jpvmhvBIiXgJttS3I97EO
	9koqSJ1H/bEQI/GaDTuAghjwRw7r1Z+mpa6NnDH7uKgraULcKgxQJ952ZhjC867XJI09GEGhq9h
	l
X-Google-Smtp-Source: AGHT+IFPEHhyVu6/K+QrJdeX0DlGJeZkJ00jGSYQQ06niyEwvUqAJA8KNKUy1vgY2kvD63zdm83e+w==
X-Received: by 2002:a05:600c:1c9f:b0:42c:ba81:117c with SMTP id 5b1f17b1804b1-4311d8914ecmr18565205e9.6.1728644201737;
        Fri, 11 Oct 2024 03:56:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8145:ba6d:a6de:28af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf5181fsm71389855e9.25.2024.10.11.03.56.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 03:56:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-check-update-nvd2-native: Incremement DL_DIR database location
Date: Fri, 11 Oct 2024 11:56:40 +0100
Message-ID: <20241011105640.738872-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 10:56:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205668

We're seeing a lot of sqlite database corruption issues in our automated
testing. It is unclear why this is happening. There were process
imrpovements implemented in master and it is unclear if older releases
are somehow making those changes ineffective or if the problem is
elsewhere.

By changing the location in DL_DIR, we split the two sets of accesses
to be separate and can isolate whether the master changes really did
improve things or not. If successful, we may consider backporting those
changes to the stable releases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 2d23d28c3e2..a7e568e3079 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -34,7 +34,7 @@ CVE_DB_INCR_UPDATE_AGE_THRES ?= "10368000"
 # Number of attempts for each http query to nvd server before giving up
 CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
-CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK/${CVE_CHECK_DB_FILENAME}"
+CVE_CHECK_DB_DLDIR_FILE ?= "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENAME}"
 CVE_CHECK_DB_DLDIR_LOCK ?= "${CVE_CHECK_DB_DLDIR_FILE}.lock"
 CVE_CHECK_DB_TEMP_FILE ?= "${CVE_CHECK_DB_FILE}.tmp"
 

