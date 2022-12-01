Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC52C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 19:03:05 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.53544.1669921376030506883
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 11:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e1y66ME8;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id 4so2568116pli.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 11:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3AMDhghFS4wQJku0B36TsZNCpcIipQBsggtaY1BHfc=;
        b=e1y66ME8+39Oqhw97eCjiFRkgNZLD/YCkSwgT2M1INh5szQk1qHRhLO9I4BkVO3Ryb
         yfA1UWTjZ/mQeaunylCt6BAzpJTE2HuKzUTmmPTDxgJgVDrvIpSj4Q90WnedQ7qfCTS8
         z5Pnc0nuYM5iSTKRPXoV4VMOWums2iY4TklFdvJa2HKwVqkOFGjSXBaqFRjyiGQFGC25
         rzZg9ZtL7fsKSzymedszTUBTQhJYGbvLcKTNVS1yc8/rIkiq36pmqXRc0COy0HNbtz7o
         VPKTZkVHZN0rN7ZTZepLdLTOFKdgaexBCzy2Avb/oyY+BIQH0i6h1UuIQJ53IEoZPryU
         IoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3AMDhghFS4wQJku0B36TsZNCpcIipQBsggtaY1BHfc=;
        b=C4GMAkO1YBpq4/1VLhRkKVrDLo2IP0HjpOu/ibFlMqDrE3adpY+OR3R1mx3UyP0q4g
         KNNgIRc5E6bzapmc4Ws/TEbl8S6kmoUT61GP4IHhvyyzAZfAW4hpNKNUi9uALCVhS7Ra
         8/OqHDGZ5DgbY8Y6taHUcTgMcLhEfTuQFeSojC/kDl+WYT8fvLstSvWOEyR7gXOrtUG0
         ZAapT8u1sPY8mrndJ7Ie8dS7IN59jXiqTDxhNM/1oKkUu/GTNNlpPPFWN3EP7xOv+3rR
         GI/0X4q+0PJX8P6L6kxR3mZc/pDzAAaQWXd5Q4uWB2cb0+ICISMkms/qkLFqU71s4/su
         zBhg==
X-Gm-Message-State: ANoB5pmP3V1B8H4iLzNCKyxUcMO4+vn64Ck+QDSH2boeTKDgB1HteJg2
	PoSYP3T7gu7GS3ivNX/BfPzuGmHnazE=
X-Google-Smtp-Source: AA0mqf6LJ/M/WmhXfOmbjpyKWdNDlr2eQCjAVVO9bT7x1hDsYU8XMUqy0LOSDiGS8H+VZcg9YvKvRQ==
X-Received: by 2002:a17:90a:9c18:b0:212:fa9a:12df with SMTP id h24-20020a17090a9c1800b00212fa9a12dfmr78455869pjp.231.1669921375240;
        Thu, 01 Dec 2022 11:02:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id 19-20020a621413000000b00576489088c7sm321092pfu.37.2022.12.01.11.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:02:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/6] libpciaccess: Do not use 64bit functions for largefile support
Date: Thu,  1 Dec 2022 11:02:47 -0800
Message-Id: <20221201190248.175753-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201190248.175753-1-raj.khem@gmail.com>
References: <20221201190248.175753-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 19:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174206

Using -D_FILE_OFFSET_BITS=64 already makes the normal function behave
like 64bit variants. Moreover it makes them portable across libc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...pwrite-pread-instead-of-64bit-versio.patch | 39 +++++++++++++++++++
 .../xorg-lib/libpciaccess_0.17.bb             |  2 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch
new file mode 100644
index 0000000000..cd9c2d3991
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch
@@ -0,0 +1,39 @@
+From d20ff4f2e4feaafa6a6191b9cae3815b85617943 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 11 Nov 2022 11:15:58 -0800
+Subject: [PATCH] linux_sysfs: Use pwrite/pread instead of 64bit versions
+
+pread64/pwrite64 are aliased to pread/pwrite when largefile support is
+enabled e.g. using _FILE_OFFSET_BITS=64 macro
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/linux_sysfs.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/linux_sysfs.c b/src/linux_sysfs.c
+index d62f48c..20c800e 100644
+--- a/src/linux_sysfs.c
++++ b/src/linux_sysfs.c
+@@ -462,7 +462,7 @@ pci_device_linux_sysfs_read( struct pci_device * dev, void * data,
+ 
+ 
+     while ( temp_size > 0 ) {
+-	const ssize_t bytes = pread64( fd, data_bytes, temp_size, offset );
++	const ssize_t bytes = pread( fd, data_bytes, temp_size, offset );
+ 
+ 	/* If zero bytes were read, then we assume it's the end of the
+ 	 * config file.
+@@ -522,7 +522,7 @@ pci_device_linux_sysfs_write( struct pci_device * dev, const void * data,
+ 
+ 
+     while ( temp_size > 0 ) {
+-	const ssize_t bytes = pwrite64( fd, data_bytes, temp_size, offset );
++	const ssize_t bytes = pwrite( fd, data_bytes, temp_size, offset );
+ 
+ 	/* If zero bytes were written, then we assume it's the end of the
+ 	 * config file.
+-- 
+2.38.1
+
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
index 06c30384ab..309354e872 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
@@ -5,6 +5,8 @@ PCI bus and devices in a platform-independent way."
 
 require xorg-lib-common.inc
 
+SRC_URI += "file://0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch"
+
 XORG_EXT = "tar.xz"
 SRC_URI[sha256sum] = "74283ba3c974913029e7a547496a29145b07ec51732bbb5b5c58d5025ad95b73"
 
-- 
2.38.1


