Return-Path: <joel@jms.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191A3C636CC
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 10:03:28 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.30045.1676800998954667507
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 02:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jms.id.au header.s=google header.b=HTQvQReQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: joel.stan@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id ek25so1057344edb.7
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 02:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjGxgOh6QpC5SHEoj37UUQxR1HNRKhhTzc+JQJflSw4=;
        b=HTQvQReQ0dNN0zHFoRiXIwOXWZXzYhpRTAhTfyBN7DEqpjXkpg4m/DC2jjknsJcKs4
         NXzWLR43FpnyQOGwk8HYBKuSxVZ55RS7S0ww17p66o0cizTOFJ4jnHHZg+waNaXhpp2T
         IwzZgAJBggokoOWycL2guuIRYErYWDtgmVT1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjGxgOh6QpC5SHEoj37UUQxR1HNRKhhTzc+JQJflSw4=;
        b=h/Rtb4nmqiCJGHDV561XQY2/NylJec7XAeQavsPQv3tNROw5yqpK8A6LwDnaTLOZ53
         wrVVNjoqSV8LrHmn+ERVBTw5iFTx6pDyK9ny5FGMamEBvaXnWyqTjQ/novqcj2knfOJn
         qivQUaEswhac1gz+r1nLJfJoPRNPBo428vBRRsrZeY2CVvVVhL8NC8UyomaS28BBErK9
         hDemRmSfOaeKEL69Si2fvFJYLTYDWOm404cTRhA6eBqbiWvDifLxykk3LtgXWVKu89Qr
         GzDAyLLXSirXUvL9HfN+eHl0TFvURttKN6TOvAcaXftlx6u9Q+PzOajxLFDLf3bAOu01
         H9CQ==
X-Gm-Message-State: AO0yUKXhe8l3TVE7ROZm5OPD5+g0myrlThj0zjyh8dC7ywlWaGftYkMx
	OpWjBiw/o8PkvORZCpgvmUyURWD3Esw1xf6rwkfzBJjp
X-Google-Smtp-Source: AK7set9LNmeHkaNSV0oQPyr1I/dZBaErVTdLROyCvdbhsYGrt4A76xUPMytKPhVm9F4Brf3Cv+Hj00Jl4FYBQGBJgSQ=
X-Received: by 2002:a17:906:bce7:b0:8b1:28f6:8ab3 with SMTP id
 op7-20020a170906bce700b008b128f68ab3mr2893222ejb.15.1676800996347; Sun, 19
 Feb 2023 02:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20230219094834.1157042-1-joel@jms.id.au>
In-Reply-To: <20230219094834.1157042-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 19 Feb 2023 10:03:03 +0000
Message-ID: <CACPK8XcaxS9HTxKk_QW6oRa_S5g6+cy+5vJ4dZ6ze0j8Q1FpxA@mail.gmail.com>
Subject: Re: [PATCH] qemu: Fix building with latest glibc 2.36
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 10:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177323

On Sun, 19 Feb 2023 at 09:48, Joel Stanley <joel@jms.id.au> wrote:
>
> When building native qemu with glibc 2.36 (including latest changes from
> the glibc stable branch), qemu fails to build:
>
>  In file included from /usr/include/linux/btrfs.h:29,
>                   from ../qemu-7.2.0/linux-user/syscall.c:165:
>  /usr/include/linux/fs.h:50:8: error: redefinition of =E2=80=98struct fil=
e_clone_range=E2=80=99
>     50 | struct file_clone_range {
>        |        ^~~~~~~~~~~~~~~~
>  ../qemu-7.2.0/linux-user/syscall.c:129:8: note: originally defined here
>    129 | struct file_clone_range {
>        |        ^~~~~~~~~~~~~~~~
>
> Backport changes to linux-user that remove the local copy of struct
> file_clone_range.
>
> Patches from https://lore.kernel.org/qemu-devel/20230110174901.2580297-1-=
berrange@redhat.com/
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  3 +
>  ...er-add-more-compat-ioctl-definitions.patch | 69 ++++++++++++++++
>  ...r-fix-compat-with-glibc-2.36-sys-mou.patch | 78 +++++++++++++++++++
>  3 files changed, 150 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Revert-linux-use=
r-add-more-compat-ioctl-definitions.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0002-Revert-linux-use=
r-fix-compat-with-glibc-2.36-sys-mou.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 92828e8f2dfc..01778eff74e7 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -30,6 +30,9 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
>             file://0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek=
.patch \
>             file://0002-linux-user-Replace-use-of-lfs64-related-functions=
-an.patch \
>             file://0001-configure-Fix-check-tcg-not-executing-any-tests.p=
atch \
> +           file://cross.patch \

This line is a mistake, I don't know where it came from. I can re-spin
after the rest of the change gets a review.

> +           file://0001-Revert-linux-user-add-more-compat-ioctl-definitio=
ns.patch \
> +           file://0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-=
mou.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-m=
ore-compat-ioctl-definitions.patch b/meta/recipes-devtools/qemu/qemu/0001-R=
evert-linux-user-add-more-compat-ioctl-definitions.patch
> new file mode 100644
> index 000000000000..cd8121fed14c
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-com=
pat-ioctl-definitions.patch
> @@ -0,0 +1,69 @@
> +From afa96c55f2c270405de8984e2466067bbb44c0e4 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange@=
redhat.com>
> +Date: Tue, 10 Jan 2023 12:49:00 -0500
> +Subject: [PATCH] Revert "linux-user: add more compat ioctl definitions"
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This reverts commit c5495f4ecb0cdaaf2e9dddeb48f1689cdb520ca0.
> +
> +glibc has fixed (in 2.36.9000-40-g774058d729) the problem
> +that caused a clash when both sys/mount.h annd linux/mount.h
> +are included, and backported this to the 2.36 stable release
> +too:
> +
> +  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmou=
nt.h.3E_and_.3Csys.2Fmount.h.3E
> +
> +It is saner for QEMU to remove the workaround it applied for
> +glibc 2.36 and expect distros to ship the 2.36 maint release
> +with the fix. This avoids needing to add a further workaround
> +to QEMU to deal with the fact that linux/brtfs.h now also pulls
> +in linux/mount.h via linux/fs.h since Linux 6.1
> +
> +Upstream-Status: Backport from v8.0 (master)
> +
> +Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> +Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> +Link: https://lore.kernel.org/r/20230110174901.2580297-2-berrange@redhat=
.com
> +Signed-off-by: Joel Stanley <joel@jms.id.au>
> +---
> + linux-user/syscall.c | 25 -------------------------
> + 1 file changed, 25 deletions(-)
> +
> +diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> +index f95a6161e..510de8edc 100644
> +--- a/linux-user/syscall.c
> ++++ b/linux-user/syscall.c
> +@@ -111,31 +111,6 @@
> + #define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
> + #define FS_IOC32_GETVERSION            _IOR('v', 1, int)
> + #define FS_IOC32_SETVERSION            _IOW('v', 2, int)
> +-
> +-#define BLKGETSIZE64 _IOR(0x12,114,size_t)
> +-#define BLKDISCARD _IO(0x12,119)
> +-#define BLKIOMIN _IO(0x12,120)
> +-#define BLKIOOPT _IO(0x12,121)
> +-#define BLKALIGNOFF _IO(0x12,122)
> +-#define BLKPBSZGET _IO(0x12,123)
> +-#define BLKDISCARDZEROES _IO(0x12,124)
> +-#define BLKSECDISCARD _IO(0x12,125)
> +-#define BLKROTATIONAL _IO(0x12,126)
> +-#define BLKZEROOUT _IO(0x12,127)
> +-
> +-#define FIBMAP     _IO(0x00,1)
> +-#define FIGETBSZ   _IO(0x00,2)
> +-
> +-struct file_clone_range {
> +-        __s64 src_fd;
> +-        __u64 src_offset;
> +-        __u64 src_length;
> +-        __u64 dest_offset;
> +-};
> +-
> +-#define FICLONE         _IOW(0x94, 9, int)
> +-#define FICLONERANGE    _IOW(0x94, 13, struct file_clone_range)
> +-
> + #else
> + #include <linux/fs.h>
> + #endif
> diff --git a/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-c=
ompat-with-glibc-2.36-sys-mou.patch b/meta/recipes-devtools/qemu/qemu/0002-=
Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch
> new file mode 100644
> index 000000000000..d754f21ad4d6
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-w=
ith-glibc-2.36-sys-mou.patch
> @@ -0,0 +1,78 @@
> +From e95c0a42940ca1cf763ca3374b36a9be030039d7 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange@=
redhat.com>
> +Date: Tue, 10 Jan 2023 12:49:01 -0500
> +Subject: [PATCH] Revert "linux-user: fix compat with glibc >=3D 2.36
> + sys/mount.h"
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This reverts commit 3cd3df2a9584e6f753bb62a0028bd67124ab5532.
> +
> +glibc has fixed (in 2.36.9000-40-g774058d729) the problem
> +that caused a clash when both sys/mount.h annd linux/mount.h
> +are included, and backported this to the 2.36 stable release
> +too:
> +
> +  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmou=
nt.h.3E_and_.3Csys.2Fmount.h.3E
> +
> +It is saner for QEMU to remove the workaround it applied for
> +glibc 2.36 and expect distros to ship the 2.36 maint release
> +with the fix. This avoids needing to add a further workaround
> +to QEMU to deal with the fact that linux/brtfs.h now also pulls
> +in linux/mount.h via linux/fs.h since Linux 6.1
> +
> +Upstream-Status: Backport from v8.0 (master)
> +
> +Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> +Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> +Link: https://lore.kernel.org/r/20230110174901.2580297-3-berrange@redhat=
.com
> +Signed-off-by: Joel Stanley <joel@jms.id.au>
> +---
> + linux-user/syscall.c | 18 ------------------
> + meson.build          |  2 --
> + 2 files changed, 20 deletions(-)
> +
> +diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> +index 510de8edc..13a67b84b 100644
> +--- a/linux-user/syscall.c
> ++++ b/linux-user/syscall.c
> +@@ -95,25 +95,7 @@
> + #include <linux/soundcard.h>
> + #include <linux/kd.h>
> + #include <linux/mtio.h>
> +-
> +-#ifdef HAVE_SYS_MOUNT_FSCONFIG
> +-/*
> +- * glibc >=3D 2.36 linux/mount.h conflicts with sys/mount.h,
> +- * which in turn prevents use of linux/fs.h. So we have to
> +- * define the constants ourselves for now.
> +- */
> +-#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
> +-#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
> +-#define FS_IOC_GETVERSION              _IOR('v', 1, long)
> +-#define FS_IOC_SETVERSION              _IOW('v', 2, long)
> +-#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
> +-#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
> +-#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
> +-#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
> +-#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
> +-#else
> + #include <linux/fs.h>
> +-#endif
> + #include <linux/fd.h>
> + #if defined(CONFIG_FIEMAP)
> + #include <linux/fiemap.h>
> +diff --git a/meson.build b/meson.build
> +index e44432370..f37ba4114 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -2032,8 +2032,6 @@ config_host_data.set('HAVE_OPTRESET',
> +                      cc.has_header_symbol('getopt.h', 'optreset'))
> + config_host_data.set('HAVE_IPPROTO_MPTCP',
> +                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTC=
P'))
> +-config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
> +-                     cc.has_header_symbol('sys/mount.h', 'FSCONFIG_SET_=
FLAG'))
> +
> + # has_member
> + config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
> --
> 2.39.1
>

