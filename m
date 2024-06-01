Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A2AC27C52
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:16 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.36164.1717244714334990123
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PLoFlLh/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f44b441b08so22904365ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244713; x=1717849513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjUL/IQ/4U2RiN0JQSp47ZCPgdCDFyr317UBmYQYTTg=;
        b=PLoFlLh/dCXRqzxCnRyj6EU5+mhPG1CjVaaSE32QWvQmf2ZVDDkNin8vsDfzJRhMg2
         fSEi6gNhV1tTtmfmwKB4kk7ZXAvfzluI08ImuhZW2JLcC9w61ighUNQYAdUhBEWrfHel
         CKCko9/RLJmB42MrDYWjsWkiPenadCXbT0EHN7Kspcv0J6/mio/Xlyzf/p1iAHVxuesr
         C/GuGTV6sHglrNE69FwZK8FR4QzXGIYwl9WR7M277mW1hjLIh87xdzD60wurI5v8BbK3
         1lrvxlpnLH94+eTGy9eyY181CoMOmBdNRPt0Hkj0qvCiQPVcwC0y0BUiiR76zldxxgH6
         6zgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244713; x=1717849513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjUL/IQ/4U2RiN0JQSp47ZCPgdCDFyr317UBmYQYTTg=;
        b=PWJoLrOKgR6wYdvrYgHlKe84C5o0EN57qT+26a2jJiEhfb/g/vnlt5bNsjk2IIaqvC
         3LOewhMIbrCqw5CY0XEvoKefMClEmkzGXYEHXnYQL1hC3VwxycnzAMhYCVTD/PFWh7IV
         rEas3lfluaFyYCQGiEA75N50FtTqowg1r5WnUUocVZHC5IaqGqJGutatTT+b/bG9/rji
         6av5mC2k1eEAqCvG1zVdmikszl152QzSYpRJDDCmB2f4wPQkSSGf8vAbo2ZWhwYAVAHd
         1wBHydg1g19t4id2kRiBHhoyEWild8gVQuVamnYPFDE7/U/+gg6qdY5IdvvENu6E5o0V
         NZBQ==
X-Gm-Message-State: AOJu0YwmVq0EuThV83+xC4c3rJQnfg+68SmTsJhFOIp2/+ywqBFJ4HnD
	CQMO1wJ/y0hEn+hTRKYCF1u/8qcL52YTt6asBoc1r+DfuaLFiDS6h38cc/mXANO7nOqOrRUsrmX
	o
X-Google-Smtp-Source: AGHT+IEfBL0B5Ep8tOzFUAJOp0iROL0I6B4WoNpRD3TGiWJdT2iBzVYXWpekQJNxwQ8FfEMUaddapw==
X-Received: by 2002:a17:903:22c8:b0:1eb:1af6:e7ea with SMTP id d9443c01a7336-1f637062db1mr51371935ad.34.1717244713450;
        Sat, 01 Jun 2024 05:25:13 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.25.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:25:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/21] libarchive: upgrade 3.7.2 -> 3.7.4
Date: Sat,  1 Jun 2024 05:24:40 -0700
Message-Id: <1c789d692e0bbea4c26cfad8c36abf051f54a444.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200110

From: Yogita Urade <yogita.urade@windriver.com>

Changlog:
========
   rar: Fix OOB in rar e8 filter
   zip: Fix out of boundary access
   7zip: Limit amount of properties
   bsdtar: Fix error handling around strtol() usages
   passphrase: Improve newline handling on Windows
   passphrase: Never allow empty passwords
   rar: Fix "File CRC Error" when extracting specific rar4 archives
   xar: Avoid infinite link loop
   zip: Update AppleDouble support for directories
   zstd: Implement core detection
   PCRE2 support
   add trailing letter b to bsdtar(1) substitute pattern
   add support for long options "--group" and "--owner" to tar(1)
   Fix possible vulnerability in tar error reporting introduced in f27c173
   ISO9660: preserve the natural order of links
   rar5: fix decoding unicode filenames on Windows
   rar5: fix infinite loop if during rar5 decompression the last block produced no data
   xz filter: fix incorrect eof at the end of an lzip member
   zip: fix end-of-data marker processing when decompressing zip archives
   multiple bsdunzip(1) fixes
   filetime truncation fix on Windows

Adjusted configurehack.patch to align with upgraded version.

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/libarchive/configurehack.patch | 19 ++++++++++++-------
 ...ibarchive_3.7.2.bb => libarchive_3.7.4.bb} |  2 +-
 2 files changed, 13 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.7.2.bb => libarchive_3.7.4.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive/configurehack.patch b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
index f3989d99eb..44720fdd53 100644
--- a/meta/recipes-extended/libarchive/libarchive/configurehack.patch
+++ b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
@@ -2,12 +2,15 @@ To work with autoconf 2.73, tweak the macro ordering in configure.in.
 
 Upstream-Status: Pending
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ configure.ac | 26 +++++++++++++-------------
+ 1 file changed, 13 insertions(+), 13 deletions(-)
 
-Index: libarchive-3.6.2/configure.ac
-===================================================================
---- libarchive-3.6.2.orig/configure.ac
-+++ libarchive-3.6.2/configure.ac
-@@ -357,6 +357,19 @@ if test "x$with_bz2lib" != "xno"; then
+diff --git a/configure.ac b/configure.ac
+index 5668d41..7e65e49 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -414,6 +414,19 @@ if test "x$with_bz2lib" != "xno"; then
    esac
  fi
  
@@ -27,9 +30,9 @@ Index: libarchive-3.6.2/configure.ac
  AC_ARG_WITH([libb2],
    AS_HELP_STRING([--without-libb2], [Don't build support for BLAKE2 through libb2]))
  
-@@ -558,19 +571,6 @@ LDFLAGS=$save_LDFLAGS
+@@ -678,19 +691,6 @@ fi
  
- AC_SUBST(GC_SECTIONS)
+ AC_SUBST(DEAD_CODE_REMOVAL)
  
 -# Checks for typedefs, structures, and compiler characteristics.
 -AC_C_CONST
@@ -47,3 +50,5 @@ Index: libarchive-3.6.2/configure.ac
  # Check for tm_gmtoff in struct tm
  AC_CHECK_MEMBERS([struct tm.tm_gmtoff, struct tm.__tm_gmtoff],,,
  [
+--
+2.40.0
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.2.bb b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.7.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.4.bb
index 91f521fa4d..da85764116 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 SRC_URI += "file://configurehack.patch"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "df404eb7222cf30b4f8f93828677890a2986b66ff8bf39dac32a804e96ddf104"
+SRC_URI[sha256sum] = "7875d49596286055b52439ed42f044bd8ad426aa4cc5aabd96bfe7abb971d5e8"
 
 CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
 
-- 
2.34.1


