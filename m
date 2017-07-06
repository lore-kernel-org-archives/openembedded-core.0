Return-Path: <msm-oss@mcclintock.net>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 56FB277A61
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 18:21:17 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id x187so9216796oig.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 11:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mcclintock.net; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=6QVBqWd7uNMx/hQZawBNYXtp0Rl3TSYWKlJ5lgJbo8Y=;
	b=eajmgus4giHg5fzGRmh5nhsWmWR0i+d5/TCbdeWjdHlTx3tcYIPSHqiG82xOOLWUsA
	zO/6fafzzZCMS/G2FOF7eeIsA74NI28ikmCY8k5LbUsLNUpLZxQiEU06P3l/+0VzTxgJ
	GrcZ3SDcEFbCs2JhMCKNBUYmsYRqm2WTw+ADY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6QVBqWd7uNMx/hQZawBNYXtp0Rl3TSYWKlJ5lgJbo8Y=;
	b=taKemAk7P/UvlilRHDaChfBXwSG0BmTnb2dPloiotUuNLu+71tve0gXRziMU4b2/xf
	qegmkQEERPGZFz0UKAyxwJopl5JIXMK/gaUGb5EZrjUjv6uGYBnQcC/vhmWPSvTksblU
	wQWp1FwQliF+XD/Zo2v3+iG45UmVFxp/jCuLrWTtnkPKSgeUYiW3BaaLPj7QFYawQV14
	0pK30Ipe2X74ZURqy6rvlWAV19QIVbgKFJMAvLlb+0mvGJ6lrruZe+NKyve2MXVpt95J
	GWKbS1HTOqlZrGlEbWvfQwvVXzyJEn8WFLNIuKsv7QBSWeDVwr1JavirzoABbKiKH1Gy
	vfLA==
X-Gm-Message-State: AKS2vOw2z7KOuYtyvwIarrj96YwQxx3gbegZOobgESjvHJgiqsF1AaZv
	UwCi0GfPh0IWOUWbn3g=
X-Received: by 10.202.80.85 with SMTP id e82mr32981546oib.0.1499365278781;
	Thu, 06 Jul 2017 11:21:18 -0700 (PDT)
Received: from pandora.lan (cpe-72-182-106-201.austin.res.rr.com.
	[72.182.106.201]) by smtp.gmail.com with ESMTPSA id
	r73sm1034590oie.11.2017.07.06.11.21.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Jul 2017 11:21:17 -0700 (PDT)
From: Matthew McClintock <msm-oss@mcclintock.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 13:21:15 -0500
Message-Id: <20170706182115.18798-1-msm-oss@mcclintock.net>
X-Mailer: git-send-email 2.13.1
Subject: [PATCH] u-boot: add workaround patch for missing python dev
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
X-List-Received-Date: Thu, 06 Jul 2017 18:21:22 -0000

Per the comments in the included patch:

tools: disable _libfdt.so (swig present, python-dev missing breakage)

 This is probing for tools and enabling if swig is found, however Python
 libraries might be absent per the comment. This is just a host tool so
 let's just disable it entirely for the now.

Signed-off-by: Matthew McClintock <msm-oss@mcclintock.net>
---
 ...le-_libfdt.so-swig-present-python-dev-mis.patch | 33 ++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2017.05.bb          |  2 ++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-tools-disable-_libfdt.so-swig-present-python-dev-mis.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-tools-disable-_libfdt.so-swig-present-python-dev-mis.patch b/meta/recipes-bsp/u-boot/files/0001-tools-disable-_libfdt.so-swig-present-python-dev-mis.patch
new file mode 100644
index 0000000000..ac4b7b3032
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-tools-disable-_libfdt.so-swig-present-python-dev-mis.patch
@@ -0,0 +1,33 @@
+From 562ef1104558387d73365b50b86488f2d9aff653 Mon Sep 17 00:00:00 2001
+From: Matthew McClintock <msm-oss@mcclintock.net>
+Date: Thu, 6 Jul 2017 13:05:32 -0500
+Subject: [PATCH] tools: disable _libfdt.so (swig present, python-dev missing
+ breakage)
+
+This is probing for tools and enabling if swig is found, however Python
+libraries might be absent per the comment. This is just a host tool so
+let's just disable it entirely for the now.
+
+Signed-off-by: Matthew McClintock <msm-oss@mcclintock.net>
+---
+ tools/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 2fc4a58..ac30086 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -114,8 +114,8 @@ fit_check_sign-objs   := $(dumpimage-mkimage-objs) fit_check_sign.o
+ 
+ # Build a libfdt Python module if swig is available
+ # Use 'sudo apt-get install swig libpython-dev' to enable this
+-hostprogs-y += \
+-	$(if $(shell which swig 2> /dev/null),_libfdt.so)
++#hostprogs-y += \
++#	$(if $(shell which swig 2> /dev/null),_libfdt.so)
+ _libfdt.so-sharedobjs += $(LIBFDT_OBJS)
+ libfdt:
+ 
+-- 
+2.13.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot_2017.05.bb
index 37c21dcaa3..16d9563ce6 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2017.05.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2017.05.bb
@@ -2,3 +2,5 @@ require u-boot-common_${PV}.inc
 require u-boot.inc
 
 DEPENDS += "bc-native dtc-native"
+
+SRC_URI += "file://0001-tools-disable-_libfdt.so-swig-present-python-dev-mis.patch"
-- 
2.13.1


