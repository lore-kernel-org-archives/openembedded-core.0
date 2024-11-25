Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F661D5807A
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:43 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.17083.1732536098081302478
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nDA5kWkh;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-432d86a3085so40233975e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536096; x=1733140896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XixZhLyWUYp3LdbYvoMllKbIOf4mG+4r/Qsfxm1xeNQ=;
        b=nDA5kWkhJtR4od3hE2Svyet4k67wsuRr9ONoOThTZIWMy0UxF2LJ4Fxudp+gTgd5cR
         PVq7Q14pufTnMCz8oydVHm396gdymtZqv73pbASyVpCq5R2UETZUbN4vqnv5TCu7dt+n
         +NQtt0WwoXx5l9ibhCYCueGWoWbyypCkRwi77UGW/TnnFmHgPKH+H9DCn/v1yXOTko8p
         JpUSpFL5hD38TAZPq048q8uTBetKCtjAAQ1kU2/xtnFajz6UwR3wWcxAjGy+++0PP9q5
         zJMmCvybWMRQ3WQlBCqGpiYjtOr4NEOjyzXtKI5/3ycN88+BRSbQ4G0KtK/5PIHaoIYo
         3zAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536096; x=1733140896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XixZhLyWUYp3LdbYvoMllKbIOf4mG+4r/Qsfxm1xeNQ=;
        b=DIuL92X0nO5pPM5NPUrdv32R+/w5Yv6KPSjz4MJEuQTU5qUc4971soQvWGzzSTIQPb
         QfbG0x675Mze8pgJDg3+dY9J8cDnpnG/H714nSQq53sYrgukbi388ijXQLycYHc/1rwj
         uwxKPtOR7S0I751LkYfkFi0EFoOxdTvWtvKsLOXJVcUKX4gAGboACDDHeBMGItpf6+FI
         IaxYsh1F00gKVHY28BZbTHGYN1b05ZwVAAnfsrEEGkgHI3nT3Yn6EVAzFOAoV5A6jHgd
         g+hnBR2bmdU2lGrxx5CcTfAjEIm7u0+16Fpb7ykbhJZSazRirGg4QWjKJPaa2iyDtulm
         QmPw==
X-Gm-Message-State: AOJu0Yz2OFBaGD6HOlL9QTP8zhlArJtzPdkHNCfxUtFG1kiabMJXA8SM
	mgQ4sk1Y/wvVrzfsJvAIH21x3UB7bPrsF+3OYdTrNrLhvruZfaLQJ909jw==
X-Gm-Gg: ASbGncvlCFa0MtS1tZyaxIgzUcdf+LeuLW7UfYXAgUm+0lCvKyiyeqLW5yaF/YTMXwA
	AtY2BZz8tK+QjzrNMWeLcflH900QDDMBZ+WEkrxSUrvNsOW7LU86Ttvn32rNFb7eT9mETdf1hIP
	5uZX5oH+5fE8bo+ZiSt0LZbWJYfa/Ei6At10F4c7JGOcn92RX5qNEzzzhDOyFbTGFr/lYiTAOrl
	BBiAnVvEMwpsftToQrleCbT/22WHVl6Q+MkckxqVldC3qsCvsgmekMdqxwsDYyXH3SMtQEqBMKj
	AcrtRt1tD7Q=
X-Google-Smtp-Source: AGHT+IEbaHtVbOMQOvbHmhYSCLWTOV5Qiuz2Z0SgDWccDmrwAvupcaES/+g3JFIVjruISyQghLhmqA==
X-Received: by 2002:a05:600c:4694:b0:431:54d9:da57 with SMTP id 5b1f17b1804b1-433ce4d4cfamr119666525e9.30.1732536094740;
        Mon, 25 Nov 2024 04:01:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/35] gawk: upgrade 5.3.0 -> 5.3.1
Date: Mon, 25 Nov 2024 13:01:00 +0100
Message-Id: <20241125120127.2205232-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207756

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...c-re-enable-disabled-printf-features.patch | 35 +++++++++++++++++
 ...001-m4-readline-add-missing-includes.patch | 38 -------------------
 .../gawk/{gawk_5.3.0.bb => gawk_5.3.1.bb}     |  4 +-
 3 files changed, 37 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
 delete mode 100644 meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
 rename meta/recipes-extended/gawk/{gawk_5.3.0.bb => gawk_5.3.1.bb} (94%)

diff --git a/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch b/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
new file mode 100644
index 00000000000..4fe60c7cb83
--- /dev/null
+++ b/meta/recipes-extended/gawk/gawk/0001-configure.ac-re-enable-disabled-printf-features.patch
@@ -0,0 +1,35 @@
+From 879fb11c7c006a8533a092fb75b38d84cc570d83 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 22 Nov 2024 12:13:58 +0100
+Subject: [PATCH] configure.ac: re-enable disabled printf features
+
+This is needed for ptests to pass for one thing.
+
+Upstream-Status: Inappropriate [needs a config option]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index cb99ffe..5fe792f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -398,7 +398,7 @@ int main()
+ ])],
+ 	has_f_format=yes,
+ 	has_f_format=no,
+-	has_f_format=no  dnl Cross-compiling, assuming the worst.
++	has_f_format=yes  dnl Cross-compiling in oe-core
+ )
+ if test "$has_f_format" = yes
+ then
+@@ -427,7 +427,7 @@ int main()
+ ])],
+ 	has_a_format=yes,
+ 	has_a_format=no,
+-	has_a_format=no  dnl Cross-compiling, assuming the worst.
++	has_a_format=yes  dnl Cross-compiling in oe-core
+ )
+ if test "$has_a_format" = yes
+ then
diff --git a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch b/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
deleted file mode 100644
index 6fffd1f373a..00000000000
--- a/meta/recipes-extended/gawk/gawk/0001-m4-readline-add-missing-includes.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 4f4e84f139e2a8682f1374a592f2636c43ad857b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 21 May 2024 15:10:11 +0000
-Subject: [PATCH] m4/readline: add missing includes
-
-The cross-specific code fragment only includes stdio.h, where the native
-fragment also includes fcntl.h and unistd.h.  This is important because
-GCC 14.1 has made the implicit definitions an error:
-
-conftest.c: In function 'main':
-conftest.c:144:9: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
-conftest.c:146:14: error: implicit declaration of function 'open'; did you mean 'popen'? [-Wimplicit-function-declaration]
-
-Add the missing includes so that the check doesn't always fail due to
-these errors.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gawk.git/commit/?id=c1613c310d71b87f509458e0259ecd10eda2b140]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- m4/readline.m4 | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/m4/readline.m4 b/m4/readline.m4
-index 38f96326..efd52d4e 100644
---- a/m4/readline.m4
-+++ b/m4/readline.m4
-@@ -66,6 +66,8 @@ dnl action if false:
- dnl action if cross compiling:
- 		[AC_LINK_IFELSE(
- 			[AC_LANG_PROGRAM([[#include <stdio.h>
-+#include <fcntl.h>
-+#include <unistd.h>
- #include <readline/readline.h>
- #include <readline/history.h>]],		dnl includes
- 			dnl function body
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/gawk/gawk_5.3.0.bb b/meta/recipes-extended/gawk/gawk_5.3.1.bb
similarity index 94%
rename from meta/recipes-extended/gawk/gawk_5.3.0.bb
rename to meta/recipes-extended/gawk/gawk_5.3.1.bb
index ac9d8500d60..bd72fbf2808 100644
--- a/meta/recipes-extended/gawk/gawk_5.3.0.bb
+++ b/meta/recipes-extended/gawk/gawk_5.3.1.bb
@@ -16,11 +16,11 @@ PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
 PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
-           file://0001-m4-readline-add-missing-includes.patch \
            file://run-ptest \
+           file://0001-configure.ac-re-enable-disabled-printf-features.patch \
            "
 
-SRC_URI[sha256sum] = "378f8864ec21cfceaa048f7e1869ac9b4597b449087caf1eb55e440d30273336"
+SRC_URI[sha256sum] = "fa41b3a85413af87fb5e3a7d9c8fa8d4a20728c67651185bb49c38a7f9382b1e"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
2.39.5


