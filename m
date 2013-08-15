Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9DADE6B8B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:23:04 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so181234eei.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=RQMdhJ+8cRBTH2wcHXY4DWnPKk1n6KZjRA7y1PH8TDI=;
	b=GZNu1ZvRaYatyBItnn0d/ntVE4uiYqkBE6YTH64qsnbT97fFf1H5xbzC9F1yWOMI/q
	13oKjpmIb80hSj+lk/sY74ZzRcbKU803TDhD33kICyH2IHPvYEgf4+tsFzkR3wccl5Pu
	+RTzSy1ZRFiAC3U2+MB6/1rUC9RHtgHN8Dw3QADhY7YqnlTbeJqSJ/Hv8Y7OsCsMWohn
	x4h2zR23T463y7zk6TsB36Ro2B98ch4HwggDuG7LydBs4jVpFM9q4hFw1cUIblM0as/b
	73nS/MZcVckiCTEm3z9H9zzKUCYwhAJ4USx/EQEbez2S0Ew99PRtU1I2oOMWkVjLTsB0
	eOCA==
X-Received: by 10.14.246.11 with SMTP id p11mr20974102eer.9.1376551384809;
	Thu, 15 Aug 2013 00:23:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm74979396eev.14.2013.08.15.00.23.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:23:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:23:20 +0200
Message-Id: <c3eb0853ae658c7c97bd5e025c9a0bb7e3ea6c83.1376551402.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551401.git.Martin.Jansa@gmail.com>
References: <cover.1376551401.git.Martin.Jansa@gmail.com>
Subject: [for-dylan][PATCH 09/33] wget: Add missing DEPENDS on zlib
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
X-List-Received-Date: Thu, 15 Aug 2013 07:23:05 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

Create a new build enviroment, build wget failed
...
configure:34512: checking for libssl
configure:34542: i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/home/jiahongxu/yocto/build-20130613-qemu/tmp/sysroots/qemux86 -o conftest - O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c -ldl  -lssl /home/jiahongxu/yocto/build-  20130613-qemu/tmp/sysroots/qemux86/lib/libcrypto.so -lz >&5
/home/jiahongxu/yocto/build-20130613-qemu/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.7.2/ld: cannot find -lz collect2: error: ld returned 1 exit status
...

From log as we known, the reason is link zlib failed, it isn't
explicitly in wget's DEPENDS. Add zlib to wget's DEPENDS.

[YOCTO #4749]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/wget/wget.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 2787068..a7f99d7 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "A console URL download utility featuring HTTP, FTP, and more."
 SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "openssl"
+DEPENDS = "openssl zlib"
 
 INC_PR = "r16"
 
-- 
1.8.3.2


