Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87300C00145
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 08:46:00 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.128340.1671093955902582665
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 00:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pAybzvw0;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id gt4so9773053pjb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 00:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IO0lH2E9XbJ0meYv+2RvXWExKPNoCXBs7CJjDH73JU8=;
        b=pAybzvw0BxeZtCyKsojC1//8+R6OLPAgn81KNJQtbcZb5HeZmeYngPovgMr2ez4ssW
         sguIitib5TeCCPh9Jmc8RHqxm1GxQ3cbRskoVQ6OpQni7Sxh20/4b15V5wCZr4DusR5y
         oZZknjToORPXcTB2GwpZ3YOddW5so8M4jXRV+gBHPPxaJoZzfrekN7fUcR/mblXZMZSJ
         Zz8ntmgenwoZ61jWwiQTtC18rXc5ZhnUrqD9/AujBemcT0FsW7pZmd2CrYujYxXvpTVC
         qYW8rYAMxNLGrBHET25YpPFh3Oo4w7tY1xEyX1FiIBDumxCQNoN74YH2igAvFRtBnUGj
         ALfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IO0lH2E9XbJ0meYv+2RvXWExKPNoCXBs7CJjDH73JU8=;
        b=P5929qKeEGGcNg3fsM0ZpQq1nCK6hREzrqmbd12hbh+DmRcUM2Zi/JJ/0ok8kWZyYu
         yBc2J2v0BDVR9FEdHRqksZGILlfAYEZycqjOhJTWTIhsKfYCNWFtE8uUl5WtyXCNecYI
         pyNgfAv5/Ru8/MCHNUmpwfyztrzx2/e7Lah/PfpB8U7qf0WmML3l65/DgdVTXw4UiQzP
         Up9jLhEZMvC4I8Q1EqRNKgC8sirPWspn8ib65S5cQ1Eoe4kIB6jYkS1adNi8E8B+r2NJ
         fEQ7AtsOik6bB0yBwG4M1FW0PVSIuK6L5L+x3dos7iWC06HtXWYEPLp0gRs8l9q1owjC
         6VNA==
X-Gm-Message-State: ANoB5pnqnpElzcy2YpG10j+Gn/FibVxGU91g1Y2Sy68UqIUPfKsldtXI
	IByhmYFNcTysK753a1AjSfLbmOt/uuc=
X-Google-Smtp-Source: AA0mqf7Z8lH2nO8sHmbZRMPYiGGrMj+3ahahUgBaQIF1x6wmyqRutYxMkBrW7VXil6jXsx490a8+aA==
X-Received: by 2002:a17:902:7242:b0:18f:a4e1:9908 with SMTP id c2-20020a170902724200b0018fa4e19908mr14384370pll.15.1671093955104;
        Thu, 15 Dec 2022 00:45:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id z14-20020a170903018e00b00188ea79fae0sm3255723plg.48.2022.12.15.00.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 00:45:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 09/11] libpciaccess: Do not use 64bit functions for largefile support
Date: Thu, 15 Dec 2022 00:45:44 -0800
Message-Id: <20221215084546.125368-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221215084546.125368-1-raj.khem@gmail.com>
References: <20221215084546.125368-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 08:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174571

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
index 0000000000..512a473e20
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
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/26]
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
2.39.0


