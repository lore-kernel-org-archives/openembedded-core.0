Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id BADF07FAAD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 21:22:11 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id i12so6144097wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 13:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Df8SDzcH07/EgzZkQjazmRbP+wwmdIbuaF+jNdZHeM4=;
	b=dUKpsqS0pUC4sBAbKdI6paje/blMXrjdnmvV3GB0ij5bj2jnoZ9cq7rtkOJYK2JiCu
	U+1dds9xgqpXhqPDOhjSwAqP+tupDAne+Gi2Y4plTyBRYvfSoa7oIEDs7NTgTZIYU8Nl
	G+JGKhGzI/LnCIgezgN0yt1d9EMcov51CoIXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Df8SDzcH07/EgzZkQjazmRbP+wwmdIbuaF+jNdZHeM4=;
	b=qlHAJVnIyhM7mjsnWHzOyeUV49WgYo9qYgSUlNLVSI6qug2pD3JrEBnLCUKU09emTV
	7Vfih+N654H4CHkpNNiFG/obfTRM0xx6J4zkM1rfAmMR2gP7nh3c2YA7vqymb3qebkN9
	v5B4EuALF0zItLq2X2QcR8tvAJ6nWJGA4UI7c5dt8go0yXDoRyGOi2yb/UDpJXW5VF+n
	8rnw+5MH93sc1NvbP8+AsklG7K5XUaCGDcYMb4vegFiqE/FLZUZXXq/GX53q6sVRl5GL
	jD/rKb66i45h/KwhdJBbyqcGYuLDtIm33swXTKUxPuFEE37N9eb76IaTy5iRweHJ2NmP
	xBfg==
X-Gm-Message-State: APjAAAVw+LEqv1Y2G0LcW2UUYUHfK81+wy6IAFtQ/uE4vEOAWHE31Y59
	lG5RC74hEH1ssWwD3rsgMGogDCuFF/A=
X-Google-Smtp-Source: APXvYqzVLy+XrUTnDjBf5oS7ZTWYRb1PhYHKVzvU9YLtSp37afyB9Hu6K52CKSQJFwm9Kp1Icu8YRA==
X-Received: by 2002:a5d:5224:: with SMTP id i4mr13645566wra.303.1574371331863; 
	Thu, 21 Nov 2019 13:22:11 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e16sm4939533wrj.80.2019.11.21.13.22.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 13:22:11 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 21:22:05 +0000
Message-Id: <20191121212208.4885-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121212208.4885-1-richard.purdie@linuxfoundation.org>
References: <20191121212208.4885-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/5] opkg-utils: Fix silent empty/broken opkg package creation
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
X-List-Received-Date: Thu, 21 Nov 2019 21:22:12 -0000
Content-Transfer-Encoding: 8bit

opkg-build was failing on hosts where tar < 1.28 and reproducibile builds
were enabled but it was doing this silently and generating corrupted
(empty) ipk files. Add a fix for this (submitted upstream).

The fix requires bash but if you're building ipk files this shoudn't be
a problem.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../opkg-utils/opkg-utils/pipefail.patch      | 31 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.4.1.bb            |  3 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch
new file mode 100644
index 00000000000..55ddcc1fd20
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch
@@ -0,0 +1,31 @@
+We need opkg-build to fail if for example the tar command is passed invalid 
+options. Without this, we see silently created empty packaged where data.tar
+is zero bytes in size. This creates hard to debug problems.
+
+An example is when reproducible builds are enabled and run on old hosts like
+centos7 which has tar < 1.28:
+
+Subprocess output:tar: unrecognized option '--clamp-mtime'
+Try `tar --help' or `tar --usage' for more information.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: opkg-utils-0.4.1/opkg-build
+===================================================================
+--- opkg-utils-0.4.1.orig/opkg-build
++++ opkg-utils-0.4.1/opkg-build
+@@ -1,4 +1,4 @@
+-#!/bin/sh
++#!/bin/bash
+ 
+ : <<=cut
+ =head1 NAME
+@@ -12,6 +12,7 @@ opkg-build - construct an .opk from a di
+ #   Updated to work on Familiar Pre0.7rc1, with busybox tar.
+ #   Note it Requires: binutils-ar (since the busybox ar can't create)
+ set -e
++set -o pipefail
+ 
+ version=1.0
+ 
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
index cf1e4670c65..eb6c7a3a6ad 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
@@ -10,6 +10,7 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
            file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
            file://0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch \
+           file://pipefail.patch \
 "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
@@ -19,6 +20,8 @@ SRC_URI[sha256sum] = "9ea9efdd9fe13661ad251e3a2860c1c93045adcfaa6659c3e86d9748ec
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+RDEPENDS_${PN} += "bash"
+
 # For native builds we use the host Python
 PYTHONRDEPS = "python3 python3-shell python3-io python3-math python3-crypt python3-logging python3-fcntl python3-pickle python3-compression python3-stringold"
 PYTHONRDEPS_class-native = ""
-- 
2.20.1


