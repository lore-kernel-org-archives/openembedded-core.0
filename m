Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web09.1798.1604356487334542850
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 14:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=O2g0tDNV;
 spf=pass (domain: foundries.io, ip: 209.85.160.175, mailfrom: ricardo@foundries.io)
Received: by mail-qt1-f175.google.com with SMTP id h12so10421755qtu.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 14:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7CXe6bemsVCFvlBPLKmUkRcM0lldonkxbFZlXs3gvec=;
        b=O2g0tDNVWTFEVA5D8zQlQp7rKfKXKUVlS+Vk5o63uZ2egoPPJHZUseiwG9qkJUmXq2
         3exCpOG/s/qXdfF/YKY6sNr970Nm5Qha+zLab4W//oNBc+f5YVimisdWvMzsNmLdDT7q
         VJU6L/zBvG+KArJSeTgcO+0GlljOCCFLX/c6DaOWJ32c76FLsfHXs1z2oUG3JX5FWtqa
         TVxkbXiwaSQlfgrdrXN/JSyCw2zqw4mSoNxtWQNTIh7jki4bkMlSeGIyJRzvjkvwGCa1
         0TvuYFziVSFNd+j8vd4TC6yfAx5fpYJoFhnFMyyhrFMax7zFoYPrgqXcI3r3VFtPJ+Ff
         GQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7CXe6bemsVCFvlBPLKmUkRcM0lldonkxbFZlXs3gvec=;
        b=Iku6XrX3b0ASroP4TP2s1MndW/PcZXDHc/DKhhcLoPXxV1vLnffcOF8JOos5x/REmg
         aPuzNYvD0VWufsy4HRLD1inr7O8OU7BWjqjFXS/ZcF7S4c3+35k7Sm3magdXYP4e5bYG
         lHn7eS+TcNZfjDLCRds1No5RArh2A6L43pf3F4BqVTEAbgQsN7s/Mc3vQoCdvCV3u8nS
         w6NYxZ7T4Tb8AxxuO26onOKSJHD1AaFcKkcgrfTGMlnUENznC4Ekv1m0eL+byzoUKzlj
         h+lMjpnduW8NuAZgAEeaFU73qckRmYvqkpK77Y1JSsGi6bj8QWtzy9j2XVcLwKiKIYfM
         o0Rg==
X-Gm-Message-State: AOAM533GQRKdjMegqzSGbULVNZIEN3Q7lRUMQiM5daKSqzPUCpQDc9jO
	j6dcazuKQjkC66hp1mS820doIn5J5/yt
X-Google-Smtp-Source: ABdhPJzh7KUcxi3D307ZgcgNQNM1nLrkL1zoshZtKOVTMtdjU3EU6b7whscdwNVIM4PzDg5FpYe9kg==
X-Received: by 2002:ac8:7391:: with SMTP id t17mr15809281qtp.289.1604356485977;
        Mon, 02 Nov 2020 14:34:45 -0800 (PST)
Return-Path: <ricardo@foundries.io>
Received: from localhost.localdomain ([2804:7f5:f480:c7b5:49db:70d7:2f40:1936])
        by smtp.gmail.com with ESMTPSA id p13sm9059635qti.58.2020.11.02.14.34.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 14:34:45 -0800 (PST)
From: "Ricardo Salveti" <ricardo@foundries.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] dosfstools: add mkfs.vfat to ALTERNATIVE
Date: Mon,  2 Nov 2020 19:34:29 -0300
Message-Id: <20201102223429.9234-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mkfs.vfat tool can also be provided by busybox via the CONFIG_MKFS_VFAT
configuration (not enabled by default in OE but can be enabled on
systems avoiding components based on GPLv3).

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---

v2:
- changed base_sbindir to sbindir

 meta/recipes-devtools/dosfstools/dosfstools_4.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
index 97ce449954..4bd4aef099 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.1.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "e6b2aca70ccc3fe3687365009dd94a2e18e82b688ed4e260e04b741247
 
 UPSTREAM_CHECK_URI = "https://github.com/dosfstools/dosfstools/releases"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig update-alternatives
 
 EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
 
@@ -26,3 +26,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 # Add codepage437 to avoid error from `dosfsck -l`
 RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconv-ibm437"
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "mkfs.vfat"
+ALTERNATIVE_LINK_NAME[mkfs.vfat] = "${sbindir}/mkfs.vfat"
-- 
2.29.2

