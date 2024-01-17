Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089BFC47DA7
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 13:08:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.1533.1705496907662206144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 05:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H5zzUk9T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40e88012233so9129345e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 05:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705496906; x=1706101706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wj8tptRYsdj8+Ua1xCfSC/wkkxQZWJsblUpl0py++PQ=;
        b=H5zzUk9TmVZUCZxcNGxy41uwv9BA73BjYaYQdPVt6LzwJxxXHX+aNTOz6DsM1Umn9c
         JVNdA0PpxPreZKDN+qTRWUOzHSeOOQjkVVFITGTGeBOtXbFpEIVYJXlE9yIgu7eK8sgL
         Qx2jKTEfI/VnyHBhM6pVM2R7gHB8Mtz6QHimU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705496906; x=1706101706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wj8tptRYsdj8+Ua1xCfSC/wkkxQZWJsblUpl0py++PQ=;
        b=TTiwWzEi+AbFiaLKakV6xAUiVCnclzipeFGXQCxRQCa0SlHoSvEZo2+pjS/XrQazgx
         tu6ptQIRZ56b6IK+p2vdwZJ1WbUMNdFRgcls2KpIAJH7qgmd96nNMey7uWaAsmRKaAvB
         ml8GmUkuL8oKALiVcjMF5scivx3zVSCikR7cjcCVITiUlt19kdVOKocI3FbyrnzmjtAI
         rCrzP8uWZO08Kb64sxJLPyIwD4pNZTMw/qGmNmVkrelIa9IDwyYBNtJxb2uQpoiAGgDs
         jxA4F0k9/RuTMgnNiWuBF0q+tuWXqB+r+W4ca2L8MvBNztdi6idF0WG6F4yK2Fi88NjZ
         cIlg==
X-Gm-Message-State: AOJu0YyokC9YXuMO7TNPi7L8zT0wQpm3LP/epJjwqvyejRhMAkSarLWI
	AxqXoEUhSZF3zRs0uXoI2BoxczsAyiUn9AXeBIVgm7P9Z0o=
X-Google-Smtp-Source: AGHT+IHYajbd+jcydIPxebuw9+aIAe+W5wvr1r3Gci6M4UJPu5UlcvD189ggItUUhsU7RQ7Io1vgaw==
X-Received: by 2002:a05:600c:21d4:b0:40d:3112:a2d7 with SMTP id x20-20020a05600c21d400b0040d3112a2d7mr4419324wmj.187.1705496905976;
        Wed, 17 Jan 2024 05:08:25 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3c1d:bf3d:325f:7bb3])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c1c9400b0040e54f15d3dsm26263349wms.31.2024.01.17.05.08.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 05:08:25 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] libtool: Update cleanup sysroot handling patch
Date: Wed, 17 Jan 2024 13:08:21 +0000
Message-Id: <20240117130822.3928928-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240117130822.3928928-1-richard.purdie@linuxfoundation.org>
References: <20240117130822.3928928-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 13:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193911

The sysroot path cleanup change was reworked after discussion/review upstream. It
appeared there were two different changes in one of our patches so separate out
the second one and mark as inappropriate as it is unlikely upstream would take
such a change in defaults. We need further investigation to decide if OE really
wants/needs this going forward.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libtool/libtool-2.4.7.inc                 |  1 +
 ...-libtool.m4-Cleanup-sysroot-trailing.patch | 37 +++++++++++++++++++
 ...ool.m4-Handle-as-a-sysroot-correctly.patch | 33 +++++++----------
 3 files changed, 52 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-devtools/libtool/libtool/0003-libtool.m4-Cleanup-sysroot-trailing.patch

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.7.inc b/meta/recipes-devtools/libtool/libtool-2.4.7.inc
index a07df720acf..16bb10d48f8 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.7.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.7.inc
@@ -15,6 +15,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
            file://0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch \
            file://0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch \
            file://dont-depend-on-help2man.patch \
+           file://0003-libtool.m4-Cleanup-sysroot-trailing.patch \
            file://0006-libtool.m4-Handle-as-a-sysroot-correctly.patch \
            file://nohardcodepaths.patch \
            file://0007-libtool-Fix-support-for-NIOS2-processor.patch \
diff --git a/meta/recipes-devtools/libtool/libtool/0003-libtool.m4-Cleanup-sysroot-trailing.patch b/meta/recipes-devtools/libtool/libtool/0003-libtool.m4-Cleanup-sysroot-trailing.patch
new file mode 100644
index 00000000000..b6175903daf
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/0003-libtool.m4-Cleanup-sysroot-trailing.patch
@@ -0,0 +1,37 @@
+libtool.m4: Cleanup sysroot trailing "/"
+
+If $CC has --sysroot=/, it is a valid configuration however libtool will
+then set lt_sysroot to "/".
+
+This means references like $lt_sysroot$libdir become //usr/lib instead
+of the more normally expected /usr/lib. This may or may not break something
+but certainly is confusing to the user and gives confusing output. Making
+"/" simply unset lt_sysroot is much cleaner.
+
+Whilst here, trim any trailing '/' from sysroot paths to drop the duplication
+and result in cleaner/consistent output.
+
+* m4/libtool.m4: Cleanup sysroot trailing '/' handling
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2024-01/msg00111.html]
+Signed-off-by:  Richard Purdie <richard.purdie@linuxfoundation.org>
+
+---
+ m4/libtool.m4 | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/m4/libtool.m4 b/m4/libtool.m4
+index fa1ae91..2f31d24 100644
+--- a/m4/libtool.m4
++++ b/m4/libtool.m4
+@@ -1256,7 +1256,9 @@ lt_sysroot=
+ case $with_libtool_sysroot in #(
+  yes)
+    if test yes = "$GCC"; then
+-     lt_sysroot=`$CC --print-sysroot 2>/dev/null`
++     # Trim trailing / since we'll always append absolute paths and we want
++     # to avoid //, if only for less confusing output for the user.
++     lt_sysroot=`$CC --print-sysroot 2>/dev/null | $SED 's:/\+$::'`
+    fi
+    ;; #(
+  /*)
diff --git a/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch b/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch
index a221dab5283..c104e904cc4 100644
--- a/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch
+++ b/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch
@@ -1,34 +1,29 @@
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 06/12] libtool.m4: Handle "/" as a sysroot correctly
+libtool.m4: Change libtool to handle sysroots by default
 
-Update libtool.m4 to resolve a problem with lt_sysroot not being properly
-updated if the option '--with[-libtool]-sysroot' is not provided when
-running the 'configure' script for a package so that "/" as a sysroot
-is handled correctly by libtool.
+Rather than using no sysroot by default, always query gcc to obtain the sysroot.
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Upstream Report:
-http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
+Upstream-Status: Inappropriate [Upstream are unlikely to accept this change of default]
 
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00018.html]
+---
+ m4/libtool.m4 | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
-Index: libtool-2.4.7/m4/libtool.m4
-===================================================================
---- libtool-2.4.7.orig/m4/libtool.m4
-+++ libtool-2.4.7/m4/libtool.m4
-@@ -1254,16 +1254,20 @@ dnl lt_sysroot will always be passed unq
+diff --git a/m4/libtool.m4 b/m4/libtool.m4
+index 2f31d24..bd90775 100644
+--- a/m4/libtool.m4
++++ b/m4/libtool.m4
+@@ -1254,18 +1254,18 @@ dnl lt_sysroot will always be passed unquoted.  We quote it here
  dnl in case the user passed a directory name.
  lt_sysroot=
  case $with_libtool_sysroot in #(
 - yes)
 + no)
     if test yes = "$GCC"; then
-      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
-+     # Treat "/" the same a an unset sysroot.
-+     if test "$lt_sysroot" = /; then
-+       lt_sysroot=
-+     fi
+      # Trim trailing / since we'll always append absolute paths and we want
+      # to avoid //, if only for less confusing output for the user.
+      lt_sysroot=`$CC --print-sysroot 2>/dev/null | $SED 's:/\+$::'`
     fi
     ;; #(
 + yes|''|/)
-- 
2.39.2


