Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46BEF459EF
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 17:01:27 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.161239.1775840481024196912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 10:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MTDNMiYm;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2cf1646bd11so3998952eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 10:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775840480; x=1776445280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7RFWXmzyr3LNJW337bTK3gzijYusroM2yh4M7baToGw=;
        b=MTDNMiYmEYCy1gkg2SGBazom5o+qB9E2aZQKM11LAC3d+jnBWGeDmeNDz5AtVjO7/w
         fpdAyafOwgq/+/PwKrFYeQSiwffX2g/ZYb+5JFUPwDkifs9fMey2X3iZ60BWXhSBQ9ei
         Y5XIMjiiW6B+ZawV1v8lCJUtATtQTBtkk1JG4Mp/oO3OcSrLfmmB/QJg+DdoQIfkrfJw
         nhKaGXwviSlaBVvmyxzSSBNkxsGtdfboBsTE+TvFE2l9BLHNHaEmyQ04IfVW8PTzQVYh
         03H+6rG/ocHR52ZYPfdO0nlFYbrz7LrTjfjrr772o//I7qPQWvJHxcOICT867ULEAYqf
         7ZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775840480; x=1776445280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RFWXmzyr3LNJW337bTK3gzijYusroM2yh4M7baToGw=;
        b=VwiOEFqTq/JJ5NYu03zUnUzB/q/ReYPVUgIQgtBqD7Jc/1TPXGNiDJt32Zd/lZo8rd
         g73/v54Bc2dAHMB60c2tZUh8s+6FFsvaxxwZu43Q29WTBovRhktSh3oOiUBfmTYPcHk4
         lN+GT4LJZ7+ssRAu50DM+QljOozXMLq+2VjhlCTQPAb5IiThs0waFGCAeFa05DJuDMwt
         UHHijDsk2AowHTfjIMgd6SiBps1UzRwUx+Lat2ObjS7Uqi6gvGiLB+AzMBAgDt2wXZo0
         uulVIMYdHstyIhkxXn5qvuF0Nf20jCi5J7SQGoM0KZRnwPI9nJCiXjmX5uCMN662Xj4/
         QiHw==
X-Gm-Message-State: AOJu0Yw47HbtBw13uLguOhCVasQ6QYqJdWPHI/YXT3jiJ3cTjY3cUvus
	1DbgiCGZurB5/P4wW4EfClgiwvj//BGm64wpaD9mJA8RSnqpxtFC8BD5lebfasko
X-Gm-Gg: AeBDietBvqHsRvK66pfuPCxadGhXcFtlArOLXWDrKbYcgbK+l553uwNyH2XezQscaa3
	7kN2vGlZyyI+yuTV43gao+68SqfRYCAPVOA4GUPv9zMmjsdhm+nrUnrFKhciSgSxUOam9tyJV1j
	KPQw1CnQZ38mIDoX6ScvVNRI9K+lEdLdvPLwjH+1WFfhPr+TG1LU8gVGMdl/DxTOicGZNGpZ48f
	7/mUQWUp1OeHqdhmEbFraC6jxA/JlcS8ULl7Y9r6MSq5A76aW4cIDsutbq7HN1KMqmruCXPf+Pb
	85hBukF5bjRcPo9tyFnZaLBmfmRw2z8lWDTBZvXDjrpmC8qvW9amsf2fhpirbLBiNVV/0KhKM2j
	8Fh2s5/AjjxaqY7/zEAzKAwv/Rq3bak1uZJQN0lglZDgHhAyQ1Mk3m+/vX3liMjvUrZeuX/BfKl
	Z1huWRi0P3ju0mAwdby9y/7PKZstohUFh0D9HXTu3hGvKsY4Xn3c7pjgIIxNet1a6ear153eYdd
	RxC1Mam+LuOc1cigMdCOt6ztbEddZLRI8fkQxB2bHsKUk0S8sOUSx6wEvfp
X-Received: by 2002:a05:7300:4352:b0:2c5:60d0:7031 with SMTP id 5a478bee46e88-2d586ea749bmr2460141eec.4.1775840479755;
        Fri, 10 Apr 2026 10:01:19 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d561cd3138sm4950253eec.14.2026.04.10.10.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 10:01:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] flex: Fix build with autoconf-2.74 and gcc <= 13
Date: Fri, 10 Apr 2026 10:01:17 -0700
Message-ID: <20260410170117.237402-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 17:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235038

GCC 13 or below does not support -std=gnu23 but autoconf enforces
it on compilers which do not have C23 turned on by default

Update the autconf m4 file instead of passing cmdline option

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...uild-Support-ac_-cv_-build_prog_cc_s.patch | 52 +++++++++++++++++++
 meta/recipes-devtools/flex/flex_2.6.4.bb      |  5 +-
 2 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/flex/flex/0001-ax_prog_cc_for_build-Support-ac_-cv_-build_prog_cc_s.patch

diff --git a/meta/recipes-devtools/flex/flex/0001-ax_prog_cc_for_build-Support-ac_-cv_-build_prog_cc_s.patch b/meta/recipes-devtools/flex/flex/0001-ax_prog_cc_for_build-Support-ac_-cv_-build_prog_cc_s.patch
new file mode 100644
index 0000000000..be7cc5ff5d
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/0001-ax_prog_cc_for_build-Support-ac_-cv_-build_prog_cc_s.patch
@@ -0,0 +1,52 @@
+From 41f4c52fa5661551842c5a57a2b6f93382176bd6 Mon Sep 17 00:00:00 2001
+From: Kang-Che Sung <explorer09@gmail.com>
+Date: Wed, 16 Oct 2024 21:56:44 +0800
+Subject: [PATCH] ax_prog_cc_for_build: Support ac_{,cv_}build_prog_cc_stdc
+
+Improve compatibility with Autoconf 2.70 and later. Add support for
+these variables for indicating build compiler capabilities:
+* ac_cv_build_prog_cc_stdc (corresponding to ac_cv_prog_cc_stdc;
+  Autoconf 2.70)
+* ac_build_prog_cc_stdc (corresponding to ac_prog_cc_stdc;
+  Autoconf 2.70)
+* ac_cv_build_prog_cc_c23 (corresponding to ac_cv_prog_cc_c23;
+  Autoconf 2.73)
+
+Upstream-Status: Backport [https://github.com/autoconf-archive/autoconf-archive/commit/8a970ce96721f516fef4226e5eca8da341159765]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ m4/ax_prog_cc_for_build.m4 | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/m4/ax_prog_cc_for_build.m4 b/m4/ax_prog_cc_for_build.m4
+index 77fd346..d48e622 100644
+--- a/m4/ax_prog_cc_for_build.m4
++++ b/m4/ax_prog_cc_for_build.m4
+@@ -45,9 +45,12 @@ dnl Use the standard macros, but make them use other variable names
+ dnl
+ pushdef([ac_cv_prog_CPP], ac_cv_build_prog_CPP)dnl
+ pushdef([ac_cv_prog_gcc], ac_cv_build_prog_gcc)dnl
++pushdef([ac_cv_prog_cc_c23], ac_cv_build_prog_cc_c23)dnl
++pushdef([ac_cv_prog_cc_stdc], ac_cv_build_prog_cc_stdc)dnl
+ pushdef([ac_cv_prog_cc_works], ac_cv_build_prog_cc_works)dnl
+ pushdef([ac_cv_prog_cc_cross], ac_cv_build_prog_cc_cross)dnl
+ pushdef([ac_cv_prog_cc_g], ac_cv_build_prog_cc_g)dnl
++pushdef([ac_prog_cc_stdc], ac_build_prog_cc_stdc)dnl
+ pushdef([ac_cv_exeext], ac_cv_build_exeext)dnl
+ pushdef([ac_cv_objext], ac_cv_build_objext)dnl
+ pushdef([ac_exeext], ac_build_exeext)dnl
+@@ -105,11 +108,14 @@ popdef([CPP])dnl
+ popdef([CC])dnl
+ popdef([ac_objext])dnl
+ popdef([ac_exeext])dnl
++popdef([ac_prog_cc_stdc])dnl
+ popdef([ac_cv_objext])dnl
+ popdef([ac_cv_exeext])dnl
+ popdef([ac_cv_prog_cc_g])dnl
+ popdef([ac_cv_prog_cc_cross])dnl
+ popdef([ac_cv_prog_cc_works])dnl
++popdef([ac_cv_prog_cc_stdc])dnl
++popdef([ac_cv_prog_cc_c23])dnl
+ popdef([ac_cv_prog_gcc])dnl
+ popdef([ac_cv_prog_CPP])dnl
+
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 0507d4e300..bbaa6f3998 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/flex-${PV}.tar.gz \
            file://0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch \
            file://0001-build-tests-add-missing-parser-scanner-dependencies.patch \
            file://0001-Match-malloc-signature-to-its-use.patch \
+		   file://0001-ax_prog_cc_for_build-Support-ac_-cv_-build_prog_cc_s.patch \
            "
 
 SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995"
@@ -36,10 +37,6 @@ inherit autotools gettext texinfo ptest github-releases
 M4 = "${bindir}/m4"
 M4:class-native = "${STAGING_BINDIR_NATIVE}/m4"
 EXTRA_OECONF += "ac_cv_path_M4=${M4} ac_cv_func_reallocarray=no"
-# Don't let autoconf smarts to detect C standard, flex code does not need C23
-# which is what it will enforce see
-# https://savannah.gnu.org/support/index.php?111401
-CACHED_CONFIGUREVARS:append:toolchain-clang = " CFLAGS='${CFLAGS} -std=gnu17'"
 
 EXTRA_OEMAKE += "m4=${STAGING_BINDIR_NATIVE}/m4"
 

