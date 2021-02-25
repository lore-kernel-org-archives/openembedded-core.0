Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.106.1614288030393011609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 13:20:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LDiKQmCz;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id v200so4487987pfc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 13:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kbpifzS6+loHlgQZg5dZ0muGmUsAp5JX7KOcEFSHcVo=;
        b=LDiKQmCzBKc/Mpi9QH02hro+s03/KMqH05S6WPXrEBBrF+xZgcw+wq4dIwMBNAfxsf
         KVYGhowWFzjpInlZj9DlbVvA6QtXrXsXVHohB3ibo1LDX0DRKsp6P9NpvPc1dmRMF7tH
         xVWM7FeMY4RFZw/pHQvAL4VaUBpUWytgtwzuVqOxopaOGydrigO4n1WPHG0BZueDJwe3
         Q4MII2IbO3PaA5DwG/bjru/wKFdsYQmzpaZEgi4s80lJJMd7Ec4bZ32ZsiJHNGNto4Ws
         2eBa3ennVehU4qgnAZuphmQ0IfBT2CZPkn30MDNQmHD4azgk/7Y30Z+IBqYf61qZG5sU
         tALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kbpifzS6+loHlgQZg5dZ0muGmUsAp5JX7KOcEFSHcVo=;
        b=IITogX+hEmEb/QjpNnRxJ881cs9Y4trkMatHeBxi1PfYC6+qI0fKcWcXbWOjL3YTr+
         ycQSEpffUFUly5o6Szk6bRhTZcXHSExO0rqGZoQwxs90zlNiFg5J99TDgO/SVUBcKAVa
         8+sh9XgayrMRbdx/L5TcFKyCQlsYt7si47HCzTVl5vjlPZM2rrUrCE6rOCtYbjgOLcF2
         HgbjLQ4+qFERXp632XQMTc8sfVOE9aQylgwrG2BPMle04hC2m8wEu/2qKDv1oC7nqPmW
         SqXmwoJRIgVAomdam7kww7a4pnurWYGcN+Amn0pqwrw18zeQncS7ME6Z1+zm6qrx06de
         rX9A==
X-Gm-Message-State: AOAM530+bWWxYfIBzyNeqzMi1GzjOEalkB8rBl44/utHTUtFfBhhdrIl
	zaBd2MQZT+Z3rlARYsP1btWaeirgDgo7YA==
X-Google-Smtp-Source: ABdhPJy8R56SsuPDCK00Q5JQ/v6JuuWT5RQIFAWEchyMefRR2KvG6FF528eIScmHIG4XwqSWlevDng==
X-Received: by 2002:a63:d0f:: with SMTP id c15mr4661144pgl.367.1614288029334;
        Thu, 25 Feb 2021 13:20:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id u22sm7163743pgh.20.2021.02.25.13.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 13:20:29 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] core-image-minimal: Raise size limit to 16M
Date: Thu, 25 Feb 2021 13:20:26 -0800
Message-Id: <20210225212026.176719-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

latest core image mimial/sysvinit has less free space
so df tests fail with

AssertionError: False is not true : Not enough space on image. Current size is 2717

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/images/core-image-minimal.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/core-image-minimal.bb b/meta/recipes-core/images/core-image-minimal.bb
index 19f27f8395..a48e634546 100644
--- a/meta/recipes-core/images/core-image-minimal.bb
+++ b/meta/recipes-core/images/core-image-minimal.bb
@@ -8,5 +8,5 @@ LICENSE = "MIT"
 
 inherit core-image
 
-IMAGE_ROOTFS_SIZE ?= "8192"
-IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
+# 16M
+IMAGE_ROOTFS_SIZE ?= "16384"
-- 
2.30.1

