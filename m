Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7529CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 20:59:47 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2251.1762203579846927597
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 12:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h4RGKS/b;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b9ef786babcso743009a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 12:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762203579; x=1762808379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QoNwecra9WX63w380qJnJM/RNRjimOYN7ObQ76YVCI=;
        b=h4RGKS/bCLTj3PCn7QFd8o8x99nEH7qlkUFWPZ/V3XYZmLgn1xntFqpfWykLKrGoxY
         fL//7aSdUpgOwEqJ9G9uxu9XUXvzoqGe0iF7TGv+smYiie9gnjJFo/GvnceByWR4LCbr
         IaIt44irQYGdZz4tnAdLuzMKRm7NylFnnB/emDmApPkD81y8qT3I6is1O+aJT4AjsiT3
         JVhiZ0hyDK+l8yLhf99Rb33r3ii3brGabMtf9nB0qoChrwO+SxBUzbzydzoK9LhdzvYu
         eXVNR52MwtKD8vuyvi9RYtjkBTGvFEby3EcTEHf0eJBaWgq6z3dPkoY6FgK+r8x33MGg
         luJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762203579; x=1762808379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QoNwecra9WX63w380qJnJM/RNRjimOYN7ObQ76YVCI=;
        b=n/gP7s0VZJCiTNjHeIO28ZuFp5iDORA8JylVXppdgnGq51zX5FJqROBH0fvhKtMrtz
         lzybLJdLDI8QPn1XgbBXGcSocO/h5xqawS5GIFzQfOH4Gu6WawDWG6vs6uRh7pQHGRm3
         gFFLNSpOqL3EL8TeXg3/7GIVqWIA+JnDmMvFrPLY/uXRpbAncveTKoH84UGN+lWcRzAJ
         cFdcDRx2CxD2e1tHta2R9b7++zznS5Wb8Bzbu3lytEvOIdejiHLRtwlm3edEn1YwFDhG
         DHtJO39H46JGqB4i9NOVi4qUx5qw088J3YPj+EdF0PMKTtyY0qOKQZo5pc28+RunwXGa
         lMkg==
X-Gm-Message-State: AOJu0Yxf3vYVMFIldHnmgPY0B3ym3elAJffEI/CP7joo02JYBx3p7YEN
	EjV0VZIWVGOPYSMloUWa2NE1TT+PCyVZcF8ufB3vQ7xComB/gKQPR+jCJ+nFPE0bkMvA49EjsXt
	lFqYv7eg=
X-Gm-Gg: ASbGnctS01ELQj3AzppllK5gnL3pwGcoWgCKLJP3DtMBJDQ/KlXo5MMStUm9vlRZYpA
	kyY0EB4Tbj9wQtQLod8vwelaXMo7eca7qF6oZMryr2N0E96OY2lzNpz7Wjsn7CXGepa5GzvVLt/
	hhxhTi6bXMt5zq8lNBmMXhC0ZbnpraWWbwWUzEefX8MJJyf9sAB8Bt/SbFdmRAlLzfVZW3+r4Tz
	ekwAwbKN/TYasdmtrd9B/hm204mHful8BH7HiEXmYtzIh40kt47uvRIp/km9i3tsPjk95U6vKCF
	DVv9YmxFUZ92PgQmLgfsI1rpu9yZL83l4lIXaAo5MhvWthgE2QTY2XWpSBdHFzTnp1J2YzKml/A
	meXyYbqfIvKZGfpkQlQFefnB6U/vguyYu8mG9+Ibou9/BQ7dDQxDhd23n6skI5gieFezIkAkEUq
	MzS5iwuPt/6XWT
X-Google-Smtp-Source: AGHT+IFI/wm1c1PofR6MZdxy3H5knbYMrMMOCJ1/K1nlDrSA7ypRxpzGYsdc8qwJGZZvFFcgzGpI3g==
X-Received: by 2002:a17:903:41cb:b0:295:9c48:96c0 with SMTP id d9443c01a7336-2959c489ae2mr85874515ad.5.1762203579120;
        Mon, 03 Nov 2025 12:59:39 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:6a2d:a521:f4d2:20a3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415b02891asm2024911a91.9.2025.11.03.12.59.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:59:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/8] bind: upgrade 9.18.33 -> 9.18.41
Date: Mon,  3 Nov 2025 12:59:14 -0800
Message-ID: <deca51264991a2f6c6e450f8fa8b4a233280b700.1762203396.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762203396.git.steve@sakoman.com>
References: <cover.1762203396.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 20:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225703

From: Praveen Kumar <praveen.kumar@windriver.com>

This upgrade fixes
CVE-2025-8677,CVE-2025-40778 and CVE-2025-40780.

Changelog
==========
https://downloads.isc.org/isc/bind9/9.18.41/doc/arm/html/changelog.html

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/{bind_9.18.33.bb => bind_9.18.41.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.33.bb => bind_9.18.41.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.33.bb b/meta/recipes-connectivity/bind/bind_9.18.41.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.33.bb
rename to meta/recipes-connectivity/bind/bind_9.18.41.bb
index ceea149699..0e557163d5 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.33.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.41.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "fb373fac5ebbc41c645160afd5a9fb451918f6c0e69ab1d9474154e2b515de40"
+SRC_URI[sha256sum] = "6ddc1d981511c4da0b203b0513af131e5d15e5f1c261145736fe1f35dd1fe79d"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.43.0


