Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA055FED2E3
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 07:45:36 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16301.1773301527218725963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 00:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FcOjzvxR;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so604612f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 00:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773301525; x=1773906325; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4ZIkc4mAa9p7E2dwOl3K2TVchOVvdCCi8/fB23/QKs=;
        b=FcOjzvxRMr7CICe30Lv3jV1Locsz+cqbsWg4sAF7l+YZ8v1C4lYkuzquNayB31rVfE
         WIhyygRPUGJpfR9Az3r5f0h7BaADXA0TIfoYcyfckl9p4Yu8P6kXXj7/vcAkiGzQm5O/
         cYE6Rz8BrwNgdTMYKgGw4GGEx+6nVxtWhBi+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773301525; x=1773906325;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4ZIkc4mAa9p7E2dwOl3K2TVchOVvdCCi8/fB23/QKs=;
        b=ouBelujqeI4NiDW0hvbZGFD8NDX4kx3umlA4pfAt+W0Ml7IWOeAJ2ynJp3Qzo9uTaH
         amhjxDqLjdelA1G2f1e8A7KSIIU6viYzl8LiVCQVFtQjW27nwgmXPwDBK9OtILo2LlI5
         2li3gMmMdOzv27fzj0PIROmNkszFDJrZaaJ1Te9fHKmrKupMCRzrNFi2amzlavXEh/g5
         W90wu3H+B5ph2hriJkqhJHwO8gQ+V6GraOQOU8FGLuye+656pSCk5s3ZE9LxfRLDJktY
         2uvAm3YAaWOQdURZ5ECfXvmKy6qLNhscwbwTdI1w9J8ga1J04ib/+1jnQcruDpwGnvPt
         sPPg==
X-Forwarded-Encrypted: i=1; AJvYcCXTiNgV7rRewBhVbfwOCbQ6KBzQkAtiQcySh5Tu3IMNaLtGgm7Kh/urPVpVWgxjtyzwVhKQh2giJu/zvuNSEkWC7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxk7+JD2sTk+JcFB1dC+ymIAo9gFP4xcBmzynudgVTLmTlhkOTo
	ZuuRP+3sU0L3ON4c57E8YrMzs2XAVmq1QFQZZtbrG3LW0KXx62WvW49WmgTgLuq3c3o=
X-Gm-Gg: ATEYQzyM0irb1ruDQPmF30f+ZkTaKCNHJ2X9Ym8AHLsCgmmGoQ2ITD0rA/Wu6HbYPxp
	6U0k3/cIyrbgjBZ5p3LUBss2at8Ps7zz8bhPm+vMtLtUbyc+t1MmgwBx6POY0JhjFZvhq+sIOmx
	8xFWdDTemnWQtKp47U92pyyvwpl3qJamf0Hg6Ytic6wD/z4C6b93S7oyg73HF6CBZ0AXfXhl0kt
	B8/E6Ks84EAP3I0MgVZ0iXXGSXebcLsnOPCxj4ONSh2QD0UxR/IThzyrwrsu5Ct464jXkqsNS7R
	1RWV0E4qh60iWay53tT/Yl/1X7gDjhq8bvkGQwU06blJZw/h7K0rRPqnSoduq1RoP4PAuRY+HDl
	NXCJ85DqxMAIQkC2V6e4x4+H/8Lj+BtUOKPKCBtKaDlpyh8ilyY6S6ARxLsAYqBPwamUSiRpXpt
	yjOjQiqgxwIJpa/LGURtQm9nGXKlbcyVHW89M5rH/hxz7DsmXO8iIYLZGknD0eksUnL+5NOJMY8
	puPm4/TEjbbWew=
X-Received: by 2002:a5d:5f42:0:b0:439:ac6b:dd64 with SMTP id ffacd0b85a97d-439f821fa97mr9872079f8f.45.1773301524756;
        Thu, 12 Mar 2026 00:45:24 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19ac5fsm6009304f8f.1.2026.03.12.00.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 00:45:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 08:45:23 +0100
Message-Id: <DH0MXDT4CMYO.J77RUCVJZFOK@smile.fr>
Subject: Re: [OE-core] [PATCH] shared/fdset: add detailed debug logging to
 fdset_new_fill()
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "AshishKumar Mishra" <ashishkumar.mishra@bmwtechworks.in>
To: <git-patches@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260310080942.47334-1-git-patches@bmwtechworks.in>
In-Reply-To: <20260310080942.47334-1-git-patches@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 07:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232924

On Tue Mar 10, 2026 at 9:09 AM CET, Ashish Kumar Mishra via lists.openembed=
ded.org wrote:
> Currently, when fdset_new_fill() fails to open /proc/self/fd or
> encounters an error while processing individual file descriptors
> (such as fcntl or fstat failures), it returns a silent error code.
>
> For debugging rarely reproducible failures it becomes difficult to
> know the exact cause of failure
> This commit updates the function to use log_debug_errno() for all
> error paths and hence  provides better visibility into why FD collection
> failed, including the path of the problematic FD (via fd_get_path)
> and its inode type.
>
> Upstream-Status: Backport [https://github.com/systemd/systemd/pull/40385]
>
> Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> ---

Hello,

This is the second version of this patch. Please see [0] for how to mark
it as such and handle patches iterations (Note the patch changelog below
the "---" line). This will make the reviews a lot easier and less
confusing for reviewers.

Regards,

[0]: https://docs.yoctoproject.org/contributor-guide/submit-changes.html#ta=
king-patch-review-into-account

>  ...-detailed-debug-logging-to-fdset_new.patch | 97 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_259.3.bb    |  1 +
>  2 files changed, 98 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0018-shared-fdset-a=
dd-detailed-debug-logging-to-fdset_new.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-deta=
iled-debug-logging-to-fdset_new.patch b/meta/recipes-core/systemd/systemd/0=
018-shared-fdset-add-detailed-debug-logging-to-fdset_new.patch
> new file mode 100644
> index 0000000000..849f5cfda1
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0018-shared-fdset-add-detailed-de=
bug-logging-to-fdset_new.patch
> @@ -0,0 +1,97 @@
> +From 0565f9f27323a8f9e62d85f2add542af99cea06a Mon Sep 17 00:00:00 2001
> +From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> +Date: Wed, 21 Jan 2026 14:13:29 +0530
> +Subject: [PATCH] shared/fdset: add detailed debug logging to fdset_new_f=
ill()
> +
> +Currently, when fdset_new_fill() fails to open /proc/self/fd or
> +encounters an error while processing individual file descriptors
> +(such as fcntl or fstat failures), it returns a silent error code.
> +
> +For debugging rarely reproducible failures it becomes difficult to
> +know the exact cause of failure
> +This commit updates the function to use log_debug_errno() for all
> +error paths and hence  provides better visibility into why FD collection
> +failed, including the path of the problematic FD (via fd_get_path)
> +and its inode type.
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/pull/40385=
]
> +
> +Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> +---
> + src/shared/fdset.c | 35 ++++++++++++++++++++++++++---------
> + 1 file changed, 26 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/shared/fdset.c b/src/shared/fdset.c
> +index 832e7fda60..f340f41b0e 100644
> +--- a/src/shared/fdset.c
> ++++ b/src/shared/fdset.c
> +@@ -8,6 +8,7 @@
> + #include "alloc-util.h"
> + #include "async.h"
> + #include "dirent-util.h"
> ++#include "errno-util.h"
> + #include "fd-util.h"
> + #include "fdset.h"
> + #include "log.h"
> +@@ -179,9 +180,10 @@ int fdset_new_fill(
> +         d =3D opendir("/proc/self/fd");
> +         if (!d) {
> +                 if (errno =3D=3D ENOENT && proc_mounted() =3D=3D 0)
> +-                        return -ENOSYS;
> ++                        return log_debug_errno(SYNTHETIC_ERRNO(ENOSYS),
> ++                                               "Failed to open /proc/se=
lf/fd/, /proc/ is not mounted.");
> +=20
> +-                return -errno;
> ++                return log_debug_errno(errno, "Failed to open /proc/sel=
f/fd/: %m ");
> +         }
> +=20
> +         s =3D fdset_new();
> +@@ -210,9 +212,14 @@ int fdset_new_fill(
> +                          * been passed in can be collected and fds whic=
h have been created locally can be
> +                          * ignored, under the assumption that only the =
latter have O_CLOEXEC set. */
> +=20
> +-                        fl =3D fcntl(fd, F_GETFD);
> +-                        if (fl < 0)
> +-                                return -errno;
> ++                        fl =3D RET_NERRNO(fcntl(fd, F_GETFD));
> ++                        if (fl < 0) {
> ++                                _cleanup_free_ char *path =3D NULL;
> ++                                (void) fd_get_path(fd, &path);
> ++                                return log_debug_errno(fl,
> ++                                                       "Failed to get f=
lag of fd=3D%d (%s): %m ",
> ++                                                       fd, strna(path))=
;
> ++                        }
> +=20
> +                         if (FLAGS_SET(fl, FD_CLOEXEC) !=3D !!filter_clo=
exec)
> +                                 continue;
> +@@ -221,13 +228,23 @@ int fdset_new_fill(
> +                 /* We need to set CLOEXEC manually only if we're collec=
ting non-CLOEXEC fds. */
> +                 if (filter_cloexec <=3D 0) {
> +                         r =3D fd_cloexec(fd, true);
> +-                        if (r < 0)
> +-                                return r;
> ++                        if (r < 0) {
> ++                                _cleanup_free_ char *path =3D NULL;
> ++                                (void) fd_get_path(fd, &path);
> ++                                return log_debug_errno(r,
> ++                                                       "Failed to set C=
LOEXEC flag fd=3D%d (%s): %m ",
> ++                                                       fd, strna(path))=
;
> ++                        }
> +                 }
> +=20
> +                 r =3D fdset_put(s, fd);
> +-                if (r < 0)
> +-                        return r;
> ++                if (r < 0) {
> ++                        _cleanup_free_ char *path =3D NULL;
> ++                        (void) fd_get_path(fd, &path);
> ++                        return log_debug_errno(r,
> ++                                               "Failed to put fd=3D%d (=
%s) into fdset: %m ",
> ++                                               fd, strna(path));
> ++                }
> +         }
> +=20
> +         *ret =3D TAKE_PTR(s);
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-core/systemd/systemd_259.3.bb b/meta/recipes-co=
re/systemd/systemd_259.3.bb
> index bcb8fe3d9c..44d319d0c5 100644
> --- a/meta/recipes-core/systemd/systemd_259.3.bb
> +++ b/meta/recipes-core/systemd/systemd_259.3.bb
> @@ -33,6 +33,7 @@ SRC_URI +=3D " \
>             file://0001-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
>             file://0002-implment-systemd-sysv-install-for-OE.patch \
>             file://0003-Do-not-create-var-log-README.patch \
> +           file://0018-shared-fdset-add-detailed-debug-logging-to-fdset_=
new.patch \
>             "
> =20
>  PAM_PLUGINS =3D " \


--=20
Yoann Congal
Smile ECS


