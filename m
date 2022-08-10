Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5FBC19F2A
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 16:31:15 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.484.1660149070327573429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 09:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qH5OCO/q;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id z2so19826324edc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 09:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=HXCXhlYZ0V9KpbTkTvxEyn3ZlpuwQDd8Q+KbGzk+TkI=;
        b=qH5OCO/qwTV7ov6ENe8bCeQ6kPAbiiuL8tRF9XFb3xKKgbByXIRL5PjzGif21NfNEF
         fyluNfJcvZNQf61RA2xFhT0ItXzAJzzuvElKdYDXFvAzu2CGS/UDx4QSr8prDL9YRSx8
         I6Mr0i6km1qGB5Kgrbtj9GbQlS3DKdt+80Zi/pwz0xaugaIa9DwHP2O4tVWjNmOxDjV+
         WKYcjDK9rZ0+WOBm4NIGaOaa8AKkUTTIS9IGfCR3srDA10Djk/fiwMXaKnj8jNH9bOs7
         6qPrJIqsxTnQAfGWyNww9cDgZr6tQjxHCvAzjDpDymdizXei1DQUQVD8mmcT1XVtyCpY
         e2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=HXCXhlYZ0V9KpbTkTvxEyn3ZlpuwQDd8Q+KbGzk+TkI=;
        b=goRjTNlHkOYOYLlfwMFEM9slMAHXGdC6iGZjvlzmpdqKV3ZfaaCUF0/xZ3yp9beurk
         5VSJOOK3ssTpx9jOWdZ63QpA+p6bz4/0mxKOHv7RwoCVYtwkqKQ5q8fQpIwDQAQVAtVI
         0eqXhs2Br9dvNyKFB6fHiWx3GQoe4cNrRZElFHGtbYFIwCAxvz9QkclOLhBbQBxuOxxD
         zBLWG2QOEju/U56Y9gISfw7DA77AXGlmRFRjyvjd1lt7yBZ6O7A89copCukqHE7RDMMy
         eYGw1NFHDotH40dJjQhna479uNvyImWlL4hIZA4c8810oDQ10GPKSSR6S3CxaQh0hzf9
         eALg==
X-Gm-Message-State: ACgBeo2njJSG8fd3UNja06f0JK5vhHqW+8d5028dKAMi/pSztmKaTyQO
	deMv3i3whQ296b3xMWVrBdICyZ54g2snV7Mpb0ZTYfjVkyTJ6Q==
X-Google-Smtp-Source: 
 AA6agR413m6xpZG6qU5yIqTyzhW3F7tdjcI3N/KIuMr/jgaSk5eoMrB02Peip9EL107oQPToNf1WXlJ/CIMeVQ8Y/js=
X-Received: by 2002:aa7:d0c8:0:b0:43c:f071:992a with SMTP id
 u8-20020aa7d0c8000000b0043cf071992amr27447971edo.418.1660149068733; Wed, 10
 Aug 2022 09:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <1705773DE10A5E2A.21236@lists.openembedded.org>
 <b6e3d481-675d-fc6f-b88b-81cfc6ca2aed@windriver.com>
In-Reply-To: <b6e3d481-675d-fc6f-b88b-81cfc6ca2aed@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 10 Aug 2022 06:30:57 -1000
Message-ID: 
 <CAOSpxdYbaGBmOqhvcaPeUgGZZUumE9fc_0c0g_sq5A4AHeXv3w@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] u-boot: fix CVE-2022-33103
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 16:31:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169199

On Wed, Aug 10, 2022 at 5:35 AM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
> Steve, did you miss this patch?

I did :-(

I've got it now.  Sorry about that.

Steve

> On 2022-07-26 15:18, Sakib Sajal wrote:
> > Backport patch to resolve CVE-2022-33103.
> >
> > Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > ---
> >   ..._read-Prevent-arbitrary-code-executi.patch | 80 +++++++++++++++++++
> >   meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
> >   2 files changed, 81 insertions(+)
> >   create mode 100644 meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
> >
> > diff --git a/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch b/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
> > new file mode 100644
> > index 0000000000..b1650f6baa
> > --- /dev/null
> > +++ b/meta/recipes-bsp/u-boot/files/0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch
> > @@ -0,0 +1,80 @@
> > +From 65f1066f5abe291c7b10b6075fd60776074a38a9 Mon Sep 17 00:00:00 2001
> > +From: Miquel Raynal <miquel.raynal@bootlin.com>
> > +Date: Thu, 9 Jun 2022 16:02:06 +0200
> > +Subject: [PATCH] fs/squashfs: sqfs_read: Prevent arbitrary code execution
> > +
> > +Following Jincheng's report, an out-of-band write leading to arbitrary
> > +code execution is possible because on one side the squashfs logic
> > +accepts directory names up to 65535 bytes (u16), while U-Boot fs logic
> > +accepts directory names up to 255 bytes long.
> > +
> > +Prevent such an exploit from happening by capping directory name sizes
> > +to 255. Use a define for this purpose so that developers can link the
> > +limitation to its source and eventually kill it some day by dynamically
> > +allocating this array (if ever desired).
> > +
> > +Link: https://lore.kernel.org/all/CALO=DHFB+yBoXxVr5KcsK0iFdg+e7ywko4-e+72kjbcS8JBfPw@mail.gmail.com
> > +Reported-by: Jincheng Wang <jc.w4ng@gmail.com>
> > +Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > +Tested-by: Jincheng Wang <jc.w4ng@gmail.com>
> > +
> > +CVE: CVE-2022-33103
> > +Upstream-Status: Backport [2ac0baab4aff1a0b45067d0b62f00c15f4e86856]
> > +
> > +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > +---
> > + fs/squashfs/sqfs.c | 8 +++++---
> > + include/fs.h       | 4 +++-
> > + 2 files changed, 8 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/fs/squashfs/sqfs.c b/fs/squashfs/sqfs.c
> > +index e2d91c654c..a145d754cc 100644
> > +--- a/fs/squashfs/sqfs.c
> > ++++ b/fs/squashfs/sqfs.c
> > +@@ -973,6 +973,7 @@ int sqfs_readdir(struct fs_dir_stream *fs_dirs, struct fs_dirent **dentp)
> > +     int i_number, offset = 0, ret;
> > +     struct fs_dirent *dent;
> > +     unsigned char *ipos;
> > ++    u16 name_size;
> > +
> > +     dirs = (struct squashfs_dir_stream *)fs_dirs;
> > +     if (!dirs->size) {
> > +@@ -1055,9 +1056,10 @@ int sqfs_readdir(struct fs_dir_stream *fs_dirs, struct fs_dirent **dentp)
> > +             return -SQFS_STOP_READDIR;
> > +     }
> > +
> > +-    /* Set entry name */
> > +-    strncpy(dent->name, dirs->entry->name, dirs->entry->name_size + 1);
> > +-    dent->name[dirs->entry->name_size + 1] = '\0';
> > ++    /* Set entry name (capped at FS_DIRENT_NAME_LEN which is a U-Boot limitation) */
> > ++    name_size = min_t(u16, dirs->entry->name_size + 1, FS_DIRENT_NAME_LEN - 1);
> > ++    strncpy(dent->name, dirs->entry->name, name_size);
> > ++    dent->name[name_size] = '\0';
> > +
> > +     offset = dirs->entry->name_size + 1 + SQFS_ENTRY_BASE_LENGTH;
> > +     dirs->entry_count--;
> > +diff --git a/include/fs.h b/include/fs.h
> > +index 1c79e299fd..6cb7ec89f4 100644
> > +--- a/include/fs.h
> > ++++ b/include/fs.h
> > +@@ -161,6 +161,8 @@ int fs_write(const char *filename, ulong addr, loff_t offset, loff_t len,
> > + #define FS_DT_REG  8         /* regular file */
> > + #define FS_DT_LNK  10        /* symbolic link */
> > +
> > ++#define FS_DIRENT_NAME_LEN 256
> > ++
> > + /**
> > +  * struct fs_dirent - directory entry
> > +  *
> > +@@ -181,7 +183,7 @@ struct fs_dirent {
> > +     /** change_time:        time of last modification */
> > +     struct rtc_time change_time;
> > +     /** name:               file name */
> > +-    char name[256];
> > ++    char name[FS_DIRENT_NAME_LEN];
> > + };
> > +
> > + /* Note: fs_dir_stream should be treated as opaque to the user of fs layer */
> > +--
> > +2.33.0
> > +
> > diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
> > index f2443723e2..a6a15d698f 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
> > +++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
> > @@ -4,6 +4,7 @@ require u-boot.inc
> >   SRC_URI:append = " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
> >                      file://0001-riscv-fix-build-with-binutils-2.38.patch \
> >                      file://0001-i2c-fix-stack-buffer-overflow-vulnerability-in-i2c-m.patch \
> > +                   file://0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch \
> >                    "
> >
> >   DEPENDS += "bc-native dtc-native python3-setuptools-native"
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#168511): https://lists.openembedded.org/g/openembedded-core/message/168511
> > Mute This Topic: https://lists.openembedded.org/mt/92635002/4422444
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakib.sajal@windriver.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

