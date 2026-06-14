Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3659ECD98D8
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:40 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105040.1781424212284802394
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D+MLFOCO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so17396085e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424210; x=1782029010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKZ0e+O6S1AIb6yR4x3gki+MlT/hHzZO27a+BxZip0c=;
        b=D+MLFOCON7XKL3u34z+f3k1tqL+PZlYDSdPksScMfDI4SCbqupERN/NEG2/41/n8st
         lukAxIsB5GPWY2Ohlpv42F1ty6+jcQ0TCDje+pZP5ntFsH5CrbHavDuW5yXc5/eGeykG
         wRAXP+REDkRo7c/Z6wfHRTxdAdVJDk9sNYBKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424210; x=1782029010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CKZ0e+O6S1AIb6yR4x3gki+MlT/hHzZO27a+BxZip0c=;
        b=E40nqxLfEfMjBfCtEAVNjUky2oWcT491xsFR4p99WuCSAVMfROArdPCiczMo+q9o9V
         5hW/yIPvNNingu10leF1THDps/OW0tOo8vmlyERxB0TSajim9Vx9OoG2rRUulDYwSRiW
         FnjLbNC4d0uikzGE+THjjnLtyhpSQNL890jK0d1sPUIPd+WvopzB14t6QkVxXNlbs0PQ
         Sq7R1TziIOA5jubXYFAMaKlZecMKj+jvhCvF4+LbHAqcdeVui4HfASPMSizeZz095GcK
         o7mZeuifSeqCSVvc7sQpFQ5pgb+sNSClB5gpoN9THnQwJJd8njr7OdiPtPkM/R5aBz5b
         7DnQ==
X-Gm-Message-State: AOJu0YyrZ9T7HB0VoSKVts3d1d9gRKu8pOM8q4pl+yWFzTtEnYGF3NZ5
	RdHliCr85xK3OzICcA6u8dK5218ILzamGPRfdnCvYEj0E6B1/yX+n8/KpWwSA2f95o/IUViN8qJ
	7qju/
X-Gm-Gg: Acq92OFPcU9yOVKEdpiwoBTiH7KzyW0f5oxchZTSgwQAWvW60mIrgSnEhbSx4/+0o3B
	ZrGNViadNfOv+mdnO9h+hWVCdJJS54iFJugF1G7G3G56MOfRg7QiJIrWvjJ6tB/JTtMK6rY8tV0
	B2D83rnzD5FEJS2YtU5BJobtNuAmxKEWsbWvyYpL/sL7CiFHapSBw0LDsmvfGVKTLaWzVlGlPFv
	zNiVpA8VW4CsQV6kxZ/t2w8RcZ1GiqzaKBU7ahAtTdInhV+wS4bpzJiutJyuaJImnRNItNy5HzY
	2K8cur8LYs5yvYQlTRdeldZy754crkWgrOPYyMOCzsRuQTxJfigyNOwqZ0XBWMtZSaxJD25e9QT
	dupUKAGjQB6SYCLy+uj/yGr9PHX8J7mRW6r+agMXOpe1s+GqHWm1U2MRTm708pIqOL+FxhTP+2N
	Sn/NTMK+WBrDurhxDfTdnvNcgoh4hcQG6wGAAL3TLYl7z1k7D2Yw7o
X-Received: by 2002:a05:600c:1511:b0:490:ce99:d2ee with SMTP id 5b1f17b1804b1-490ec4df7b5mr73179525e9.15.1781424210398;
        Sun, 14 Jun 2026 01:03:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/56] glib-2.0: Upgrade 2.88.0 -> 2.88.1
Date: Sun, 14 Jun 2026 09:02:24 +0100
Message-ID: <20260614080307.4017177-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238697

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../0001-Do-not-write-bindir-into-pkg-config-files.patch    | 6 +++---
 .../files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch        | 2 +-
 .../0001-Install-gio-querymodules-as-libexec_PROGRAM.patch  | 4 ++--
 ...move-the-warning-about-deprecated-paths-in-schemas.patch | 2 +-
 ...o-tests-resources.c-comment-out-a-build-host-only-.patch | 2 +-
 .../0001-meson-Run-atomics-test-on-clang-as-well.patch      | 4 ++--
 ...son.build-do-not-enable-pidfd-features-on-native-g.patch | 4 ++--
 ...010-Do-not-hardcode-python-path-into-various-tools.patch | 4 ++--
 meta/recipes-core/glib-2.0/files/relocate-modules.patch     | 4 ++--
 meta/recipes-core/glib-2.0/files/skip-timeout.patch         | 2 +-
 ...lib-2.0-initial_2.88.0.bb => glib-2.0-initial_2.88.1.bb} | 0
 .../glib-2.0/{glib-2.0_2.88.0.bb => glib-2.0_2.88.1.bb}     | 0
 meta/recipes-core/glib-2.0/glib.inc                         | 2 +-
 13 files changed, 18 insertions(+), 18 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.88.0.bb => glib-2.0-initial_2.88.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.88.0.bb => glib-2.0_2.88.1.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
index 8b783e81ea6..b6ad6035c54 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pkg-config-files.patch
@@ -1,4 +1,4 @@
-From 6fe3965383d94b3030e85ab899955858710fec5c Mon Sep 17 00:00:00 2001
+From 89c0644254023cfd5a22685fbbb50ebd8c6224df Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 15 Feb 2019 11:17:27 +0100
 Subject: [PATCH] Do not prefix executables with $bindir in pkg-config files
@@ -15,7 +15,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 13 insertions(+), 11 deletions(-)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 2f8f188..57c48d2 100644
+index c7da257..8a00989 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
 @@ -934,17 +934,18 @@ libgio_dep = declare_dependency(link_with : libgio,
@@ -46,7 +46,7 @@ index 2f8f188..57c48d2 100644
    uninstalled_variables : [
      'gio=${prefix}/gio/gio',
 diff --git a/glib/meson.build b/glib/meson.build
-index 209bcbf..a86cfd3 100644
+index 0fb6e26..9eebf73 100644
 --- a/glib/meson.build
 +++ b/glib/meson.build
 @@ -480,9 +480,10 @@ pkg.generate(libglib,
diff --git a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
index b91624da8b3..c698376d3fe 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-Linux.patch
@@ -1,4 +1,4 @@
-From 966c58aae35f9e2bcef5238e0331a119e0e51abd Mon Sep 17 00:00:00 2001
+From 727d5239c378c820f874b50d539f87b54a3757a9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 15 Mar 2014 22:42:29 -0700
 Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
diff --git a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
index 5b7c3239962..18d69c4a43e 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as-libexec_PROGRAM.patch
@@ -1,4 +1,4 @@
-From 0de3a3a791ca32f2330eb3a8ad9da0fe6dce950c Mon Sep 17 00:00:00 2001
+From af1354b16aeffbfefc7e8d32160c97105a93a84f Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 22 Mar 2016 15:14:58 +0200
 Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
@@ -13,7 +13,7 @@ Upstream-Status: Inappropriate [OE specific]
  1 file changed, 1 insertion(+)
 
 diff --git a/gio/meson.build b/gio/meson.build
-index 39256d3..2f8f188 100644
+index a3e6f18..c7da257 100644
 --- a/gio/meson.build
 +++ b/gio/meson.build
 @@ -1071,6 +1071,7 @@ gio_querymodules = executable('gio-querymodules', 'gio-querymodules.c', 'giomodu
diff --git a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
index d6dd66357ae..594c4447972 100644
--- a/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -1,4 +1,4 @@
-From b829f3205e4d8390f02eaa8e7a7bf85e51cbb7ed Mon Sep 17 00:00:00 2001
+From 6237ed5e1677c3b0ea50c92dc36e864ca860e1bd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 12 Jun 2015 17:08:46 +0300
 Subject: [PATCH] Remove the warning about deprecated paths in schemas
diff --git a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
index 7a2fc0b7efa..243961ab8e8 100644
--- a/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
@@ -1,4 +1,4 @@
-From 912e674bb0a3b51dabaa58da1834491ef94e6a2a Mon Sep 17 00:00:00 2001
+From 521b129c7c6329a01a5f56b4604ea1b7499b03ad Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 8 Jan 2020 18:22:46 +0100
 Subject: [PATCH] gio/tests/resources.c: comment out a build host-only test
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
index 149833dc434..fda448e3cc8 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-clang-as-well.patch
@@ -1,4 +1,4 @@
-From 26ddae02d7677bcff7c3933ee856d34df41b548f Mon Sep 17 00:00:00 2001
+From 69e80e3b936e57eaecda231b12b554c075218deb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 12 Oct 2019 17:46:26 -0700
 Subject: [PATCH] meson: Run atomics test on clang as well
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index dab1d61..cc3a5ed 100644
+index bb68398..3e9e03a 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -2100,7 +2100,7 @@ atomicdefine = '''
diff --git a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
index efd5d3de1b1..711572b1395 100644
--- a/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
+++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
@@ -1,4 +1,4 @@
-From c6cd3c0a66ae8f210185e0cb05b2172dc192ce9e Mon Sep 17 00:00:00 2001
+From e79e19bc1e6a7e8fb8596c4a9d60e21032350784 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sat, 16 Sep 2023 22:28:27 +0200
 Subject: [PATCH] meson.build: do not enable pidfd features on native glib
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index cc3a5ed..58dd87a 100644
+index 3e9e03a..f1957f0 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -1098,7 +1098,8 @@ if cc.links('''#include <sys/syscall.h>
diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 8dbdf746b7d..0f98133802b 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -1,4 +1,4 @@
-From 40e40230e6a3c52b79c6f92e8c060bd4d93f0374 Mon Sep 17 00:00:00 2001
+From 6d92086a791c2320b46817640ceba901361f34fe Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 3 Oct 2017 10:45:55 +0300
 Subject: [PATCH] Do not hardcode python path into various tools
@@ -32,7 +32,7 @@ index 0578b74..56e8e2e 100755
  # pylint: disable=too-many-lines, missing-docstring, invalid-name
  
 diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
-index 7e794e9..4b619f8 100755
+index f388714..37ed491 100755
 --- a/gobject/glib-mkenums.in
 +++ b/gobject/glib-mkenums.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/glib-2.0/files/relocate-modules.patch b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
index 4c2638ae615..7f326d85887 100644
--- a/meta/recipes-core/glib-2.0/files/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 14bbc77bc465b42454112bc6a33264c2c3e013e5 Mon Sep 17 00:00:00 2001
+From 20721d24485a51206189b3128835c3c3098601b3 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -21,7 +21,7 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index 38761e4..afa7878 100644
+index 7311775..abc2c79 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
 @@ -1312,6 +1312,24 @@ get_gio_module_dir (void)
diff --git a/meta/recipes-core/glib-2.0/files/skip-timeout.patch b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
index 8ef140d0d7f..43506d69f58 100644
--- a/meta/recipes-core/glib-2.0/files/skip-timeout.patch
+++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
@@ -1,4 +1,4 @@
-From f77b9dd72dd0103c7a28dd7e1cdf6e316ecbf030 Mon Sep 17 00:00:00 2001
+From d548554b8793d82b93c7c7b2198e368b57916958 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Thu, 28 Mar 2024 16:27:09 +0000
 Subject: [PATCH] Skip /timeout/rounding test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.88.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.88.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.88.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index dee94ec0600..8d23092187b 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -238,7 +238,7 @@ SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-SRC_URI[archive.sha256sum] = "3546251ccbb3744d4bc4eb48354540e1f6200846572bab68e3a2b7b2b64dfd07"
+SRC_URI[archive.sha256sum] = "51ab804c56f6eab3e5045c774d1290ac5e4c923d4f9a3d8e33123bee45c1840e"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.

