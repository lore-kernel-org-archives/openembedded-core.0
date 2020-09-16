Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.21730.1600260902000661122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 05:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U5nLxSaU;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id lo4so10176551ejb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 05:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6TGPq/wq/KtjyWD0cjyKmSezL59qMO6DAiztIrA2rcU=;
        b=U5nLxSaUR49P1IFgzgPWy6YNAhoydVEpgxaF5IOSHbRpOXzja4dgo1Rf9lF8xYLkCV
         BT8026MPh0gBVAQNP5qJ1C2Syp6yZ1SwVSvjZbPTcUD3brimlPnOK3lOua84n6NBEepF
         JVMTyINUFzGh2BOeS9TDfc1s05njGRcp4C7E6WWQaaBTub3c3KjbQ7wSHoncrjHBODIR
         jbaZ/C3LzIXNx0fWVZBuOog1u631o4Ve8TmCYhdkbJl5o+CyQxoRFFdcOw8ASOpilh1q
         YOzLMfK5WIY3Vi4Vcqgd2oUktWnTrQVDbBS1sfX0vfHJLDDs7mCbe8Bda7XyxvFQqCay
         NM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6TGPq/wq/KtjyWD0cjyKmSezL59qMO6DAiztIrA2rcU=;
        b=YyYyBidDz6IQN3qIQ3owSq6sZmTxARWaJTI3UEpb08xpY8Bu8CkfqPVaurQFSSNasx
         hKckkeLvYWca63y+iNsBBuuwOo8dPYRaxhXvfDZc8fP5WmXsCjXmJkrCBVVP3MTL7gUm
         KCRWSjc0aH7vM6TXV02LF7rkpSRdPKO+ymb3COYnEvlvMdxgu5JENhmkkijP3vtWYqrm
         bl2+69m8AZ9U1gJ9fIWFu3oA31tjce20N2+TNthPm13euuTJGtWvD3LGKx+UzeCiGNTu
         cMUPV2Xw1gDK7ilB0skuDeZwN232ICWJA70VGbPWKLw94bUfVjnVt25GmiMqi6I7byv+
         XZsw==
X-Gm-Message-State: AOAM531+aGl/mwKJZK9mMHYEngutTc7SUVAPfXfI0jAXH/6/rK3Ofqaa
	TU60Gp3rMJtmMPa4jZprcDDC5JbJExg=
X-Google-Smtp-Source: ABdhPJzzBZMr6dRLXUmOlkbfveNNj+h39o9HjKv9U+Sjiau20N4bpXZlOYBOBicd9OukyAlIjsKT8g==
X-Received: by 2002:a17:906:71cc:: with SMTP id i12mr25022739ejk.507.1600260900097;
        Wed, 16 Sep 2020 05:55:00 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ce14sm14168700edb.25.2020.09.16.05.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 05:54:59 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 5/5] *-initramfs: don't use .rootfs IMAGE_NAME_SUFFIX
Date: Wed, 16 Sep 2020 14:54:49 +0200
Message-Id: <20200916125449.1564380-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916125449.1564380-1-Martin.Jansa@gmail.com>
References: <20200916125449.1564380-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* fixes the issue when image-live.bbclass expects the image
  ending with just INITRAMFS_FSTYPES:
  image-live.bbclass:INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.${INITRAMFS_FSTYPES}"
  while by default it now was with .rootfs suffix:
  -rw-r--r-- 2 bitbake bitbake 1.5K Oct 25 16:12 /OE/build/oe-core/tmp/deploy/images/genericx86-64/core-image-minimal-initramfs.env
  -rw-r--r-- 4 bitbake bitbake  11M Oct 25 16:13 /OE/build/oe-core/tmp/deploy/images/genericx86-64/core-image-minimal-initramfs-genericx86-64-1.0-r0-20191025154349.cpio.gz
  -rw-r--r-- 4 bitbake bitbake 1.2K Oct 25 16:11 /OE/build/oe-core/tmp/deploy/images/genericx86-64/core-image-minimal-initramfs-genericx86-64-1.0-r0-20191025154349.manifest
  -rw-r--r-- 4 bitbake bitbake 1.3K Oct 25 16:12 /OE/build/oe-core/tmp/deploy/images/genericx86-64/core-image-minimal-initramfs-genericx86-64-1.0-r0-20191025154349.qemuboot.conf
  -rw-r--r-- 4 bitbake bitbake 196K Oct 25 16:11 /OE/build/oe-core/tmp/deploy/images/genericx86-64/core-image-minimal-initramfs-genericx86-64-1.0-r0-20191025154349.testdata.json
  -rw-r--r-- 4 bitbake bitbake 118M Oct 25 16:13 /OE/build/oe-core/tmp/deploy/images/genericx86-64/core-image-minimal-initramfs-genericx86-64-1.0-r0-20191025154349.wic
  -rw-r--r-- 4 bitbake bitbake 3.1K Oct 25 16:13 /OE/build/oe-core/tmp/deploy/images/genericx86-64/core-image-minimal-initramfs-genericx86-64-1.0-r0-20191025154349.wic.bmap
  -rw-r--r-- 4 bitbake bitbake 1.3K Oct 25 16:12 /OE/build/oe-core/tmp/deploy/images/genericx86-64/core-image-minimal-initramfs-genericx86-64.qemuboot.conf
  -rw-r--r-- 4 bitbake bitbake  11M Oct 25 16:13 /OE/build/oe-core/tmp/deploy/images/genericx86-64/core-image-minimal-initramfs-genericx86-64.rootfs.cpio.gz
  -rw-r--r-- 4 bitbake bitbake 1.2K Oct 25 16:11 /OE/build/oe-core/tmp/deploy/images/genericx86-64/core-image-minimal-initramfs-genericx86-64.rootfs.manifest
  -rw-r--r-- 4 bitbake bitbake 118M Oct 25 16:13 /OE/build/oe-core/tmp/deploy/images/genericx86-64/core-image-minimal-initramfs-genericx86-64.rootfs.wic
  -rw-r--r-- 4 bitbake bitbake 3.1K Oct 25 16:13 /OE/build/oe-core/tmp/deploy/images/genericx86-64/core-image-minimal-initramfs-genericx86-64.rootfs.wic.bmap
  -rw-r--r-- 4 bitbake bitbake 196K Oct 25 16:11 /OE/build/oe-core/tmp/deploy/images/genericx86-64/core-image-minimal-initramfs-genericx86-64.testdata.json

  initramfs images aren't normally used for rootfs, so just set
  the suffix to empty, people using different artifact names might
  still need to set INITRD_LIVE (e.g. when their images don't end
  with "-${MACHINE}" as well)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/images/core-image-minimal-initramfs.bb        | 1 +
 meta/recipes-core/images/core-image-tiny-initramfs.bb           | 1 +
 meta/recipes-extended/images/core-image-testmaster-initramfs.bb | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
index 83d0eaa8df..664fe7310e 100644
--- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
+++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
@@ -17,6 +17,7 @@ PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} udev base-
 IMAGE_FEATURES = ""
 
 export IMAGE_BASENAME = "${MLPREFIX}core-image-minimal-initramfs"
+IMAGE_NAME_SUFFIX ?= ""
 IMAGE_LINGUAS = ""
 
 LICENSE = "MIT"
diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index 0eca6d9944..5849900742 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -13,6 +13,7 @@ PACKAGE_INSTALL = "initramfs-live-boot-tiny packagegroup-core-boot dropbear ${VI
 IMAGE_FEATURES = ""
 
 export IMAGE_BASENAME = "core-image-tiny-initramfs"
+IMAGE_NAME_SUFFIX ?= ""
 IMAGE_LINGUAS = ""
 
 LICENSE = "MIT"
diff --git a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb b/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
index 09a6d16042..1a2e0af27b 100644
--- a/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
+++ b/meta/recipes-extended/images/core-image-testmaster-initramfs.bb
@@ -8,6 +8,7 @@ PACKAGE_INSTALL = "initramfs-live-boot initramfs-live-install-testfs initramfs-l
 IMAGE_FEATURES = ""
 
 export IMAGE_BASENAME = "core-image-testmaster-initramfs"
+IMAGE_NAME_SUFFIX ?= ""
 IMAGE_LINGUAS = ""
 
 LICENSE = "MIT"
-- 
2.25.1

