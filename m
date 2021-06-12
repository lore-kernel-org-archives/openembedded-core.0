Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.9855.1623526999039457430
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jun 2021 12:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=klImgrMX;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id y11so5296351pgp.11
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Jun 2021 12:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h+0vvD1KyfPRhae2cKgol4vf2ZRrnoGBIJEV3FiiN9g=;
        b=klImgrMXimtu9I5wJO10zgzZhnhI1DZ5j0HmB6iLcWRFERhP01TmKeNfrnn5+X2Kln
         LGhlP7QNYorG/eVmxH1omgi3bqlwRUQdtsjaJTqcksTOSzv/3GYsTXo2xb5lZ4yNThdq
         5xogFubje3VHL9pROBxyrCRn1GRcTojKJxa1ClEscxNTAr7Mi5vWpADo7ZkYFVE0FtF0
         zl3AEmvuvxIG5lUGv3XesHz5gGFXV+B7mcBi1lNjuTbpM6j/EfsAO1xyQKNfLg2e8E0e
         +qJSei7TYc7VDdTKrKOPshRv6zb/+i7YtHnPNwOagGGJhWuRT69vg4eaBhMRC7JuYYrm
         VQbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h+0vvD1KyfPRhae2cKgol4vf2ZRrnoGBIJEV3FiiN9g=;
        b=eUPGri+1tQwVXm1Z60gXZVeFnasbfxj2cx2ivqUcym/Z0Ixe6eoYcdK9zkwgQ7gdHi
         +L11Gb2rakuZIPaWq4lNwlBGbcyzKO/w9nw4GqwqltJhqC9RXpaof+r2N7lmp6SOEMYV
         LmAge4rH0XfkWJYHd91eE9b9FLza4g/IDuD/8+NildjlbqJePYE9ctYOhcerSVW8B3Q+
         XRE2N/iSzLGT7tkfOR+Z/motpNAk6F57TMyxBnhxHTk24Q6jGDSyLWl/AzJWu32sBQWj
         fM7X62+OSD9J2BQpzjkNlV0970g4VZNdqEW8sW15jPBNyV8ChKLI8GSNQ2UIjS7Ku8FM
         59zg==
X-Gm-Message-State: AOAM532eHInw1vTuR2DSujsd3f9/zZOfq5ndZzx+8XVrGMSrOPs6JP5z
	GyA85QyCss63OynR/BFnZKrEEMeh7YsUtQ==
X-Google-Smtp-Source: ABdhPJxVZp3LD48tVwPar11gJXuA5cb9+H+qnWLuILRcrv/XhQrJzLrzMscGVEe6D8QPD16HK1hPLQ==
X-Received: by 2002:a62:7514:0:b029:2e9:c7c2:1e4 with SMTP id q20-20020a6275140000b02902e9c7c201e4mr14063164pfc.45.1623526998147;
        Sat, 12 Jun 2021 12:43:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id i22sm8369667pfq.6.2021.06.12.12.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 12:43:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andrea Adami <andrea.adami@gmail.com>
Subject: [PATCH 1/2] gcompat: Add recipe
Date: Sat, 12 Jun 2021 12:43:14 -0700
Message-Id: <20210612194315.676681-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a compat library which helps running pre-compiled binaries which were
compiled for glibc but needs to run on musl systems, this is quite
common case where pre-existing binaries are supplied and can not be
recompiled immediately

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-core/musl/gcompat_git.bb    | 42 ++++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/musl/gcompat_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 71943ffe26..e59f01d66a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -229,6 +229,7 @@ RECIPE_MAINTAINER_pn-gobject-introspection = "Alexander Kanavin <alex.kanavin@gm
 RECIPE_MAINTAINER_pn-gperf = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-gpgme = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-gptfdisk = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-gcompat = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-grep = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-groff = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-grub = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
new file mode 100644
index 0000000000..6792c0be70
--- /dev/null
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -0,0 +1,42 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "A library which provides glibc-compatible APIs for use on musl libc systems"
+HOMEPAGE = "https://git.adelielinux.org/adelie/gcompat"
+
+LICENSE = "NCSA"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eb33ef4af05a9c7602843afb7adfe792"
+
+SRC_URI = "git://git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=current"
+
+PV = "1.0.0+1.1+git${SRCPV}"
+SRCREV = "af5a49e489fdc04b9cf02547650d7aeaccd43793"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig linuxloader
+
+DEPENDS += "musl-obstack"
+
+GLIBC_LDSO = "${@get_glibc_loader(d)}"
+MUSL_LDSO = "${@get_musl_loader(d)}"
+
+EXTRA_OEMAKE = "LINKER_PATH=${MUSL_LDSO} LOADER_NAME=`basename ${@get_glibc_loader(d)}`"
+
+do_configure () {
+	:
+}
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	oe_runmake install 'DESTDIR=${D}'
+}
+#
+# We will skip parsing for non-musl systems
+#
+COMPATIBLE_HOST = ".*-musl.*"
+
+UPSTREAM_CHECK_COMMITS = "1"
-- 
2.32.0

