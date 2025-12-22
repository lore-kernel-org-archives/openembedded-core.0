Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7510E6916E
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:07:54 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87650.1766434070298994099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I2wzYmLr;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so734690766b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434069; x=1767038869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Qbj3HhXK5Nns/SwYIf0qSRfwHsUpVc7gK3+IBLMeMk=;
        b=I2wzYmLrS8iMOQ7NynSqBYqDaoUafx6XkHT6q3gO7PDCG3pLJEOezcXTtfe0NrX2Mb
         HGw7+Jq2R1KnfPyecUlKQc0p/7jIwFMRAev5koRsF2/U8UAz3M7IdS4J5JTe2BDOwluy
         hhxkIv0alnxRf61RY+GiPzYabR+DepTvnsv+YwPzELwHzqmf27dU/Kf/Fc6Comw4BEhs
         UZ2DS1DxJy9dyf5RYCkRZ3aHsRicJ0PJ9fHlHX5iFaefZOgUmpqleCySDPBh/Lg1CDEZ
         cGmu0AjXFdRuW+ZjjS3QRwkzRcF3Wbkx4d9oOH/nWmQw2A9fzMmg66nUh0+dAKy6OBuk
         1hIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434069; x=1767038869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Qbj3HhXK5Nns/SwYIf0qSRfwHsUpVc7gK3+IBLMeMk=;
        b=PXeEDsNK5FgyupHPRdl+oq6saMCa/OD9ZBOzxRuQ98hSKFU4yoB2sMmQpuXFWm0j3f
         5r7OGuW9jXOJxl3fPzF4zw/uqf94XWnvXsUDI3UeDDiG3BqpzXkadBh8l3URqeaoxLbX
         XOfwES7kcC7FjGHc5Pd1p0rRdVfKnkTe6jxYARgQ+3iw7lfnDOI4IZglVORgz6Gl46Zi
         TEnsvFUiO7O8YwWD4Kt3t1cYb4QjLLiSmfrEh8sQI2/eXHEYkmZmQ11Bhs1+BbytbQjN
         Tg2uqVmOiP+c3RloUkqcNbJEhLcScdPvp9xRnSXwV0qYN3fWPH7+/qvnc43ubEU8/R4m
         n7/g==
X-Gm-Message-State: AOJu0YyPvn2mm3r7qp0FKjKotReMzN4n0GWzo7c1ZbAORKakdiFhkZba
	MOZiqZ6Tc1lwctiSXUrWeUPdggw/SCo54hhqMm8csxAa1vVwFaqMQ9xxYZVrkA==
X-Gm-Gg: AY/fxX7ytjU7Gs3HRNs5CTNjA0405+3/B6YB7h3dwdHNBKNTgemnk/BZKgMo9vqwhAE
	xXmlYXfMSLmWHvaHU9AiKTzMPtLYs/EvYni1++kq7W3Hnhfz+UDX3ImqtaqOYjpdc8s9+sXgdaQ
	lgEDNp8LmiALbekJLEu2GB7r/9EMebm/bJ64POEuHsIeJxa1VhlTHSmBgHEF4uhEpiC+VptGPA1
	lCoI/sKyKVpQ868XvlogTUHbiX8WIPDq0T+X4lu2aXa1RI3Y/q32WPC7ex1ie8VVE4wSomlC5Vu
	q1lGH2umeUPj+9ZDgSxCth7MzOcOkFex8pv8UOrWxJUWCpi5DCDEE7rlIeWPsjbTk+pZboThSKy
	rUFjpNAIj2J9aZgnQvuYRe7GgJO8pRqpFf1eiihVOVpoRt812eNmusFHLh38yBSxP8VdEstYVKn
	gLt1lBOwc2ol6V8fI/h4jkb8GIcXJ7BxgQ/MlXsPvoUQ5QFTU=
X-Google-Smtp-Source: AGHT+IGQ3VFykSRlfrkqve54hKVoOjPN0LY32Y9EkcEGvap20wtKDcuMG2VTmSh3J4egQZQtv7lfJg==
X-Received: by 2002:a17:907:9719:b0:b7a:2ba7:197f with SMTP id a640c23a62f3a-b803719e302mr1324058866b.52.1766434068114;
        Mon, 22 Dec 2025 12:07:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 004/114] alsa: upgrade 1.2.14 -> 1.2.15
Date: Mon, 22 Dec 2025 21:05:46 +0100
Message-ID: <20251222200739.2278706-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228328

From: Alexander Kanavin <alex@linutronix.de>

alsa-lib: backport a patch to address musl build failures.

alsa-utils: backport a separate-build-directory build fix.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...cf08ad67447893b707cddfce31c9cafee643.patch | 50 +++++++++++++++++++
 ...{alsa-lib_1.2.14.bb => alsa-lib_1.2.15.bb} |  6 ++-
 ...a-tools_1.2.14.bb => alsa-tools_1.2.15.bb} |  2 +-
 ...conf_1.2.14.bb => alsa-ucm-conf_1.2.15.bb} |  2 +-
 ...7067fcf5b05e7fa5a84c38238dbffd079c4f.patch | 29 +++++++++++
 ...a-utils_1.2.14.bb => alsa-utils_1.2.15.bb} |  6 ++-
 6 files changed, 89 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/a068cf08ad67447893b707cddfce31c9cafee643.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.14.bb => alsa-lib_1.2.15.bb} (89%)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.2.14.bb => alsa-tools_1.2.15.bb} (97%)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.14.bb => alsa-ucm-conf_1.2.15.bb} (89%)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils/10587067fcf5b05e7fa5a84c38238dbffd079c4f.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.14.bb => alsa-utils_1.2.15.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/a068cf08ad67447893b707cddfce31c9cafee643.patch b/meta/recipes-multimedia/alsa/alsa-lib/a068cf08ad67447893b707cddfce31c9cafee643.patch
new file mode 100644
index 0000000000..2e84a11f26
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/a068cf08ad67447893b707cddfce31c9cafee643.patch
@@ -0,0 +1,50 @@
+From a068cf08ad67447893b707cddfce31c9cafee643 Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Mon, 8 Dec 2025 23:46:17 -0500
+Subject: [PATCH] ucm: use closefrom instead of close_range
+
+closefrom is a library function with a fallback mechanism for when the
+kernel does not support the close_range syscall.
+
+Also check for the function properly instead of assuming it is available
+with _GNU_SOURCE defined.
+
+Closes: https://github.com/alsa-project/alsa-lib/pull/486
+Fixes: https://github.com/alsa-project/alsa-lib/issues/485
+Signed-off-by: Mike Gilbert <floppym@gentoo.org>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/a068cf08ad67447893b707cddfce31c9cafee643]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure.ac       | 1 +
+ src/ucm/ucm_exec.c | 4 ++--
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8f4bd0de1..f4862f64c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -52,6 +52,7 @@ dnl Checks for library functions.
+ AC_PROG_GCC_TRADITIONAL
+ AC_CHECK_FUNCS([uselocale])
+ AC_CHECK_FUNCS([eaccess])
++AC_CHECK_DECLS([closefrom])
+ 
+ dnl Enable largefile support
+ AC_SYS_LARGEFILE
+diff --git a/src/ucm/ucm_exec.c b/src/ucm/ucm_exec.c
+index b5a22023b..713039b49 100644
+--- a/src/ucm/ucm_exec.c
++++ b/src/ucm/ucm_exec.c
+@@ -259,8 +259,8 @@ int uc_mgr_exec(const char *prog)
+ 
+ 		close(f);
+ 
+-#if defined(_GNU_SOURCE)
+-		close_range(3, maxfd, 0);
++#if HAVE_DECL_CLOSEFROM
++		closefrom(3);
+ #else
+ 		for (f = 3; f < maxfd; f++)
+ 			close(f);
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb
index 41a42f9ecc..c357f31c4c 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.bb
@@ -9,8 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "be9c88a0b3604367dd74167a2b754a35e142f670292ae47a2fdef27a2ee97a32"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
+           file://a068cf08ad67447893b707cddfce31c9cafee643.patch \
+          "
+SRC_URI[sha256sum] = "83770841585e766a60c99fd23f8c574c22643ae0cb1f2d20b793c3d84eb95a8d"
 
 inherit autotools pkgconfig
 
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.2.14.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-tools_1.2.14.bb
rename to meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
index 751d9e8a76..1228176fb9 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.2.15.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=59530bdf33659b29e73d4adb9f9f65
 
 SRC_URI = "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2"
 
-SRC_URI[sha256sum] = "faef6fdd39ec79c9a5473dc63aa1b6331bf7664a9d452a0a8198cec7016cbc6f"
+SRC_URI[sha256sum] = "800498d35233672ef67f4bf74cc6e1d37e1fe70c0540e2d2e062f2319e7b5df7"
 
 inherit autotools-brokensep pkgconfig
 # brokensep as as10k1 (and probably more) fail out of tree
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb
index d9ef831937..1eaec98e3b 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.15.bb
@@ -8,7 +8,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "32e9809f592d92b978aa1032e35293c33b8d0f1ec475f937022c3ee9a3069c21"
+SRC_URI[sha256sum] = "5510cb0947a3bb877b5ce218e3ecedd78bfa6643e372346c87d93d4844a45ffa"
 # Something went wrong at upstream tarballing
 
 inherit allarch
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/10587067fcf5b05e7fa5a84c38238dbffd079c4f.patch b/meta/recipes-multimedia/alsa/alsa-utils/10587067fcf5b05e7fa5a84c38238dbffd079c4f.patch
new file mode 100644
index 0000000000..3269e3eeba
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils/10587067fcf5b05e7fa5a84c38238dbffd079c4f.patch
@@ -0,0 +1,29 @@
+From 10587067fcf5b05e7fa5a84c38238dbffd079c4f Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Mon, 8 Dec 2025 11:12:34 +0000
+Subject: [PATCH] alsactl: fix build when in subdirectory
+
+create the conf directory as part of the edit recipe
+
+Closes: https://github.com/alsa-project/alsa-utils/pull/311
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-utils/commit/10587067fcf5b05e7fa5a84c38238dbffd079c4f]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ alsactl/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
+index 48b7c7a6..c8729e04 100644
+--- a/alsactl/Makefile.am
++++ b/alsactl/Makefile.am
+@@ -47,6 +47,7 @@ endif
+ edit = \
+ 	extratest=$$(echo ' $(ALSACTL_UDEV_EXTRATEST)' | sed -e 's/__/ /g' -e 's/^ $$//'); \
+ 	args=$$(echo ' $(ALSACTL_UDEV_ARGS)' | sed -e 's/__/ /g' -e 's/^ $$//'); \
++	mkdir -p conf; \
+ 	$(SED) -r -e 's,@sbindir\@,$(sbindir),g' \
+ 		  -e 's,@mydatadir\@,$(mydatadir),g' \
+ 		  -e 's,@daemonswitch\@,$(ALSACTL_DAEMONSWITCH),g' \
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
index 3cbb9b464b..7ea9ee6f8a 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
@@ -24,8 +24,10 @@ PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev
 PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "0794c74d33fed943e7c50609c13089e409312b6c403d6ae8984fc429c0960741"
+SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
+           file://10587067fcf5b05e7fa5a84c38238dbffd079c4f.patch \
+          "
+SRC_URI[sha256sum] = "d3183d2ed2d69e9143c5beb97036267c3fdabfe8bfbea8bc6863f17b1f0b568e"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.47.3


