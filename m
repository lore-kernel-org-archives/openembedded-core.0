Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE34BC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:00 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.3043.1639000799954100133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DGAY8MFG;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id d24so6608270wra.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 13:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=avLakiG220HiWTqeWsgiyLD+Rm5C0XGgv1n73pOpDcg=;
        b=DGAY8MFG2HECNUcVR0T5VsjOG22Qha15jZLnCUhH6Hfj0oVlmpcZBtiCdxsljhAAu/
         oyTBahZUOk3c/47EOR3SwKyVM0YuxUAXymZ3mAlyXRnjMfbnOJBcZFq/mfsFbzG9kRqd
         3e7w9eOF//AjEUvGlySpTkn/Taynubi3H+MfB6BDEBrvYMRFTioG6fWr2a899BesyKQM
         MTqAFmOS2lP5z4SIELrOHYr15cSuittCQ5Lwwqsotqms4mDmdnRn/oy2UsglxrrcTPMv
         ED2sdHZ7mLTZg9rGAEUiCbF/Zr6Zznt9uoDd2EXWPxMbj7QdKUdsTqs+RZ+KhMlgc9EI
         ol+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=avLakiG220HiWTqeWsgiyLD+Rm5C0XGgv1n73pOpDcg=;
        b=rTKKwRM9YbnMru4bB0874lekJ3rBHnCJrptT3RvXj+l4HgDO2EaU1YGUxLnyWfuYiF
         LdJ5jP7tHABlh7DdffZV2NJvUUcjgLoIwaR4J+Wv+XgUn9sRFpxI4KdS9Cbr7ahy8lbs
         K1V1KYJkkExkZ7X9TLa4/3Q8mr3aHUUiYtlHa7YfxeiYvfUQCq8fIRyVSQppQWsARuQ4
         URSLKEH2JG22+S/xL8t7b8ZGe3RCUf0qlgLSKjV9k6N/vKw8lYUsV6Y2W2KW/Iqy8jgi
         +DAo6ceoqhL3FCXXe2MlD6dBF5JFEDigGCQUHRavYG85a/5o8VXKGeAtMG7nt5xgUDhx
         MHTw==
X-Gm-Message-State: AOAM530GuFWcmv0uB9So1Zeumxu/flBsGhemHxKtBZxeE9niHW+vhxzB
	RijBolX+76UcCmuMUEHA7Iv7k3yltsK20A==
X-Google-Smtp-Source: 
 ABdhPJxEahq46rkSpuAQktV8rhly1ebVipKNHkT1LpG1dD7D6boxF8U3FQO8Ygt44iRDEO2YqdcNFA==
X-Received: by 2002:a05:6000:1a48:: with SMTP id
 t8mr1651914wry.66.1639000798483;
        Wed, 08 Dec 2021 13:59:58 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.13.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 13:59:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Hongxu Jia <hongxu.jia@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/29] python3: drop unneeded multiprocessing module patch
Date: Wed,  8 Dec 2021 22:59:21 +0100
Message-Id: <20211208215947.1979470-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159369

I ran the reproducing sequence on qemux86, and it went fine:

root@qemux86:~# python3
Python 3.10.0 (default, Oct  4 2021, 17:55:55) [GCC 11.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import multiprocessing
>>> pool_sema = multiprocessing.BoundedSemaphore(value=1)
>>> pool_sema.acquire()
True
>>> pool_sema.release()
>>>

Additionally AB testing revealed no issues, and the description isn't entirely
clear about where and how the problem occurs, so I can't submit it upsream
without having that understanding and how to demonstrate the problem.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ssing-libraries-to-Extension-for-mul.patch | 70 -------------------
 .../recipes-devtools/python/python3_3.10.0.bb |  1 -
 2 files changed, 71 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch

diff --git a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch b/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
deleted file mode 100644
index 374433c68e..0000000000
--- a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From bad7e6a625436402a01d03021fb9ccd58bc9930f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 9 Jan 2020 17:44:05 +0100
-Subject: [PATCH] setup.py: pass missing libraries to Extension for
- multiprocessing module
-
-In the following commit:
-...
-commit e711cafab13efc9c1fe6c5cd75826401445eb585
-Author: Benjamin Peterson <benjamin@python.org>
-Date:   Wed Jun 11 16:44:04 2008 +0000
-
-    Merged revisions 64104,64117 via svnmerge from
-    svn+ssh://pythondev@svn.python.org/python/trunk
-...
-(see diff in setup.py)
-It assigned libraries for multiprocessing module according
-the host_platform, but not pass it to Extension.
-
-In glibc, the following commit caused two definition of
-sem_getvalue are different.
-https://sourceware.org/git/?p=glibc.git;a=commit;h=042e1521c794a945edc43b5bfa7e69ad70420524
-(see diff in nptl/sem_getvalue.c for detail)
-`__new_sem_getvalue' is the latest sem_getvalue@@GLIBC_2.1
-and `__old_sem_getvalue' is to compat the old version
-sem_getvalue@GLIBC_2.0.
-
-To build python for embedded Linux systems:
-http://www.yoctoproject.org/docs/2.3.1/yocto-project-qs/yocto-project-qs.html
-If not explicitly link to library pthread (-lpthread), it will
-load glibc's sem_getvalue randomly at runtime.
-
-Such as build python on linux x86_64 host and run the python
-on linux x86_32 target. If not link library pthread, it caused
-multiprocessing bounded semaphore could not work correctly.
-...
->>> import multiprocessing
->>> pool_sema = multiprocessing.BoundedSemaphore(value=1)
->>> pool_sema.acquire()
-True
->>> pool_sema.release()
-Traceback (most recent call last):
-  File "<stdin>", line 1, in <module>
-ValueError: semaphore or lock released too many times
-...
-
-And the semaphore issue also caused multiprocessing.Queue().put() hung.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index d92face..f42bcbb 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1836,7 +1836,7 @@ class PyBuildExt(build_ext):
-             if (sysconfig.get_config_var('HAVE_SEM_OPEN') and not
-                 sysconfig.get_config_var('POSIX_SEMAPHORES_NOT_ENABLED')):
-                 multiprocessing_srcs.append('_multiprocessing/semaphore.c')
--        self.add(Extension('_multiprocessing', multiprocessing_srcs,
-+        self.add(Extension('_multiprocessing', multiprocessing_srcs, libraries=['pthread'],
-                            include_dirs=["Modules/_multiprocessing"]))
- 
-         if (not MS_WINDOWS and
diff --git a/meta/recipes-devtools/python/python3_3.10.0.bb b/meta/recipes-devtools/python/python3_3.10.0.bb
index e3300b6495..24e6c04fe9 100644
--- a/meta/recipes-devtools/python/python3_3.10.0.bb
+++ b/meta/recipes-devtools/python/python3_3.10.0.bb
@@ -25,7 +25,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
            file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
-           file://0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
            file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
            file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch \
-- 
2.20.1


