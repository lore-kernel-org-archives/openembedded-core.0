Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C898C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 18:26:36 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.32660.1641234395039298021
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 10:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=pZaQJ8QM;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.170,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f170.google.com with SMTP id p19so31195087qtw.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 10:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LnmcfQnWPvwFcq+S5qzjwZj5m1WSFjUKRpu/IYbV/l4=;
        b=pZaQJ8QMyspcgAMVkLvRpd5LQzS02waTMhqc+IeIjMdbdXMZeOLNovBr8bpAxZw+eU
         Ls7mxoeyj80LiGGEF7UZM9zOQYDY252Ewk1VMyoCe8f50QbkaOwTUgcDiD2pAtkmpSN0
         2sMf3DNqyuU2mp6VLYy0Uiq/SUXid9mDR+7lCaA0B/eybkNMxe3N/4VKZ/fBjWOyeTdm
         KcR1u0odU1kHlMZYAUbj5hzKBcAGYE9qOuiAf119MX4k6QIzz/qp7iT12mDGnQwLN0xP
         NfubGPYgFq4Krzl0YpdqgryLeE9vYwY+wa65r3zsjjkP/2qfJJqOFJfGzZllSmIQYf4+
         MQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LnmcfQnWPvwFcq+S5qzjwZj5m1WSFjUKRpu/IYbV/l4=;
        b=HL5oZFlMRyqcgezG3DRCDwdp7mfTpWNQA23WVIvU3DlW4vhc52ROYrNp4XegJ6QT9x
         ZPGRXrHw/VMmVuf0S7YqKHVwhuIFpEUD8YU3awS3TaJQsKTYqv1IzEUmYkpxi7/az9i7
         0Q3Pot7cKEwBd6LTONn0dFT+l7l3PY0ZeObK4c7eIkgGecLlUoGWUyLBZShUXGw+/BP/
         mgScWpTtqDnvabWB3HWirVlQ7Vy3tXyG7jUCReQlIHPRDkfq5AsHBAxKaIbEtAq8w/26
         J53pdj7eR1P5R9s+Lz67KQLFsEnVydhWXLRSdgtTEjipHc8U7W3ubxDJKSDp9//Q0McP
         W/vw==
X-Gm-Message-State: AOAM532Oph/N5Z4y8uDxvcp/4OtbAjvNIkk1ZC9ssUHM18uWDSzK7oA3
	xzEx4+1L86iPtYtszo678XZErqKihYVETD8k
X-Google-Smtp-Source: 
 ABdhPJxaiN5QZrKAkv8OgDqtwDMMCYgy/alQnIe0RU8dRTRa0uzTw2oj88OiUwFVLlIisBrhabWimg==
X-Received: by 2002:ac8:7406:: with SMTP id p6mr41876880qtq.245.1641234393725;
        Mon, 03 Jan 2022 10:26:33 -0800 (PST)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com.
 [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id
 y30sm19680810qkj.43.2022.01.03.10.26.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jan 2022 10:26:33 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f43.google.com with SMTP id kk22so31750320qvb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 10:26:33 -0800 (PST)
X-Received: by 2002:a05:6214:5286:: with SMTP id
 kj6mr42616007qvb.74.1641234392966;
 Mon, 03 Jan 2022 10:26:32 -0800 (PST)
MIME-Version: 1.0
References: <20220103161854.301148-1-otavio@ossystems.com.br>
 <20220103161854.301148-5-otavio@ossystems.com.br>
 <751c03719644795404dcf983123f3b9ea50aec72.camel@linuxfoundation.org>
In-Reply-To: 
 <751c03719644795404dcf983123f3b9ea50aec72.camel@linuxfoundation.org>
Date: Mon, 3 Jan 2022 15:26:21 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKpLqP5NUXYfMk3j9yuJGCZjNgHWr5fgQCxNA6LusaWPgw@mail.gmail.com>
Message-ID: 
 <CAP9ODKpLqP5NUXYfMk3j9yuJGCZjNgHWr5fgQCxNA6LusaWPgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/24] e2fsprogs: upgrade 1.46.4 -> 1.46.5
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 18:26:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160144

Em seg., 3 de jan. de 2022 =C3=A0s 14:42, Richard Purdie
<richard.purdie@linuxfoundation.org> escreveu:
> On Mon, 2022-01-03 at 13:18 -0300, Otavio Salvador wrote:
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >  ...ct_io-expect-correct-expected-output.patch | 69 -------------------
> >  ...-missing-check-for-permission-denied.patch |  3 +-
> >  .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  3 +-
> >  ...2fsprogs_1.46.4.bb =3D> e2fsprogs_1.46.5.bb} |  9 +--
> >  4 files changed, 7 insertions(+), 77 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-test=
s-u_direct_io-expect-correct-expected-output.patch
> >  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.46.4.bb =3D> e2fsp=
rogs_1.46.5.bb} (94%)
> >
> > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_dir=
ect_io-expect-correct-expected-output.patch b/meta/recipes-devtools/e2fspro=
gs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
> > deleted file mode 100644
> > index f198df83eb..0000000000
> > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-=
expect-correct-expected-output.patch
> > +++ /dev/null
> > @@ -1,69 +0,0 @@
> > -From ea5adf259e01c790f9ba69d6fe88d691de410b6f Mon Sep 17 00:00:00 2001
> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
> > -Date: Sun, 22 Aug 2021 14:37:32 +0200
> > -Subject: [PATCH] tests/u_direct_io/expect: correct expected output
> > -
> > -This is likely the right fix, but upstream needs to confirm.
> > -
> > -Upstream-Status: Inappropriate [issue reported https://github.com/tyts=
o/e2fsprogs/issues/80]
> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ----
> > - tests/u_direct_io/expect | 16 +++++++++-------
> > - 1 file changed, 9 insertions(+), 7 deletions(-)
> > -
> > -diff --git a/tests/u_direct_io/expect b/tests/u_direct_io/expect
> > -index b0cdc730..830cbd75 100644
> > ---- a/tests/u_direct_io/expect
> > -+++ b/tests/u_direct_io/expect
> > -@@ -19,8 +19,8 @@ Filesystem OS type:       Linux
> > - Inode count:              32768
> > - Block count:              32768
> > - Reserved block count:     1638
> > --Overhead clusters:        5131
> > --Free blocks:              27631
> > -+Overhead clusters:        6155
> > -+Free blocks:              26607
> > - Free inodes:              32757
> > - First block:              0
> > - Block size:               4096
> > -@@ -29,27 +29,29 @@ Reserved GDT blocks:      7
> > - Blocks per group:         32768
> > - Fragments per group:      32768
> > - Inodes per group:         32768
> > --Inode blocks per group:   1024
> > -+Inode blocks per group:   2048
> > - Flex block group size:    16
> > - Mount count:              0
> > - Check interval:           15552000 (6 months)
> > - Reserved blocks uid:      0
> > - Reserved blocks gid:      0
> > - First inode:              11
> > --Inode size:           128
> > -+Inode size:           256
> > -+Required extra isize:     32
> > -+Desired extra isize:      32
> > - Journal inode:            8
> > - Default directory hash:   half_md4
> > - Journal backup:           inode blocks
> > - Directories:              2
> > -  Group  0: block bitmap at 9, inode bitmap at 25, inode table at 41
> > --           27631 free blocks, 32757 free inodes, 2 used directories
> > -+           26607 free blocks, 32757 free inodes, 2 used directories
> > - e2fsck -fn -N test_filesys $LOOP
> > - Pass 1: Checking inodes, blocks, and sizes
> > - Pass 2: Checking directory structure
> > - Pass 3: Checking directory connectivity
> > - Pass 4: Checking reference counts
> > - Pass 5: Checking group summary information
> > --test_filesys: 11/32768 files (9.1% non-contiguous), 5137/32768 blocks
> > -+test_filesys: 11/32768 files (9.1% non-contiguous), 6161/32768 blocks
> > - Exit status is 0
> > - e2fsck -fn -N test_filesys $TMPFILE
> > - Pass 1: Checking inodes, blocks, and sizes
> > -@@ -57,5 +59,5 @@ Pass 2: Checking directory structure
> > - Pass 3: Checking directory connectivity
> > - Pass 4: Checking reference counts
> > - Pass 5: Checking group summary information
> > --test_filesys: 11/32768 files (9.1% non-contiguous), 5137/32768 blocks
> > -+test_filesys: 11/32768 files (9.1% non-contiguous), 6161/32768 blocks
> > - Exit status is 0
> > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-mi=
ssing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e=
2fsprogs/e2fsprogs-fix-missing-check-for-permission-denied.patch
> > index a4f98246bb..045ffa6086 100644
> > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-c=
heck-for-permission-denied.patch
> > +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-fix-missing-c=
heck-for-permission-denied.patch
> > @@ -1,7 +1,8 @@
> > -From f1e161a48f74b46ae3c99921971c4b5ae8d587c9 Mon Sep 17 00:00:00 2001
> > +From ad7f927c0d95fd461f45f478bbe6355b8df46eac Mon Sep 17 00:00:00 2001
> >  From: Jackie Huang <jackie.huang@windriver.com>
> >  Date: Wed, 10 Aug 2016 11:19:44 +0800
> >  Subject: [PATCH] Fix missing check for permission denied.
> > +Organization: O.S. Systems Software LTDA.
> >
> >  If the path to "ROOT_SYSCONFDIR/mke2fs.conf" has a permission denied p=
roblem,
> >  then the get_dirlist() call will return EACCES. But the code in profil=
e_init
> > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.pa=
tch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
> > index 41a4047622..6f3ad342cc 100644
> > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
> > +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
> > @@ -1,7 +1,8 @@
> > -From 550b5fbece84dde16ce9910c2cad390ea4a2f5d5 Mon Sep 17 00:00:00 2001
> > +From 5e5820fd214a0bc25907053ae6a76eb1ec493134 Mon Sep 17 00:00:00 2001
> >  From: Ross Burton <ross.burton@intel.com>
> >  Date: Mon, 23 Dec 2013 13:38:34 +0000
> >  Subject: [PATCH] e2fsprogs: silence debugfs
> > +Organization: O.S. Systems Software LTDA.
> >
> >  When executing a script don't echo every command, as we do this for en=
tire
> >  filesystems at rootfs time.
>
> Thanks for the upgrades!
>
> Adding OS Systems headers to existing patch files like this with no real =
other
> changes doesn't seem like it may have been intended?

I'll remove it and regen all patches.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

