Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639AECAC593
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:48 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.41411.1757580702474802276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bYiwVd0i;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so3184065e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580701; x=1758185501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyiseXmVclp/eAKGg/+/+CdMQJw1TqDBxegntCIgWZ0=;
        b=bYiwVd0iLGAVXWPvwaMbUONPufAPV+SaANHCHzwl/yA1S2ycZs8h0QwPlJEVgTSwzM
         7qB1yjuZwCgTqrNzIdtxKOvfnCzqDtWH1vGtBrAq+oC3tBwtwn5yEaX+lGmWHrC7Mmka
         GdfXF37+6NMEBtFwriUvELLEeZUjvAe+qj9IFobpD7ZRPAFqjU8oeeYyfxbtkTEgna4e
         2YtGQaDxGSdkfe3pdRRTuQsVn4gN83Gwlsx9VUgfPF7Hx9ZlJaYTdHoQ46HHo7r4XqCZ
         nNQy0bVG/ipvbnoupT+H+pV3eY2MDOvOGWFbYAl3SiE4AMMCvaDWkU49GIjZpoBrhdnO
         ZF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580701; x=1758185501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyiseXmVclp/eAKGg/+/+CdMQJw1TqDBxegntCIgWZ0=;
        b=n5JxnoVyzOtpBKY4AI2nkYey1KyLJzcC55xQf4qP8Nt13ijc0yNKEtHECWajmlFMye
         Z4wS3v3GKBoNTcAkCAw/5iYzorpwMyjiwYmNvvoR8eZTywUJzkI91S6eS36Os0VMtrtU
         px40A7g4srfBEBfrOZpU4OA7bU96zlxzVoOWBfSuaQ8k7bgjRO2xprvOeO6uBe0vDlSE
         G2Kp/DnTEGa7ZC5+GNd+y9qI99XBYUsjDDIMN3pafl4zjYp2xLfOcbWCQjhj84/z8KHC
         7QRF2Hk5vL2XKWfMZ0ELfDmzlzZdKiIoFvGtTHKzrV4E5SCwXoh6khca9YvSJwuVhTSl
         6Y9w==
X-Gm-Message-State: AOJu0YyCDW0vO0cAFVnKSeVbCOIu45LMn1NQFXUHwlqgQOdEQMZvGOPg
	Xa6Qnh8aK/S3dcRZ4FXcS4evI8SRgTc9sYR7ofROWl5SeDTTku43VROFX/AmHA==
X-Gm-Gg: ASbGncttzC+tzw8dHINgarQa5cfAZYeUaT74UKIpdmjjxMGLJlaODY4tNOx5ABqyWun
	kqKu1xIhgp18JwWcqYbkyRHjTirrnf7WIfZehiSn+kfmxWxGVeMqicXkEO8/piYXh2H3Z8KmFH5
	zZT/b1mNPVyItX7JNbpLHLk3na3dH+M0aXsSmt8+Du2umB20iQw4yD145eV78DjDmABdOfu9J5o
	CsPCRN/JQILwQdgaHYp6crXZRM3mYy5+Qkr4rCNgDxgJh2rAsai5tse4+1mZ3+0x2mgF1LnVlsP
	tZW41cukpMBd0LdPIVQVElMgw1jOImX/Y88h+HP/uy/X+hTpgrs1xZuYncT6nt+LGG7k393rBx2
	1RNFsv/CL1wNzkvK4Wt9i5gPEXQ24kzHZPJlx1LDgX8UgR5ScIxgOU5PD2deUaM0IsEjxXHU8c6
	hmMwBYe9rp225FEpb1ufEfu9P7SYM5AYnphf5dVqYFIrvffI1v8CkCpxksuw==
X-Google-Smtp-Source: AGHT+IFQ8SlOZQDWKDuwEC6od7QybTOoysSWNrk/Nci+yk30WuUdPMptj5345p2I9l4mNcR2Kf/VBg==
X-Received: by 2002:a05:600c:19c7:b0:45d:dbf4:8882 with SMTP id 5b1f17b1804b1-45ddded6c74mr154208255e9.28.1757580700741;
        Thu, 11 Sep 2025 01:51:40 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:40 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/16] which: update 2.21 -> 2.23
Date: Thu, 11 Sep 2025 10:51:17 +0200
Message-Id: <20250911085123.1551425-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911085123.1551425-1-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223256

From: Alexander Kanavin <alex@linutronix.de>

This (and 2.22) is a first release in many years.

- drop tweaks and dependency on cwautomacros as that is no longer used

- drop patch as configure.ac has been rewritten

- drop --disable-iberty as otherwise built-in implementation of xmalloc() isn't enabled

Sadly, cwautomacros has been replaced by an equally custom, weird set
of macros, written by 'which' maintainer: https://github.com/CarloWood/cwm4

- one effect of that is that autoreconf isn't happy with which's configure.ac and won't run;
one is supposed to use a custom script instead: https://github.com/CarloWood/cwm4/blob/master/scripts/bootstrap.sh

- alas, that script is not shipped in tarballs; the maintainer wants
everyone to trust their 200k configure script (hello xz backdoor)

- building from git (where the script exists) is not impossible,
but that has no version tags

- so in the end configure.ac is deleted; this has an effect
of autotools.bbclass running configure instead

All this 'special handling' for what, exactly? One single-function
executable, one manpage and one info page, which should all be in coreutils
to begin with. GNU's attachment to autotools defies reason.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../which/which-2.21/automake.patch           | 19 ------------
 ...opt-Fix-signature-of-getenv-function.patch | 29 +++++++++++--------
 .../which/{which_2.21.bb => which_2.23.bb}    |  8 ++---
 3 files changed, 19 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-extended/which/which-2.21/automake.patch
 rename meta/recipes-extended/which/{which-2.21 => which-2.23}/0001-getopt-Fix-signature-of-getenv-function.patch (51%)
 rename meta/recipes-extended/which/{which_2.21.bb => which_2.23.bb} (74%)

diff --git a/meta/recipes-extended/which/which-2.21/automake.patch b/meta/recipes-extended/which/which-2.21/automake.patch
deleted file mode 100644
index 4d0f2e4d7be..00000000000
--- a/meta/recipes-extended/which/which-2.21/automake.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Update autoconf prologue to use "foreign" strictness.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index d974461..a20dfa8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1,7 +1,7 @@
- dnl Process this file with autoconf to produce a configure script.
- AC_INIT([which], [2.21])
- AC_CONFIG_SRCDIR(which.c)
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([foreign])
- AM_CONFIG_HEADER(config.h)
- AM_MAINTAINER_MODE
- 
-
diff --git a/meta/recipes-extended/which/which-2.21/0001-getopt-Fix-signature-of-getenv-function.patch b/meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch
similarity index 51%
rename from meta/recipes-extended/which/which-2.21/0001-getopt-Fix-signature-of-getenv-function.patch
rename to meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch
index e006d797d3c..c54368a0840 100644
--- a/meta/recipes-extended/which/which-2.21/0001-getopt-Fix-signature-of-getenv-function.patch
+++ b/meta/recipes-extended/which/which-2.23/0001-getopt-Fix-signature-of-getenv-function.patch
@@ -1,4 +1,4 @@
-From 16a1647fc26953fab659de5f55d4c0defdfb894f Mon Sep 17 00:00:00 2001
+From 83d2ed3fd203868a8f287d2ebedc7c304c74fbb4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 22 Mar 2025 17:56:19 -0700
 Subject: [PATCH] getopt: Fix signature of getenv function
@@ -13,27 +13,32 @@ Upstream-Status: Submitted [https://lists.gnu.org/archive/html/which-bugs/2025-0
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  getopt.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ getopt.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/getopt.c b/getopt.c
+index 9ac2ed6..b1aa322 100644
 --- a/getopt.c
 +++ b/getopt.c
-@@ -209,7 +209,7 @@ static char *posixly_correct;
+@@ -205,7 +205,7 @@ static char *posixly_correct;
  /* Avoid depending on library functions or files
     whose names are inconsistent.  */
  
--char *getenv ();
+-char *getenv();
 +char *getenv (const char*);
  
- static char *
- my_index (str, chr)
+ static char *my_index(str, chr) const char *str;
+ int chr;
+diff --git a/getopt.h b/getopt.h
+index f080053..e04e3ca 100644
 --- a/getopt.h
 +++ b/getopt.h
-@@ -103,7 +103,7 @@ struct option
+@@ -102,7 +102,7 @@ struct option {
     errors, only prototype getopt for the GNU C library.  */
- extern int getopt (int argc, char *const *argv, const char *shortopts);
- #else /* not __GNU_LIBRARY__ */
--extern int getopt ();
+ extern int getopt(int argc, char *const *argv, const char *shortopts);
+ #else  /* not __GNU_LIBRARY__ */
+-extern int getopt();
 +extern int getopt (int, char * const [], const char *);
  #endif /* __GNU_LIBRARY__ */
- extern int getopt_long (int argc, char *const *argv, const char *shortopts,
- 		        const struct option *longopts, int *longind);
+ extern int getopt_long(int argc, char *const *argv, const char *shortopts, const struct option *longopts, int *longind);
+ extern int getopt_long_only(int argc, char *const *argv, const char *shortopts, const struct option *longopts,
diff --git a/meta/recipes-extended/which/which_2.21.bb b/meta/recipes-extended/which/which_2.23.bb
similarity index 74%
rename from meta/recipes-extended/which/which_2.21.bb
rename to meta/recipes-extended/which/which_2.23.bb
index 7279a047373..e98d897e75b 100644
--- a/meta/recipes-extended/which/which_2.21.bb
+++ b/meta/recipes-extended/which/which_2.23.bb
@@ -9,21 +9,17 @@ HOMEPAGE = "https://carlowood.github.io/which/"
 LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://which.c;beginline=1;endline=17;md5=a9963693af2272e7a8df6f231164e7a2"
-DEPENDS     = "cwautomacros-native"
 
 inherit autotools texinfo update-alternatives
 
-EXTRA_OECONF = "--disable-iberty"
-
 SRC_URI = "${GNU_MIRROR}/which/which-${PV}.tar.gz \
-           file://automake.patch \
            file://0001-getopt-Fix-signature-of-getenv-function.patch \
            "
 
-SRC_URI[sha256sum] = "f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad"
+SRC_URI[sha256sum] = "a2c558226fc4d9e4ce331bd2fd3c3f17f955115d2c00e447618a4ef9978a2a73"
 
 do_configure:prepend() {
-	sed -i -e 's%@ACLOCAL_CWFLAGS@%-I ${STAGING_DIR_NATIVE}/usr/share/cwautomacros/m4%g' ${S}/Makefile.am ${S}/tilde/Makefile.am
+	rm -f ${S}/configure.ac
 }
 
 ALTERNATIVE:${PN} = "which"
-- 
2.39.5


