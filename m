Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5B461792FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 00:44:30 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id b129-v6so9524386pga.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Sep 2018 17:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aTELmXiLei8nxw+yZBMmjrkITLEd9g/NdgAD0wulW6E=;
	b=X4eiAVjiADnkzZqnfd44NYIbaWibxoyRUSxkrXOLqOyXO6HWDeiH6y61EGsZR2mMsC
	fZY0bsX0c0OyfyV3iVWhr6jD0l9SbZZwwpK9uiTgH5GwOxdHrtuQZTt9zu0IxB/+65Yo
	BnKH1czHap2iSxO3YVMbMrFx90Yx6KRpJNI7pUdjqP25pXBhxBXx8z1EdvvkN7DG4b9H
	PsRSQUT6DHYLikVUsygBRyL4sItgU5vL54aRquZsKRCpEuS93MW09aPwU1sbzVxAy9+s
	IcO8xGdFSgNII1Yv/9Uv6r+b+FyuCgemKtzM+NeQty0cd3Vp1PhrQfOkbubACNt3RGGx
	AbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aTELmXiLei8nxw+yZBMmjrkITLEd9g/NdgAD0wulW6E=;
	b=XTG1oxQf8t0a3u3FtqmiRPGPFmTLQ/2VEXuFLJt8MnfYovjqogyV76Yv5tbLj7rxUW
	0Tm3H9wufWlZimJKKKQqLfMTVVwtMUZpKvQyYVgZGXKuLGhgM3Y63gpoU3aYxrNitQyR
	OOOnTVuZj8vbDlpxkwf07w841JnA/kM8oQM34UPSvi+uzGCyoE5PU5OAkI6Hgf9NsCcl
	1jIwIv+49orflIlXUBEKIGmMiOONroaiBuAPWs3AFNiFP8t6ZDFWVqNvhH1fvBGV+3Et
	t9Kgx4s7bKLj6p3hwz5OtHUPn13lo/HKSv/j+oj66c6DEOOvOkXSuQg9ZTHTgdwbi2Yn
	zuwQ==
X-Gm-Message-State: APzg51CeuY8/asnDNrVCHx/jzu/TzS7H556D85KGpmCEJvu3CL4ooRez
	Vi5hKzd7Lh2urL9PPLYUW7v3iGH7
X-Google-Smtp-Source: ANB0VdYRd/Z9MTuzsYe/hzCc3VpqMw+QJ45vJCnko15uQyjqJWIYh81ZenjScHWCYtqdU3fxLb4nAg==
X-Received: by 2002:a63:1316:: with SMTP id
	i22-v6mr19467848pgl.86.1536540270626; 
	Sun, 09 Sep 2018 17:44:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	l70-v6sm21261938pge.36.2018.09.09.17.44.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Sep 2018 17:44:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Sep 2018 17:44:22 -0700
Message-Id: <20180910004422.15400-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH] gst-validate: Fix build on musl
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
X-List-Received-Date: Mon, 10 Sep 2018 00:44:30 -0000

Connect has different signature on musl.

Fixes
socket_interposer.c:103:1: error: conflicting types for 'connect'
| connect (int socket, const struct sockaddr_in *addrin, socklen_t
address_len)
| ^
|
recipe-sysroot/usr/include/sys/socket.h:327:5:
note: previous declaration is here
| int connect (int, const struct sockaddr *, socklen_t);
|     ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ct-has-a-different-signature-on-musl.patch | 38 +++++++++++++++++++
 .../gstreamer/gst-validate_1.14.2.bb          |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/files/0001-connect-has-a-different-signature-on-musl.patch

diff --git a/meta/recipes-multimedia/gstreamer/files/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/files/0001-connect-has-a-different-signature-on-musl.patch
new file mode 100644
index 0000000000..a0d215c5a0
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/files/0001-connect-has-a-different-signature-on-musl.patch
@@ -0,0 +1,38 @@
+From 0bd8004d8dddc486d3961a5316d24e8f2645e4c8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 9 Sep 2018 17:38:10 -0700
+Subject: [PATCH] connect has a different signature on musl
+
+On linux when not using glibc and using musl for C library, connect
+API has a different signature, this patch fixes this so it can compile
+on musl, the functionality should remain same as it is immediately
+typcasted to struct sockaddr_in* type inside the function before use
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plugins/fault_injection/socket_interposer.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/plugins/fault_injection/socket_interposer.c b/plugins/fault_injection/socket_interposer.c
+index 53c1ebb..ad7adf8 100644
+--- a/plugins/fault_injection/socket_interposer.c
++++ b/plugins/fault_injection/socket_interposer.c
+@@ -100,10 +100,15 @@ socket_interposer_set_callback (struct sockaddr_in *addrin,
+ }
+ 
+ int
+-connect (int socket, const struct sockaddr_in *addrin, socklen_t address_len)
++#if defined(__linux__) && !defined(__GLIBC__)
++connect (int socket, const struct sockaddr *addr, socklen_t address_len)
++#else
++connect (int socket, const struct sockaddr_in *addr, socklen_t address_len)
++#endif
+ {
+   size_t i;
+   int override_errno = 0;
++  struct sockaddr_in* addrin = (struct sockaddr_in*)addr;
+   typedef ssize_t (*real_connect_fn) (int, const struct sockaddr_in *,
+       socklen_t);
+   static real_connect_fn real_connect = 0;
diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.14.2.bb
index cad64b2b80..f4438dc5a2 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.14.2.bb
@@ -7,6 +7,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
+           file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 SRC_URI[md5sum] = "f334102b0e706008505d00f7f5b5e023"
 SRC_URI[sha256sum] = "ea9e423e5470ef85ef8a0aea1714e7abfc49deb2ed282057367484cdeba6f19f"
-- 
2.18.0


