Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB9AC36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 15:04:50 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.2144.1742569482927725744
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 08:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=J6q8HJhY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2264aefc45dso15003375ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742569479; x=1743174279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+r3p9aS0YLFMohybmT3Ti+XEsslAFRanld+XsNdpAEQ=;
        b=J6q8HJhYpYAbkmpW4/GYBEe+IZzEjCE53GfZq162vyviYdhUoEny7VHYvOGt9e1HZr
         0t1iZGgh3VkPQJC6R96Yk7pD4ZhRLx3hQtRX+4frvswoUrUTeIiaJOzmq6vyM2tCsOpx
         lAZ3OHA69pUmCNe1VK1widMJF/hdPtqEheke6p/gUl0esuph1P/o3ziulZV9Gylk3Y/T
         2s0+bZvmUHd8OQJrNnnxMYCfC/gJcxkI4Yi2r1WfMh+0zr+mosmXqcOmu8HZGlYE91kQ
         qQkPNsbNRFxk+m1vTWEnW1/fUTAI60Q27OsDUpuY6Snk1ylJHeFc4wHkU6WPsV8/BE9V
         L6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742569479; x=1743174279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+r3p9aS0YLFMohybmT3Ti+XEsslAFRanld+XsNdpAEQ=;
        b=MR7zwmABMeyDPPqmX376X5267Wfx4mono2i5hs2ns4WT/wJKtUL3HhgsjSud92pt+y
         boPgOtSDeedgGTjUAA5WfUr2DcvwAOWppQdoHRAp3y9ruuFzQvlXftgkPYR3lbcZznaL
         4wTip0b8zlKMjx52SsB1apr2IcgChgdO5eWbZYsBtgT99418RJcD/vNyu3FM6tlxHX2k
         zRBZnSzmPhQ7Kmb9a5cjNquJZu3Xg0ky2GrNM72NyWWJ/mnPHzXVMNrEIySJs2AbeNLI
         q1TU/sjbM6iv1Vynyjl8HHvaZgPM81FKC7q9Gy11uZlUs8qxp2ssVrT0mapn1qYKYxuG
         PcMg==
X-Gm-Message-State: AOJu0Yx1VGhe4xoqCeuIi71AXTpo9UbkY1iueNNHKCpsw9vsm/5bb1RT
	Ror+zTzCuBpnbTr33ejzgMsTzlBiA5pfZ8+NwtGLmiAgd93C+LaT3a7tQtRGCPQAKwfgxeQoXy0
	0
X-Gm-Gg: ASbGnctLDTMrhkXLpoiMs89WMjScmQV/TcyY0HgHvVEOKDR6VR6TlNiaa5ErxNwOT4B
	RKpk736nalf2Az/57/gAnOMK96okm8tts4u0bK6gyvUHm+YqUsQNHEG9dfc5yefDLPkJofqBSOU
	n6gXklDLo8xauQU9+HtH4gmqVyVp7BObLxNASLx4Mv3V6+H1ov90S/H6AwDTcQtKi3wyOTA/lPt
	RgyA6efQ5HtrQ9ibQt4QVfCTPKWJxYcUawTWpIwh37hdoJ/6soPVnW3HI7omGtZUb2K+7vUvZ27
	8leqwC2ph9mOn+KHflWSe+ClL92wcnPCIIup
X-Google-Smtp-Source: AGHT+IGjqFZCdEpChTMO+FqZi3UVuwOCPa9Cy3Lzp5LpAY9uxBrCdAb3PCLswQhA4uOJPNy6ovGpbQ==
X-Received: by 2002:a05:6a00:2392:b0:736:4b85:ee05 with SMTP id d2e1a72fcca58-739059b495emr5701267b3a.11.1742569478620;
        Fri, 21 Mar 2025 08:04:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2534:4cdb:e422:e636])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd5788sm2076620b3a.50.2025.03.21.08.04.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:04:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/5] nativesdk-libtool: sanitize the script, remove buildpaths
Date: Fri, 21 Mar 2025 08:04:24 -0700
Message-ID: <a720df7ad77af1f8b1c00a211c88537e5f23edbc.1742569342.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742569342.git.steve@sakoman.com>
References: <cover.1742569342.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 15:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213478

From: Denys Dmytriyenko <denys@konsulko.com>

Use the same sed command to sanitize libtool script for target recipe
and nativesdk one. Otherwise fails with buildpaths QA error:

ERROR: nativesdk-libtool-2.5.0-r0 do_package_qa: QA Issue: File /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/libtool in package nativesdk-libtool contains reference to TMPDIR [buildpaths]

(From OE-Core rev: f08df9adf290fb6cbebff24df6bbbbe8e5ce95e0)

Upstream-Status: Backport[https://git.yoctoproject.org/poky/commit/?id=89e184da6c9d95a99fd34334df5ac6c5ae87f13a]

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89e184da6c9d95a99fd34334df5ac6c5ae87f13a)
Signed-off-by: Nikhil R <nikhilr5@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/libtool/libtool_2.4.7.bb    | 15 +--------------
 .../libtool/nativesdk-libtool_2.4.7.bb            |  1 +
 .../libtool/remove-buildpaths.inc                 | 13 +++++++++++++
 3 files changed, 15 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-devtools/libtool/remove-buildpaths.inc

diff --git a/meta/recipes-devtools/libtool/libtool_2.4.7.bb b/meta/recipes-devtools/libtool/libtool_2.4.7.bb
index 44a4950574..c1e315aece 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.7.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.7.bb
@@ -1,4 +1,5 @@
 require libtool-${PV}.inc
+require remove-buildpaths.inc
 
 SRC_URI += "file://multilib.patch"
 
@@ -15,20 +16,6 @@ SYSROOT_DIRS_IGNORE += " \
 
 ACLOCALEXTRAPATH:class-target = ""
 
-do_install:append () {
-        sed -e 's@--sysroot=${STAGING_DIR_HOST}@@g' \
-            -e "s@${DEBUG_PREFIX_MAP}@@g" \
-            -e 's@${STAGING_DIR_HOST}@@g' \
-            -e 's@${STAGING_DIR_NATIVE}@@g' \
-            -e 's@^\(sys_lib_search_path_spec="\).*@\1${libdir} ${base_libdir}"@' \
-            -e 's@^\(compiler_lib_search_dirs="\).*@\1${libdir} ${base_libdir}"@' \
-            -e 's@^\(compiler_lib_search_path="\).*@\1${libdir} ${base_libdir}"@' \
-            -e 's@^\(predep_objects="\).*@\1"@' \
-            -e 's@^\(postdep_objects="\).*@\1"@' \
-            -e "s@${HOSTTOOLS_DIR}/@@g" \
-            -i ${D}${bindir}/libtool
-}
-
 inherit multilib_script
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/libtool"
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.7.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.7.bb
index 86c55ded7b..ac460decf6 100644
--- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.7.bb
+++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.7.bb
@@ -1,4 +1,5 @@
 require libtool-${PV}.inc
+require remove-buildpaths.inc
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/libtool:"
 
diff --git a/meta/recipes-devtools/libtool/remove-buildpaths.inc b/meta/recipes-devtools/libtool/remove-buildpaths.inc
new file mode 100644
index 0000000000..1ca95aeace
--- /dev/null
+++ b/meta/recipes-devtools/libtool/remove-buildpaths.inc
@@ -0,0 +1,13 @@
+do_install:append () {
+        sed -e 's@--sysroot=${STAGING_DIR_HOST}@@g' \
+            -e "s@${DEBUG_PREFIX_MAP}@@g" \
+            -e 's@${STAGING_DIR_HOST}@@g' \
+            -e 's@${STAGING_DIR_NATIVE}@@g' \
+            -e 's@^\(sys_lib_search_path_spec="\).*@\1${libdir} ${base_libdir}"@' \
+            -e 's@^\(compiler_lib_search_dirs="\).*@\1${libdir} ${base_libdir}"@' \
+            -e 's@^\(compiler_lib_search_path="\).*@\1${libdir} ${base_libdir}"@' \
+            -e 's@^\(predep_objects="\).*@\1"@' \
+            -e 's@^\(postdep_objects="\).*@\1"@' \
+            -e "s@${HOSTTOOLS_DIR}/@@g" \
+            -i ${D}${bindir}/libtool
+}
-- 
2.43.0


