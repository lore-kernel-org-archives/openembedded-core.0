Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A97AC43458
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 17:35:45 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.108907.1783150221577759542
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jul 2026 00:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OB7H8Kdn;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: jakubszczudlo40@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4759b4f0897so576143f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jul 2026 00:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783150220; x=1783755020; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4T2HJ1Abz04e9I+RY7bgLSGHPJ8fZARsiZK5luVbgQ=;
        b=OB7H8KdnSMU6iytgoMjF2wFQwlnTwVkYnjkKIxHUZp2bOdZ7K1LgjGkkI9YE4Tti6K
         t/+1j61Cm7lG/x0DppP/VsRj4DruAhXROmH7MyWkVAv9P8ZXPueMBgu6BhYRhU61nOfW
         SEP2DCbCXbZqLSl8NIdetddNVsECsvzYwQObgvSamO+ugvNzkEZIb11aYfI6zQ0Ae740
         F7SrjddSjgzbcD/j7sm5FP4VL4w+R9AVNwD7hjYebiIQOYHpS1Drac9dBoVGZuvdJCL3
         X1Jmk6enRvFCnzMA7xmMQZxTr1VgLLrWkIiUpwSUHzJq+Tg7iu0TKVCYv1hHJU2/iDom
         dqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783150220; x=1783755020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4T2HJ1Abz04e9I+RY7bgLSGHPJ8fZARsiZK5luVbgQ=;
        b=Ucm7oQMhW7MnTkAEbnoVKO5WOJmmc68Xon78sOdrsKaIzC1YJdGubEBAE7H9m9opH1
         3yxdKcAJeg8l1KNLciyDSn6CDZS3DCoaoRLyX0Nt7xQjrSQQWD4F+smKgyPWx/Pjaqwc
         f0yIcnRbIb++wBOBhiLm/CEZWlbdpedWe/Y1Ht1mht3wIV6iYfTWbTThSvACLsgHFwXz
         wcugxM9Zn5axBLBavicRggRZxBYC3CAdfcZjR3xVMarF8nzdus+n/pS+f+Tp2gRkPO/I
         XzYUpTcVpJpgT6NnoBI5vP/KLxQ6J1MvzCtkjbhCU4QMXn7NDTyl77+rhGOedOU3uie7
         BTJg==
X-Gm-Message-State: AOJu0Yx1wHvUCJWdCejAw/WcKBTU+T2Gt63pfgvYEyVf6aQ4A802OLBP
	yL04zgzUlkP35LsO1gPmb7ck+D6H0vreaIenmhNNazVrALxq6k4K44da7LaYgA==
X-Gm-Gg: AfdE7ckE6EfhZZwq7IyGrgke+PnrofzObrNdNEmB1lKuDL5LQI0X7lwEbAz5XtwafF7
	OteM8Rterg6txoN2ZkWF2Kn1VbK2M2lrl6p5N/fSyzo5/QTsk6xKEB8h/QH+oS5UyUOCay7pZXe
	5Sdwwy/DlAH1hdpy/4FYbS2sDs67leX6Axq9wOWtGPV0RMETJiG/8yH7kwPSa3gVwFSVAywzGnk
	kxtkn8yWIB1xVfTwRk7wcKhQI6t/eJKF+Y0HkRnLy4hy/cz2TqK7O5JOcYG0bKcXA6H4LSOQJc0
	AJncqGlNvbMP0efVofFc67ZKrT58cqMOf3miyP6UBPgWDkRNZvsc5Ky1y8VB5D/TvtUbz/PukHQ
	eSJfsNEyjuzKT6QK0AmZ2s5vrL2ltRDDCk9gFXN4U4v7BayxcyPbpNIYNi+DQAHtSs6YS1zdVKu
	Uj2bwvjTC3VZd8m10hRXgQPf89kqIcYlq3UUgCBn2m5xxwqnf+EoFftOeeJWPSajlhekk=
X-Received: by 2002:a05:6000:46d6:b0:473:1706:7efb with SMTP id ffacd0b85a97d-47aacab49efmr1688003f8f.43.1783150219655;
        Sat, 04 Jul 2026 00:30:19 -0700 (PDT)
Received: from Nitro5-JS.kielce.vectranet.pl (bge41.neoplus.adsl.tpnet.pl. [83.28.68.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm5737806f8f.22.2026.07.04.00.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 00:30:18 -0700 (PDT)
From: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Hongxu Jia <hongxu.jia@windriver.com>,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>
Subject: [scarthgap][PATCH] Update libgcrypt to 1.10.4
Date: Sat,  4 Jul 2026 09:29:34 +0200
Message-ID: <20260704072934.5991-1-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jul 2026 17:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240131

Release notes are here:
https://dev.gnupg.org/T8233.html
Version cointains fix for CVE-2026-41989

Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
---
 ...ilding-error-with-O2-in-sysroot-path.patch | 64 -------------------
 ...ibgcrypt_1.10.3.bb => libgcrypt_1.10.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 66 deletions(-)
 delete mode 100644 meta/recipes-support/libgcrypt/files/0001-Fix-building-error-with-O2-in-sysroot-path.patch
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
diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
similarity index 92%
rename from meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
rename to meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
index 3d49d586bb..a3b5bd06cc 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.10.4.bb
@@ -25,9 +25,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.bz2 \
            file://no-native-gpg-error.patch \
            file://no-bench-slope.patch \
            file://run-ptest \
-           file://0001-Fix-building-error-with-O2-in-sysroot-path.patch \
            "
-SRC_URI[sha256sum] = "8b0870897ac5ac67ded568dcfadf45969cfa8a6beb0fd60af2a9eadc2a3272aa"
+SRC_URI[sha256sum] = "d6d2f835a79711ceba54b53d1081d388d24fb0341d79a268a6557e12908a90a0"
 
 BINCONFIG = "${bindir}/libgcrypt-config"
 
-- 
2.47.3


