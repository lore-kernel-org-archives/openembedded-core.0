Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144C3C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 17:16:16 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web12.1449.1645463775444150565
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 09:16:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DnkYdBLs;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id e22so33628266qvf.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 09:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bPGeBPnQzObQiM3zaenECo1q5iU8wONhSkuukNBzxVI=;
        b=DnkYdBLsIoJsefeyragZR1W2Zd3farFS18of2U4RMH2r2HIpYah16IhID7XOeVBNFd
         8e29q6mJTYmbekfc/aKtS6ZzIcC81ru8qtMLtiPgtzxjTraTZQrkDCBpTTtZGtmGBBwQ
         ARHNKKZ/2J1rgdO4/7usRAmK10FAUqMwcEe+NQ6Ek9NUnmxRbplOWIb1zlPY6hLL0By3
         R4NHl01N28zP7uR7fmYcU0MSdGCfwO/JFjt/GTORtHNY5oIAujJAxtV/ONvUSdwXS7UJ
         iJdwAUd3QzlLQqOCPuGkW6g8JUN4WfDHdSzW2HAk91IUFfHZ/1cjgWqwp1k2Loc9j+Jq
         LYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bPGeBPnQzObQiM3zaenECo1q5iU8wONhSkuukNBzxVI=;
        b=lCyiN+OwyOICnm5ewbYQHAvHdJyEf+0AYXAkyMele/Vsa7cCCUJWZ09pjBwhUvX+pT
         7s+xK9griPZCzHVmLsH+s2CZKE4k5Wpn4Jqefls0wRtoKJQKA1xqnMxeub2vWBhxDLnc
         1aFio29wd28kfMy+EFGZe5aNx83R4PPGFyVjVmOp1idmHarDesRmMAlVqWSoPTUPJRFH
         N0eePEtKMCbwBB9H8xErmETyI81ykQb7t7Uf7BIea+Oy09+cdLOuioWAfTZV7aqhO8QR
         aEkGE+RAnvt1H4kWckXZ7wFxxh3iV/q9/zdi9L1CiJovZGpIuS6/15SAt5zNzGN4rHEY
         FYLQ==
X-Gm-Message-State: AOAM531mbIQukaWJzz4wuDy/YyOfgMIDg5SOcPGdRBrnvIlRgZrsCPA7
	WNPwpnVT2iuBNyj8fJPKB1cpBnE/tlCVxNDDrU8u5SIL2KmbyQ==
X-Google-Smtp-Source: 
 ABdhPJz9NVpqhJ5LphJ/yjHQQ8zjWmnL1M23mXvp6BYlsxLufl+RqycTvL0hJPL22swW+icbfdGsNlBIxRZRaU10SSM=
X-Received: by 2002:ad4:574a:0:b0:42b:ef56:c2a4 with SMTP id
 q10-20020ad4574a000000b0042bef56c2a4mr16096147qvx.16.1645463774371; Mon, 21
 Feb 2022 09:16:14 -0800 (PST)
MIME-Version: 1.0
References: <20220221080815.1979337-1-changqing.li@windriver.com>
In-Reply-To: <20220221080815.1979337-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Feb 2022 09:15:48 -0800
Message-ID: 
 <CAMKF1srQ-bYd6qmmb+YTH_qsNM6bgSOOWFDbwhsLJdJTiVDaQQ@mail.gmail.com>
Subject: Re: [OE-core][hardknott][PATCH] e2fsprogs: backport to fix one
 regression
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 17:16:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162060

I am seeing

CmdError('quilt --quiltrc
/mnt/b/yoe/master/build/tmp/work/x86_64-linux/e2fsprogs-native/1.46.5-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch
0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch
patching file e2fsck/super.c
Hunk #1 FAILED at 1038.
Hunk #2 FAILED at 1050.
2 out of 2 hunks FAILED -- rejects in file e2fsck/super.c
Patch 0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch
can be reverse-applied

On Mon, Feb 21, 2022 at 12:08 AM Changqing Li
<changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Backport a patch in 1.46.3 which fix one regression:
> This is what the changelog says:
>     Fix e2fsck so that the if the s_interval is zero, and the last mount
>     or write time is in the future, it will fix invalid last mount/write
>     timestamps in the superblock. (This was a regression introduced in
>     v1.45.5.)
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |  3 +-
>  ...mount-write-time-when-e2fsck-is-forc.patch | 66 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> index fb02b2006e..1250a9b99c 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> @@ -19,7 +19,8 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
>  SECTION = "base"
>  DEPENDS = "util-linux attr autoconf-archive"
>
> -SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master"
> +SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master \
> +           file://0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch"
>  S = "${WORKDIR}/git"
>
>  inherit autotools gettext texinfo pkgconfig multilib_header update-alternatives ptest
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch
> new file mode 100644
> index 0000000000..d679b25b1d
> --- /dev/null
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-fix-last-mount-write-time-when-e2fsck-is-forc.patch
> @@ -0,0 +1,66 @@
> +From 2c69c94217b6db083d601d4fd62d6ab6c1628fee Mon Sep 17 00:00:00 2001
> +From: Lukas Czerner <lczerner@redhat.com>
> +Date: Mon, 14 Jun 2021 15:27:25 +0200
> +Subject: [PATCH] e2fsck: fix last mount/write time when e2fsck is forced
> +
> +With commit c52d930f e2fsck is no longer able to fix bad last
> +mount/write time by default because it is conditioned on s_checkinterval
> +not being zero, which it is by default.
> +
> +One place where it matters is when other e2fsprogs tools require to run
> +full file system check before a certain operation. If the last mount
> +time is for any reason in future, it will not allow it to run even if
> +full e2fsck is ran.
> +
> +Fix it by checking the last mount/write time when the e2fsck is forced,
> +except for the case where we know the system clock is broken.
> +
> +[ Reworked the conditionals so error messages claiming that the last
> +  write/mount time were corrupted wouldn't be always printed when the
> +  e2fsck was run with the -f option, thus causing 299 out of 372
> +  regression tests to fail.  -- TYT ]
> +
> +Fixes: c52d930f ("e2fsck: don't check for future superblock times if checkinterval == 0")
> +Reported-by: Dusty Mabe <dustymabe@redhat.com>
> +Signed-off-by: Lukas Czerner <lczerner@redhat.com>
> +Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> +
> +Upstream-Status: Backport [https://github.com/tytso/e2fsprogs/commit/2c69c94217b6db083d601d4fd62d6ab6c1628fee]
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + e2fsck/super.c | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/e2fsck/super.c b/e2fsck/super.c
> +index e1c3f935..31e2ffb2 100644
> +--- a/e2fsck/super.c
> ++++ b/e2fsck/super.c
> +@@ -1038,9 +1038,9 @@ void check_super_block(e2fsck_t ctx)
> +        * Check to see if the superblock last mount time or last
> +        * write time is in the future.
> +        */
> +-      if (!broken_system_clock && fs->super->s_checkinterval &&
> +-          !(ctx->flags & E2F_FLAG_TIME_INSANE) &&
> +-          fs->super->s_mtime > (__u32) ctx->now) {
> ++      if (((ctx->options & E2F_OPT_FORCE) || fs->super->s_checkinterval) &&
> ++          !broken_system_clock && !(ctx->flags & E2F_FLAG_TIME_INSANE) &&
> ++          (fs->super->s_mtime > (__u32) ctx->now)) {
> +               pctx.num = fs->super->s_mtime;
> +               problem = PR_0_FUTURE_SB_LAST_MOUNT;
> +               if (fs->super->s_mtime <= (__u32) ctx->now + ctx->time_fudge)
> +@@ -1050,9 +1050,9 @@ void check_super_block(e2fsck_t ctx)
> +                       fs->flags |= EXT2_FLAG_DIRTY;
> +               }
> +       }
> +-      if (!broken_system_clock && fs->super->s_checkinterval &&
> +-          !(ctx->flags & E2F_FLAG_TIME_INSANE) &&
> +-          fs->super->s_wtime > (__u32) ctx->now) {
> ++      if (((ctx->options & E2F_OPT_FORCE) || fs->super->s_checkinterval) &&
> ++          !broken_system_clock && !(ctx->flags & E2F_FLAG_TIME_INSANE) &&
> ++          (fs->super->s_wtime > (__u32) ctx->now)) {
> +               pctx.num = fs->super->s_wtime;
> +               problem = PR_0_FUTURE_SB_LAST_WRITE;
> +               if (fs->super->s_wtime <= (__u32) ctx->now + ctx->time_fudge)
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162017): https://lists.openembedded.org/g/openembedded-core/message/162017
> Mute This Topic: https://lists.openembedded.org/mt/89289488/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

