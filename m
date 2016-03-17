Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 99DE06FEF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 05:18:32 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id w104so63250363qge.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 22:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dkL1/iX15go9Ed4HO58u5Zz+tvgiQEKq9liNBQgmifk=;
	b=BmsSRBJf1f7IV10cNrKALJxxDpSHrIIbrcpeu8sUVT9nRl7zFE5MywWDgnPXVEcFue
	WUBfy5A4EpyXtlIMBsI2idubKCqLbZj0w30pOP/KYq0EJ5H+EGju2CMcrHZFN33j+lMZ
	et3HLXU6HO5nBKaoQ+7VXDxxGgg2TqgTxw8g/P7MF6pY5hDf+bf7wuSGXeJalJYAaJW/
	78sZOufkxofSbLEIEZu9lJZKRRagcPrQvfX6UsAuph8Tt4186lcQOTPqbQipmYC2s7xv
	TMDTt9NCRIaRisqTS3BjEnuTVu+pQhIPNxQkuE2olq4Fw1ipXShnZGkR8+SgKE7Ggbr0
	GFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dkL1/iX15go9Ed4HO58u5Zz+tvgiQEKq9liNBQgmifk=;
	b=F96ul0xed5PrW5aDy+RyjZlIknn32vok3hCApjjlG3HrpbHNAV1KgLGR9gblyc3gjw
	axdurtcZNpcmHLZbzBxSeJDeQgiURqLQuhRjsmUG0KdA2yDZs/JByhPEPt1vLw5aleI+
	cDAp+x+yUTWbxKg0Yj58kYUqq5oAAVkn6U2VrTMWalWSKp2pHjOvTgwjSjQ4zljWqtr+
	Ub/orMKeDp/wv9wE0yMoYjT040LryMmDcDFwY5SwAVC1h3yudfnw8auaae+347FkgroW
	2kJTW0dbvBKEJ5QsUrdH2bj2uKWpSlpVZwD5OOBQYVfQCHaiklaSN8QTVnj7UPOome9a
	VbUg==
X-Gm-Message-State: AD7BkJKWwLSRkDoWroXdLlzK6oXCT0YhoPnfEclg7ZX1Tu5+KJnIh4UogzCqc8j9Wg1v1A==
X-Received: by 10.140.234.11 with SMTP id f11mr12408766qhc.51.1458191912974;
	Wed, 16 Mar 2016 22:18:32 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	i46sm2216771qgd.19.2016.03.16.22.18.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Mar 2016 22:18:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 05:18:14 +0000
Message-Id: <cover.1458191793.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/6] Fix more recipes to build with musl
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
X-List-Received-Date: Thu, 17 Mar 2016 05:18:34 -0000

This fixes build for few more recipes on musl

Khem Raj (6):
  xcb-util-image: Fix build with clang
  bdwgc: Check for getcontext() API during configure
  watchdog: Disable nfs on musl targets
  socat: Access c_ispeed and c_ospeed via APIs
  python-numpy: Fix build on musl
  libtirpc: Add native rpcgen and regenrate rpc headers on musl

 ...001-Access-c_ispeed-and-c_ospeed-via-APIs.patch |   39 +
 meta/recipes-connectivity/socat/socat_1.7.3.1.bb   |    1 +
 .../python/python-numpy/aarch64/_numpyconfig.h     |    3 +-
 .../python/python-numpy/add-glibc-check.patch      |   36 +
 .../python/python-numpy/mips/_numpyconfig.h        |    3 +-
 .../python/python-numpy/mips64/_numpyconfig.h      |    3 +-
 .../python/python-numpy/mips64n32/_numpyconfig.h   |    3 +-
 .../python/python-numpy/powerpc/_numpyconfig.h     |    3 +-
 .../python/python-numpy/powerpc64/_numpyconfig.h   |    3 +-
 .../python/python-numpy/x86-64/_numpyconfig.h      |    3 +-
 .../recipes-devtools/python/python-numpy_1.10.4.bb |    1 +
 ...Add-rpcgen-program-from-nfs-utils-sources.patch | 6510 ++++++++++++++++++++
 ...ly-generate-XDR-header-files-from-.x-sour.patch | 1003 +++
 ...R-files-needed-to-build-rpcbind-on-top-of.patch | 1655 +++++
 meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb   |    6 +-
 meta/recipes-extended/watchdog/watchdog_5.14.bb    |    1 +
 .../xorg-lib/xcb-util-image/clang.patch            |   24 +
 .../xorg-lib/xcb-util-image_0.4.0.bb               |    5 +-
 ...ac-add-check-for-NO_GETCONTEXT-definition.patch |   29 +
 meta/recipes-support/bdwgc/bdwgc_7.4.2.bb          |    1 +
 20 files changed, 9323 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/socat/0001-Access-c_ispeed-and-c_ospeed-via-APIs.patch
 create mode 100644 meta/recipes-devtools/python/python-numpy/add-glibc-check.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0003-Add-rpcgen-program-from-nfs-utils-sources.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0004-Automatically-generate-XDR-header-files-from-.x-sour.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0005-Add-more-XDR-files-needed-to-build-rpcbind-on-top-of.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/xcb-util-image/clang.patch
 create mode 100644 meta/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch

-- 
1.9.1


