Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 894EC7FC1F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 09:12:43 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id f129so12779637wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 01:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=mWgmQtp6f7k7uIWkZZXDVbvMiYTs+ouVwjsqu3bB0JQ=;
	b=Vl2wa5c4pj1s86tizqhAG2JcuGwhkoO4pOt+E2DCZhIjUVgV/pO92Oko40SLo4QzSC
	LsHXcjvXrqiphXt9CUPaiF9g2NA0q0BhFQ1/p3Hun4eQrDAgtAeq/dhwEuyIMG/J4cRi
	IJ92v7Y3H0GZY01der5DgaTN797kif3MjzzNG+fK4CvnoUqTyfNYAlS8RGyU++9zLgkF
	Asi+3DRlP8zoOqsTmiZN8xHE+UzwiUgE7pZo3SYer+VprwBOvbNkPedMGBOpzH5dmyCA
	KnQlQBvvXG5iB/R/oJjDBF4HVfRBnr/oyAO7z0Hyrk48OVyg7i8+8BTxenrF1mCzUaHw
	nd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mWgmQtp6f7k7uIWkZZXDVbvMiYTs+ouVwjsqu3bB0JQ=;
	b=MzH9BtFD/ktkAPElzpGNTEL6YZF+AJ0h9pCvFC9BzC8yyVevo7IFVo2BP+GjL30d5N
	LQwK4HKcJ729Use7ambk3YX8I1gV9zmYSwEvRHmS8MQUcYZdG6BeIR3obpqLIzB/lesS
	lQ5F+gDai2TQngFv2ohny01gitL8jiz97NImCPESDJl97y3gjb0t3lLp0HHxfXMjrWkA
	3kO5sLbPS/cLA+uwxRKcfp0SppREfH3CdnLEiaJpBlZnnnnZpLp1858INqw7KGDTgMH3
	wIeW/n2mxA2HW+aEIQrXDnUuNCcqn0EUuvIXSSbU4DWAbjvtbvbm/0Wp9tdJYuDDcJtX
	gbGA==
X-Gm-Message-State: APjAAAUGMMKiP3qajQ4Vo/6MHwN+d1Fe3jPZdnNnoeWKezaoVgcesywN
	f4ZWG8SaI1AdqmL3IMb9YK9vObq6r38=
X-Google-Smtp-Source: APXvYqxe4PyjA6FkdTiiVq2f5R+QVsNq1ue7FscfuxHVbTiIvT3vC+HlLu8WDQAA95U2+Nl6oCbnOQ==
X-Received: by 2002:a05:600c:54b:: with SMTP id
	k11mr25217686wmc.63.1578993164081; 
	Tue, 14 Jan 2020 01:12:44 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	o129sm17806160wmb.1.2020.01.14.01.12.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 01:12:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 10:12:26 +0100
Message-Id: <97301bd6ecfeefc3ec9e4a8d9da4de1635c8bcc2.1578993027.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1578993027.git.Martin.Jansa@gmail.com>
References: <cover.1578993027.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv5 7/8] *-initramfs: don't use .rootfs IMAGE_NAME_SUFFIX
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jan 2020 09:12:43 -0000
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
index 7df8ab1ebd..055db7b4a9 100644
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
2.20.1


