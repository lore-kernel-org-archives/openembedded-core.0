Return-Path: <marc.ferland@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id BE34B77D51
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 15:48:42 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id y63so5295957qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 08:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7fO3BD8LMrzpFAyuYOtWgCgRRzdlLaIv2+re3gHwXKM=;
	b=Ep3rK0xnLZY6m8gpqK8QSbhJXS5sABkugsk28KqhsLFSOJ8POqWHnZ88fRAvpL7bQ6
	YXIiYbD97Ue5MApvNBowT8YMVz0a6vVxCpF4pyEZTPmg+iFqxoBRvJ8EXQeq4WuWplvH
	h2F1gIUjlDxiStJlPf8eQSpUGALHd//i6qpEMzlrVrrYdRFxCNS6rytfBkpmuir/Hay1
	VAYzz3/ZFAZf6Frmr50IQpRsem9cn8bFR5kmJugL7QmGnY1wrjzdI7S12nyaaTqrIB0T
	W9dFzrGqEvgv8VLPC/IKq/Y+fj8tyFSCqKWZnbsaEUqmkjq7eYR3wD4JTylUCP2U/Bjh
	DF2g==
X-Gm-Message-State: AN3rC/4rxbcjEzeGofZ8y4Fc3uYAQbzSFxYzPjfOiP8nNUAKQ1Y8D0sN
	G4gbN5Yd5lDBZWnY
X-Received: by 10.55.77.209 with SMTP id a200mr5822492qkb.11.1493308123208;
	Thu, 27 Apr 2017 08:48:43 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	c64sm1880613qka.63.2017.04.27.08.48.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Apr 2017 08:48:42 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 11:39:48 -0400
Message-Id: <1493307588-14557-1-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] speex: upgrade 1.2rc2 -> 1.2.0
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
X-List-Received-Date: Thu, 27 Apr 2017 15:48:43 -0000

Upgrade speex to 1.2.0. Very small diff between 1.2rc2 and 1.2.0, mostly
compiler warning fixes, tabs vs spaces, trailing whitespaces and one
liners.

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-multimedia/speex/speex_1.2.0.bb  | 19 +++++++++++++++++++
 meta/recipes-multimedia/speex/speex_1.2rc2.bb | 19 -------------------
 2 files changed, 19 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-multimedia/speex/speex_1.2.0.bb
 delete mode 100644 meta/recipes-multimedia/speex/speex_1.2rc2.bb

diff --git a/meta/recipes-multimedia/speex/speex_1.2.0.bb b/meta/recipes-multimedia/speex/speex_1.2.0.bb
new file mode 100644
index 0000000..fc020a2
--- /dev/null
+++ b/meta/recipes-multimedia/speex/speex_1.2.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Speech Audio Codec"
+DESCRIPTION = "Speex is an Open Source/Free Software patent-free audio compression format designed for speech."
+HOMEPAGE = "http://www.speex.org"
+SECTION = "libs"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8 \
+                    file://include/speex/speex.h;beginline=1;endline=34;md5=ef8c8ea4f7198d71cf3509c6ed05ea50"
+DEPENDS = "libogg speexdsp"
+
+SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "8ab7bb2589110dfaf0ed7fa7757dc49c"
+SRC_URI[sha256sum] = "eaae8af0ac742dc7d542c9439ac72f1f385ce838392dc849cae4536af9210094"
+
+inherit autotools pkgconfig lib_package
+
+EXTRA_OECONF = "\
+        ${@bb.utils.contains('TARGET_FPU', 'soft', '--enable-fixed-point --disable-float-api --disable-vbr', '', d)} \
+"
diff --git a/meta/recipes-multimedia/speex/speex_1.2rc2.bb b/meta/recipes-multimedia/speex/speex_1.2rc2.bb
deleted file mode 100644
index f7d23db..0000000
--- a/meta/recipes-multimedia/speex/speex_1.2rc2.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Speech Audio Codec"
-DESCRIPTION = "Speex is an Open Source/Free Software patent-free audio compression format designed for speech."
-HOMEPAGE = "http://www.speex.org"
-SECTION = "libs"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8 \
-                    file://include/speex/speex.h;beginline=1;endline=34;md5=ef8c8ea4f7198d71cf3509c6ed05ea50"
-DEPENDS = "libogg speexdsp"
-
-SRC_URI = "http://downloads.us.xiph.org/releases/speex/speex-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "6ae7db3bab01e1d4b86bacfa8ca33e81"
-SRC_URI[sha256sum] = "caa27c7247ff15c8521c2ae0ea21987c9e9710a8f2d3448e8b79da9806bce891"
-
-inherit autotools pkgconfig lib_package
-
-EXTRA_OECONF = "\
-        ${@bb.utils.contains('TARGET_FPU', 'soft', '--enable-fixed-point --disable-float-api --disable-vbr', '', d)} \
-"
-- 
2.7.4


