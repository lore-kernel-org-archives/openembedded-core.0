Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F38CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:44:48 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22752.1764261887365047558
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 08:44:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OwXgQ9/k;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo1189690b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 08:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764261886; x=1764866686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JuEKor2pO1rBIovM+LQXEQXRY2Fk/alSR+IYY99FRCg=;
        b=OwXgQ9/kLVS8mrjcX2ZMLZxb1cztOVVDgWfP6Vrds0eSpdtqHOh4hcO0oZI6Gumd9h
         TPZvZ3Dh8HX2xXwXj2N93C3/49DHH8Q4FaXRSzjO8BWx3gdzWBrC5dRTL5PuLMqddIvF
         sy6V1gFIEN0fE4YvQP/sOy80ZTYjIKiTbSfGZJ8P4BYBd1P9/D06llA4LKKht8EQaqGf
         oINEttWa9XVurE5U1NJoCXk544+Xj4FsASimvxkx5GdEO8Qa7vh86F/Q7HdLXZfpyZ2I
         plzTzXKJfT1JvBR4CwxT+eQhnqYWNTqfZbnZstfvfZZL0KDotMz3m+l+7YZCTha71wbT
         ooLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764261886; x=1764866686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuEKor2pO1rBIovM+LQXEQXRY2Fk/alSR+IYY99FRCg=;
        b=SmS/TefOzyVXFL//fs/xnWkDRy452/o4vE4tr7la2YbtOJN+6R3YGWNlqOBDcE182p
         vy0A8nEk9jQDKsKCnXmcOZFewRw+tBqI4ig3/YVY60skrSUUieHXPbd2tmkcmHEuC+6E
         RhCDXFeKnCtZYIs0IX5n6YCAwjB4RPrLljjrw6jHtOKYBhX6h6HWC4Z480W6+5sedXs2
         6Rq+BjcLOLYorSTikQt8fF+IpGuYzCD5ILzlkZecY9qVdSieOPradESbTbBgtzOBV0Vf
         rbZPTtUVgCrBVqK1GUgGLzIrnL20PUXtePBlDiZhtMZFm0T6wpsTBAUdhCRhf2eZLOW5
         Y6pA==
X-Gm-Message-State: AOJu0YwVkxfvZ2lgM7s4Ex2ieNnI08HSwznoXKQa2Bzsq5eTfbUKslsQ
	uAXlUaZ3WFKMus+lpPF1m4EstAwm/dZhj7ROT+BJ8r1asJwFrKWz4177RNAzNw0r
X-Gm-Gg: ASbGncvhJ4n/OzJ12UQE0DwfAV8abeiNzZiyae+vtdwgoXQ664Zp0I1cblZLqbrSrdA
	poiWl8uZXHqbOk3Dg47r8G/8ZfTN5wiUi07Ij4O6uHsAWwmFsvILIqS7/vA++jy8w2G2t7rSfl9
	eQaEUo8eWgZSj3/6lgOvLagXlb3D7+ByCtOsTOlMFXIJCfMAPp7gR0lgxLBkT1IGa48SOaEuWUC
	pZhj+aXhd/s6zeHKh3eVaSZixQmJP3jO+OmmSVl6AwXVinCLU3+RPslGEUa1TsEl7iS5SKvryMH
	QgVFCK63W7glSk+7DGDv6N5jFxCw6rO0kXaSznvrLaMe7leqoyskDY53WRqA/MiF08NMeQlQBtN
	HtOPf/fPbsnn9P+uN3s9gavPpt5gaTuOWXCWcXVnPXj4PI2vrDV5fChgxx2cvg40AMRtuGs4XLI
	GyLjZlYk01af/eUHJccJTKsG99COA715rctZjTRq8VdgJX6EoAOoCE4QjJbgts0pNYhmzIosAcE
	IhJuI9BrF0i1mq8fGTkAp2CU2XfB7jw
X-Google-Smtp-Source: AGHT+IE92JsrDV5FzPV5Y5mBmAn81bHMr+Ifn3jrcsmk/RXhPxwS0OsU+BfMWXaesSiF1dujHWxqew==
X-Received: by 2002:a05:7022:619e:b0:11b:9386:a3c5 with SMTP id a92af1059eb24-11c9d873794mr19933722c88.48.1764261886258;
        Thu, 27 Nov 2025 08:44:46 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::7c49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb04a07bsm7757678c88.7.2025.11.27.08.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:44:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] autoconf: Raise line length limit for sed/awk
Date: Thu, 27 Nov 2025 08:44:43 -0800
Message-ID: <20251127164443.2285753-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 16:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226850

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
 ...-command-limit-to-prevent-line-wrapp.patch | 41 +++++++++++++++++++
 .../autoconf/autoconf_2.72.bb                 |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch b/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch
new file mode 100644
index 00000000000..41468ba316c
--- /dev/null
+++ b/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch
@@ -0,0 +1,41 @@
+From 139f757a6244d3b1e07f7fddc6d07d9c17f45313 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 25 Nov 2025 21:03:38 -0800
+Subject: [PATCH] Increase awk/sed command limit to prevent line wrapping
+
+Autoconf 2.70+ wraps long variable assignments in config.status
+using backslash-newline continuations. This breaks when LDFLAGS
+or other variables contain special characters.
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
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72.bb b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
index b599f270c79..20197d6f793 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A GNU tool that produce shell scripts to automatically configure software"
-DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \ 
+DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \
 configure software source code packages. Autoconf creates a configuration script for a package from a template \
 file that lists the operating system features that the package can use, in the form of M4 macro calls."
 LICENSE = "GPL-3.0-or-later"
@@ -19,6 +19,7 @@ SRC_URI = " \
            file://preferbash.patch \
            file://autotest-automake-result-format.patch \
            file://man-host-perl.patch \
+		   file://0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch \
 "
 SRC_URI:append:class-native = " file://no-man.patch"
 

