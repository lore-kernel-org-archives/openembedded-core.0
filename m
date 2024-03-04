Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8182EC48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:23:50 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.101512.1709565825067528093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qckvGHNL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29abd02d0d9so2776546a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 07:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709565824; x=1710170624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJUJk2wSKvq/t2Yygyjr6DKa67rVnia6H+YUC5iO8bg=;
        b=qckvGHNL4pjvSlcQotG4NT3fpphkA9ujLCPC5LgLiFFPUfA5cNC61odTFdESoqN7mE
         bApO2CvL12cjlT70ROXjGV0XaCOQp0/yTgMvGcppucbLgqZ1SCFeSIAYBO3KLghvBtcA
         lcBQph+bQ0XrmaVOShVbRi/NYXbYDB90lHZ40n6nR2fNyy4/WKraiDj8h7iUiZV6JY6A
         58oqlprARkfPbOZM57t0MGvCr/8W2jMrM7N45RRj2+6d5YXYmXKox5ZskK3iPlcCb1Dl
         +d3DTpmMZO39t7WkL94KfWkY6E1fAYGutkBz6dcKI0oFh5dMRlZ9j7rMVZeFzAnsnyM9
         a+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709565824; x=1710170624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJUJk2wSKvq/t2Yygyjr6DKa67rVnia6H+YUC5iO8bg=;
        b=w+QHoFBEnIoLZ5frhtAAZkLA7wavLDO39pXhcqe1P9HF/SyZOdDQkfz4EVz5omvHPq
         Y5fV4UI/c0u+r7KdO5cp1TELzQNkQ49n4gPWOIzzFtBUB4hJ/ArRDcfDSGwDeuy8i/j+
         GlSYlpnpEv4VMVN6QcozvlljJ82bWDMCtZwGQnXvrcoxbZ6ljyB3yYezUPZt/21hwC/w
         CWAlTVnWj47ws7P4o5lHcHShQZx4yh0LFG1bU+QTl5LpYUu7doD8wJmnzzlDcUzqWcXz
         GmFuaDrlJMOdaxzR1TlZO1V04fAZPWwS7QKclAuVfmhJ6Fdf4YQgHeM7Fom5LtpADDTu
         9XuA==
X-Gm-Message-State: AOJu0YweEoXpQzTNXoA9kBeyrNQ6d9jJDMMn9SbmAZEEoE8rp6Q5Gqnf
	RqreQGi1k5cHoEdWCOeimw2g1yi5saqR9JrxbXvzxGIMp7dCw5u3lIHi6hnU33ne/R+a/ygj8PS
	Z2D4=
X-Google-Smtp-Source: AGHT+IFf1wG6q4RLRD4GMN7Lizz1BTyQXYoe+oLdaHi2Z2R7LyA34jDUmccEPlRO409+GdycxC8vBQ==
X-Received: by 2002:a17:90a:9ed:b0:29b:1fe1:863b with SMTP id 100-20020a17090a09ed00b0029b1fe1863bmr6025299pjo.41.1709565824423;
        Mon, 04 Mar 2024 07:23:44 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0f0100b0029981c0d5c5sm8898968pjy.19.2024.03.04.07.23.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 07:23:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/11] tzdata : Upgrade to 2024a
Date: Mon,  4 Mar 2024 05:23:15 -1000
Message-Id: <5f9463d8c9954944c44ca9f25702753895b02745.1709565668.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709565668.git.steve@sakoman.com>
References: <cover.1709565668.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 15:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196608

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5abbd0abf992ce8d11f3ae31fb1d83d97f5319fa)
Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 2774e5e730..4734adcc08 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2023d"
+PV = "2024a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "e9a5f9e118886d2de92b62bb05510a28cc6c058d791c93bd6b84d3292c3c161e"
-SRC_URI[tzdata.sha256sum] = "dbca21970b0a8b8c0ceceec1d7b91fa903be0f6eca5ae732b5329672232a08f3"
+SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
+SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
-- 
2.34.1


