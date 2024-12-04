Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0828E77175
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:49:51 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.8159.1733294990218287037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E6Au9qwr;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385eed29d7fso337714f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294989; x=1733899789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+S9BpyQkaiB/z2D8MRK17TVcEGMdg/+XC1NxaOXJBRk=;
        b=E6Au9qwre4IKGw4De7ZfvGyYnDnVWfzPgRNsnFAicdGmCsawdp7g6Q54fVyTH6ob2y
         PVpTCzAmpPvcLAmaBdbm/k+NHr+NAyy2wu82OFAZKdEw1ouKeT8FfXSThpcCHrWvMQtV
         3kWzXvzptNtKiTJCFgQa2U8wIMQwncDXkxnHm8Dvm7nVA05Sn0b8UiCPmUXtoQzznR82
         ATUGhhcPk+glEUo6vHvfLYAqGugnEiDdQo3oYrxd1/cKta9x/WXNwhY98tNn8NrEm5Du
         DFG01RvhiiPUTVHFFQAfAp0dDek6tcRfOeXoLtrRlZzPZFo0StCrICGkiXplWzvdaXxv
         CNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294989; x=1733899789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+S9BpyQkaiB/z2D8MRK17TVcEGMdg/+XC1NxaOXJBRk=;
        b=PmS+Q1RXlT9fJfhMeto2DZuJIWmclawWL3c1DhyWXsftZ7AJ5qXQ5QaiLhFzPcDW7g
         EQOYeP3WidEVOgv27jDRhqTybnB3FP3TDdwYHtknUoVW6Eq49KQqciMyDZCs2M9UVhlL
         g2WESApcoxQNMFzFVn4xvDOaWGsBR61CoO2oFNzh5XYHxj35ifNuylNbOQq8iKYrR3aL
         eJQ7Gayi50AAccuyIFM6cbfg6Mcr7MJDhefXqp2E0mcYSeOpDUNr+H9QxmBmU+o+nur1
         zfkjze85L5PVL4K22TZahn63t1jUm5KNLhOWCo+OlSxXQSQtACATViIJGwqUuazMJgT8
         53Lg==
X-Gm-Message-State: AOJu0YySaQIn93O8XRnJCDKWtQnbe42NmQdMvHEPpfKChUht/ScnJ9/g
	7uzL+NIjyVBcHkynetTIFvv/2f5z93F97Hn7ZNCxzAHx8j+w8ToWCQHubA==
X-Gm-Gg: ASbGnctn9ZpJUwH4OPPyh6l7zmit8kCdID7JB3vHU0d4O3E8pbsLk35yVpFykRg5sj2
	7WlHdeHIZbhZas40mHLY3Qcr2CV05Bv1UIbNReo1eUqSsKuRPlsqBjW6O1s9YXf4kQEKMaqmaO3
	/VKEB1E9ZMZqbF5+UVfGwqcwvXQ4Ga8Z5tO2ciHCQXYT1iY6rK+fjZJeDY3zcSk4mM2PoNj5GRz
	RxEk5AqtOjjqkhk+cVRDeefeJ2YZf+6rRXTu/zSyiVjzWtt579VAliVKh7DMXW7mgvXbGaBjM8r
	KdX83beaZgs=
X-Google-Smtp-Source: AGHT+IHRI6FZpYMP/C4mIxb1p0ozKowt220JoA1hb3UnblY8Scco3eFc6xdcxK4e03Y8TQGv9ELrSw==
X-Received: by 2002:a5d:5f48:0:b0:385:f07a:f4af with SMTP id ffacd0b85a97d-385f07af622mr10115258f8f.0.1733294988338;
        Tue, 03 Dec 2024 22:49:48 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/37] libtool: update 2.5.2 -> 2.5.4
Date: Wed,  4 Dec 2024 07:49:01 +0100
Message-Id: <20241204064920.817016-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208247

From: Alexander Kanavin <alex@linutronix.de>

2.5.2 was a beta, upstream made two stable releases since:
https://savannah.gnu.org/news/?id=10676
https://savannah.gnu.org/news/?id=10693

Drop libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch
(merged upstream)

Apply all patches unconditionally; the two conditional patches weren't specific
to respective variants, and this significantly simplifies version updates or
other modifications.

License-Update: change of FSF address to a URI

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libtool/libtool-2.5.2.inc                 | 36 ----------------
 .../libtool/libtool-2.5.4.inc                 | 37 ++++++++++++++++
 ...-cross_2.5.2.bb => libtool-cross_2.5.4.bb} |  1 -
 ...ative_2.5.2.bb => libtool-native_2.5.4.bb} |  0
 ...-trailing-slashes-on-install-command.patch | 36 ----------------
 ...root-paths-being-encoded-into-RPATH.patch} | 24 +++++++----
 ...ncode-RATHS-which-match-default-lin.patch} | 25 +++++++----
 ...-libtool-remove-help2man-dependency.patch} | 23 +++++++---
 ...-libtool-to-handle-sysroots-by-defa.patch} | 19 +++++---
 ...-static-libs-for-internal-compiler-.patch} | 21 ++++++---
 ... 0006-libtool-Fix-tools-path-issues.patch} | 19 ++++++--
 ...problem-with-libtoolize-in-multilib.patch} | 23 +++++++---
 ...inking-when-cross-compiling-its-poi.patch} | 43 +++++++++++++------
 .../{libtool_2.5.2.bb => libtool_2.5.4.bb}    |  2 -
 ...ol_2.5.2.bb => nativesdk-libtool_2.5.4.bb} |  2 -
 15 files changed, 176 insertions(+), 135 deletions(-)
 delete mode 100644 meta/recipes-devtools/libtool/libtool-2.5.2.inc
 create mode 100644 meta/recipes-devtools/libtool/libtool-2.5.4.inc
 rename meta/recipes-devtools/libtool/{libtool-cross_2.5.2.bb => libtool-cross_2.5.4.bb} (98%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.5.2.bb => libtool-native_2.5.4.bb} (100%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch
 rename meta/recipes-devtools/libtool/libtool/{0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch => 0001-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch} (75%)
 rename meta/recipes-devtools/libtool/libtool/{0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch => 0002-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch} (79%)
 rename meta/recipes-devtools/libtool/libtool/{dont-depend-on-help2man.patch => 0003-libtool-remove-help2man-dependency.patch} (58%)
 rename meta/recipes-devtools/libtool/libtool/{0006-libtool.m4-Handle-as-a-sysroot-correctly.patch => 0004-libtool.m4-Change-libtool-to-handle-sysroots-by-defa.patch} (66%)
 rename meta/recipes-devtools/libtool/libtool/{0008-libtool-Check-for-static-libs-for-internal-compiler-.patch => 0005-libtool-Check-for-static-libs-for-internal-compiler-.patch} (66%)
 rename meta/recipes-devtools/libtool/libtool/{nohardcodepaths.patch => 0006-libtool-Fix-tools-path-issues.patch} (54%)
 rename meta/recipes-devtools/libtool/libtool/{multilib.patch => 0007-libtool-Fix-problem-with-libtoolize-in-multilib.patch} (54%)
 rename meta/recipes-devtools/libtool/libtool/{fixinstall.patch => 0008-libtool-Avoid-relinking-when-cross-compiling-its-poi.patch} (70%)
 rename meta/recipes-devtools/libtool/{libtool_2.5.2.bb => libtool_2.5.4.bb} (91%)
 rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.5.2.bb => nativesdk-libtool_2.5.4.bb} (93%)

diff --git a/meta/recipes-devtools/libtool/libtool-2.5.2.inc b/meta/recipes-devtools/libtool/libtool-2.5.2.inc
deleted file mode 100644
index bde80e12ce7..00000000000
--- a/meta/recipes-devtools/libtool/libtool-2.5.2.inc
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Generic library support script"
-DESCRIPTION = "This is GNU libtool, a generic library support script. \
-Libtool hides the complexity of generating special library types \
-(such as shared libraries) behind a consistent interface."
-HOMEPAGE = "http://www.gnu.org/software/libtool/libtool.html"
-SECTION = "devel"
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-    file://libltdl/COPYING.LIB;md5=4fbd65380cdd255951079008b364516c "
-
-SRC_URI = "https://alpha.gnu.org/gnu/libtool/libtool-${PV}.tar.gz \
-           file://0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch \
-           file://0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch \
-           file://0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch \
-           file://dont-depend-on-help2man.patch \
-           file://0006-libtool.m4-Handle-as-a-sysroot-correctly.patch \
-           file://0008-libtool-Check-for-static-libs-for-internal-compiler-.patch \
-           file://nohardcodepaths.patch \
-          "
-
-SRC_URI[sha256sum] = "29275fb45b236d6ff720a433f9cd5f61ea2f52cc3aa2e5f89ba57726bda54793"
-
-inherit autotools texinfo
-EXTRA_AUTORECONF = "--exclude=libtoolize"
-
-CACHED_CONFIGUREVARS += "ac_cv_path_GREP=grep"
-
-DEPENDS = "libtool-native"
-
-PACKAGES =+ "libltdl"
-FILES:${PN} += "${datadir}/aclocal"
-
-FILES:${PN}-dev:remove = "${datadir}/aclocal"
-FILES:libltdl = "${libdir}/libltdl${SOLIBS}"
-
-export CONFIG_SHELL="/bin/bash"
diff --git a/meta/recipes-devtools/libtool/libtool-2.5.4.inc b/meta/recipes-devtools/libtool/libtool-2.5.4.inc
new file mode 100644
index 00000000000..86ce446916a
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool-2.5.4.inc
@@ -0,0 +1,37 @@
+SUMMARY = "Generic library support script"
+DESCRIPTION = "This is GNU libtool, a generic library support script. \
+Libtool hides the complexity of generating special library types \
+(such as shared libraries) behind a consistent interface."
+HOMEPAGE = "http://www.gnu.org/software/libtool/libtool.html"
+SECTION = "devel"
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
+    file://libltdl/COPYING.LIB;md5=4bf661c1e3793e55c8d1051bc5e0ae21 "
+
+SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
+           file://0001-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch \
+           file://0002-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch \
+           file://0003-libtool-remove-help2man-dependency.patch \
+           file://0004-libtool.m4-Change-libtool-to-handle-sysroots-by-defa.patch \
+           file://0005-libtool-Check-for-static-libs-for-internal-compiler-.patch \
+           file://0006-libtool-Fix-tools-path-issues.patch \
+           file://0007-libtool-Fix-problem-with-libtoolize-in-multilib.patch \
+           file://0008-libtool-Avoid-relinking-when-cross-compiling-its-poi.patch \
+          "
+
+SRC_URI[sha256sum] = "da8ebb2ce4dcf46b90098daf962cffa68f4b4f62ea60f798d0ef12929ede6adf"
+
+inherit autotools texinfo
+EXTRA_AUTORECONF = "--exclude=libtoolize"
+
+CACHED_CONFIGUREVARS += "ac_cv_path_GREP=grep"
+
+DEPENDS = "libtool-native"
+
+PACKAGES =+ "libltdl"
+FILES:${PN} += "${datadir}/aclocal"
+
+FILES:${PN}-dev:remove = "${datadir}/aclocal"
+FILES:libltdl = "${libdir}/libltdl${SOLIBS}"
+
+export CONFIG_SHELL="/bin/bash"
diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb b/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb
similarity index 98%
rename from meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb
rename to meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb
index 18849cb8ef6..32d03c2f8ac 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.5.2.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb
@@ -1,7 +1,6 @@
 require libtool-${PV}.inc
 
 PACKAGES = ""
-SRC_URI += "file://fixinstall.patch"
 
 datadir = "${STAGING_DIR_TARGET}${target_datadir}"
 
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.5.2.bb b/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb
similarity index 100%
rename from meta/recipes-devtools/libtool/libtool-native_2.5.2.bb
rename to meta/recipes-devtools/libtool/libtool-native_2.5.4.bb
diff --git a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch
deleted file mode 100644
index d5d906e6b62..00000000000
--- a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Handle-trailing-slashes-on-install-command.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 01/12] ltmain.in: Handle trailing slashes on install commands correctly
-
-A command like:
-
-libtool --mode=install /usr/bin/install -c gck-roots-store-standalone.la '/image/usr/lib/gnome-keyring/standalone/'
-
-where the path ends with a trailing slash currently fails. This occurs in
-software like gnome-keyring or pulseaudio and is because the comparision
-code doesn't see the paths as equal. Strip both paths to ensure this works
-reliably.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00010.html]
-
-Index: libtool-2.5.0/build-aux/ltmain.in
-===================================================================
---- libtool-2.5.0.orig/build-aux/ltmain.in
-+++ libtool-2.5.0/build-aux/ltmain.in
-@@ -2382,8 +2382,14 @@ func_mode_install ()
- 	func_append dir "$objdir"
- 
- 	if test -n "$relink_command"; then
-+	  # Strip any trailing slash from the destination.
-+	  func_stripname '' '/' "$libdir"
-+	  destlibdir=$func_stripname_result
-+	  func_stripname '' '/' "$destdir"
-+	  s_destdir=$func_stripname_result
-+
- 	  # Determine the prefix the user has applied to our future dir.
--	  inst_prefix_dir=`$ECHO "$destdir" | $SED -e "s%$libdir\$%%"`
-+	  inst_prefix_dir=`$ECHO "X$s_destdir" | $Xsed -e "s%$destlibdir\$%%"`
- 
- 	  # Don't allow the user to place us outside of our expected
- 	  # location b/c this prevents finding dependent libraries that
diff --git a/meta/recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch b/meta/recipes-devtools/libtool/libtool/0001-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch
similarity index 75%
rename from meta/recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch
rename to meta/recipes-devtools/libtool/libtool/0001-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch
index a6b3313d716..bcffb7d1ae3 100644
--- a/meta/recipes-devtools/libtool/libtool/0004-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch
+++ b/meta/recipes-devtools/libtool/libtool/0001-ltmain.sh-Fix-sysroot-paths-being-encoded-into-RPATH.patch
@@ -1,5 +1,7 @@
+From 16354097285634daf0240d428bc49fba95c3a291 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 04/12] ltmain.sh: Fix sysroot paths being encoded into RPATHs
+Date: Tue, 26 Nov 2024 09:57:35 +0000
+Subject: [PATCH 1/7] ltmain.sh: Fix sysroot paths being encoded into RPATHs
 
 There is a bug where RPATHs could end up containing sysroot values when
 cross compiling which is obviously incorrect. Strip out sysroot components
@@ -8,12 +10,15 @@ from libdir when building RPATH values to avoid this.
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00009.html]
+---
+ build-aux/ltmain.in | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
 
-Index: libtool-2.5.0/build-aux/ltmain.in
-===================================================================
---- libtool-2.5.0.orig/build-aux/ltmain.in
-+++ libtool-2.5.0/build-aux/ltmain.in
-@@ -7584,9 +7584,11 @@ func_mode_link ()
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+index fa157775..c31faebd 100644
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -7764,9 +7764,11 @@ func_mode_link ()
  	  test relink = "$opt_mode" || rpath=$compile_rpath$rpath
  	  for libdir in $rpath; do
  	    if test -n "$hardcode_libdir_flag_spec"; then
@@ -27,7 +32,7 @@ Index: libtool-2.5.0/build-aux/ltmain.in
  		if test -z "$hardcode_libdirs"; then
  		  hardcode_libdirs=$libdir
  		else
-@@ -8316,6 +8318,10 @@ func_mode_link ()
+@@ -8496,6 +8498,10 @@ func_mode_link ()
        hardcode_libdirs=
        for libdir in $compile_rpath $finalize_rpath; do
  	if test -n "$hardcode_libdir_flag_spec"; then
@@ -38,7 +43,7 @@ Index: libtool-2.5.0/build-aux/ltmain.in
  	  if test -n "$hardcode_libdir_separator"; then
  	    if test -z "$hardcode_libdirs"; then
  	      hardcode_libdirs=$libdir
-@@ -8367,6 +8373,10 @@ func_mode_link ()
+@@ -8547,6 +8553,10 @@ func_mode_link ()
        hardcode_libdirs=
        for libdir in $finalize_rpath; do
  	if test -n "$hardcode_libdir_flag_spec"; then
@@ -49,3 +54,6 @@ Index: libtool-2.5.0/build-aux/ltmain.in
  	  if test -n "$hardcode_libdir_separator"; then
  	    if test -z "$hardcode_libdirs"; then
  	      hardcode_libdirs=$libdir
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/libtool/libtool/0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch b/meta/recipes-devtools/libtool/libtool/0002-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch
similarity index 79%
rename from meta/recipes-devtools/libtool/libtool/0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch
rename to meta/recipes-devtools/libtool/libtool/0002-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch
index 54e602f1182..2ece455969b 100644
--- a/meta/recipes-devtools/libtool/libtool/0005-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch
+++ b/meta/recipes-devtools/libtool/libtool/0002-ltmain.in-Don-t-encode-RATHS-which-match-default-lin.patch
@@ -1,5 +1,8 @@
+From 59b6032698d10306ffb3be3cbf76690409d7f9a6 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 05/12] ltmain.in: Don't encode RATHS which match default linker paths
+Date: Tue, 26 Nov 2024 09:57:36 +0000
+Subject: [PATCH 2/7] ltmain.in: Don't encode RATHS which match default linker
+ paths
 
 We don't want to add RPATHS which match default linker search paths, they're
 a waste of space. This patch filters libtools list of paths to encoode and
@@ -11,12 +14,15 @@ the paths before comparision.
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00013.html]
+---
+ build-aux/ltmain.in | 34 ++++++++++++++++++++++++++++------
+ 1 file changed, 28 insertions(+), 6 deletions(-)
 
-Index: libtool-2.5.0/build-aux/ltmain.in
-===================================================================
---- libtool-2.5.0.orig/build-aux/ltmain.in
-+++ libtool-2.5.0/build-aux/ltmain.in
-@@ -7602,8 +7602,16 @@ func_mode_link ()
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+index c31faebd..44c7d81e 100644
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -7782,8 +7782,16 @@ func_mode_link ()
  		  esac
  		fi
  	      else
@@ -35,7 +41,7 @@ Index: libtool-2.5.0/build-aux/ltmain.in
  	      fi
  	    elif test -n "$runpath_var"; then
  	      case "$perm_rpath " in
-@@ -8336,8 +8344,16 @@ func_mode_link ()
+@@ -8516,8 +8524,16 @@ func_mode_link ()
  	      esac
  	    fi
  	  else
@@ -54,7 +60,7 @@ Index: libtool-2.5.0/build-aux/ltmain.in
  	  fi
  	elif test -n "$runpath_var"; then
  	  case "$perm_rpath " in
-@@ -8391,8 +8407,14 @@ func_mode_link ()
+@@ -8571,8 +8587,14 @@ func_mode_link ()
  	      esac
  	    fi
  	  else
@@ -71,3 +77,6 @@ Index: libtool-2.5.0/build-aux/ltmain.in
  	  fi
  	elif test -n "$runpath_var"; then
  	  case "$finalize_perm_rpath " in
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch b/meta/recipes-devtools/libtool/libtool/0003-libtool-remove-help2man-dependency.patch
similarity index 58%
rename from meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch
rename to meta/recipes-devtools/libtool/libtool/0003-libtool-remove-help2man-dependency.patch
index 0013d165445..b174827eef7 100644
--- a/meta/recipes-devtools/libtool/libtool/dont-depend-on-help2man.patch
+++ b/meta/recipes-devtools/libtool/libtool/0003-libtool-remove-help2man-dependency.patch
@@ -1,13 +1,21 @@
+From e3e8422333239c47ad613e2f41ee04244556d3be Mon Sep 17 00:00:00 2001
+From: Marko Lindqvist <cazfi74@gmail.com>
+Date: Mon, 7 Jan 2013 01:49:28 +0200
+Subject: [PATCH 3/7] libtool: remove help2man dependency
+
 Upstream-Status: Inappropriate
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
 Updated by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.am | 17 -----------------
+ 1 file changed, 17 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 7bd7f72..c29860e 100644
+index 51c1fbdb..4962c3ad 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -411,21 +411,6 @@ $(notes_txt): $(notes_texi)
+@@ -408,23 +408,6 @@ $(notes_txt): $(notes_texi)
  	$(AM_V_GEN)$(MAKEINFO) -P '$(srcdir)/doc' --no-headers \
  	    $(MAKEINFOFLAGS) -o '$@' '$(notes_texi)'
  
@@ -22,10 +30,15 @@ index 7bd7f72..c29860e 100644
 -# manual pages if the sources for the build-tree files we want to
 -# run have changed.
 -$(libtool_1): $(ltmain_sh)
--	$(AM_V_GEN)$(update_mans) --help-option=--help-all libtool
+-	$(AM_V_GEN)$(update_mans) -n 'Provide generalized library-building support services' --help-option=--help-all libtool
 -$(libtoolize_1): $(libtoolize_in)
--	$(AM_V_GEN)$(update_mans) libtoolize
+-	$(AM_V_GEN)$(update_mans) -n 'Prepare a package to use libtool' libtoolize
+-
+-
 -
- 
  ## ------------- ##
  ## Installation. ##
+ ## ------------- ##
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch b/meta/recipes-devtools/libtool/libtool/0004-libtool.m4-Change-libtool-to-handle-sysroots-by-defa.patch
similarity index 66%
rename from meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch
rename to meta/recipes-devtools/libtool/libtool/0004-libtool.m4-Change-libtool-to-handle-sysroots-by-defa.patch
index feb1048b554..e8fc1bff9c6 100644
--- a/meta/recipes-devtools/libtool/libtool/0006-libtool.m4-Handle-as-a-sysroot-correctly.patch
+++ b/meta/recipes-devtools/libtool/libtool/0004-libtool.m4-Change-libtool-to-handle-sysroots-by-defa.patch
@@ -1,20 +1,22 @@
-libtool.m4: Change libtool to handle sysroots by default
+From 3bb376ff4832e2bd1aaee5530b4b926e3f7407c0 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sat, 14 Sep 2013 09:01:38 +0000
+Subject: [PATCH 4/7] libtool.m4: Change libtool to handle sysroots by default
 
 Rather than using no sysroot by default, always query gcc to obtain the sysroot.
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Upstream-Status: Inappropriate [Upstream are unlikely to accept this change of default]
-
 ---
  m4/libtool.m4 | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
-Index: libtool-2.5.0/m4/libtool.m4
-===================================================================
---- libtool-2.5.0.orig/m4/libtool.m4
-+++ libtool-2.5.0/m4/libtool.m4
-@@ -1253,18 +1253,18 @@ dnl lt_sysroot will always be passed unq
+diff --git a/m4/libtool.m4 b/m4/libtool.m4
+index 8d323b3e..3650c87c 100644
+--- a/m4/libtool.m4
++++ b/m4/libtool.m4
+@@ -1288,18 +1288,18 @@ dnl lt_sysroot will always be passed unquoted.  We quote it here
  dnl in case the user passed a directory name.
  lt_sysroot=
  case $with_sysroot in #(
@@ -36,3 +38,6 @@ Index: libtool-2.5.0/m4/libtool.m4
   *)
     AC_MSG_RESULT([$with_sysroot])
     AC_MSG_ERROR([The sysroot must be an absolute path.])
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch b/meta/recipes-devtools/libtool/libtool/0005-libtool-Check-for-static-libs-for-internal-compiler-.patch
similarity index 66%
rename from meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch
rename to meta/recipes-devtools/libtool/libtool/0005-libtool-Check-for-static-libs-for-internal-compiler-.patch
index c103ebb7bfc..5a4411c8e50 100644
--- a/meta/recipes-devtools/libtool/libtool/0008-libtool-Check-for-static-libs-for-internal-compiler-.patch
+++ b/meta/recipes-devtools/libtool/libtool/0005-libtool-Check-for-static-libs-for-internal-compiler-.patch
@@ -1,5 +1,8 @@
+From 9f16cd0624641e489665415150792d9054af8a7a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Subject: [PATCH 08/12] libtool: Check for static libs for internal compiler libraries
+Date: Tue, 26 Nov 2024 09:57:39 +0000
+Subject: [PATCH 5/7] libtool: Check for static libs for internal compiler
+ libraries
 
 Libtool checks only for libraries linked as -l* when trying to
 find internal compiler libraries. Clang, however uses the absolute
@@ -14,12 +17,15 @@ https://crbug.com/749263
 https://debbugs.gnu.org/cgi/bugreport.cgi?bug=27866
 
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00016.html]
+---
+ m4/libtool.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: libtool-2.5.0/m4/libtool.m4
-===================================================================
---- libtool-2.5.0.orig/m4/libtool.m4
-+++ libtool-2.5.0/m4/libtool.m4
-@@ -7553,7 +7553,7 @@ if AC_TRY_EVAL(ac_compile); then
+diff --git a/m4/libtool.m4 b/m4/libtool.m4
+index 3650c87c..51493a10 100644
+--- a/m4/libtool.m4
++++ b/m4/libtool.m4
+@@ -7708,7 +7708,7 @@ if AC_TRY_EVAL(ac_compile); then
    for p in `eval "$output_verbose_link_cmd"`; do
      case $prev$p in
  
@@ -28,3 +34,6 @@ Index: libtool-2.5.0/m4/libtool.m4
         # Some compilers place space between "-{L,R,l}" and the path.
         # Remove the space.
         if test x-L = x"$p" ||
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/libtool/libtool/nohardcodepaths.patch b/meta/recipes-devtools/libtool/libtool/0006-libtool-Fix-tools-path-issues.patch
similarity index 54%
rename from meta/recipes-devtools/libtool/libtool/nohardcodepaths.patch
rename to meta/recipes-devtools/libtool/libtool/0006-libtool-Fix-tools-path-issues.patch
index fcbce7286b4..9788433ab82 100644
--- a/meta/recipes-devtools/libtool/libtool/nohardcodepaths.patch
+++ b/meta/recipes-devtools/libtool/libtool/0006-libtool-Fix-tools-path-issues.patch
@@ -1,3 +1,8 @@
+From c04839effba0538c982422275c5cda5947aa0e85 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 3 Feb 2015 14:24:58 +0000
+Subject: [PATCH 6/7] libtool: Fix tools path issues
+
 If for example you build on a machine with /bin/grep, then restore that sstate
 onto a machine with /usr/bin/grep, things will fail. Simply don't bother
 hardcoding paths.
@@ -5,11 +10,14 @@ hardcoding paths.
 RP 2015/2/3
 
 Upstream-Status: Inappropriate
+---
+ libtoolize.in | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
 
-Index: libtool-2.4.5/libtoolize.in
-===================================================================
---- libtool-2.4.5.orig/libtoolize.in
-+++ libtool-2.4.5/libtoolize.in
+diff --git a/libtoolize.in b/libtoolize.in
+index 6c15aa57..8beb670e 100644
+--- a/libtoolize.in
++++ b/libtoolize.in
 @@ -40,11 +40,11 @@
  
  : ${AUTOCONF="autoconf"}
@@ -27,3 +35,6 @@ Index: libtool-2.4.5/libtoolize.in
  
  
  ## -------------------------- ##
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/libtool/libtool/multilib.patch b/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-problem-with-libtoolize-in-multilib.patch
similarity index 54%
rename from meta/recipes-devtools/libtool/libtool/multilib.patch
rename to meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-problem-with-libtoolize-in-multilib.patch
index 018f0666520..bcb372bbc12 100644
--- a/meta/recipes-devtools/libtool/libtool/multilib.patch
+++ b/meta/recipes-devtools/libtool/libtool/0007-libtool-Fix-problem-with-libtoolize-in-multilib.patch
@@ -1,3 +1,8 @@
+From 083cf39140cd894ea306b67411d6088c13a9e286 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Mon, 30 Jul 2018 17:00:01 +0000
+Subject: [PATCH 7/7] libtool: Fix problem with libtoolize in multilib
+
 Without this patch /usr/bin/libtoolize is different for each multilib
 since their host-triplets are different, despite there being no difference in
 the functionality of libtoolize itself.
@@ -7,17 +12,23 @@ libXX-libtool couldn't be installed into the same system.
 
 Upstream-Status: Inappropriate
 RP 2018/7/30
+---
+ libtoolize.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: libtool-2.4.6/libtoolize.in
-===================================================================
---- libtool-2.4.6.orig/libtoolize.in
-+++ libtool-2.4.6/libtoolize.in
-@@ -113,7 +113,7 @@ You must 'cd' to the top directory of yo
+diff --git a/libtoolize.in b/libtoolize.in
+index 8beb670e..c89a093c 100644
+--- a/libtoolize.in
++++ b/libtoolize.in
+@@ -139,7 +139,7 @@ You must 'cd' to the top directory of your package before you run
  When reporting a bug, please describe a test case to reproduce it and
  include the following information:
  
 -       host-triplet:   @host_triplet@
 +       host-triplet    <redacted>
-        version:        $progname (GNU @PACKAGE@) @VERSION@
+        version:        $progname $scriptversion
         automake:       `($AUTOMAKE --version) 2>/dev/null |$SED 1q`
         autoconf:       `($AUTOCONF --version) 2>/dev/null |$SED 1q`
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/libtool/libtool/fixinstall.patch b/meta/recipes-devtools/libtool/libtool/0008-libtool-Avoid-relinking-when-cross-compiling-its-poi.patch
similarity index 70%
rename from meta/recipes-devtools/libtool/libtool/fixinstall.patch
rename to meta/recipes-devtools/libtool/libtool/0008-libtool-Avoid-relinking-when-cross-compiling-its-poi.patch
index 94601b1beb8..267c3ab1405 100644
--- a/meta/recipes-devtools/libtool/libtool/fixinstall.patch
+++ b/meta/recipes-devtools/libtool/libtool/0008-libtool-Avoid-relinking-when-cross-compiling-its-poi.patch
@@ -1,5 +1,10 @@
+From 78eac8c99451681f4c403b3ea727ee61651a3c1a Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 16 Nov 2011 16:58:34 +0000
+Subject: [PATCH] libtool: Avoid relinking when cross compiling, its pointless
+
 There is no point in having "executable" binaries in the .libs
-directory linked with different rpaths to the target which 
+directory linked with different rpaths to the target which
 could concivably be run on the build system when cross compiling.
 
 This patch removes the extra rpaths ($compile_rpath) so that the
@@ -17,12 +22,15 @@ Upstream-Status: Inappropriate [upstream are unlikely to take a patch like this]
 RP 2011/11/16
 
 Updated by: Robert Yang <liezhi.yang@windriver.com>
+---
+ build-aux/ltmain.in | 56 ++++++++++++++++++++++-----------------------
+ 1 file changed, 28 insertions(+), 28 deletions(-)
 
-Index: libtool-2.5.2/build-aux/ltmain.in
-===================================================================
---- libtool-2.5.2.orig/build-aux/ltmain.in
-+++ libtool-2.5.2/build-aux/ltmain.in
-@@ -2381,7 +2381,7 @@ func_mode_install ()
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+index fa157775..816ea5a0 100644
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -2513,7 +2513,7 @@ func_mode_install ()
  	dir=$func_dirname_result
  	func_append dir "$objdir"
  
@@ -31,7 +39,7 @@ Index: libtool-2.5.2/build-aux/ltmain.in
  	  # Strip any trailing slash from the destination.
  	  func_stripname '' '/' "$libdir"
  	  destlibdir=$func_stripname_result
-@@ -2419,7 +2419,7 @@ func_mode_install ()
+@@ -2552,7 +2552,7 @@ func_mode_install ()
  	  shift
  
  	  srcname=$realname
@@ -40,17 +48,18 @@ Index: libtool-2.5.2/build-aux/ltmain.in
  
  	  # Install the shared library and build the symlinks.
  	  func_show_eval "$install_shared_prog $dir/$srcname $destdir/$realname" \
-@@ -6276,17 +6276,17 @@ func_mode_link ()
+@@ -6411,18 +6411,18 @@ func_mode_link ()
  	    # Hardcode the library path.
  	    # Skip directories that are in the system default run-time
  	    # search path.
 -	    case " $sys_lib_dlsearch_path " in
 -	    *" $absdir "*) ;;
 -	    *)
--	      case "$compile_rpath " in
+-	      case "$compile_rpath$compile_rpath_tail " in
 -	      *" $absdir "*) ;;
 -	      *) case $absdir in
 -                 "$progdir/"*) func_append compile_rpath " $absdir" ;;
+-                 *) func_append compile_rpath_tail " $absdir" ;;
 -		 esac
 -	      esac
 -	      ;;
@@ -58,10 +67,11 @@ Index: libtool-2.5.2/build-aux/ltmain.in
 +	    #case " $sys_lib_dlsearch_path " in
 +	    #*" $absdir "*) ;;
 +	    #*)
-+	    #  case "$compile_rpath " in
++	    #  case "$compile_rpath$compile_rpath_tail " in
 +	    #  *" $absdir "*) ;;
 +	    #  *) case $absdir in
 +            #     "$progdir/"*) func_append compile_rpath " $absdir" ;;
++            #     *) func_append compile_rpath_tail " $absdir" ;;
 +	#	 esac
 +	    #  esac
 +	    #  ;;
@@ -69,17 +79,18 @@ Index: libtool-2.5.2/build-aux/ltmain.in
  	    case " $sys_lib_dlsearch_path " in
  	    *" $libdir "*) ;;
  	    *)
-@@ -6352,17 +6352,17 @@ func_mode_link ()
+@@ -6488,18 +6488,18 @@ func_mode_link ()
  	    # Hardcode the library path.
  	    # Skip directories that are in the system default run-time
  	    # search path.
 -	    case " $sys_lib_dlsearch_path " in
 -	    *" $absdir "*) ;;
 -	    *)
--	      case "$compile_rpath " in
+-	      case "$compile_rpath$compile_rpath_tail " in
 -	      *" $absdir "*) ;;
 -	      *) case $absdir in
 -                 "$progdir/"*) func_append compile_rpath " $absdir" ;;
+-                 *) func_append compile_rpath_tail " $absdir" ;;
 -		 esac
 -	      esac
 -	      ;;
@@ -87,10 +98,11 @@ Index: libtool-2.5.2/build-aux/ltmain.in
 +	    #case " $sys_lib_dlsearch_path " in
 +	    #*" $absdir "*) ;;
 +	    #*)
-+	    #  case "$compile_rpath " in
++	    #  case "$compile_rpath$compile_rpath_tail " in
 +	    #  *" $absdir "*) ;;
 +	    #  *) case $absdir in
 +            #     "$progdir/"*) func_append compile_rpath " $absdir" ;;
++            #     *) func_append compile_rpath_tail " $absdir" ;;
 +	#	 esac
 +	    #  esac
 +	    #  ;;
@@ -98,7 +110,7 @@ Index: libtool-2.5.2/build-aux/ltmain.in
  	    case " $sys_lib_dlsearch_path " in
  	    *" $libdir "*) ;;
  	    *)
-@@ -6705,8 +6705,8 @@ func_mode_link ()
+@@ -6843,8 +6843,8 @@ func_mode_link ()
  		  eval libdir=`$SED -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
  		  test -z "$libdir" && \
  		    func_fatal_error "'$deplib' is not a valid libtool archive"
@@ -109,3 +121,6 @@ Index: libtool-2.5.2/build-aux/ltmain.in
  
  		  path=-L$absdir
  		fi
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/libtool/libtool_2.5.2.bb b/meta/recipes-devtools/libtool/libtool_2.5.4.bb
similarity index 91%
rename from meta/recipes-devtools/libtool/libtool_2.5.2.bb
rename to meta/recipes-devtools/libtool/libtool_2.5.4.bb
index c1e315aece4..835f2da9948 100644
--- a/meta/recipes-devtools/libtool/libtool_2.5.2.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.5.4.bb
@@ -1,8 +1,6 @@
 require libtool-${PV}.inc
 require remove-buildpaths.inc
 
-SRC_URI += "file://multilib.patch"
-
 RDEPENDS:${PN} += "bash"
 
 #
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.2.bb b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb
similarity index 93%
rename from meta/recipes-devtools/libtool/nativesdk-libtool_2.5.2.bb
rename to meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb
index 2589bd617ee..3669c8ba2ea 100644
--- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.2.bb
+++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.5.4.bb
@@ -3,8 +3,6 @@ require remove-buildpaths.inc
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/libtool:"
 
-SRC_URI += "file://fixinstall.patch"
-
 inherit nativesdk
 
 S = "${WORKDIR}/libtool-${PV}"
-- 
2.39.5


