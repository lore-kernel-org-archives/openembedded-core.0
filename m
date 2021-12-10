Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901EDC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 00:19:33 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.590.1639095572892272139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 16:19:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BYCz+Xml;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id s137so6568763pgs.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 16:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=krPLb7vZOwsHn0MP1EablDkg31b2l3StXO07jDJuSgQ=;
        b=BYCz+Xmllq8anS5CwQCrnJXETb5/M7kmEVxs2Krw2JfhJ+PxQqj24a855f79s45/2M
         WSnpFmV0BLjfxbzczW27JN5LVdrpfp4NQCWYCC7/8TqBJWY0+gv6+FJtqaU3cM+hWcHU
         GHRyOWIlgcFx/C6fKVUpcEldnVOi62J7KePuaksdy28yu52VrWSaZKoweQwuDCuBOC/h
         h8t1wTiMZ83ShNGKtzmR9MhlMBRfLkoIrVWAQJ7I5VVb9KD2HHnsMYl9UszkF02xYHRq
         d8ipEzmiECZStKo8/GwZbYRWJXg82qOImeJibT1NxSM0W2QvHh31K6686M8R8vvsQFqS
         2bAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=krPLb7vZOwsHn0MP1EablDkg31b2l3StXO07jDJuSgQ=;
        b=eu7P8bIcU2vOaHYud9HBhGwoB1eZD/UXHQLcxT8gsq7XhD1Hdczfjujh5IxluVEDkZ
         Iyrn8nWCWXkEfLRnHnotNzZjLWT2Vxsjz/eDzKBsAcf99AEEyrt65JLf+nTaGRf6secq
         4F310j/APkL8+F9WUkVI8KtfnmQZJ1swdqSxDHuGSH/19D1H02tGexSXHAQpemMy7myl
         5OQ1tKhnsXokyiDTqvsqRZiBBMmn22pllGFsLcnoRfLsKS2nDma98Go8yPlLJ7dqQUc8
         N4edazo+InormnKFMpZbhgIB1eOTjfJ0oOf64re+OESwNaosRrDnEP4obHlzExyA+7Ru
         0mYg==
X-Gm-Message-State: AOAM532IZ4/B8kFrTfqCYf+BACi+EAO8VMliFJTNGoH0tJQ8Yl+4ZYmC
	II62euKJdAOm1noKM4gfZpWHylj764Nq2w==
X-Google-Smtp-Source: 
 ABdhPJywr3sGH8wP/LOr46nlP3Sf9gFldj89sxGRLPk0i4yQKaHKBHAq3GhRtMPAebHrNrOhFwzGdA==
X-Received: by 2002:a63:6a4a:: with SMTP id
 f71mr35834029pgc.115.1639095572156;
        Thu, 09 Dec 2021 16:19:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ce68])
        by smtp.gmail.com with ESMTPSA id q6sm690806pgs.19.2021.12.09.16.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 16:19:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Hongxu Jia <hongxu.jia@windriver.com>
Subject: [PATCH] glibc: Redo tzselect bash dependency problem
Date: Thu,  9 Dec 2021 16:19:29 -0800
Message-Id: <20211210001929.1559113-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 00:19:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159486

New patch adds a knob to select needed shell interpreter for tzselect
script, which then we excercise via EXTRA_OEMAKE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/glibc/glibc.inc             |  4 ++
 ...erpreter-overridable-in-tzselect.ksh.patch | 50 +++++++++++++++++++
 ...zone-re-written-tzselect-as-posix-sh.patch | 34 -------------
 meta/recipes-core/glibc/glibc_2.34.bb         |  2 +-
 4 files changed, 55 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0017-timezone-re-written-tzselect-as-posix-sh.patch

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


