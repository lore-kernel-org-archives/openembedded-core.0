Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9716C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 21:51:24 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.160213.1783371774666159736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 14:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Go8XWymQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: jakubszczudlo40@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b77b150aso32162095e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 14:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783371773; x=1783976573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5Bwu2H2m1zQBWJr1uCg7BkUWN2q6sOKk94JUkMZ9Qc=;
        b=Go8XWymQyEEPOxsIe0okr2wS6iMRco7qaPrS2yfJqvwsQtXERBg+C9wSB8x9AEykWZ
         eFmkdkcOxEEt1LfV4EwV6nLqBbTbo0FaTNGrZzFKJ8WSll+JaOrPEmXrFFAqQNlQiiGU
         wo1SHDwTO58vIxa02hyNl/70rFJkFXY72H7Elp+hY1RUrySIU6zDVWGKoz+ut8dQACUL
         8UYT/EIbCl8nI6cwGog6xKm+G6OWQdE348HxbWZaP355t1y6yco6e9LkY1NTbtSKk8DH
         lkEX1cLSFZL6YoEPFrluyTsqU1xtBKKHJ7M6PJcXfHojWR405YvXgcFNg0qYFgVTT03v
         fwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371773; x=1783976573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5Bwu2H2m1zQBWJr1uCg7BkUWN2q6sOKk94JUkMZ9Qc=;
        b=S/kMoaSfpw0iuJs3cU30IYpTQVy+sJ3uNAnRp8e2OkSIlZEyPfGlCyw0n6k8aNazdk
         gLj84mXru5NjBG7vJkCrYMTO2OJvCKRVymIHWrbeUj+ioMnP4KQMJKBsON6YzOP5FKPd
         yUq18x7Xk3k7JOYEf0mRxavnfL7qjOao4iLX/gQy1h26wBzSnizzOXwRLZcvAhR/WVKc
         jt/+JAiCAoKAjp2ppYtKt9ho2OTpgVmJz+Ro9JX9DU2dWdb3eDF8CNuu8QmBm0yDOPLC
         gut+H8DLDxI29pnDcPy8NjYN2C3QtBLi5ZKUSK2eQdg/u0loSQt37SLoy2Zl1zIfGcRy
         K7BQ==
X-Gm-Message-State: AOJu0YyBRzeHDIMQiYgPlhUTUA7kQ8hyeHAcHg51WuP29IWbh7azUvRy
	dYYgp8rLHzVnBcuvEIN8RqZdsoLNDW99ZEh7PrH6XO5MPGMEEsCjrqJz9t9yFg==
X-Gm-Gg: AfdE7clZ0qHPNUGr7SKDuHld90FrmBjibl5pF64SaImkDygU9cWcm+MTEgr6+OrvHJ1
	vz5rrO9Cdx+sD0UiwDOadrt+HPo/fkivPRauH7nS/965HiuMRjepHBV3JNjely+Igw8KWN8ORpK
	02m2KaHDPLwWtm10xKE88LyPgNHNt16JGQhUVWRjRmpr3YtlPj7QptdwSuKtHGTl3ZP0zu+Pf3G
	nrmi8AnUBkegJt/Sb6KEpYCXvAz8iKfT/z+7I+yEIyLciG8vcPKjgXuJv1siMoPbo9kpKABbn3r
	6sQ5AECLHNB2+GY3Z6+4jIzlL4gc80FUTKncngZtZqRPcXDCw9juksy+nMDpsc4Cr2PvvOEq/pd
	e/h/TlbTGPHqTHP+gEL26xDT+vk1h87p6Yza25r0woQs8LrrdDsI/C9fNRvxPyVP5C7OgdGV4eQ
	V2Q45/Cm0gzo7gjjpPbGs1Rjl2IYLXHLCk23nuw78=
X-Received: by 2002:a05:600c:628f:b0:493:92c9:1e6d with SMTP id 5b1f17b1804b1-493df08f731mr21493765e9.33.1783371772584;
        Mon, 06 Jul 2026 14:02:52 -0700 (PDT)
Received: from Nitro5-JS.kielce.vectranet.pl ([2a02:2a40:27ec:2900::3ab6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f51193sm373975e9.12.2026.07.06.14.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:02:51 -0700 (PDT)
From: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [scarthgap][PATCH v2] libgcrypt: upgrade 1.10.3 -> 1.10.4
Date: Mon,  6 Jul 2026 23:02:31 +0200
Message-ID: <20260706210232.794171-1-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 21:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240345

Release notes are here:
https://dev.gnupg.org/T8233.html
Update contains fix for CVE-2026-41989 and patch that need to be updated to
correct setting compile flags in new version.

Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
---
v2:
 - Added new patch to fix building error with '-O2' in sysroot path for libgcrypt 1.10.4, patch
   was taken from wrynose and backported.

 ...ilding-error-with-O2-in-sysroot-path.patch | 64 -------------------
 ...ilding-error-with-O2-in-sysroot-path.patch | 49 ++++++++++++++
 ...ibgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} |  4 +-
 3 files changed, 51 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} (92%)

diff --git a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
deleted file mode 100644
index dee4969f35..0000000000
--- a/meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From b99952adc6ee611641709610d2e4dc90ba9acf37 Mon Sep 17 00:00:00 2001
-From: "simit.ghane" <simit.ghane@lge.com>
-Date: Tue, 7 May 2024 14:09:03 +0530
-Subject: [PATCH] Fix building error with '-O2' in sysroot path
-
-* cipher/Makefile.am (o_flag_munging): Tweak the sed script.
-* random/Makefile.am (o_flag_munging): Ditto.
---
-
-Characters like '-O2' or '-Ofast' will be replaced by '-O1' and '-O0'
-respectively when compiling cipher and random in the filesystem
-paths as well if they happen to contain '-O2' or '-Ofast
-
-If we are cross compiling libgcrypt and sysroot contains such
-characters, we would
-get compile errors because the sysroot path has been modified.
-
-Fix this by adding blank spaces and tabs before the original matching
-pattern in the sed command.
-
-Signed-off-by: simit.ghane <simit.ghane@lge.com>
-
-ChangeLog entries added by wk
-
-Note that there is also the configure option --disable-O-flag-munging;
-see the README.
-
-Upstream-Status: Backport [https://dev.gnupg.org/rCb99952adc6ee611641709610d2e4dc90ba9acf37 https://dev.gnupg.org/rC5afadba008918d651afefb842ae123cc18454c74]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- cipher/Makefile.am | 2 +-
- random/Makefile.am | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/cipher/Makefile.am b/cipher/Makefile.am
-index 2c39586e..a914ed2b 100644
---- a/cipher/Makefile.am
-+++ b/cipher/Makefile.am
-@@ -168,7 +168,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
- 
- 
- if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/-O\([2-9sgz][2-9sgz]*\)/-O1/' -e 's/-Ofast/-O1/g'
-+o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g' -e 's/[[:blank:]]-Ofast/ -O1 /g'
- else
- o_flag_munging = cat
- endif
-diff --git a/random/Makefile.am b/random/Makefile.am
-index 0c935a05..340df38a 100644
---- a/random/Makefile.am
-+++ b/random/Makefile.am
-@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-base-user.h
- 
- # The rndjent module needs to be compiled without optimization.  */
- if ENABLE_O_FLAG_MUNGING
--o_flag_munging = sed -e 's/-O\([1-9sgz][1-9sgz]*\)/-O0/g' -e 's/-Ofast/-O0/g'
-+o_flag_munging = sed -e 's/[[:blank:]]-O\([1-9sgz][1-9sgz]*\)/ -O0 /g' -e 's/[[:blank:]]-Ofast/ -O0 /g'
- else
- o_flag_munging = cat
- endif
--- 
-2.44.1
-
diff --git a/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
new file mode 100644
index 0000000000..d1b82ec11e
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch
@@ -0,0 +1,49 @@
+From e96df0c82e086bf348753d2d0fa37fa6191b4b14 Mon Sep 17 00:00:00 2001
+From: "simit.ghane" <simit.ghane@lge.com>
+Date: Tue, 11 Jun 2024 07:22:28 +0530
+Subject: [PATCH] random:cipher: handle substitution in sed command
+
+Upstream-Status: Backport [https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commit;h=e96df0c82e086bf348753d2d0fa37fa6191b4b14]
+
+* cipher/Makefile.am (o_flag_munging): Add 'g' flag for first sed
+expression.
+* random/Makefile.am (o_flag_munging): Likewise.
+--
+
+It was there earlier and accidentally removed from
+Makefile.am of cipher and random
+
+Signed-off-by: simit.ghane <simit.ghane@lge.com>
+[jk: add changelog to commit message]
+Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
+---
+ cipher/Makefile.am | 2 +-
+ random/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cipher/Makefile.am b/cipher/Makefile.am
+index ea9014cc98..149c9f2101 100644
+--- a/cipher/Makefile.am
++++ b/cipher/Makefile.am
+@@ -169,7 +169,7 @@ gost-s-box$(EXEEXT_FOR_BUILD): gost-s-box.c
+ 
+ 
+ if ENABLE_O_FLAG_MUNGING
+-o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /' -e 's/[[:blank:]]-Ofast/ -O1 /g'
++o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O1 /g' -e 's/[[:blank:]]-Ofast/ -O1 /g'
+ else
+ o_flag_munging = cat
+ endif
+diff --git a/random/Makefile.am b/random/Makefile.am
+index c7100ef8b8..a42e430649 100644
+--- a/random/Makefile.am
++++ b/random/Makefile.am
+@@ -56,7 +56,7 @@ jitterentropy-base.c jitterentropy.h jitterentropy-base-user.h
+ 
+ # The rndjent module needs to be compiled without optimization.  */
+ if ENABLE_O_FLAG_MUNGING
+-o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O0 /' -e 's/[[:blank:]]-Ofast/ -O0 /g'
++o_flag_munging = sed -e 's/[[:blank:]]-O\([2-9sgz][2-9sgz]*\)/ -O0 /g' -e 's/[[:blank:]]-Ofast/ -O0 /g'
+ else
+ o_flag_munging = cat
+ endif
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
similarity index 92%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
index 3d49d586bb..a887dc355e 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
@@ -25,9 +25,9 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
            file://run-ptest \
-           file://0001-Fix-building-error-with-O2-in-sysroot-path.patch \
+           file://0002-libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            "
-SRC_URI[sha256sum] = "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa"
+SRC_URI[sha256sum] = "d6d2f835a79711ceba54b53d1081d388d24fb0341d79a268a6557e12908a90a0"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.47.3


