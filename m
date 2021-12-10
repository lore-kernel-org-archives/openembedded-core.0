Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCAAFC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 01:06:24 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.1113.1639098384284806307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 17:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FZZ+m6x7;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id y8so5221302plg.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 17:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i3/Bu0vUU9Als23F4wCbYSh05xGMHN0IN11j7t6XSuU=;
        b=FZZ+m6x7VxoFnnMSMezdZE6HLI72KBvd9TxvhhLBjk2j82L9ZBs/ZIBd7Qf2l8sWl1
         tN0Ocmu5/ibv/yXheS1xoVeoh6cby2SJ/mpGz1MKIswVzX9gEkd3gcYyIvnK+/IcFMgG
         EB+xvzQb0IezrgKAlyz7kJSY9ViLP7adFF4I7lN0pbfJqZCbclPO21tmJktk4lHcbf/A
         gcd/8qAN29DNOGiWz/lcQsSXuxgkOsi40JcOv9sTYo4YIid303wI4WKbyfeHdLlCM2Vi
         yciLM0uclvZ/JhSYdBXwPtkrGxWwEd4JsEtH9nEjNyuhHvrFBcPH2DBCdAjdkIzev6mm
         RiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i3/Bu0vUU9Als23F4wCbYSh05xGMHN0IN11j7t6XSuU=;
        b=BhAd91UzOKQYiIpQIkLZjryxgNM8bY7ZOWBogXViLgOxEOxXvbifjx3bK2xX4LCiEK
         k466zWe+GvT7A58Dd8SrDHUfoaE9oUVjGPYTjbs/qI3QWLc+8uM3/vm+UiFL/iXvlUN9
         p3eyTFnRYbH15FEhKdx4pC3Pp9ROgrmSSXH2RuOlGGtu4xU8/jPOSxSZRdNoBNIv/yn1
         Sf3cEzzctsR9QxEdBy8ENHtIDXbLaSmhsSxJmcKUmDMLy0Fed4a3I+pHBuWmUc0g8kND
         Xx5hh+tsaFktt2x5tKPOAJ9u8p6yq0rmSUC2uINdot8oGkM8j7XGZzY3VaHDjWGQn/BG
         7Fiw==
X-Gm-Message-State: AOAM530Blw7Yxueqw3N+UXcUOvM/TZ9PzRCKM+aGRzLEml7cXlYq6JCz
	tLD/nZz6iwYZeIQE6/Iu0aZIJBjlmE8FPA==
X-Google-Smtp-Source: 
 ABdhPJyDtDqe6kLrY3UectErIomPUilKAzjXkvG0jNB+6GAWwNO2L0R5Rc7JmrKgKNeahGgCTZ7PPA==
X-Received: by 2002:a17:903:22c5:b0:142:3100:65af with SMTP id
 y5-20020a17090322c500b00142310065afmr72955903plg.83.1639098383409;
        Thu, 09 Dec 2021 17:06:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id
 o4sm10193439pjq.23.2021.12.09.17.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 17:06:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Hongxu Jia <hongxu.jia@windriver.com>
Subject: [PATCH v2] glibc: Redo tzselect bash dependency problem
Date: Thu,  9 Dec 2021 17:06:13 -0800
Message-Id: <20211210010613.1653218-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 01:06:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159487

New patch adds a knob to select needed shell interpreter for tzselect
script, which then we excercise via EXTRA_OEMAKE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Hongxu Jia <hongxu.jia@windriver.com>
---
v2: Fix cross-localedef-native as well

 .../glibc/cross-localedef-native_2.34.bb      |  7 ++-
 meta/recipes-core/glibc/glibc.inc             |  4 ++
 ...erpreter-overridable-in-tzselect.ksh.patch | 50 +++++++++++++++++++
 ...zone-re-written-tzselect-as-posix-sh.patch | 34 -------------
 meta/recipes-core/glibc/glibc_2.34.bb         |  2 +-
 5 files changed, 61 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0017-timezone-re-written-tzselect-as-posix-sh.patch

diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.34.bb b/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
index 44c684bd74b..77ca3105ba0 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.34.bb
@@ -34,13 +34,13 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0001-localedef-Add-hardlink-resolver-from-util-linux.patch \
            file://0002-localedef-fix-ups-hardlink-to-make-it-compile.patch \
            \
-           file://0017-timezone-re-written-tzselect-as-posix-sh.patch \
            file://0018-Remove-bash-dependency-for-nscd-init-script.patch \
            file://0019-eglibc-Cross-building-and-testing-instructions.patch \
            file://0020-eglibc-Help-bootstrap-cross-toolchain.patch \
            file://0021-eglibc-Resolve-__fpscr_values-on-SH4.patch \
            file://0022-eglibc-Forward-port-cross-locale-generation-support.patch \
            file://0024-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
+           file://0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch \
 "
 # Makes for a rather long rev (22 characters), but...
 #
@@ -49,6 +49,11 @@ SRCREV_FORMAT = "glibc_localedef"
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--with-glibc=${S}"
+
+# We do not need bash to run tzselect script, the default is to use
+# bash but it can be configured by setting KSHELL Makefile variable
+EXTRA_OEMAKE += "KSHELL=/bin/sh"
+
 CFLAGS += "-fgnu89-inline -std=gnu99 -DIS_IN\(x\)='0'"
 
 do_install() {
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 80a3e0b493d..fdd241d973b 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -41,6 +41,10 @@ PARALLEL_MAKE = ""
 # ensure make uses /bin/bash
 EXTRA_OEMAKE += "SHELL=/bin/bash"
 
+# We do not need bash to run tzselect script, the default is to use
+# bash but it can be configured by setting KSHELL Makefile variable
+EXTRA_OEMAKE += "KSHELL=/bin/sh"
+
 do_configure:prepend() {
 	sed -e "s#/bin/bash#/bin/sh#" -i ${S}/elf/ldd.bash.in
 }
diff --git a/meta/recipes-core/glibc/glibc/0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch b/meta/recipes-core/glibc/glibc/0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch
new file mode 100644
index 00000000000..0480c47b498
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch
@@ -0,0 +1,50 @@
+From 76d170fbbfd07b26a0288212201e5d15558db36f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 9 Dec 2021 15:14:42 -0800
+Subject: [PATCH] Make shell interpreter overridable in tzselect.ksh
+
+define new macro called KSHELL which can be used to define default shell
+use Bash by default
+
+Upstream-Status: Submitted [https://patchwork.sourceware.org/project/glibc/patch/20211209234015.1554552-1-raj.khem@gmail.com/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makeconfig        | 9 +++++++++
+ timezone/Makefile | 1 +
+ 2 files changed, 10 insertions(+)
+
+diff --git a/Makeconfig b/Makeconfig
+index 3fa2f13003..a1ea5d5571 100644
+--- a/Makeconfig
++++ b/Makeconfig
+@@ -292,6 +292,15 @@ ifndef sysincludedir
+ sysincludedir = /usr/include
+ endif
+ 
++# The full path name of a Posix-compliant shell, preferably one that supports
++# the Korn shell's 'select' statement as an extension.
++# These days, Bash is the most popular.
++# It should be OK to set this to /bin/sh, on platforms where /bin/sh
++# lacks 'select' or doesn't completely conform to Posix, but /bin/bash
++# is typically nicer if it works.
++ifndef KSHELL
++KSHELL = /bin/bash
++endif
+ 
+ # Commands to install files.
+ ifndef INSTALL_DATA
+diff --git a/timezone/Makefile b/timezone/Makefile
+index c624a189b3..dc8f5277de 100644
+--- a/timezone/Makefile
++++ b/timezone/Makefile
+@@ -127,6 +127,7 @@ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
+ 	    -e '/TZVERSION=/s|see_Makefile|"$(version)"|' \
+ 	    -e '/PKGVERSION=/s|=.*|="$(PKGVERSION)"|' \
+ 	    -e '/REPORT_BUGS_TO=/s|=.*|="$(REPORT_BUGS_TO)"|' \
++	    -e 's|#!/bin/bash|#!$(KSHELL)|g' \
+ 	    < $< > $@.new
+ 	chmod 555 $@.new
+ 	mv -f $@.new $@
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/glibc/glibc/0017-timezone-re-written-tzselect-as-posix-sh.patch b/meta/recipes-core/glibc/glibc/0017-timezone-re-written-tzselect-as-posix-sh.patch
deleted file mode 100644
index 100d08599c9..00000000000
--- a/meta/recipes-core/glibc/glibc/0017-timezone-re-written-tzselect-as-posix-sh.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2731fa0c7463cd160361a8ac92f3bd7f984d953d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Mar 2015 00:33:03 +0000
-Subject: [PATCH] timezone: re-written tzselect as posix sh
-
-To avoid the bash dependency.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- timezone/tzselect.ksh | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/timezone/tzselect.ksh b/timezone/tzselect.ksh
-index 18fce27e24..7705df83d7 100755
---- a/timezone/tzselect.ksh
-+++ b/timezone/tzselect.ksh
-@@ -1,4 +1,4 @@
--#!/bin/bash
-+#!/bin/sh
- # Ask the user about the time zone, and output the resulting TZ value to stdout.
- # Interact with the user via stderr and stdin.
- 
-@@ -34,7 +34,7 @@ REPORT_BUGS_TO=tz@iana.org
- 
- # Specify default values for environment variables if they are unset.
- : ${AWK=awk}
--: ${TZDIR=`pwd`}
-+: ${TZDIR=$(pwd)}
- 
- # Output one argument as-is to standard output.
- # Safer than 'echo', which can mishandle '\' or leading '-'.
diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index 09d8b0780f6..faef42fd5e3 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -32,7 +32,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            ${NATIVESDKFIXES} \
            file://0015-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch \
            file://0016-yes-within-the-path-sets-wrong-config-variables.patch \
-           file://0017-timezone-re-written-tzselect-as-posix-sh.patch \
            file://0018-Remove-bash-dependency-for-nscd-init-script.patch \
            file://0019-eglibc-Cross-building-and-testing-instructions.patch \
            file://0020-eglibc-Help-bootstrap-cross-toolchain.patch \
@@ -49,6 +48,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0002-CVE-2021-38604.patch \
            file://0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://CVE-2021-43396.patch \
+           file://0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch \
            "
 # Use append instead of += that way patch is applied with devupstream too
 SRC_URI:append = "\
-- 
2.34.1


