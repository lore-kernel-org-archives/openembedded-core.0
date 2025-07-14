Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B440CC83F27
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:23:43 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.82442.1752510216393486725
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 09:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NYzjdMQe;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c3d06de3so4911834b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752510216; x=1753115016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNdw2tqTVqQeZssZ/gmC04UeK3/xWW6RK+pTDFDHnno=;
        b=NYzjdMQe0c04AmGopNCubLy98BZQwM3K4XbjDFZt5aYfbVGDHsTES4MoO/TtNGtFji
         oEygZVE4owTUr0A4qUwUsMUsullGHovxVCShU9SoeniZtz1/JIrr4fSWUYSHNSkdnpGP
         Q6UMmNcIX/vKq6zv7HY0I4jPf4BvuXOfTj+xuH2SJqpOzkMVjNBHCqmKscOXrMmpijhV
         knEGz+xPiXgA86LcvJ2AO1V++LMAquGmgBvPA5bSRSrJ27PrUDZ4RSttbXm2gwxfzH0Q
         ErfbuJ3DCUC+j6wJl6AVQ1TuV6PW+9ZTuXXMx2oAVNQSH1pdCT57yRyEtOKvkLghdz5C
         ZZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752510216; x=1753115016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNdw2tqTVqQeZssZ/gmC04UeK3/xWW6RK+pTDFDHnno=;
        b=bCWao9oaDZAaMgqnUYUQJLkqgXYVDKAF2Rs6EOheU0Qj/yBMfhfBbeBkDLPKk69cGp
         djwQ0pk3cEIwCmX6AvaK7GzQtKik4rjhaSZYQ2towoqkgJ4umIUd+UhApUYSzvc7BkA+
         CDloJ/UF0FAlB03z8jsAiuYcMkdShX6Biwi+M6HwzEQgC1nJc4FM40Re4ZUFrUohRFLA
         tatwCJBsYNCOpIP7HR3+isF0QdqS8xMZKa2qQa5vUni1utYXDVOvT/eEbCp7LImKwJVI
         7X6PsGQH19KGD2gos839am2JNfAaRIHQJ2zokQwnIrsmaFSKgDRGJUN1Z5GFIMNe/H5T
         QIMw==
X-Gm-Message-State: AOJu0YzyVLOoOE2oceXEAwgfnASQodK8Kx/RWhmOkGyDvtF+mnTawNv9
	tIHWgumLhAZzv8YgnXLYMB0eAWJtyVqoU+6vMGVOtamQcgg+W0PQZ4Glf2/LQ8RggxOCbh8cmmm
	AQ8Ho
X-Gm-Gg: ASbGncvF0eDcwbD8njEV4XZL1WyvyZF5LG8Wpt3eANWOAt4jWnbGOJJJTHUeP9JcDd+
	pIvQjYkzxRBOEe/kpYxSIe0gOwrdvRBWgmHqT1MyuzpfTQzb+9mUPDU6LtdiNhlK1H/sAMzzPPE
	aftpWgFj8uRiGHoY8/+avZScDpOjuG3TCaoinYfICsd41FaewRtbK1FUKG7L068m4vfGGTJWPLv
	lDaml56rUakONjycaxpB5s0CitnkXASBJPEgFRwJqKXIAVJ831siNMeD+atzk9VFX61BbCdnsBY
	185iOsAnJv5HEnza4r6twp/MM8H6rs66Q09RceTxUuz/VCtvfkV1pKHbikSuBesqCLIZcz+Nd/X
	RpMrCBVYFpKis
X-Google-Smtp-Source: AGHT+IEPc2jcn0KJy0LwFx/5t05LVjmMYOVR6iHCTxVmNjg9h6jtD8ZnT4eQLmlZl8wsRHFQWZh/9g==
X-Received: by 2002:a05:6a00:124f:b0:748:2ff7:5e22 with SMTP id d2e1a72fcca58-74ee09afb8amr19164846b3a.10.1752510215562;
        Mon, 14 Jul 2025 09:23:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4aa7:6b72:b465:3a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5e8fsm10456053b3a.29.2025.07.14.09.23.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:23:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 12/15] libpam: upgrade 1.7.0 -> 1.7.1
Date: Mon, 14 Jul 2025 09:23:06 -0700
Message-ID: <0c405f1a60446e9e69b0ea6fc0e142eaf4243642.1752509862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752509862.git.steve@sakoman.com>
References: <cover.1752509862.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 16:23:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220250

From: Wang Mingyu <wangmy@fujitsu.com>

0001-meson.build-correct-check-for-existence-of-two-prepr.patch
removed since it's included in 1.7.1

Changelog:
===============
* pam_access: do not resolve ttys or display variables as hostnames.
* pam_access: added "nodns" option to disallow resolving of tokens as hostnames
  (CVE-2024-10963).
* pam_limits: added support for rttime (RLIMIT_RTTIME).
* pam_namespace: fixed potential privilege escalation (CVE-2025-6020).
* meson: added support of elogind as a logind provider.
* Multiple minor bug fixes, build fixes, portability fixes,
  documentation improvements, and translation updates.

(From OE-Core rev: 5e77c48e074a20e58a233ab5ed6d8ef09bbd55c8)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ect-check-for-existence-of-two-prepr.patch | 40 -------------------
 .../pam/{libpam_1.7.0.bb => libpam_1.7.1.bb}  |  3 +-
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100644 meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch
 rename meta/recipes-extended/pam/{libpam_1.7.0.bb => libpam_1.7.1.bb} (97%)

diff --git a/meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch b/meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch
deleted file mode 100644
index ef087ffc06..0000000000
--- a/meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 9b5182d4781bcd6fb37a4030faf325965fde3e93 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 28 Nov 2024 20:32:17 +0100
-Subject: [PATCH] meson: correct check for existence of two preprocessor
- defines
-
-sizeof is meant for *types*, and in case of cross compiling
-the test program produced by it has incorrect syntax
-  __NR_keyctl something;
-and will always fail to compile.
-
-* meson.build: Use cc.get_define() instead of cc.sizeof() to check for
-preprocessor symbols.
-
-Co-authored-by: Dmitry V. Levin <ldv@strace.io>
-Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/pull/861]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index f6a7dafe9..307fed0aa 100644
---- a/meson.build
-+++ b/meson.build
-@@ -198,12 +198,12 @@ foreach ident: check_functions
-   endif
- endforeach
- 
--enable_pam_keyinit = cc.sizeof('__NR_keyctl', prefix: '#include <sys/syscall.h>') > 0
-+enable_pam_keyinit = cc.get_define('__NR_keyctl', prefix: '#include <sys/syscall.h>') != ''
- 
- if get_option('mailspool') != ''
-   cdata.set_quoted('PAM_PATH_MAILDIR', get_option('mailspool'))
- else
--  have = cc.sizeof('_PATH_MAILDIR', prefix: '#include <paths.h>') > 0
-+  have = cc.get_define('_PATH_MAILDIR', prefix: '#include <paths.h>') != ''
-   cdata.set('PAM_PATH_MAILDIR', have ? '_PATH_MAILDIR' : '"/var/spool/mail"')
- endif
- 
diff --git a/meta/recipes-extended/pam/libpam_1.7.0.bb b/meta/recipes-extended/pam/libpam_1.7.1.bb
similarity index 97%
rename from meta/recipes-extended/pam/libpam_1.7.0.bb
rename to meta/recipes-extended/pam/libpam_1.7.1.bb
index 4abc52bd93..68857c5138 100644
--- a/meta/recipes-extended/pam/libpam_1.7.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
@@ -22,10 +22,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://pam.d/other \
            file://run-ptest \
            file://pam-volatiles.conf \
-           file://0001-meson.build-correct-check-for-existence-of-two-prepr.patch \
            "
 
-SRC_URI[sha256sum] = "57dcd7a6b966ecd5bbd95e1d11173734691e16b68692fa59661cdae9b13b1697"
+SRC_URI[sha256sum] = "21dbcec6e01dd578f14789eac9024a18941e6f2702a05cf91b28c232eeb26ab0"
 
 DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
-- 
2.43.0


