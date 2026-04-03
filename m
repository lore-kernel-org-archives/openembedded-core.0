Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250A5E88D68
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 21:30:44 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5465.1775251842396954433
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 14:30:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lPT+encR;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2cbdd9852aaso1602986eec.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 14:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775251841; x=1775856641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xcOFnjRr2CaWAooOel+0+WnlBUpBGR74vG1ug4xn+lU=;
        b=lPT+encRoUwctqBuWFx+MqjbdF0s7AZSEtDAwUJFy5pYnxvocpmSpiNDKNKyCBIEHZ
         9jiHxZ3aC/W5JRb1qgd6FRNTvLpcSlmDYfdwtJqnxViRBq0GO/gbNwRaQPuA7Hf4tHnr
         YldMRSN1HedOl/dH9rDF0c8VLK4pxrODNBw/OaZfjh94MTUEn3o1Kd1qWF5XDO0gANMz
         mY97ygnlWAmBtgHq8z2Vsh9px2DLF4qt34VYWMl432AmkL3K/OCSCcjkoyYRKkX3Jwyv
         LbKf96OLGTYOCJnsaEv6AsUag5mk6uJQjQ8UwJK1tiwVjs2TGLRyKBZ1tAo1AGaC/IAz
         yMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775251841; x=1775856641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcOFnjRr2CaWAooOel+0+WnlBUpBGR74vG1ug4xn+lU=;
        b=jTE9c1GgS4R8LnmCBgEMCnCJ7wp3bHoAQ51sLtxZ1Xv8Klw0UkK1MmMe+ZebafTNXi
         dAz1jfgb9J6y68TqbAAk/fSgjr7STP+3Ivllp8nMZuKeWltoAVtaTHVrrE+YSHRoX/VB
         Svb66MXQvJB8i7I0HHCnpsNYec/t5C2RXlMht26rl9NomFDb3XiZN1lbWtDOqANuOO3k
         defF4mlDDiPY176JJE1Xxh5L8U7ucGzrmRIyhMr2RekIY4f82z5C6O6dOCpNnn8wkGCL
         T78hOWFTChb6P0pbApkzdaLjHrHARU6GpFtdg7y4CpXpoeDaB3k9JTIJ8ngzfh+sRZee
         nwAA==
X-Gm-Message-State: AOJu0YwhKo9FLJrSqjCRiRnmhixQZtsqHLse4N6wh9bQlFrYA3tPc9g/
	kVAtW87BY4/lpvPS2aBWlmdG9qiX0o2N1OarbB6wWOz+Zqn4iFxQ5kj8i+sWvGr1
X-Gm-Gg: AeBDieue3r6xp7xn2kQbFuDcSoriy1737Irjt33xo45GTHLCkBEYULZnRho3SdCs4fS
	wloGEPSJmtsFiM/gFHYbRSLoUBao/V6HOKE3nKOlxiXxeEQNGsu7/rGHXQuDjdn+/oATEs61MEn
	TdH5dGeEjHS3NfrZBNh9fpqN8YR0vxSe50zbko7+OeTwoXXsr3rHUdIZqdECdvm+ZKs21Rtpl/v
	Pa+DLiURmgC0OmPm92NDM6ndXgiBUKiVppOg++hm/qZKtT7jt4VLD65gVHaiJrxX6R7yzh8HtT6
	qJ2H7q3rK+xTS/pXdKXxdnI52t4gBFdK5zU/w84kBitoRx9FulIaypAFGaGOf1AFufFe2q+bIj7
	8FS42j/ag3vJ3f7xey015Mi8C7XEQcyCv5+Y3iZ+S8v6HD3m0+bF6LBOvotNcwSeAaDcNThNTTf
	8Q0hCI/YwQx1PVvII6dV+mZaHoQtLN379PTwvBh36KKPb07lPUbfNy7ycHhqR+ulZxMSP+LXwd5
	d9boXnQoEjBnQVecKpOAEUx3yydUmDfzUXWkqp5zXJtgorCIl86/7XHIRVN
X-Received: by 2002:a05:7300:e619:b0:2c8:8e74:4eca with SMTP id 5a478bee46e88-2cbfbf794f7mr2328108eec.19.1775251841364;
        Fri, 03 Apr 2026 14:30:41 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20b2b1sm6524016eec.18.2026.04.03.14.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:30:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] autoconf: Raise line length limit for sed/awk
Date: Fri,  3 Apr 2026 14:30:38 -0700
Message-ID: <20260403213038.3278233-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 21:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234600

From: Khem Raj <raj.khem@gmail.com>

Latest autoconf is splitting long cmd lines in config.status
it generates using sed/awk to have compatibility with
platform like HPUX,Solaris,AIX which is understandable given
autotools try to achieve wider portability, however, this does
mean that in OE builds we might get these newlines added in
places dividing commands including buildpaths in them and the
methods deployed to scrub them from output artifacts will fail
since the string is now on two lines resulting in build QA to
pass but the strings do sneak in affecting reproducibility
one such example is e2tools recipe in meta-filesystems and there
perhaps are more

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Improve patch commit message so we don't forget the reason to do it

 ...-command-limit-to-prevent-line-wrapp.patch | 47 +++++++++++++++++++
 .../autoconf/autoconf_2.73.bb                 |  3 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch b/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch
new file mode 100644
index 0000000000..4caeb7e39e
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch
@@ -0,0 +1,47 @@
+From 139f757a6244d3b1e07f7fddc6d07d9c17f45313 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Nov 2025 21:03:38 -0800
+Subject: [PATCH] Increase awk/sed command limit to prevent line wrapping
+
+Autoconf 2.70+ wraps long variable assignments in config.status
+using backslash-newline continuations. This breaks when LDFLAGS
+or other variables contain special characters.
+
+In OE, buildpaths will be part of flags such as LDFLAGS or CFLAGS
+and they might end up being linewrapped now. OE recipes do have
+mechanisms to scrub the absolute paths for achieving reproducibility
+which fails when linwrapping happens as the strings get divided and
+the checks for scrubbing become ineffective.
+
+Increase _AC_SED_CMD_LIMIT from 99 and _AC_AWK_LITERAL_LIMIT
+from 148 to 4000 to prevent wrapping.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/autoconf/status.m4 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/autoconf/status.m4 b/lib/autoconf/status.m4
+index 2bfaf32..be444b2 100644
+--- a/lib/autoconf/status.m4
++++ b/lib/autoconf/status.m4
+@@ -297,7 +297,7 @@ AC_DEFUN([AC_CONFIG_FILES], [_AC_CONFIG_FOOS([FILES], $@)])
+ # Some seds have small command number limits, like on Digital OSF/1 and HP-UX.
+ m4_define([_AC_SED_CMD_LIMIT],
+ dnl One cannot portably go further than 99 commands because of HP-UX.
+-[99])
++[4000])
+
+
+ # _AC_AWK_LITERAL_LIMIT
+@@ -307,7 +307,7 @@ dnl One cannot portably go further than 99 commands because of HP-UX.
+ #
+ # Some awk's have small limits, such as Solaris and AIX awk.
+ m4_define([_AC_AWK_LITERAL_LIMIT],
+-[148])
++[4000])
+
+
+ # _AC_OUTPUT_FILES_PREPARE
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.73.bb b/meta/recipes-devtools/autoconf/autoconf_2.73.bb
index 2dd8fb2772..227fd043cc 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.73.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.73.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A GNU tool that produce shell scripts to automatically configure software"
-DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \
+DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \
 configure software source code packages. Autoconf creates a configuration script for a package from a template \
 file that lists the operating system features that the package can use, in the form of M4 macro calls."
 LICENSE = "GPL-3.0-or-later"
@@ -17,6 +17,7 @@ SRC_URI = " \
            file://remove-usr-local-lib-from-m4.patch \
            file://preferbash.patch \
            file://autotest-automake-result-format.patch \
+           file://0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch \
 "
 SRC_URI:append:class-native = " file://no-man.patch"


