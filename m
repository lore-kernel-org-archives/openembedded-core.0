Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996C6CD13D9
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:26 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.27420.1694943559513902985
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=emfKByEP;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9ad8d47ef2fso432045666b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943558; x=1695548358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is+8//lgkZOLtcY2Eig4f7VLEJ0n3241ETnsMngWbns=;
        b=emfKByEPh/jMryfpnI+r9Q2TLhdokby+fGZXo78Iu5eShKzTMO2NBjUg2kAO+tf/YZ
         pFtI5ojCNXOdZ+0dT9oupckk2ZJKfaK/EqK4iP3yYDaLkqtG2SqEPPwSizg8lFrMXPmr
         j7/pttOhZzKTOxS8KbwFss/re6G/kWZFtq6Uo7lA8U8WC8o0O68PDDef4HbDVjT+TMwQ
         eB0PQSU1XdchVZ4MWMY/PR4sItzUz3B1Ckbpdx+l1+86/Klm0V6ZyS7COBoUXyEtDYI1
         lwS9t1Vv+MWhx+EyKLjD1ulKyw4ZKI2OqpPP9fmNO6UWxeblyEkyOfpxZRuoSi04IRSs
         pGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943558; x=1695548358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=is+8//lgkZOLtcY2Eig4f7VLEJ0n3241ETnsMngWbns=;
        b=rBiamJQ1kHVG7vhEitVooSdGgZEq0GzK4u8TJKNBouW7M0qHqBNPKjCXpPGGTu6iWy
         Y0NMexpajiB2N99gCNQhcYW2epm2D0gK92wbC4HUM81jenCPS50XWEls0a2jHM/7yN0S
         +4NnnbkwX0SA323X+UJNllOu8+Bwv37jxtWlsIRk89jk+/UM2FVfETPyyPYvqs1y8yqZ
         LErdF3V0Bcq+B/gTYxGiIONycAJY/hrh6lBCJiXHHWe8LlbRUxveTVSgHni07Kb56a9b
         l8yiD3nBe12s3Jz3T9p/oyHCRz2HNYpkqYR1EAABBHp1p7qUmw18bOfu2Hra6Dcdp/S7
         NgXA==
X-Gm-Message-State: AOJu0Yzctb9c538CNAqdtlVvfckuUZhRR4Wxv1ZlC9VFMMEUhW4GrO3I
	T9qzLd3YMMnRaQB8g5opI8aJ1XRg+fg=
X-Google-Smtp-Source: AGHT+IF7IF8Gpo5qezSjfZg4kYDHjse+yvj8ptxBE/i97AVYFgsAYSb7pOQupK1sqi1CwdO259f7PA==
X-Received: by 2002:a17:906:300e:b0:9a6:6c5b:ae0c with SMTP id 14-20020a170906300e00b009a66c5bae0cmr5526553ejz.23.1694943557961;
        Sun, 17 Sep 2023 02:39:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/29] gzip: update 1.12 -> 1.13
Date: Sun, 17 Sep 2023 11:38:54 +0200
Message-Id: <20230917093901.428214-22-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187795

Drop autoconf-2.73.patch as issue resolved upstream.

License-update: http -> https

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gzip/gzip-1.12/autoconf-2.73.patch        | 24 -------------------
 .../wrong-path-fix.patch                      |  0
 .../gzip/{gzip_1.12.bb => gzip_1.13.bb}       |  7 +++---
 3 files changed, 3 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-extended/gzip/gzip-1.12/autoconf-2.73.patch
 rename meta/recipes-extended/gzip/{gzip-1.12 => gzip-1.13}/wrong-path-fix.patch (100%)
 rename meta/recipes-extended/gzip/{gzip_1.12.bb => gzip_1.13.bb} (86%)

diff --git a/meta/recipes-extended/gzip/gzip-1.12/autoconf-2.73.patch b/meta/recipes-extended/gzip/gzip-1.12/autoconf-2.73.patch
deleted file mode 100644
index 18f992beb87..00000000000
--- a/meta/recipes-extended/gzip/gzip-1.12/autoconf-2.73.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-The gnulib largefile macro needs updating to work with autoconf 2.73. Rather
-than the full code:
-
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/m4/largefile.m4?id=f91f633858cf132e50924224c50d6264a92caabb
-
-Just tweak the exiting code to work with 2.73. The next gzip upgrade should
-update to new gnulib
-
-Upstream-Status: Inappropriate
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: findutils-4.9.0/gl/m4/largefile.m4
-===================================================================
---- findutils-4.9.0.orig/m4/largefile.m4
-+++ findutils-4.9.0/m4/largefile.m4
-@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
- # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
- # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
- # or configures them incorrectly in some cases.
--m4_version_prereq([2.70], [], [
-+m4_version_prereq([2.73], [], [
- 
- # _AC_SYS_LARGEFILE_TEST_INCLUDES
- # -------------------------------
diff --git a/meta/recipes-extended/gzip/gzip-1.12/wrong-path-fix.patch b/meta/recipes-extended/gzip/gzip-1.13/wrong-path-fix.patch
similarity index 100%
rename from meta/recipes-extended/gzip/gzip-1.12/wrong-path-fix.patch
rename to meta/recipes-extended/gzip/gzip-1.13/wrong-path-fix.patch
diff --git a/meta/recipes-extended/gzip/gzip_1.12.bb b/meta/recipes-extended/gzip/gzip_1.13.bb
similarity index 86%
rename from meta/recipes-extended/gzip/gzip_1.12.bb
rename to meta/recipes-extended/gzip/gzip_1.13.bb
index 35eb7c4da23..fd846b30a55 100644
--- a/meta/recipes-extended/gzip/gzip_1.12.bb
+++ b/meta/recipes-extended/gzip/gzip_1.13.bb
@@ -5,12 +5,11 @@ require gzip.inc
 LICENSE = "GPL-3.0-or-later"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
-           file://autoconf-2.73.patch \
            file://run-ptest \
-          "
+           "
 SRC_URI:append:class-target = " file://wrong-path-fix.patch"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
                     file://gzip.h;beginline=8;endline=20;md5=6e47caaa630e0c8bf9f1bc8d94a8ed0e"
 
 PROVIDES:append:class-native = " gzip-replacement-native"
@@ -39,4 +38,4 @@ do_install_ptest() {
             ${B}/tests/Makefile > ${D}${PTEST_PATH}/src/tests/Makefile
 }
 
-SRC_URI[sha256sum] = "5b4fb14d38314e09f2fc8a1c510e7cd540a3ea0e3eb9b0420046b82c3bf41085"
+SRC_URI[sha256sum] = "20fc818aeebae87cdbf209d35141ad9d3cf312b35a5e6be61bfcfbf9eddd212a"
-- 
2.30.2


