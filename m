Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD2F1112246
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 00:07:08 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5306.1775088421967329267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 17:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZaUWz/89;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7d91f82d819so355791a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 17:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775088421; cv=none;
        d=google.com; s=arc-20240605;
        b=Eu+EAJdGLerqFBRxcemVGj8KWVa0D/imdQPldx0xQRnnQthJi22nJ51OfO5uR8wu5i
         UvG7pQo0rmYYao0VrEqg2gol2XNOwOsTGOOOKrKyYvYhFkDokfTR1cHghJfDg8nuxQ1d
         v9e3+Dkft0geWa5IGG9smgLgiDWzRYe6cGjTfZN1nsOnuyCVMu81vdu6OCApiTxxoPqD
         Fni5S2cjpuuaNQiMGK0NI4EgJTgUi7eUgzXdvk7MAysw1ifuuokZkXz8X8JPmQ37AfP3
         kDPy/0v3CYucpZMLMe0bOJuq0gmBkEjlldWFsHrFjL7+PMRL+OWiNwoSvuLBfYkFC/J8
         7P1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bPbzCkqlEmJLs/8arVXZw1lmVhAl/RsGjbK35x+oxUI=;
        fh=qaE+R8tw13mIZtiDyk0ILZwdZjqMlU62Xvoax2zwAMs=;
        b=IFSWUOf5hBIsHjOSHrTqqYv9fEPxtPdoAFDAJRBNjZ9aUZSqp9NskqPiKoBV7Kk9K0
         9eF7mg0TbSpKsWwbTTkbg/8NpiUsSwTrs6DcIbZjvRImSiyi0nVpezK3L8mpJTq5ZQGX
         qaBQsWQD+sFSQWo7EBPnVxZBiTspPHlftAX3ONhC1M8bzV1fpgz83q83B4cZbo6qBnFG
         VGF9IvpNTDp2a9vAmJrtLV3zddwNBQ9HMxIRmV2kirEZwOudpTi87uNbc7OIDa4DZ+mq
         4o5dWCaWM4AEHu/nDJKjFYODgsLAmCkJ/fBQtg3vRReC8VhZKBfuDjg/HJzRXFrS5mD7
         5u1A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775088421; x=1775693221; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPbzCkqlEmJLs/8arVXZw1lmVhAl/RsGjbK35x+oxUI=;
        b=ZaUWz/89J9obbS3++Fp5Q/zrn47U8R2MAyWRLPuLhgNrLug4hduosj4CgTq9vvr+Jo
         QUaCvZRAgln8J5CMwyUQH1s/UGyOsgu/VYgj95B/m/YsAw0PXX6CmdnfJ9lsZzUcGhzM
         0tHUMURe5o+B8qVVRaIukQwkmbqdBaYWmJ2fBB+NYU4cTLGPhte8FNHf/psQqVsn7cgI
         wfwCEiPnpQB5/CgF7YwPugUtVbhlpOzoeBV+T/LvCvqD5k8+6Oa/59PDZAJ+/+YQ8Gmf
         6lA5JPapmuPJ5qJqKCh1jWknwbCqvgXtvfMUKaaUDEh3YVU2PMW0dhrMtfXftl+FZHuB
         yp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775088421; x=1775693221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bPbzCkqlEmJLs/8arVXZw1lmVhAl/RsGjbK35x+oxUI=;
        b=lqn3CsbXVEhQi8t8y84siW0p43V3GaiG6Vu8XJzO68vPPredf6cb9A9yLjlUnH1ZML
         3ZR4VyImuXeObIDbB70kS00LoTQ4MZNmclfeD6QnMFmfoD5AToZTMtpPFwWfJac4Xvi6
         vyMk/jwir+koxVPfniBlfFCgZHva0n9Mlj+V+gLhljnhzQ6ZQDYk+lZtsdv2o5QSTU+X
         7XOAPuFqtKNzxBFhcPki/RYhZIzH2ZkEv5jSIjjEZenlvQHa00DjjpO5nDFM3OZrUuUA
         3Qz6N44PgW1hpUn+FC4Lw1pNxffJuPXUTCyTZpwDjdXXXDAXu5d/UD+ZDOx0KzPyTm59
         peuA==
X-Gm-Message-State: AOJu0YyqO5twS6iR10VPQpVFxkqRxwXNTdvPrNAKuFualhzzRZbl66Xq
	hjyf+hU63nKGvk/c7IHNA/OmgvpflWIvBlFMh3Z3V8LEav0PTP4Rl7tw57bCXF6czITT/zaP7RC
	aNI0xHmvxM+01MBpa+w5DMj3U5canfSo=
X-Gm-Gg: ATEYQzz+giRKiLskqtTIwEH1eZHU5pxcdwMkHFnUZgDHs88nXVP8w9o54CgOiJgQ9y3
	KNVN43qaYMeac69VYjBehrdPvu9l1e3OWR7jY02DcqsJfmRcmZKp5QCC0ODie4uJZBvYs8ShQJH
	6/ufXekqViPWVQOyvUQuwM8tAAQaPiwcssAkP/nN1iIlCebFUW1rWM6RlGzE+whEtO29HzvNh03
	Ngm99Q/rqfnDGbxlO6H5KR4gAZtH61mcexRRXCN8suH0XHTZfo64H3KFLLimt+1IMs1PxbMqQ1U
	h7c5zjLx
X-Received: by 2002:a05:6830:3bc5:b0:7d9:b0d7:ffda with SMTP id
 46e09a7af769-7db9923e9c3mr4105284a34.11.1775088421072; Wed, 01 Apr 2026
 17:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
 <20260325021856.4053666-11-ankur.tyagi85@gmail.com> <DHHWST45DJTG.1EJZEHOO8HO56@smile.fr>
In-Reply-To: <DHHWST45DJTG.1EJZEHOO8HO56@smile.fr>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 2 Apr 2026 13:06:50 +1300
X-Gm-Features: AQROBzA2OEpEWSaiT9k_Cfi3YZO-OtrUsxvrwyd-ryVUteN40zmA5ujzutcd6mA
Message-ID: <CADySD0Hw65UuvsAFC3mK+EPdJwi3BXc=uqrnDXCeF8tMRc+aEA@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 11/12] e2fsprogs: upgrade 1.47.3 -> 1.47.4
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, Wang Mingyu <wangmy@fujitsu.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 00:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234467

On Thu, Apr 2, 2026 at 4:04=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr>=
 wrote:
>
> On Wed Mar 25, 2026 at 3:18 AM CET, Ankur Tyagi via lists.openembedded.or=
g wrote:
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > 0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
> > removed since it's inclued in 1.47.4
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com=
>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > (cherry picked from commit b14266b4c27e7e3f37a1057ab694c6b21b66b83a)
> >
> > Release Notes:
> > https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/doc/RelNotes/=
v1.47.4.txt?h=3Dv1.47.4
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Hello,
>
> I'm sorry but this upgrade contains feature change and, because of that
> is not eligible for stable merge:
> > E2fsprogs 1.47.4 (March 6, 2025)
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Updates/Fixes since v1.47.3:
> >
> > UI and Features
> > ---------------
> >
> > [...]
> >
> > Add mke2fs extended option in root_selinux to set a SELinux security
> > context label for the root directory.
> >
> > Enable mke2fs to support multiple -E options in the command line.
>

Understood, thanks for the review.

> Regards,
>
> > ---
> >  ...inode.c-Fix-for-file-larger-than-2GB.patch | 40 -------------------
> >  ...2fsprogs_1.47.3.bb =3D> e2fsprogs_1.47.4.bb} |  3 +-
> >  2 files changed, 1 insertion(+), 42 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc=
-create_inode.c-Fix-for-file-larger-than-2GB.patch
> >  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.3.bb =3D> e2fsp=
rogs_1.47.4.bb} (97%)
> >
> > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create=
_inode.c-Fix-for-file-larger-than-2GB.patch b/meta/recipes-devtools/e2fspro=
gs/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
> > deleted file mode 100644
> > index 1c578022fb..0000000000
> > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.=
c-Fix-for-file-larger-than-2GB.patch
> > +++ /dev/null
> > @@ -1,40 +0,0 @@
> > -From 6359e0ec8ef249d202dbb8583a6e430f20c5b1a0 Mon Sep 17 00:00:00 2001
> > -From: Robert Yang <liezhi.yang@windriver.com>
> > -Date: Sun, 30 Nov 2025 21:47:50 +0800
> > -Subject: [PATCH] misc/create_inode.c: Fix for file larger than 2GB
> > -
> > -Fixed:
> > -$ dd if=3D/dev/zero of=3D../image.ext4 bs=3D1M count=3D4k
> > -$ dd if=3D/dev/random of=3D../rootfs/largefile bs=3D1M count=3D3k
> > -$ ./misc/mke2fs -t ext4 -d ../rootfs/ ../image.ext4
> > -__populate_fs: Ext2 file too big while writing file "largefile"
> > -mke2fs: Ext2 file too big while populating file system
> > -
> > -This was because the offset is overflow, use __u64 to fix the problem.
> > -
> > -Another code which uses ext2_off_t is copy_fs_verity_data(), but it on=
ly copies
> > -the metadata, so it should be enough large for it, just leave it there=
.
> > -
> > -Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/25=
8]
> > -
> > -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ----
> > - misc/create_inode.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/misc/create_inode.c b/misc/create_inode.c
> > -index 624efc03..14273534 100644
> > ---- a/misc/create_inode.c
> > -+++ b/misc/create_inode.c
> > -@@ -414,7 +414,7 @@ static ssize_t my_pread(int fd, void *buf, size_t =
count, off_t offset)
> > - }
> > - #endif /* !defined HAVE_PREAD64 && !defined HAVE_PREAD */
> > -
> > --static errcode_t write_all(ext2_file_t e2_file, ext2_off_t off, const=
 char *buf, unsigned int n_bytes) {
> > -+static errcode_t write_all(ext2_file_t e2_file, __u64 off, const char=
 *buf, unsigned int n_bytes) {
> > -     errcode_t err =3D ext2fs_file_llseek(e2_file, off, EXT2_SEEK_SET,=
 NULL);
> > -     if (err)
> > -             return err;
> > ---
> > -2.34.1
> > -
> > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb b/meta=
/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
> > similarity index 97%
> > rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
> > rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
> > index 40658399d9..90f8f37b8e 100644
> > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
> > +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
> > @@ -4,14 +4,13 @@ SRC_URI +=3D "file://remove.ldconfig.call.patch \
> >             file://run-ptest \
> >             file://ptest.patch \
> >             file://mkdir_p.patch \
> > -           file://0001-misc-create_inode.c-Fix-for-file-larger-than-2G=
B.patch \
> >             "
> >  SRC_URI:append:class-native =3D " \
> >             file://e2fsprogs-fix-missing-check-for-permission-denied.pa=
tch \
> >             file://quiet-debugfs.patch \
> >             "
> >
> > -SRCREV =3D "da631e117dcf8797bfda0f48bdaa05ac0fbcf7af"
> > +SRCREV =3D "ece89fac4603e400155b7bbf6326284f8511bca9"
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+\.\d+(\.\d+)*)$"
> >
> >  EXTRA_OECONF +=3D "--libdir=3D${base_libdir} --sbindir=3D${base_sbindi=
r} \
>
>
> --
> Yoann Congal
> Smile ECS
>

