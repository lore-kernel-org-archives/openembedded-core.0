Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2230A1061B0F
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 15:16:42 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54089.1774883793410862165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 08:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hr7UAE9C;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso716114f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 08:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774883792; x=1775488592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVX0cNGJ247dfID8rDSwVYiCJfnPgyFMyJZX0EgNT5I=;
        b=hr7UAE9CsIDlC8wIz8X33BNcnnT4i/Y7Ws+LtvyVeYNGaffG8+fPDMehPSDRkFrtnJ
         atUwBME06hCFsNctLfLZCD2uco6nXX/HCxqcBp31TFJEyj9YXzAnVYKEKtUOjKLhbZSr
         qzI5NzCmBsDHK7U4rmSIo4myeiipf3X/DnsoNB5KtSFUfsACIHLh3i5wp1zNbn3gGlkJ
         AH5LzGdLjHzzDIXvzIxOMxLxlEF+vmxQoYNIrQXsv3GT3J4CnZkk1PdoGwNnsar2pZ1X
         JTh2b8k7bsQSLRUcqS7H+rCycKsrNuyWl+a7+fnzl/0nhEpUIYsyzaub45nKyyhj6hg7
         81UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774883792; x=1775488592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVX0cNGJ247dfID8rDSwVYiCJfnPgyFMyJZX0EgNT5I=;
        b=fW0Cq9klJM82Y5RRVqnZhuHEb2Nd2ShAuT48wAN+Jq+lHSgfjNJhbx6AH+nEfK4yzq
         Gn3i8Pb353UulwMggFHISxmcakJzDSRL9+38Ji85BEtAunHpjteO/WXB/BGEAnGx5i4Y
         6Iv7gsQGGbgJavjAJY8EcNfIhplady/t9ZbwqXmy8b2y5fww+ESHYb+CGnjEgd5VjU1f
         vQnby3r7eh6Trx/LiokckADbeRQRB+R5Ox+OecgrZkciAp5GWYGR7ozzaDj0pmn8bbhB
         vjctbzFFICmVdla5cV1doI6cNqeOTm4zY0q9/cXxKvB+PrQKMVgIf2N+j640CLB4uwCo
         nR+g==
X-Gm-Message-State: AOJu0YxRJfx7pey/5EJXdTQPEb6e+vaP3gxkoGIvZawLNpebsL27LfuB
	XZkqHy0Y4zdZT/yk7DRe4zL9iS0fSzOUtsfrQsfqykm9qgM0Oh24EY3dYHKepw==
X-Gm-Gg: ATEYQzx7Q0TUd5Yq6RXYFViuHa+nSzLurxcqBIP/9KkWcRCCnG4YxccHBiNseyRPnbv
	6eE+66D6SYAT6CzhiSsSjk7l6epZISo2ib3foX1DxX+7Z7lHUH3jeHol1Gpl1Mt2dj2YPvA0yQS
	V7kxSNPR4OPoL8t33KetAp3G8EoZaHxkrynpipX++j/Dnf1BSF+wHEcwPIy/KlC3hNRGPs/Upob
	hj4YkuBPIf7q2YZAx0Hcs5Y4zxy3Ihfz03WS++Bw4IID2yoIFmz4cTUARpO+B3ylbdKz7wVwoQp
	ZJoQ0nke38xJc6bkPaOjzS7P9DMwNF5CYRSUg46fswlJWJKJ7EoNdYMT4tRjc8v6MuyJ7fWgpHv
	fUkTlbO+OTHeJY8gXCIZo3+ftOXGr52p16lsukip30aBFPaOZXhHTPx/L+Sygx4AmI3BSQriv5Z
	GT0qoN9vVY/su0+gdLp1+f/Y/1EQ==
X-Received: by 2002:a05:6000:40dd:b0:43b:5192:894b with SMTP id ffacd0b85a97d-43b9e9faf4dmr21510102f8f.23.1774883791669;
        Mon, 30 Mar 2026 08:16:31 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2727sm21661575f8f.2.2026.03.30.08.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 08:16:31 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [whinlatter][PATCH 7/7] systemd: backport fix to build with glibc-2.43 on host
Date: Mon, 30 Mar 2026 17:16:16 +0200
Message-ID: <20260330151620.3835312-7-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330151620.3835312-1-martin.jansa@gmail.com>
References: <20260330151620.3835312-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 15:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234248

From: Martin Jansa <martin.jansa@gmail.com>

fixes systemd-systemctl-native on hosts with glibc-2.43:

In file included from ../sources/systemd-systemctl-257.9/src/basic/errno-list.c:13:
src/basic/errno-to-name.h:71:23: error: initialized field overwritten [-Werror=override-init]
   71 |         [EFSBADCRC] = "EFSBADCRC",
      |                       ^~~~~~~~~~~
src/basic/errno-to-name.h:71:23: note: (near initialization for ?errno_names[74]?)
src/basic/errno-to-name.h:114:26: error: initialized field overwritten [-Werror=override-init]
  114 |         [EFSCORRUPTED] = "EFSCORRUPTED",
      |                          ^~~~~~~~~~~~~~
src/basic/errno-to-name.h:114:26: note: (near initialization for ?errno_names[117]?)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd.inc         |  4 ++-
 ...ilter-out-EFSBADCRC-and-EFSCORRUPTED.patch | 34 +++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 761660f2c8..f41acc029d 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -17,6 +17,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 SRCREV = "5e38d199a623563698ab4a69acbbe3afa9135198"
 SRCBRANCH = "v257-stable"
-SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV}"
+SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV} \
+    file://0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch \
+"
 
 CVE_PRODUCT = "systemd"
diff --git a/meta/recipes-core/systemd/systemd/0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch b/meta/recipes-core/systemd/systemd/0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch
new file mode 100644
index 0000000000..5673175cb1
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-errno-list-filter-out-EFSBADCRC-and-EFSCORRUPTED.patch
@@ -0,0 +1,34 @@
+From fb146f6d2c5118410fd19907651fd8f7310bf69e Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Tue, 24 Feb 2026 20:19:45 +0900
+Subject: [PATCH] errno-list: filter out EFSBADCRC and EFSCORRUPTED
+
+These are introduced in kernel v7.0.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/3cfb16998808a6ec8012a6120d0a82f0e1a0c8bb]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ src/basic/generate-errno-list.sh | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/basic/generate-errno-list.sh b/src/basic/generate-errno-list.sh
+index f756b2e020..491fa1b6e3 100755
+--- a/src/basic/generate-errno-list.sh
++++ b/src/basic/generate-errno-list.sh
+@@ -3,9 +3,13 @@
+ set -eu
+ set -o pipefail
+ 
+-# In kernel's arch/parisc/include/uapi/asm/errno.h, ECANCELLED and EREFUSED are defined as aliases of
+-# ECANCELED and ECONNREFUSED, respectively. Let's drop them.
++# In kernel's arch/parisc/include/uapi/asm/errno.h, The following aliases are defined:
++# ECANCELLED → ECANCELED
++# EREFUSED → ECONNREFUSED
++# EFSBADCRC → EBADMSG
++# EFSCORRUPTED → EUCLEAN
++# Let's drop them.
+ 
+ ${1:?} -dM -include errno.h - </dev/null | \
+-       grep -Ev '^#define[[:space:]]+(ECANCELLED|EREFUSED)' | \
++       grep -Ev '^#define[[:space:]]+(ECANCELLED|EREFUSED|EFSBADCRC|EFSCORRUPTED)' | \
+        awk '/^#define[ \t]+E[^ _]+[ \t]+/ { print $2; }'

