Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6C6C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 22:14:49 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.15221.1641939288571930499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hvTuOdwF;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id d19so899137wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kFXOe2j+vS9M2gPD+NkM/60yNZCVoQja1OOnujY0gMs=;
        b=hvTuOdwFuFxyRYiuJvW0GxEHiiLzJn3ghPVQZGplQo+vk2iAsEbsmztN5n9h8PzRdV
         tRI73ulAl7sO4/APNloI5rqgSekCIZK9/lVMTI9NE7WZxQiMQBymZbsgvbOo0hTytqzy
         ezmFwWj9Fu5RPoDSBXKN1NGv7Tjq7R23TkF5SiF1kYxb6oa/+I2ErieAL9E2JZDrzQ7s
         Bxz6pqtpUqWQztI1CSs2L2gu2j/PRI3SInV5dWm5OETwgDgcC0aYOdRq7qSRapdK7wp8
         tfmJ/nMtbsQF33gEWlKnaDkfN3rEAS7nhbk2DZhRMegnutZEibaXcYStidpfrZ2Ga1mT
         uwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kFXOe2j+vS9M2gPD+NkM/60yNZCVoQja1OOnujY0gMs=;
        b=JOKo3DVHHvbICxw4cDayJg6tadsIuk768vMcQd78zgWMlW4kh/ergWCvIpLKBqjU0Z
         OEjxIcSd6bpgX27CV79L96xGWTYbqT1kK0j7RnlN1Qp23dHZA+GVSxi+XYfEslUPhFb+
         96GefnHzSDCmP3g4mcPhiGEhC5Qi7ifcwR7irqD/7ZrqG2JL0+8QPLt0Mph0FlUzE97Y
         JxxdfDskjNo4K0bld+P5n4/mejDEc0ry8LoEFtgPbFLBs+zWY+I6qC0ekCOlE5/cEebN
         YixEGauUxRfPYMIJ9FUhuio7kWwS+AyVrx8nbc4Unm4ftAfMtYUum0fkGhpod+35z7uZ
         dd/w==
X-Gm-Message-State: AOAM530gaqsHLzzTW3uBg7NOB1ONxADRBg20e5is6JB1uIyn2oNyNWXK
	3sOs/pAhuCybqQ0FjZk3g7gLGjz2Kq4=
X-Google-Smtp-Source: 
 ABdhPJyWdEd2vnNUINn7IPXCRSCZ1Fhlpn85UFos2d65KWXLtIxIWl3IndreHNTTVskGobllaiiBEQ==
X-Received: by 2002:adf:fec2:: with SMTP id q2mr5644724wrs.546.1641939287091;
        Tue, 11 Jan 2022 14:14:47 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id f5sm356997wri.52.2022.01.11.14.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 14:14:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Hongxu Jia <hongxu.jia@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/3] python3: drop unneeded multiprocessing module patch
Date: Tue, 11 Jan 2022 23:14:38 +0100
Message-Id: <20220111221440.3867495-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 22:14:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160467

pthread has been merged into the main libc library
(and was never separate in musl), so separate linking
for it is no longer needed.

I ran the reproducing sequence on qemux86, qemux86_64 and same targets with musl,
and it went fine:

root@qemux86:~# python3
Python 3.10.0 (default, Oct  4 2021, 17:55:55) [GCC 11.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import multiprocessing
>>> pool_sema = multiprocessing.BoundedSemaphore(value=1)
>>> pool_sema.acquire()
True
>>> pool_sema.release()
>>>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ssing-libraries-to-Extension-for-mul.patch | 70 -------------------
 .../recipes-devtools/python/python3_3.10.1.bb |  1 -
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
diff --git a/meta/recipes-devtools/python/python3_3.10.1.bb b/meta/recipes-devtools/python/python3_3.10.1.bb
index e7ae687177..d6ac431185 100644
--- a/meta/recipes-devtools/python/python3_3.10.1.bb
+++ b/meta/recipes-devtools/python/python3_3.10.1.bb
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


