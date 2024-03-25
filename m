Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B387DC54E58
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 16:25:23 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.56944.1711383918488944651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 09:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bm16nYeT;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-515ac73c516so729340e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711383916; x=1711988716; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1E+6unb8vIZle3/GbyNvwFtZH31MhEF3XyrCGdexe5U=;
        b=bm16nYeTVrpyDmxeCD5Wfwbnt0kr8MEKwTTUfbvQp67bC9JthKdXGeuTfTNETV3g9m
         U7d9DA+DFhzML4LgWi2erVFCjuREBLlsPBJVeRIDWulHJ7drOfmrl+mIBaWlHhpR2fu9
         pR3i8dK9po7WQWl1WN8KIkyAWXORdsWgiYoUoaEklEVZPmEcpCsw74LMdBCDicPg+PFl
         cvne6gjvxeCWxwv9+PXgaxP0KkY6KRMe/9vT66quq6D4+Uw0IkzyC1WpZWBoyCWDgh8C
         LnLHeiFzWF4rpyggkyDImW5v4XoY/CFEiabfJFLdpVbkSmeEvslksykUb9FHzTWqsITC
         m03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711383916; x=1711988716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1E+6unb8vIZle3/GbyNvwFtZH31MhEF3XyrCGdexe5U=;
        b=QF1H9xlltKKSC+VafEtTUJ37pfHuvO3jpaU9X/rqPc4I6jLGgtfX+PlRiZwW64AFhn
         nuqUul8ZMS5DnabkA1UYSuQJrXFLAq7dQtUhTk+UyZQpa64SAexyWgx3HK1434Bwn2ca
         NvskU64GlQaqYAEv+XrOUP94RsPbylWjjy7VRQJwgPDJRM/QtoD0WYpL6YaxshwSxSwl
         /6MhWaXzvMMhK2kitQJZ3YoEUA174h+vk2+vBxaBVAGokSyH73lguV8auF3p1HcOStPY
         vsGWxIVXfYbeomXBZOj6VBf7GU+vJD02kwdaZzGWXhW9DSCRHcqJiDABW7Egu/aOZP/v
         I2rg==
X-Gm-Message-State: AOJu0YxJl1CmNWKxYQi/LnwneThBXeUIo5Wlz2tJCp0ECy3GMBFAzzLW
	xpILBUWhgPk5jEImZe3nTtOh3iAEqVwKd8aWhm3CuMOf4RU8QBHl7TyDKtsLumW/G+bXiCB+tAM
	0XEDZ3FEL0gHmFwwond/OfH+mQk4=
X-Google-Smtp-Source: AGHT+IElvI/4z3a4i6o3zLICJI09ugXglZt32UQIkykQNyj64oObqhS7QKQhUSmZT0mFY0CarJkRfQBZ0dVj3XWwkAE=
X-Received: by 2002:a05:6512:224b:b0:513:d7c5:9bc8 with SMTP id
 i11-20020a056512224b00b00513d7c59bc8mr2635814lfu.30.1711383915876; Mon, 25
 Mar 2024 09:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240325044711.819158-1-changqing.li@windriver.com>
In-Reply-To: <20240325044711.819158-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 25 Mar 2024 17:25:04 +0100
Message-ID: <CANNYZj_Esb2pMt0YF4M9KAik5mWEQKvfjXHKya05Ui0fV06PyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dnf: fix Exception handling for class ProcessLock
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 16:25:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197490

Thanks, I'm ok with this patch.

Alex

On Mon, 25 Mar 2024 at 05:47, Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Yocto based systems will sometimes have log_lock.pid left in target
> filesystems.  Users typing 'ls /' will notice it, and will never be
> removed.
>
> It happened when log rotate happened, refer [1], since the problem
> descripted in patch 0001-lock.py-fix-Exception-handling.patch, file
> log_lock.pid will not be removed after dnf exit. For target system,
> refer [4], dnf have a solution to remove it. But for OE, refer commit
> [2][3], for fix another issue, OE changed log_lock.pid to root dir for
> native dnf, so solution in [4] not works for log_lock.pid under "/", so
> it will always exist under "/" of target system.
>
> Use patch 0001-lock.py-fix-Exception-handling.patch to fix the problem.
>
> [1] https://github.com/rpm-software-management/dnf/blob/a6d82221ae32045f0f788708a52d2f2bf5c5740b/dnf/logging.py#L127C31-L127C42
> [2] https://git.openembedded.org/openembedded-core/commit/?id=742a1b71249f4da1c8d8e13e270b0eb6128a3f66
> [3] https://git.openembedded.org/openembedded-core/commit/?id=7610f81586bd475f28fd3d89a7350771720c3264
> [4] https://github.com/rpm-software-management/dnf/blob/master/etc/tmpfiles.d/dnf.conf
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../0001-lock.py-fix-Exception-handling.patch | 62 +++++++++++++++++++
>  meta/recipes-devtools/dnf/dnf_4.19.0.bb       |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
>
> diff --git a/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
> new file mode 100644
> index 0000000000..6bffe9af0a
> --- /dev/null
> +++ b/meta/recipes-devtools/dnf/dnf/0001-lock.py-fix-Exception-handling.patch
> @@ -0,0 +1,62 @@
> +From 3881757eabfde2ff54400ab127b106ab085d83f0 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 13 Mar 2024 11:22:05 +0800
> +Subject: [PATCH] lock.py: fix Exception handling
> +
> +Before, when logdir is not writable, _try_lock will raise an Exception
> +like "Permission denied: '/var/log/log_lock.pid'", and in this case,
> +_unlock_thread will not be called and the variable count will not be
> +handled, it maybe cause log_lock.pid not be deleted in case like [1].
> +
> +For [1], it is an cross compile case, when dnf install some packages to
> +rootfs, seems like some threads don't do chroot like work, some threads
> +do chroot like work. so for the threads don't do chroot, "Permission denied"
> +Exception happend, for the threads that do chroot, log_lock.pid will be
> +created under installroot/var/log/log_lock.pid, since variable count not
> +handled correct before, log_lock.pid may not be deleted correctly.
> +
> +So fixed like this, if _try_lock raise Exception, _unlock_thread first,
> +then raise the Exception.
> +
> +[1] https://github.com/rpm-software-management/dnf/issues/1963
> +
> +Upstream-Status: Submitted [ https://github.com/rpm-software-management/dnf/pull/2065 ]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + dnf/lock.py | 12 ++++++++++--
> + 1 file changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/dnf/lock.py b/dnf/lock.py
> +index 6817aac9..5718062a 100644
> +--- a/dnf/lock.py
> ++++ b/dnf/lock.py
> +@@ -128,7 +128,11 @@ class ProcessLock(object):
> +         self._lock_thread()
> +         prev_pid = -1
> +         my_pid = os.getpid()
> +-        pid = self._try_lock(my_pid)
> ++        try:
> ++            pid = self._try_lock(my_pid)
> ++        except Exception:
> ++            self._unlock_thread()
> ++            raise
> +         while pid != my_pid:
> +             if pid != -1:
> +                 if not self.blocking:
> +@@ -140,7 +144,11 @@ class ProcessLock(object):
> +                     logger.info(msg)
> +                     prev_pid = pid
> +             time.sleep(1)
> +-            pid = self._try_lock(my_pid)
> ++            try:
> ++                pid = self._try_lock(my_pid)
> ++            except Exception:
> ++                self._unlock_thread()
> ++                raise
> +
> +     def __exit__(self, *exc_args):
> +         if self.count == 1:
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/dnf/dnf_4.19.0.bb b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
> index 784d7a94b3..184dbea963 100644
> --- a/meta/recipes-devtools/dnf/dnf_4.19.0.bb
> +++ b/meta/recipes-devtools/dnf/dnf_4.19.0.bb
> @@ -15,6 +15,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
>             file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
>             file://0030-Run-python-scripts-using-env.patch \
>             file://0001-set-python-path-for-completion_helper.patch \
> +           file://0001-lock.py-fix-Exception-handling.patch \
>             "
>
>  SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197480): https://lists.openembedded.org/g/openembedded-core/message/197480
> Mute This Topic: https://lists.openembedded.org/mt/105132842/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

