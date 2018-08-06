Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id D65CD78A40
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:34 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id g6-v6so2681350plq.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y4Ip7WKi9ZL1IJioYWqM5Dr9UWhjzwYHl635+GJaKRE=;
	b=vH+naNDMdl1b6zuearJbN7D1Xr9U/fUs+7yRWfY8PH1hnQ3e9Pqt5reMzNLZZB+a8U
	TM8AQr98f8JrPsfVZVHPzkKVcnMGksLShwUVa5AEsSHBkCWotQTilz1xOlqu1W3xWARw
	Hy5c/ZxBeDwhMmYRfQ4bacQMDrxGDNMW5DGkV95RkUOcmKp4VJFB1gRF11DQWL8Gekqz
	6tQP6xdfIrM82EUNWv/pS77mDdWb7GVriFJR7gR7ACuaSn+hC/Fu60AjJmHYJASPFdJ6
	iKGkxOMCTyGKCdLnHHpiq2p9XFabfxr0SAQts9oeWDdhdY+lZdGLybXsJZt0gfi+BR3o
	Xvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y4Ip7WKi9ZL1IJioYWqM5Dr9UWhjzwYHl635+GJaKRE=;
	b=mwwKlH+FlKDZKRzKcWN8nC8s2qLTmVNyU6JGbvuw4XriuAzcLrqCbdfnMBsJWSI8Vj
	hn0x4phNFiudUc4UxR8q1p47PM06qHdXDBlPUEfDHAEZ9R3tnD4l7Tn9NsTbHf/kBb0I
	P8BS+sYqvgdAv0bn+/v5txHnp2np7km+wvtfnl9xjD0hYY8pWNPk+aRoRrCqSklBkCgH
	KDWH66aQBRODpbx3q7zvLjNDyc60Cjdj6UosUl2WyrhBnDwBKleuC0eUAHMS+czdQEXG
	D0/0rBHqOs9gPzXKUlzAqVzCRg95B8N5BW+Ylcg2MFjj0pC2XF7+rnBNDKZqZroT56VB
	QgJg==
X-Gm-Message-State: AOUpUlGOh+OONDLNKjZ4AN+bovMEHluJowugS/esBGiz8z1QpgSxfvK2
	vYcffh1ZfU67OFz20RswcS5Al1gz
X-Google-Smtp-Source: AAOMgpfkfFRgNUM7bccm6RDLthxCmobRZ0KinHMdJhncNo9z6v/dXigc6sj46DYknb95m3kUn0ANiQ==
X-Received: by 2002:a17:902:301:: with SMTP id
	1-v6mr15512254pld.127.1533596255663; 
	Mon, 06 Aug 2018 15:57:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm11993137pgr.59.2018.08.06.15.57.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:06 -0700
Message-Id: <2c149d2fe995f6e460586d1d8ec8ed268932f611.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
Subject: [PATCH 09/18] blktool: Fix build with glibc 2.28
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../blktool/blktool-gnulib-makedev.patch      | 23 +++++++++++++++++++
 meta/recipes-extended/blktool/blktool_4-7.bb  |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch

diff --git a/meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch b/meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch
new file mode 100644
index 0000000000..6eea608b29
--- /dev/null
+++ b/meta/recipes-extended/blktool/blktool/blktool-gnulib-makedev.patch
@@ -0,0 +1,23 @@
+include <sys/sysmacros.h> for major/minor defintions
+
+Fixes
+
+| ../blktool-4.orig/blktool.c: In function 'detect_dev_class':
+| ../blktool-4.orig/blktool.c:295:10: warning: implicit declaration of function 'major' [-Wimplicit-function-declaration]
+|   switch (major(st_rdev)) {
+|           ^~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: blktool-4.orig/blktool.c
+===================================================================
+--- blktool-4.orig.orig/blktool.c
++++ blktool-4.orig/blktool.c
+@@ -27,6 +27,7 @@
+ #include <linux/cdrom.h>
+ #include <linux/major.h>
+ #include <scsi/scsi.h>
++#include <sys/sysmacros.h>
+ 
+ #include "blktool.h"
+ 
diff --git a/meta/recipes-extended/blktool/blktool_4-7.bb b/meta/recipes-extended/blktool/blktool_4-7.bb
index 4551c3233e..0e6f7ee6df 100644
--- a/meta/recipes-extended/blktool/blktool_4-7.bb
+++ b/meta/recipes-extended/blktool/blktool_4-7.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/
            file://0001-fix-typos-in-manpage.patch \
            file://0002-fix-string-error.patch \
            file://0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch \
+           file://blktool-gnulib-makedev.patch \
           "
 
 SRC_URI[tarball.md5sum] = "62edc09c9908107e69391c87f4f3fd40"
-- 
2.18.0


