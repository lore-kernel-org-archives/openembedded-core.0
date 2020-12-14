Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.35163.1607956636715402799
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Y6x+4Kh3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id p21so4919426pjv.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wbXfgOjab3RAypOdU/35MNVkTYmLKk8U2nX1zbxYjYU=;
        b=Y6x+4Kh3CBgOMtlx4n29dpyBmK3ECxGa8cO80VSGpxn/Bkd4s4ISU5l761EXM5BHEj
         ZkhZZbwerGu3qBeEvTo9bcnKLoV7Ye88NX4oNaHWykcEPKH/WigcKsSA8kGpdkteIs/r
         K81XTPe3qAD55XEl1cmWDBiDbf9F31F7l4YTOoj22Wet3+VVeGstqPtMRDB/WZPlbOON
         W3oDvPSq4/FGePpQLWnFtZIIEENXG+VOKE0LSGYgrt5ENFU+DjTm2WMmD+mUPdD0O9qN
         Q0PT4dTK8dzlUouAA6QPvBafilNyx928XpOgqV1Sjj2fJYGJBIQGuz0R5JO8BUxGZeLA
         ZR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wbXfgOjab3RAypOdU/35MNVkTYmLKk8U2nX1zbxYjYU=;
        b=pIPZolLm1RmTjQGiHE2AH+L5gChxhkzRS/oELL7pGtLjmLO6AbYvR2c2gLKY+9ZF2j
         dwRXnzzRsVWRKm3GQPLKJkSGUq4KDJJ37P+R8vOE80TDk/PPOZyFkI78qGrY6haNuLLw
         XVeZENLFPUv8tJjYt2yjJmEHC7XgIOmwsU2urzsnJ86evAnZTqhjh+MBq8RXi8SWrKEz
         30V8UV5p5fYrxJzndHR7tF05yo6BzQlQtYuU+DWGefVekoRM4W+t+Rs3m0QOrkgQgYjI
         BhyouLziuENQmxH5Ib4A7Q4hDiDINTmTKU0hIjnQzjVZLll11NPXYLPO3QH3DZRRTVF2
         kq6w==
X-Gm-Message-State: AOAM5320G2+9+i4pAJHCliDXx8AT+wTwRBlekDoQjm04t6mwvAvMMHYv
	epr+TBHzDtxyipVe8jPnEFqHypbSdGEoi9pM
X-Google-Smtp-Source: ABdhPJwWpz9Ui7s7ToX+Wwlzyy0L1U1cgqKvXxZAT+ukniULgEDZkfGvXI2VLMmDmXhSSpXszH7HWw==
X-Received: by 2002:a17:90a:2a83:: with SMTP id j3mr26002716pjd.84.1607956635744;
        Mon, 14 Dec 2020 06:37:15 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:15 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/25] kernel-dummy: fix executing unexpected tasks
Date: Mon, 14 Dec 2020 04:36:32 -1000
Message-Id: <09418489c550dc47c045c220e650afb198986676.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Andrej Valek <andrej.valek@siemens.com>

 - correctly save files into sstate
  - fix: ERROR: Task linux-dummy.do_fetch attempted to execute unexpectedly

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 16f6833ccd732de9f3db82ac5b0a18eea5298ceb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-dummy.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
index 62cf6f5ea6..649fc04dd1 100644
--- a/meta/recipes-kernel/linux/linux-dummy.bb
+++ b/meta/recipes-kernel/linux/linux-dummy.bb
@@ -5,10 +5,12 @@ where you wish to build the kernel externally from the build system."
 SECTION = "kernel"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
 PROVIDES += "virtual/kernel"
 
+inherit deploy
+
 PACKAGES_DYNAMIC += "^kernel-module-.*"
 PACKAGES_DYNAMIC += "^kernel-image-.*"
 PACKAGES_DYNAMIC += "^kernel-firmware-.*"
-- 
2.17.1

