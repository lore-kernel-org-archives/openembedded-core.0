Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE371CCA473
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 14:45:06 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.8571.1654094701609707224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 07:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=46hPObR3;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.41,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f41.google.com with SMTP id me5so3731138ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 07:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ktOLDRPCYA6v3MlmBNee/M+rwePqixrb/3++G3cw8PY=;
        b=46hPObR36arfVbzyhyrXPsOK4O0rDr0dDQ3v5hsT4VsYsWx4+yjL8AhCv+aOSWJhcb
         3yXSRd3JGfBCT4xV80DlN2bPvCpBiKxd+4VPrZ0Fa0vRK291qYRNBHyW/qXQbKJXRvAs
         lQVr7lco50vlYsUvn4xVpI8v+C3RZSPmdq2jMV/oyM+qiy5R2RVSSenEF+WmB+xgAKL6
         4OCPiGqD17zQNcEkel4Uv8Q8AJUhA1EN9knaVCTuaoiQ5M4z3Fz8R4K7P4HtRrhymlVd
         49dbG+fNLnrkgYQ0Ta+OXV+6mr/0Sx2yNJTyUMwF2uvqOA+zvidyCRSgbGwyC2N1tW4o
         UKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ktOLDRPCYA6v3MlmBNee/M+rwePqixrb/3++G3cw8PY=;
        b=IdlHw3l7qrX2159VXHEuOWJY/siT7VSmRiYSA+zU2ZnL17H2x32ifJO8ZMlrQKItBM
         DIHUOaICAiP4PB/QbwU7gf/jnYebg/wYseIGFVSI945SRMdBojvZ6OXf7QaP/mB3V9IF
         WSzQuz8/y0oxZJkkteJc21jOQW33DmiSOpToeapUKrEkfLUXVln2wj226MIxrS39ILTA
         mViiFH3MM6LuDffETgAC4qIFoY3JfZoFypVx8Koaz5lp+LznETugMzO7+AeZNIHRMjjG
         ngjN0nyS4rsglvEyAu+e9xDRQxTtQ+8TPgdebuOcX1ZUyTyohaGfwf8d3dLP4Q6zfttl
         gLPA==
X-Gm-Message-State: AOAM531YrBFmmyvSTe1Vhv1DdDiDhvijNAXC/Xsep+FGTlVOBZBklVU/
	EOhcXUP6NDppmjp3py73aPBPPO9UtwsZM+4xMYU0Iw==
X-Google-Smtp-Source: 
 ABdhPJzANtB64BR3V19dJgfCYmtESlTp5/0VRDZeb+KXRMiPiKnclEKAOKW1hAWsfdZpokIAlCnol60tOSbmHbcFsn4=
X-Received: by 2002:a17:906:478c:b0:6f4:e6c6:526f with SMTP id
 cw12-20020a170906478c00b006f4e6c6526fmr207807ejc.41.1654094699767; Wed, 01
 Jun 2022 07:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220601053401.8651-1-hprajapati@mvista.com>
In-Reply-To: <20220601053401.8651-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 1 Jun 2022 04:44:48 -1000
Message-ID: 
 <CAOSpxdYmyFF=rwBX9=N7W4JrGkdx2Bn9aGs6L6cFkJC2iyx37A@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] e2fsprogs: CVE-2022-1304 out-of-bounds
 read/write via crafted filesystem
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 14:45:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166378

On Tue, May 31, 2022 at 7:34 PM Hitendra Prajapati
<hprajapati@mvista.com> wrote:
>
> Source: https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git
> MR: 117430
> Type: Security Fix
> Disposition: Backport from https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=maint&id=ab51d587bb9b229b1fade1afd02e1574c1ba5c76
> ChangeID: e6db00c6e8375a2e869fd2e4ead61ca9149eb8fa
> Description:
>           CVE-2022-1304 e2fsprogs: out-of-bounds read/write via crafted filesystem.
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../e2fsprogs/e2fsprogs/CVE-2022-1304.patch   | 60 +++++++++++++++++++
>  .../e2fsprogs/e2fsprogs_1.45.7.bb             |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2022-1304.patch
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2022-1304.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2022-1304.patch
> new file mode 100644
> index 0000000000..74737abda7
> --- /dev/null
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2022-1304.patch
> @@ -0,0 +1,60 @@
> +From a66071ed6a0d1fa666d22dcb78fa6fcb3bf22df3 Mon Sep 17 00:00:00 2001
> +From: Hitendra Prajapati <hprajapati@mvista.com>
> +Date: Fri, 27 May 2022 14:01:50 +0530
> +Subject: [PATCH] CVE-2022-1304
> +
> +Upstream-Status: Backport from https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=maint&id=ab51d587bb9b229b1fade1afd02e1574c1ba5c76

The standard format for upstream status would be:

Upstream-Status: Backport
[https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=maint&id=ab51d587bb9b229b1fade1afd02e1574c1ba5c76]

Also needs to have the CVE: and Signed-off-by: added, e.g.

CVE: CVE-2022-1304
Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>

Thanks so much for helping with CVEs!

Steve

> +
> +libext2fs: add sanity check to extent manipulation
> +It is possible to have a corrupted extent tree in such a way that a leaf
> +node contains zero extents in it. Currently if that happens and we try
> +to traverse the tree we can end up accessing wrong data, or possibly
> +even uninitialized memory. Make sure we don't do that.
> +
> +Additionally make sure that we have a sane number of bytes passed to
> +memmove() in ext2fs_extent_delete().
> +
> +Note that e2fsck is currently unable to spot and fix such corruption in
> +pass1.
> +
> +Signed-off-by: Lukas Czerner <lczerner@redhat.com>
> +Reported-by: Nils Bars <nils_bars@t-online.de>
> +Addresses: https://bugzilla.redhat.com/show_bug.cgi?id=2068113
> +Addresses: CVE-2022-1304
> +Addresses-Debian-Bug: #1010263
> +Signed-off-by: Theodore Ts'o <tytso@mit.edu>
> +
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + lib/ext2fs/extent.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/lib/ext2fs/extent.c b/lib/ext2fs/extent.c
> +index ac3dbfec9..a1b1905cd 100644
> +--- a/lib/ext2fs/extent.c
> ++++ b/lib/ext2fs/extent.c
> +@@ -495,6 +495,10 @@ retry:
> +                       ext2fs_le16_to_cpu(eh->eh_entries);
> +               newpath->max_entries = ext2fs_le16_to_cpu(eh->eh_max);
> +
> ++              /* Make sure there is at least one extent present */
> ++              if (newpath->left <= 0)
> ++                      return EXT2_ET_EXTENT_NO_DOWN;
> ++
> +               if (path->left > 0) {
> +                       ix++;
> +                       newpath->end_blk = ext2fs_le32_to_cpu(ix->ei_block);
> +@@ -1630,6 +1634,10 @@ errcode_t ext2fs_extent_delete(ext2_extent_handle_t handle, int flags)
> +
> +       cp = path->curr;
> +
> ++      /* Sanity check before memmove() */
> ++      if (path->left < 0)
> ++              return EXT2_ET_EXTENT_LEAF_BAD;
> ++
> +       if (path->left) {
> +               memmove(cp, cp + sizeof(struct ext3_extent_idx),
> +                       path->left * sizeof(struct ext3_extent_idx));
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
> index 3bc530e02b..3e6faf4cb8 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.7.bb
> @@ -6,6 +6,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
>             file://mkdir_p.patch \
>             file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
>             file://0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch \
> +           file://CVE-2022-1304.patch \
>             "
>
>  SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166351): https://lists.openembedded.org/g/openembedded-core/message/166351
> Mute This Topic: https://lists.openembedded.org/mt/91469563/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

