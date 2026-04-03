Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AB5D7308C
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 02:43:09 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3689.1775184184311088577
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 19:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dcSVhpHr;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12a747e7b2fso759108c88.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 19:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775184183; x=1775788983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cy3L54/8SlWzbwopzJRSt9g75Q30Hwbmm+lGuF7+bhE=;
        b=dcSVhpHrEDB8KW9vixqXo2vvi7alxtux5qmeN2ZPwMwOmka2ljQ4l5fl+Lg4THmt+M
         6M3Sy3H43D7T2W+cNY5njaCAvQKnP23LoaZnzTvls9RR6rlhxT1TQrC8BqUG9XJSda0t
         BlTltPQQkO6F2m384EYnAmjW1VYfai4oSIepVNhsqfNBExODNpqMhmgXYXcEJaQUbJAw
         iO2+0pcooAStNbZ/O5fPNNFvc1LDToLkgex0NTwum3x+OFmvfYE2CX+r4tk16f9o/l9k
         qDH7LJPFryEPxfdgsYXyz05Zx3dkbaLOvy1GXlTLzGRjsrmDHkJlqP77KGykJCiCzYn/
         h/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775184183; x=1775788983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cy3L54/8SlWzbwopzJRSt9g75Q30Hwbmm+lGuF7+bhE=;
        b=lhgC5WHnMXNPkOXekoP/jZiVK66fAafj07NnQw+9Sjyevcbs65EmNurPwR+vurWS9O
         Y7faxF7c3lcjakQ8xW3CeR1Sr2py9/hAiUnUM7fYs7O2ZsEP9GiMModVEzB/6JKKBn/G
         mUiB0QjltL0bNns3CH37Oxvf4AHLmIdq0xdRXSo2k+Dj46mJhbpblsipiFRDVvchDYDP
         bVmyIHQfqLoxDhYQd5XxH4lyqCq847RK3QM2gMazvoRlzpbXyg8i7O3VsYcRi+m7uC9/
         qYot8PkRJFT0XlcQqKhtJDlk7ykL5BZpGKHZ+KSDjy11ulevegsgbtMWg3aW70iq8w43
         X6Fg==
X-Gm-Message-State: AOJu0YzpXwPEFzGiAYgkNQC8hC4j+iPWGPRcZxgFuLSlgfoFanvEKoF/
	tkSQT+ijR7c1TfRixeaEnA+s+OOHq5a4Txyot0n6MmPIzbNYCx10OJCWUHae1g==
X-Gm-Gg: ATEYQzx2C0tW3hNvhXf+j5p+rpQVbVIVxQm9GIRx1GFV57hxL4foS/VKnXRtpqOvy06
	kBp4/nCu6ZZyWmsp2Bmo0hBuI0B+QS6HTmXgBZjF8tv3eLJSVAAqPJZrwVxxGU/UKHvoRt7t1Ye
	Iv68BzQ4w8CFka1gRv2mY9p6ySrrDWyA7JvHqAHKB3jMcx5kNSIuKslyTT9D6QCezCyW3Vno9gS
	0Eq6L7LpsXGD6S7eB8dZnr0b9wi2mcgqJNRkr8m6790gDF+leD2aIl5uKs6P2weC4yAPJsmjMA3
	fwDJmDtOAL7OD8EH1xg8Y4H4XR+oAIfOwGUXuLCeWYtNZtfS1YkL9mb54fba/JmDNKf9H+JRD70
	n4lwdUgSa6Ithhei4/Eic+XU27yCSsOP4uPNdirumOz8Rul8kM4KLmCApMyW0wx3q/2dxCeFHf/
	EoHSC8ZnG10XuPgdUWEi9ZDNsHCrIMB2YKRT2IgJsOMFSIa1F3ndIyDG1h4vSrez25rJ/IpwFcO
	n8WK2CyjZJUpA/ZYG34fvLSR5V37RteloTuURPIwhqdVNKPryUuoH6iXsLN
X-Received: by 2002:a05:7022:43a8:b0:128:ce84:f68b with SMTP id a92af1059eb24-12bfb6ec4ffmr676631c88.4.1775184183018;
        Thu, 02 Apr 2026 19:43:03 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd4e4e3sm3366635c88.1.2026.04.02.19.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 19:43:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] autoconf: Raise line length limit for sed/awk
Date: Thu,  2 Apr 2026 19:43:00 -0700
Message-ID: <20260403024300.1195438-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 02:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234555

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
 ...-command-limit-to-prevent-line-wrapp.patch | 41 +++++++++++++++++++
 .../autoconf/autoconf_2.72.bb                 |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch

diff --git a/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch b/meta/recipes-devtools/autoconf/autoconf/0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch
new file mode 100644
index 0000000000..0713af6d7d
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
index b599f270c7..605d287e9a 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.72.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
            file://preferbash.patch \
            file://autotest-automake-result-format.patch \
            file://man-host-perl.patch \
+           file://0001-Increase-awk-sed-command-limit-to-prevent-line-wrapp.patch \
 "
 SRC_URI:append:class-native = " file://no-man.patch"
 

