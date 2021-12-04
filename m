Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1697AC433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:34 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.22333.1638602012560843708
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FxUgDy6Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so3928584wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=avLakiG220HiWTqeWsgiyLD+Rm5C0XGgv1n73pOpDcg=;
        b=FxUgDy6YaP6Af9MbMSrguHeBcYLvhv70edlRV9HNSsgVAdrh8RXv1kxgMqJiRNXnQY
         bf9ybErpDBtvnlq6lUapL5ESQOLhOyf9L+ihk0H0GF4IEW9mhfjx90wyS09NFVDnq3CF
         PrY0ei0z+MtiETUFoSw9lPn1ceE/aTGnzNHp48dz6/W6gj53jXMXj3ieSU+OJAbLcNY+
         mh+MEH1ZVorvSYoNcXGqvSNpLTPZMUnoK7el72iX9RfqFXrU4GY42wu8bUswiBKJfeLJ
         FhyFcGRHWKEuL7TpePkfZeCVXx2g7qHgk5yhEArMHfQgi8mn9UO8WzoYbM1YNhOK7PuZ
         cukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=avLakiG220HiWTqeWsgiyLD+Rm5C0XGgv1n73pOpDcg=;
        b=nZPfgTPL3ByQuIKh9lvuHIIlapxnE40QHKtZnQd7nIl81GMPhtm66tdSOPzJN2q8fy
         NNnGS0ZoHz5fJWnwgJKCdl2e8lg7wIKEOB9Hqawn/q4hW/ioLrDCDhrJ5yUAHu7kd155
         hiG0X9gXoY+UitUvO0mtJR3Av8X0Li5BfGJCztgR//kA+EDWKm5PVPKO89dd+3wyv/eY
         TLDnQcmc1ZZCuL/FwDmksJg4Tt9iGkUmS7pT15oUxKL9ZQu5VSdWQz4Gjl1xDCkete+F
         qJ8zqnA8NdBY2cqcvpdmXIN4gXm5/sM6XqDNub1P6Pcx0LOq98PUeCxer952Cu0jTTep
         LADA==
X-Gm-Message-State: AOAM5311F7kIExUYg5XB1OnfVFFrYBTpXR4MSkLKPqlX6y7xdFti/x6C
	oyF+eYe6kUJ7n51GjQvSV7zwUWjJPnp39A==
X-Google-Smtp-Source: 
 ABdhPJxnKJUYQfs4mKZbc88uUNbysnoO9I2+XDFZgiJRKaD6gEiHzH6MV1Z6Bp2AWyI2MVXF0XQAoQ==
X-Received: by 2002:a05:600c:4e07:: with SMTP id
 b7mr21590637wmq.8.1638602010963;
        Fri, 03 Dec 2021 23:13:30 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Hongxu Jia <hongxu.jia@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/26] python3: drop unneeded multiprocessing module patch
Date: Sat,  4 Dec 2021 08:13:02 +0100
Message-Id: <20211204071323.2480163-5-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159152

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


