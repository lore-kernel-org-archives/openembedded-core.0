Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E695BECAAA1
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 02:20:11 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.3114.1662517210344736121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 19:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jR/3TiUU;
 spf=pass (domain: gmail.com, ip: 209.85.214.174,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id s14so3508451plr.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 19:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=VoAXCAHi/2EP4HWGHqPUq3Jm6whN8uEnPdMaZBzt7nw=;
        b=jR/3TiUU6XH5gnWtL1sQkR/wmWomA90bjuyMh7ID73TIPItLmWJpDzJuFboypZwvxB
         C+4U8DdnFCK7FKm8I0Wuhv2n7Ti4f5r5wqm8vYYvg+rnpX0ZPQDBIFI6gE+BWY9m0yZG
         HrW5bVU+8wfQuNzfD4X1uQM0SxGqxmIy1DtwXPYgijnpers1JuXQHOvX+Kg8OkfGMZhp
         Y2Q/WCrgKF5vW5MbhiaM3Ycku++FPnPQCuTBNkN/Dzhf7W2gudnc9EmyjPBG8IPkNpfp
         ULfG24bpkYxPRE4apeaCbaZeycQyXtj6oK3U9zfhkGDtCfG+uuxj9Y+RSPYH5X0opyT8
         vXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=VoAXCAHi/2EP4HWGHqPUq3Jm6whN8uEnPdMaZBzt7nw=;
        b=wUcIwyC+Hnb1unVqe1vg8f8rD1YFX3EJ3skQZba4VaA9eCgbEaoCWN+AHRT4VGVky2
         IiKZYw95aN58LuyNvWxcJj8xlqxTg2ZqqnhWDE/v5C0thLFS+8Nd9i97P/SQpUJ57fDF
         zLz7FM6jD58pCkQMwxGAt99IUYEzxMfW0k0RnLBfkwlCm+GOb6+DDSWviNwqBE85QqWP
         waf3AcexNBYRj/7iNPV/zSbfr4zkrSsLxpsQCi2Iq+cXwkuo95YEwK/wgMYKYA1I9yzH
         bdCpgN4GKaNGqL8yl9UaO/797GnvnFHnoTQUftHkOOWA3lLE/HySZOE1uOAG5Acywkfk
         E2RA==
X-Gm-Message-State: ACgBeo0x2C5p0nuRTVYoQeJgL3nIA8ceYO1FOanKqncnQUOOnJr14Ajm
	aFPIwPsQM1vRu7fyNegv8UX6/0vgsd5ugg==
X-Google-Smtp-Source: 
 AA6agR71H+5QeMEksgdoZytmCWLQNhlroZUwy/g9YiKpQaBGku5aFaWbEdY4AoyBSMCvRNCixtASIA==
X-Received: by 2002:a17:902:8643:b0:172:e067:d7ac with SMTP id
 y3-20020a170902864300b00172e067d7acmr1317890plt.164.1662517209346;
        Tue, 06 Sep 2022 19:20:09 -0700 (PDT)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 s8-20020a170902ea0800b001755f43bc22sm10768832plg.175.2022.09.06.19.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 19:20:08 -0700 (PDT)
From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda.cve@gmail.com,
	shivams@gmail.com,
	Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Subject: [PATCH V2] rust-cross-canadian: Fix for the issue caused by using sdk
 shell
Date: Wed,  7 Sep 2022 07:48:17 +0530
Message-Id: <20220907021817.3309235-1-sundeep.kokkonda@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 02:20:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170368

[YOCTO #14892]
This is a fix for the fix in YOCTO #14878. When the shebang is more than
128 characters the default shell /bin/sh is used instead of SDK shell as
a fallback, which causes problems with LD_LIBRARY_PATH. With this patch
shell usage is avoided as we use a C wrapper and unset LD_LIBRARY_PATH
that way.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
---
 .../rust/files/target-rust-ccld.c             | 21 +++++++++++++++++++
 .../rust/rust-cross-canadian.inc              | 20 +++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/files/target-rust-ccld.c

diff --git a/meta/recipes-devtools/rust/files/target-rust-ccld.c b/meta/recipes-devtools/rust/files/target-rust-ccld.c
new file mode 100644
index 0000000000..fa98c1dbd7
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/target-rust-ccld.c
@@ -0,0 +1,21 @@
+/*
+*
+* Copyright (C) 2022      Wind River Systems
+*
+* SPDX-License-Identifier: MIT
+*
+*/
+
+#include <string.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+int main (int argc, char *argv[])
+{
+    unsetenv("LD_LIBRARY_PATH");
+    execvp("target-rust-ccld-wrapper", argv);
+
+    return 0;
+}
+
+
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 7bf75a4712..7536579313 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -7,13 +7,18 @@ LICENSE = "MIT"
 
 MODIFYTOS = "0"
 
+DEPENDS += "virtual/${SDK_PREFIX}gcc-crosssdk virtual/nativesdk-libc virtual/nativesdk-${SDK_PREFIX}compilerlibs"
+
+SRC_URI += "file://target-rust-ccld.c"
+LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=b6bc5662440675fd7d64688087a2f679;endline=7"
+S = "${WORKDIR}"
+
 # Need to use our SDK's sh here, see #14878
 create_sdk_wrapper () {
         file="$1"
         shift
-
         cat <<- EOF > "${file}"
-		#!${base_prefix}/bin/sh
+		#!/bin/sh
 		\$$1 \$@
 		EOF
 
@@ -32,8 +37,17 @@ do_install () {
     install -m 0644 "${RUST_TARGETS_DIR}/${RUST_TARGET_SYS}.json" "${RUSTLIB_DIR}"
 
     # Uses SDK's CC as linker so linked binaries works out of box.
+    # We have a problem as rust sets LD_LIBRARY_PATH and this will break running host
+    # binaries (even /bin/sh) in the SDK as they detect a newer glibc from the SDK
+    # in those paths and we hit symbol errors. We saw particular problems with symbol
+    # mismatch on ubuntu1804 during development. To avoid this we have an SDK built
+    # binary which unsets LD_LIBRARY_PATH, which can then call the wrapper script
+    # where the context is easier to do the env maniupations needed
     install -d ${SYS_BINDIR}
-    create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld" "CC"
+    outfile="${SYS_BINDIR}/target-rust-ccld"
+    ${CC} ${WORKDIR}/target-rust-ccld.c -o $outfile
+    chmod +x "$outfile"
+    create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
 
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
-- 
2.25.1


