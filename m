Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100E4C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 14:21:24 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.9995.1718288475245021716
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 07:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SgVO9wyl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f6e183f084so8546385ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718288474; x=1718893274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eWO9RWZQYWsrhpIYvQPIl9mWPded85z1r4OWm0YoI5I=;
        b=SgVO9wyldWKPeJbQqS5MLB1nOxw/mOXwXq5tpaWsg2Opb9CCayCJ7iPj2KUJtUoz0G
         BQkmstEWLasaEo6upSs3ItMrf1xt//pZdoTB7kEbPwMn+vu2Re9nqyM/3T4oUHnFnhdZ
         ftMQHRXHcYK/jLd4Zq7uBCOFiGHR6zLL1ccc4i6UkPQKDp15wurafQ97cMhNxpwz3qTr
         5WOEr9eMauGUGtCuTURh0d/Lly2TdCfKUL44HQO736W/JaLCkGB2okkxrTbstM+Zz5iW
         0nzTzqfQ8zNCUhOMcLmkz8o+ewKX1oxOYTTrzgyA1hQLS8KWWD1AU/mQpoAqU7/X3jm/
         zFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718288474; x=1718893274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWO9RWZQYWsrhpIYvQPIl9mWPded85z1r4OWm0YoI5I=;
        b=Fk/JoZgqkENNBzS3AR9CviiWd3ajJaJZT06Vcl9dgBWIB3Jhq5O/kcP6s1RjPjjhD6
         LrdslNilZP47+3T86ttz+Tw5SByxnu1QkDSHIww8E88kFgPrTD/zT9X+5iJWkHjBb3jN
         ycC0/UoHfhTdWLrI7AZZIEcdb4J90MxM5Xcdo4/uBTaZIqx9o3ngZJfolSu2jg3qw/fs
         S5d/K8zwv/kgmZkxKQR/ghqgQsVLPzPdgihrW0g13rgfuMZRx/J1TjK+ujGHbR5KQ3xz
         Q9GtbpvXTEgx2AnJFy3jQ6NAMMit1BKsHSO0eAkmplmbAasXZKzmlHJPcmrVPwhseUN3
         +N2w==
X-Gm-Message-State: AOJu0YzAGSlC6In3pTdJnJOHwInuXB//YR0OujBa/xAV7GDYBiLhuS2p
	VKK3WeITmBQYOLBecM3obeIlenWO3OdSdtq7xdv4cVtiRdvVwZ/4+AqH6mTWb0iiMGhW8tErUDq
	S
X-Google-Smtp-Source: AGHT+IHX0O62tJXBj6IzuUrjg43j23WlDBziWhi3elTZifb8DjmYXDKLLIZJABJkEyJYVJj71bHY5A==
X-Received: by 2002:a17:903:2282:b0:1f6:a43f:5b38 with SMTP id d9443c01a7336-1f83b5178a1mr57259175ad.4.1718288474443;
        Thu, 13 Jun 2024 07:21:14 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e5b0dfsm14414665ad.29.2024.06.13.07.21.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:21:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/29] ltp: add iputils-ping6 to RDEPENDS
Date: Thu, 13 Jun 2024 07:20:30 -0700
Message-Id: <bd2b32437787245029ca393f3e46542f0900b3fb.1718288230.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718288230.git.steve@sakoman.com>
References: <cover.1718288230.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:21:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200628

From: Xiangyu Chen <xiangyu.chen@windriver.com>

According to the LTP documents[1], it using ping6 from iputils which
support "-I" option to bind the interface[2].

Ref:
[1] https://github.com/linux-test-project/ltp/commit/6f97789c
[2] https://github.com/linux-test-project/ltp/commit/64b11656

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 05107ec5e4b81315d53efef23f2a570d520ee4c7)
Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ltp/ltp_20240129.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20240129.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
index 3e896957d1..e88e931a68 100644
--- a/meta/recipes-extended/ltp/ltp_20240129.bb
+++ b/meta/recipes-extended/ltp/ltp_20240129.bb
@@ -98,6 +98,7 @@ RDEPENDS:${PN} = "\
     gdb \
     gzip \
     iproute2 \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'iputils-ping6', '', d)} \
     ldd \
     libaio \
     logrotate \
-- 
2.34.1


