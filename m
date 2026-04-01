Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A0810F6FCB
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 15:05:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15543.1775055899344100575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 08:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=i29drYwl;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488895ad947so3501755e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 08:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775055898; x=1775660698; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhTwDk8y9sCUaZMK+prUv0l8r0UEz/jzHOTy0L3y8Us=;
        b=i29drYwlsXE9/gR8TdDw1fwm5uMK+oHZYKXNBrfMog2kKqv23Y/EsR3JbB7WM8efwJ
         AhDGr4nSLZMzMfUC0ehaKiACq54Xb6pmGOUSgOzUG56twr5Hg4QbdFjgx8wK2LSd+quF
         JxPRWAPziawzjq6tbxTDiyTJXQFXxHDHfM6KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775055898; x=1775660698;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hhTwDk8y9sCUaZMK+prUv0l8r0UEz/jzHOTy0L3y8Us=;
        b=p0f0rcGdXsjY+SOa+XNKySavlQbj4h2cNrWGTtf6OlgJV7EvVeZcoo9sPoATdkbM8f
         fE+Wb45/O6Njr4duViux/Qe77I7HgtF45waYg2UVz4AU6BAMCYZHu0Gzv1Pzq2SP6VCc
         KJlV8ZHrbL8twBSVD30FcY6e9MhPQD3e5ceDu5iSstfhv0ON6jRLwlfQljiucb/P31ng
         sq12KoigROd0o8efGhE2//8Xg1oMA8CK55KcgFvdqkBdXdem3n0TCvdedGzSc06VkaAN
         ekq2UEi2kOIBkNoiGsnLPAcfYVO5kIWyOACh+ylLDTxPRDM19cZxNAmKt1MCKbj7R7aM
         XvuA==
X-Forwarded-Encrypted: i=1; AJvYcCXNz/fd3i9vlVH17gQP+Hzn6qDeeFUnnnnxayENzlTkyLY9Lx/pFKG+okpEvazDjA3MN3rrso4SyvSBknzFwsAgtA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw7dKZC1ZYYdc65hoVMX01G2MS4Gh0OSuO6/SW2rYZGK6OvhY/Q
	4/6wCH7iVQ4LznPuIEx113DQbiwT2XcWjNJg5tTeA8w2NDkXBAzYQt1Isfh+mqx9cYU=
X-Gm-Gg: ATEYQzxaO9C7LG0OYcg5YUtHy2VFG14tVAp0cPDN1D6j1bcHYVB0KhDIxIGwERt4yc2
	W9BcRmWHshlQnrarQV48E/wlym66q9/D/ZtQcV1Om54JY1e3FWk1j81B6BpVG5lCPJZ8ztUZI8p
	qN26n0Tc83jrs4/WAbHlFUkdnmyw9wXOX9Z+bJumznosVx6OLHor4cdE6VuTTKgP9mRc1tzDZFt
	7Hpjns6Fh+8hJzkBQXzxH23Cd4Y7qvx0U/owLSOKYj2/RpqETdnDcgWEHRkfcYFwQQ0FZG59KXF
	eXQR+qQhvZ0OEOQt0asYKw7C79qbLPlzlthDpU+lWgG20eVdKLFoTFROKuMTk70fjNva+zzqwGz
	iShCXf6BI5KDpyJoC8yvlwp2OIbeGU7f7B9mPbVsdQ1fXHbt8SsNEpbim8QQkdxL/dHmjgjqtUA
	knKrlumkzdCbY5jpkulyYzHExRDxN+n1dH6pcL9XUSjp1GD+k8LPT79hTYoDKDhguzzKe+XLSz0
	nmnGM4i2AU=
X-Received: by 2002:a05:600c:890c:b0:488:7f49:eae5 with SMTP id 5b1f17b1804b1-488835903c7mr51340345e9.16.1775055897647;
        Wed, 01 Apr 2026 08:04:57 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a705f99sm3471965e9.11.2026.04.01.08.04.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 08:04:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 17:04:55 +0200
Message-Id: <DHHWST45DJTG.1EJZEHOO8HO56@smile.fr>
Subject: Re: [OE-core][whinlatter][PATCH 11/12] e2fsprogs: upgrade 1.47.3 ->
 1.47.4
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Wang Mingyu" <wangmy@fujitsu.com>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260325021856.4053666-1-ankur.tyagi85@gmail.com>
 <20260325021856.4053666-11-ankur.tyagi85@gmail.com>
In-Reply-To: <20260325021856.4053666-11-ankur.tyagi85@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 15:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234443

On Wed Mar 25, 2026 at 3:18 AM CET, Ankur Tyagi via lists.openembedded.org =
wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
> removed since it's inclued in 1.47.4
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit b14266b4c27e7e3f37a1057ab694c6b21b66b83a)
>
> Release Notes:
> https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/tree/doc/RelNotes/v1=
.47.4.txt?h=3Dv1.47.4
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>

Hello,

I'm sorry but this upgrade contains feature change and, because of that
is not eligible for stable merge:
> E2fsprogs 1.47.4 (March 6, 2025)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Updates/Fixes since v1.47.3:
>=20
> UI and Features
> ---------------
>=20
> [...]
>=20
> Add mke2fs extended option in root_selinux to set a SELinux security
> context label for the root directory.
>=20
> Enable mke2fs to support multiple -E options in the command line.

Regards,

> ---
>  ...inode.c-Fix-for-file-larger-than-2GB.patch | 40 -------------------
>  ...2fsprogs_1.47.3.bb =3D> e2fsprogs_1.47.4.bb} |  3 +-
>  2 files changed, 1 insertion(+), 42 deletions(-)
>  delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-c=
reate_inode.c-Fix-for-file-larger-than-2GB.patch
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.3.bb =3D> e2fspro=
gs_1.47.4.bb} (97%)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_i=
node.c-Fix-for-file-larger-than-2GB.patch b/meta/recipes-devtools/e2fsprogs=
/e2fsprogs/0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.patch
> deleted file mode 100644
> index 1c578022fb..0000000000
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-create_inode.c-=
Fix-for-file-larger-than-2GB.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 6359e0ec8ef249d202dbb8583a6e430f20c5b1a0 Mon Sep 17 00:00:00 2001
> -From: Robert Yang <liezhi.yang@windriver.com>
> -Date: Sun, 30 Nov 2025 21:47:50 +0800
> -Subject: [PATCH] misc/create_inode.c: Fix for file larger than 2GB
> -
> -Fixed:
> -$ dd if=3D/dev/zero of=3D../image.ext4 bs=3D1M count=3D4k
> -$ dd if=3D/dev/random of=3D../rootfs/largefile bs=3D1M count=3D3k
> -$ ./misc/mke2fs -t ext4 -d ../rootfs/ ../image.ext4
> -__populate_fs: Ext2 file too big while writing file "largefile"
> -mke2fs: Ext2 file too big while populating file system
> -
> -This was because the offset is overflow, use __u64 to fix the problem.
> -
> -Another code which uses ext2_off_t is copy_fs_verity_data(), but it only=
 copies
> -the metadata, so it should be enough large for it, just leave it there.
> -
> -Upstream-Status: Submitted [https://github.com/tytso/e2fsprogs/pull/258]
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - misc/create_inode.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/misc/create_inode.c b/misc/create_inode.c
> -index 624efc03..14273534 100644
> ---- a/misc/create_inode.c
> -+++ b/misc/create_inode.c
> -@@ -414,7 +414,7 @@ static ssize_t my_pread(int fd, void *buf, size_t co=
unt, off_t offset)
> - }
> - #endif /* !defined HAVE_PREAD64 && !defined HAVE_PREAD */
> -=20
> --static errcode_t write_all(ext2_file_t e2_file, ext2_off_t off, const c=
har *buf, unsigned int n_bytes) {
> -+static errcode_t write_all(ext2_file_t e2_file, __u64 off, const char *=
buf, unsigned int n_bytes) {
> - 	errcode_t err =3D ext2fs_file_llseek(e2_file, off, EXT2_SEEK_SET, NULL=
);
> - 	if (err)
> - 		return err;
> ---=20
> -2.34.1
> -
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb b/meta/r=
ecipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
> similarity index 97%
> rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
> rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
> index 40658399d9..90f8f37b8e 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.4.bb
> @@ -4,14 +4,13 @@ SRC_URI +=3D "file://remove.ldconfig.call.patch \
>             file://run-ptest \
>             file://ptest.patch \
>             file://mkdir_p.patch \
> -           file://0001-misc-create_inode.c-Fix-for-file-larger-than-2GB.=
patch \
>             "
>  SRC_URI:append:class-native =3D " \
>             file://e2fsprogs-fix-missing-check-for-permission-denied.patc=
h \
>             file://quiet-debugfs.patch \
>             "
> =20
> -SRCREV =3D "da631e117dcf8797bfda0f48bdaa05ac0fbcf7af"
> +SRCREV =3D "ece89fac4603e400155b7bbf6326284f8511bca9"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+\.\d+(\.\d+)*)$"
> =20
>  EXTRA_OECONF +=3D "--libdir=3D${base_libdir} --sbindir=3D${base_sbindir}=
 \


--=20
Yoann Congal
Smile ECS


