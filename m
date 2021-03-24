Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.5080.1616589483909889270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 05:38:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gP+c0Lhq;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id u4so29983027ljo.6
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 05:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IKp8nBU69p80ZF0UVNXrMgfsciwpDZ0gt+aXZQZUAUE=;
        b=gP+c0LhqzAw0m+QFiYxV1smV8Jd/yTaGAeNvDAjst1OA1+xIMuHSQppuqIyWqQ6Vj4
         m6LJlnj5azBThtZQfH1m44d9F+Y/RYP3n0sLnMWyHrRKfcWeODfA6P8uvuzf4i1b6PVn
         EVP3Wn7lqZeISHSvbAaxpta5Y0A4lbiQcgaDERNwz7f1kEjytcgzRJClNKrPVZWj+2Wh
         4FheusWWqmF1HV5GWEJxgjboByI6OrrVyet6/9azQ6KYpgocZ2uUt4jhf8zzpY7U15Cp
         qZAu8oBPf+A6GTDGI/yLk8W12bLSnF9TxOok3Z+cYmZZXdpFGIlmFjjwcP8W+WC7STWv
         kxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IKp8nBU69p80ZF0UVNXrMgfsciwpDZ0gt+aXZQZUAUE=;
        b=hyV6vxBfV6M1Z6dHvG0g4IcR1z76ooD03elUlTz9S8qrlDDjb8TJlTmPVKoZqaJM3J
         Qcx7TnFr5RS5XGh3S7ByOapol27Cj2C008V852CprLrG/+bVs12SqlcZPFpVPXSL0ijw
         DrR1I8YJjAW2B/YL3Y1eoKBvsokiF0lZoiPUpdvVVLd/Q4tjUMkmRH+AgaEp7DgfBSCo
         shBT0EisgYMugigZynkCHFNmELW1cyT8kuSmROvR7QSPYnZtJ5SCdJCPXdWZSW30W/8j
         1xwTkgAvYfrvsIYYpfsmFGINVL+VjDXgUpxQxYMAH3zPTZYpBBWKaA5TNRt8/bPiot3R
         pHmg==
X-Gm-Message-State: AOAM532hUozdsG2OBPu/kbnk3h6KJk+rRIm8oJUE+VTtQhG2xjrPzSTu
	fR88ftOP9oXC11alyzV7VxTqn8a9VYLG8Q==
X-Google-Smtp-Source: ABdhPJx2l8yMO7pIWwS09rD8nYfwu0tTbrSjzFp6udBFR7WG5WdIIwUcxrx2QtzBoa2g2DvB6KHT7w==
X-Received: by 2002:a2e:8e70:: with SMTP id t16mr2059392ljk.489.1616589481854;
        Wed, 24 Mar 2021 05:38:01 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain ([90.129.213.165])
        by smtp.gmail.com with ESMTPSA id u15sm221993lfi.5.2021.03.24.05.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:38:01 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] initramfs-framework:rootfs: fix some conditional check
Date: Wed, 24 Mar 2021 13:37:58 +0100
Message-Id: <20210324123758.861712-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Drop a duplicated check for "PARTLABEL=", also change to use elif to
avoid go through all the checks for root parameter.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../initrdscripts/initramfs-framework/rootfs    | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
index ee24e82af3..10b9583172 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
@@ -24,24 +24,13 @@ rootfs_run() {
 			if [ "`echo ${bootparam_root} | cut -c1-5`" = "UUID=" ]; then
 				root_uuid=`echo $bootparam_root | cut -c6-`
 				bootparam_root="/dev/disk/by-uuid/$root_uuid"
-			fi
-
-			if [ "`echo ${bootparam_root} | cut -c1-9`" = "PARTUUID=" ]; then
+			elif [ "`echo ${bootparam_root} | cut -c1-9`" = "PARTUUID=" ]; then
 				root_partuuid=`echo $bootparam_root | cut -c10-`
 				bootparam_root="/dev/disk/by-partuuid/$root_partuuid"
-			fi
-
-			if [ "`echo ${bootparam_root} | cut -c1-10`" = "PARTLABEL=" ]; then
-				root_partlabel=`echo $bootparam_root | cut -c11-`
-				bootparam_root="/dev/disk/by-partlabel/$root_partlabel"
-			fi
-
-			if [ "`echo ${bootparam_root} | cut -c1-10`" = "PARTLABEL=" ]; then
+			elif [ "`echo ${bootparam_root} | cut -c1-10`" = "PARTLABEL=" ]; then
 				root_partlabel=`echo $bootparam_root | cut -c11-`
 				bootparam_root="/dev/disk/by-partlabel/$root_partlabel"
-			fi
-
-			if [ "`echo ${bootparam_root} | cut -c1-6`" = "LABEL=" ]; then
+			elif [ "`echo ${bootparam_root} | cut -c1-6`" = "LABEL=" ]; then
 				root_label=`echo $bootparam_root | cut -c7-`
 				bootparam_root="/dev/disk/by-label/$root_label"
 			fi
-- 
2.29.0

