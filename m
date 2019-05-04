Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 477CC7D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:45 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b3so4437510pfd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=barJQWm87t7x1oxzIqoo1kNJSvM/4SsnalHxSmBU0D0=;
	b=COrBQ8ejogbh82lbvhbSQub2rV3Eskr0I6v6K5fIxmFxVOed5uRKGIE2u32lsMBX4X
	UOlITK+4/qvfzL6xuTAR8iqUJi26PYx1R/EMTwcBAcR6Waz9ocnTfhpc5R2wJyDWP/gV
	UbSmf34fGjvUmFyKhsFiZeAG8/MGZPT9pg8+WBQW2mCg0iqXWi/XlyXUXxzqZDuwgzMX
	spPa695m8x/Fenk7BGtC6/i+Qadm6+bFrBLrg1BTuMzG2cxU8z0STE/y27lOmgdsWucP
	e45i66F780ga8jrOTKPLRH0hUFpZeYCc9aA2DSCJgBulIBFI6N/p6CFPRc4Q+TfxJWjR
	u4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=barJQWm87t7x1oxzIqoo1kNJSvM/4SsnalHxSmBU0D0=;
	b=IZFudxMaKTr3mQK+3bZK7LU+G86WZ47jneGK1TxOxe6kXbqSUrcT6LQvNf/mDKY0Aw
	Sr7AtjwoJAX9dUy0rSZWET6jqy9lxU8uTXhF5O4hTiIXamSAcr3s8am5rsd5+4lKD39P
	yWQsqj3nX/c5x7lKW/1I6F1Puv7pnKop5Pg+bHqF17HxCES0ggC7OqXnh1ZNYn0j6bD1
	TGg7Ry4uZL0uaYZk1IUazgWHnNnHwTnsxIITrDzEO+xKazTDZeCKqB90BqLmmOvPiIG+
	yd8hoC0u7UP/fCsvVnJTD/JolvfW6ZhPlxV4ZR13UJ5oQl5TQzwDzHIxG4VvKKiWuw+T
	lXqA==
X-Gm-Message-State: APjAAAWFUGqEateaZvtPLbUDZjA3BoZypjqWFn0hIuxtEWaG3u13zyQ8
	Lp6mWgk8AlklzCc7PZ71PJ3DHYx5
X-Google-Smtp-Source: APXvYqzqkxzlqc/Ox8LjYCf9wqp3RwpK8W+DV8iCT/ikPKnvy6phSGkLo1/XtwnkO02hfvUeKaTcMg==
X-Received: by 2002:a63:8a4a:: with SMTP id y71mr19401096pgd.270.1556983666319;
	Sat, 04 May 2019 08:27:46 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:56 -0700
Message-Id: <ba56d8729a58d373bb301dda304c78702ded5869.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 20/43] cryptodev: fix module loading error
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
X-List-Received-Date: Sat, 04 May 2019 15:27:45 -0000

From: Kai Kang <kai.kang@windriver.com>

Backport patch from upstream to fix module cryptodev loading error.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/cryptodev/cryptodev.inc        |  4 +-
 ...01-Fix-module-loading-with-Linux-v5.0-rc5.patch | 59 ++++++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index 252d39d..9d8ba44 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -3,7 +3,9 @@ HOMEPAGE = "http://cryptodev-linux.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux"
+SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux \
+           file://0001-Fix-module-loading-with-Linux-v5.0-rc5.patch \
+           "
 SRCREV = "fd8b15ef1c8398a69a37932ee48c74ab40329a29"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch b/meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch
new file mode 100644
index 0000000..34ec872
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-Fix-module-loading-with-Linux-v5.0-rc5.patch
@@ -0,0 +1,59 @@
+Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-linux/commit/f971e0c]
+
+Backport patch from upstream to fix module cryptodev loading error.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From f971e0cd4a0ebe59fb2e8e17240399bf6901b09b Mon Sep 17 00:00:00 2001
+From: "Derald D. Woods" <woods.technical@gmail.com>
+Date: Sun, 10 Feb 2019 13:22:19 -0600
+Subject: [PATCH] Fix module loading with Linux v5.0-rc5
+
+This commit fixes this module load error:
+[...]
+[   29.112091] cryptodev: loading out-of-tree module taints kernel.
+[   29.128906] cryptodev: Unknown symbol crypto_givcipher_type (err -2)
+[   29.188842] cryptodev: Unknown symbol crypto_givcipher_type (err -2)
+modprobe: can't load module cryptodev (extra/cryptodev.ko): unknown symbol in module, or unknown parameter
+[...]
+
+Upstream Linux support for unused GIVCIPHER, and others, was dropped here:
+
+c79b411eaa72 (crypto: skcipher - remove remnants of internal IV generators)
+
+Signed-off-by: Derald D. Woods <woods.technical@gmail.com>
+---
+ cryptlib.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/cryptlib.c b/cryptlib.c
+index 6e66698..4a87037 100644
+--- a/cryptlib.c
++++ b/cryptlib.c
+@@ -38,7 +38,9 @@
+ #include "cryptodev_int.h"
+ #include "cipherapi.h"
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 0, 0))
+ extern const struct crypto_type crypto_givcipher_type;
++#endif
+ 
+ static void cryptodev_complete(struct crypto_async_request *req, int err)
+ {
+@@ -157,8 +159,11 @@ int cryptodev_cipher_init(struct cipher_data *out, const char *alg_name,
+ 
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0))
+ 		tfm = crypto_skcipher_tfm(out->async.s);
+-		if ((tfm->__crt_alg->cra_type == &crypto_ablkcipher_type) ||
+-		    (tfm->__crt_alg->cra_type == &crypto_givcipher_type)) {
++		if ((tfm->__crt_alg->cra_type == &crypto_ablkcipher_type)
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 0, 0))
++		    || (tfm->__crt_alg->cra_type == &crypto_givcipher_type)
++#endif
++							) {
+ 			struct ablkcipher_alg *alg;
+ 
+ 			alg = &tfm->__crt_alg->cra_ablkcipher;
+-- 
+2.20.0
+
-- 
2.7.4


