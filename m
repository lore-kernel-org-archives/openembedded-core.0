Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299C3C25B7A
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 12:14:51 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.14314.1716552886185298628
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 05:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q0DG2S8H;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f05b669b6cso28305415ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 05:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716552885; x=1717157685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=agVonJemaQkKIEHyBcp5LBjh+Cu+JBvNqj3tnJa8qHE=;
        b=q0DG2S8HAhEhSdaBgTLupsO23f9IDxJXy6VRt/+0tMh+edS46BjprHOh4Lt7OLtUwh
         CwQAVDeyJ61+O4F79p7cu+s3Xz+uzQJWNXzx9Yl0vDTVFZJk59CuJzoCm6VrVG2Lb1bo
         ADqMhyALDLbPblPj8J7idw0HcU/I7N85l0leKRwgt25ZByZcbz0vtHEYICtyLhslVamo
         MS6bWk6ku22a4OU6eX7fS2FI8mC6GpYTYu92xfo4uNCX2aFTbHqTRj/Gsd41uMMKhM0r
         UGNt0a5PrRjLRE30I7hjtP2hr5qLapnfVXKNNuIFM4ahPbA1shN3epAKMZdUqluknd8F
         jvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716552885; x=1717157685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agVonJemaQkKIEHyBcp5LBjh+Cu+JBvNqj3tnJa8qHE=;
        b=rEopvcJydrj+ZbkMzzFjZn/A/RRkP+dvHCv29r0cZgmhI9nIwjPerxM843TOcXaouV
         dbEyfJrkGW/cLJGmsswteB/hmIbkchU8uqRac54Ntms1QUpoZOrKubLY4/Ic3upB7J9j
         REyl6P+OLXNDqp8bBl3dJEJb9E0WzOH3mUaPm1tYe4Io51ZbazsdtPqe8NPDjgrzf8Fa
         30lGOVprZoooqyNuEZIGmSlyog1MLKOBuSWYiMWH0j+Dr/wfjPohq2wMm/rZmDdnQm9v
         Lv1H9P8PW0dEp2C/L+YoEbEFZIEWbxEz/aTcRPpnEOuSqPs/ekEqmi+55LNKa5JVbLcq
         7qKg==
X-Gm-Message-State: AOJu0YzhEraHNctCvV68qjxOomxgJxpzXIx8tc/rukKXGft73ezc4EKX
	HRyZrpwRuvX2j2fOtGpo5L+gLOO8pcYihBdhE0SQhsbmu3KY3FLkbb9UHnG6M5i00bq90jP3O4b
	h
X-Google-Smtp-Source: AGHT+IGnLKqLWnlkA9R8Xj2G/NpZMA1/sfAHgnB/oEUXkXnEgYZIcVflnk53biBDAwy8ivVKJsn5Kg==
X-Received: by 2002:a17:903:41ce:b0:1e2:4c85:82ea with SMTP id d9443c01a7336-1f4486f23c2mr25984395ad.24.1716552885435;
        Fri, 24 May 2024 05:14:45 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9a5388sm12592845ad.220.2024.05.24.05.14.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 05:14:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/8] initscripts: Add custom mount args for /var/lib
Date: Fri, 24 May 2024 05:14:24 -0700
Message-Id: <e0a1ed7aa1f2b12d985414db9a75d6e151ae8d21.1716552687.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716552687.git.steve@sakoman.com>
References: <cover.1716552687.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 12:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199850

From: Colin McAllister <colin.mcallister@garmin.com>

Adds bitbake variable to set additional mount flags for the /var/lib
overlayfs or bind mount when using a read-only root filesystem. This
can be used to set additional options like "-o nodev".

(From OE-Core rev: c3109e40e2c2c881996dd3fcc95fca74f098646d)

Signed-off-by: Colin McAllister <colin.mcallister@garmin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../initscripts/initscripts-1.0/read-only-rootfs-hook.sh      | 4 ++--
 meta/recipes-core/initscripts/initscripts_1.0.bb              | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
index 6706a117f7..a29773647f 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
@@ -37,9 +37,9 @@ if [ "$1" = "start" ] ; then
 		mkdir -p /var/volatile/.lib-work
 		# Try to mount using overlay, which is much faster than copying
 		# files. If that fails, fallback to the slower copy
-		if ! mount -t overlay overlay -olowerdir=/var/lib,upperdir=/var/volatile/lib,workdir=/var/volatile/.lib-work /var/lib > /dev/null 2>&1; then
+		if ! mount -t overlay overlay SED_VARLIBMOUNTARGS -olowerdir=/var/lib,upperdir=/var/volatile/lib,workdir=/var/volatile/.lib-work /var/lib > /dev/null 2>&1; then
 			cp -a /var/lib/* /var/volatile/lib
-			mount --bind /var/volatile/lib /var/lib
+			mount SED_VARLIBMOUNTARGS --bind /var/volatile/lib /var/lib
 		fi
 	fi
 fi
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 7c9d9ca4f1..e28d8c6b72 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -59,10 +59,12 @@ FILES:${PN}-functions = "${sysconfdir}/init.d/functions*"
 FILES:${PN}-sushell = "${base_sbindir}/sushell"
 
 HALTARGS ?= "-d -f"
+VARLIBMOUNTARGS ?= ""
 
 do_configure() {
 	sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${WORKDIR}/halt
 	sed -i -e "s:SED_HALTARGS:${HALTARGS}:g" ${WORKDIR}/reboot
+	sed -i -e "s:SED_VARLIBMOUNTARGS:${VARLIBMOUNTARGS}:g" ${WORKDIR}/read-only-rootfs-hook.sh
 }
 
 do_install () {
-- 
2.34.1


