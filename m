Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8547CC54E4A
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:23:40 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.101642.1709565812145978734
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:23:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cZK7Y4Qi;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5c66b093b86so4440315a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 07:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709565811; x=1710170611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcEAsSw8v7JPRwm97O2VU3iPiPApBQOpVzoSc2fjIAk=;
        b=cZK7Y4QiBbmaRGvSe47KSh7k8aKmYxnnFtUo71pdBRL318Q70mD2BITnSisAkwCLCG
         IfeldHiHQNdXCFGQQ3B+PwQHJonAJ0eoWoOarBjlyPwFwfrilN9lPxKFtpb4agFNgN1A
         2su5jwxOfB9T2qIpnJLDUPuwOAmxf6UdTt4Klw1Ono3oRVL9UDda1XzJ8INCmcSjINCI
         F4BfxXbieU+1h6tSg8wMQ82PWd2BiEfuW94OoTW2palzhPXVlEwLRH4LwdXhWGbyGfHO
         De8qWc1W9YcHjXs2QNx1g9ZZKTTpRtDpSSUMbLbevW76jDDFrzeWXmSmjJ9nIKQGBNzK
         /njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709565811; x=1710170611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcEAsSw8v7JPRwm97O2VU3iPiPApBQOpVzoSc2fjIAk=;
        b=GogkkSgAQas299wiN/PWyN6ss7df5jSu5ftTYfjY3W0UuhBLa6nHhENePuWVe69u8m
         nBBYK2sgIUWB7AzFFn7k+ZV+T74sb4jt4ExKPyXxp5U6GV3T1KPSYHZ0WEotIYVcLFP5
         +8yGEl4iKbraHYCxY/Cm2O9daZqmMFXEla7sBYtzKCtnFKqmNbT5uh4RzAMB7Hdj2CeY
         cZNRTm6AH2DVK50a6kiFYiS53kjZ3yoPnw5e7ajxFkl5/4yp2wrEY2Y7GsWddXhx82qL
         ItaYcEEOuN3uOPPTcQy9T0n0+f2G2XsjV54YHrOjKOGbTflnmh1KpY6wl4DLturT1LYT
         5suQ==
X-Gm-Message-State: AOJu0Yx2Q5Hsq49iMkt5/lsTlzCbD+2PhN/OasEl+aWdBbQvJvsJf5Ir
	S2grFvn+ytM/SFPESV6wBHqQ4BuMWu/XVHYTTkfe9qlnqyisBddNHcMl2l7SHkR4J4ZlA6umOTV
	9s3A=
X-Google-Smtp-Source: AGHT+IGn/KTK+vaAliLJpOn68pqcoteNWM+NUgzMeILKRYoPZM+qg28d95ZUUbSx18ZJsD/fF9MKDQ==
X-Received: by 2002:a17:90b:2283:b0:298:a422:937d with SMTP id kx3-20020a17090b228300b00298a422937dmr10765236pjb.24.1709565811394;
        Mon, 04 Mar 2024 07:23:31 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0f0100b0029981c0d5c5sm8898968pjy.19.2024.03.04.07.23.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 07:23:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/11] dbus: Add missing CVE_PRODUCT
Date: Mon,  4 Mar 2024 05:23:11 -1000
Message-Id: <6488fc1a8ffa68268d9d4b71cb017eeb9a645cbe.1709565668.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709565668.git.steve@sakoman.com>
References: <cover.1709565668.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 15:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196604

From: Dhairya Nagodra <dnagodra@cisco.com>

- The current recipe only contains one (out of three) valid product
  names for dbus package in NVD.
- This could result in reporting of lesser number CVEs than actual.
- Added missing names to get a proper list.

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/dbus_1.14.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.8.bb b/meta/recipes-core/dbus/dbus_1.14.8.bb
index 4da307ecb3..f03e5c2d2e 100644
--- a/meta/recipes-core/dbus/dbus_1.14.8.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.8.bb
@@ -184,4 +184,4 @@ do_install:class-nativesdk() {
 }
 BBCLASSEXTEND = "native nativesdk"
 
-CVE_PRODUCT += "d-bus_project:d-bus"
+CVE_PRODUCT += "d-bus_project:d-bus freedesktop:dbus freedesktop:libdbus"
-- 
2.34.1


