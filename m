Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E8ECD1284
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 09:10:45 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.13244.1712826643490029760
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 02:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kJXEtsBX;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50B006000A;
	Thu, 11 Apr 2024 09:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712826641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nsZQqXHFPed9aJuDvzVP5fAWq/TXuo+3QGGF2TdoYPs=;
	b=kJXEtsBXxnHDenVzBMmxYz3kS43s3/ThLCltLZczPL66+8N07aCCOFFQq2p1X5i4Jg3U5F
	9pHwQYom4Od0kua+GyILqhTEU+xagbp0AXdGzLAovAjzWv0FGVDB23p3wCulmBXT/ST0ie
	+BwdNJEnhN4fIad5uuKQkRa5jQIdAAx7ejLpyb6UhbYx0Wfr60AOHSCVOSYwkneJTxDbht
	TIPKWzMjXcxtE1f2FMTnG9sjc1jTzsid21hVNp/eaAMmDkIS/MW5f/JZx6i+wpCADn7K1F
	U/9iwBuTmXEN2e/Kjz+NwpbYSYMYQ2XPfbH8PpD92/qfSn7wBEwK683WMAMWWA==
Date: Thu, 11 Apr 2024 11:10:40 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 13/33] librepo: upgrade 1.17.0 -> 1.17.1
Message-ID: <202404110910405650fc2b@mail.local>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
 <1712646620-16608-13-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1712646620-16608-13-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 09:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198121

On 09/04/2024 15:10:00+0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> 0001-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch
> removed since it's included in 1.17.1
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -gpg_gpgme.c: fix build errors with older gcc
> -Fix some compiler warnings
> -Change header files to match a configured ABI regarding a zchunk support
> -Fix building zchunk code if zchunk is enabled
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...me.c-fix-build-errors-with-older-gcc.patch | 36 -------------------
>  .../{librepo_1.17.0.bb =3D> librepo_1.17.1.bb}  |  3 +-
>  2 files changed, 1 insertion(+), 38 deletions(-)
>  delete mode 100644 meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.=
c-fix-build-errors-with-older-gcc.patch
>  rename meta/recipes-devtools/librepo/{librepo_1.17.0.bb =3D> librepo_1.1=
7.1.bb} (88%)
>=20
> diff --git a/meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-fix-b=
uild-errors-with-older-gcc.patch b/meta/recipes-devtools/librepo/librepo/00=
01-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch
> deleted file mode 100644
> index 8727b181b3..0000000000
> --- a/meta/recipes-devtools/librepo/librepo/0001-gpg_gpgme.c-fix-build-er=
rors-with-older-gcc.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From b525cdec3051d1c6ff0c3cd38bf3070b18d6fb50 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Wed, 6 Mar 2024 10:13:38 +0100
> -Subject: [PATCH] gpg_gpgme.c: fix build errors with older gcc
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -When selinux is not enabled, older gcc versions error out this way:
> -
> -| /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-193884=
5/tmp-mc-tiny/hosttools/gcc -DG_LOG_DOMAIN=3D\"librepo\" -D_FILE_OFFSET_BIT=
S=3D64 -D_LARGEFILE64_SOURCE -D_LARGEFILE_SOURCE -Dlibrepo_EXPORTS -I/home/=
pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-ti=
ny/work/aarch64-linux/librepo-native/1.17.0/git -I/home/pokybuild/yocto-wor=
ker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/work/aarch64-lin=
ux/librepo-native/1.17.0/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/include/libmount -I/home/pokybuild/yocto-worker/oe-selftest-armhost/buil=
d/build-st-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/rec=
ipe-sysroot-native/usr/lib/pkgconfig/../../../usr/include/blkid -I/home/pok=
ybuild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/=
work/aarch64-linux/librepo-native/1.17.0/recipe-sysroot-native/usr/lib/pkgc=
onfig/../../../usr/include/glib-2.0 -I/home/pokybuild/yocto-worker/oe-selft=
est-armhost/build/build-st-19
>  38845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/recipe-sysroo=
t-native/usr/lib/pkgconfig/../../../usr/lib/glib-2.0/include -I/home/pokybu=
ild/yocto-worker/oe-selftest-armhost/build/build-st-1938845/tmp-mc-tiny/wor=
k/aarch64-linux/librepo-native/1.17.0/recipe-sysroot-native/usr/lib/pkgconf=
ig/../../../usr/include/libxml2 -isystem/home/pokybuild/yocto-worker/oe-sel=
ftest-armhost/build/build-st-1938845/tmp-mc-tiny/work/aarch64-linux/librepo=
-native/1.17.0/recipe-sysroot-native/usr/include -O2 -pipe -std=3Dc99 -Wall=
 -fPIC -MD -MT librepo/CMakeFiles/librepo.dir/gpg_gpgme.c.o -MF librepo/CMa=
keFiles/librepo.dir/gpg_gpgme.c.o.d -o librepo/CMakeFiles/librepo.dir/gpg_g=
pgme.c.o -c /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st=
-1938845/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git/librepo/g=
pg_gpgme.c

This line has been mangled so the patch doesn't apply

> -| /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-193884=
5/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git/librepo/gpg_gpgm=
e.c: In function =E2=80=98lr_gpg_ensure_socket_dir_exists=E2=80=99:
> -| /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-193884=
5/tmp-mc-tiny/work/aarch64-linux/librepo-native/1.17.0/git/librepo/gpg_gpgm=
e.c:135:1: error: label at end of compound statement
> -|   135 | exit:
> -|       | ^~~~
> -
> -Ensuring the exit: block is not empty fixes the issue.
> -
> -Upstream-Status: Submitted [https://github.com/rpm-software-management/l=
ibrepo/pull/300]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - librepo/gpg_gpgme.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/librepo/gpg_gpgme.c b/librepo/gpg_gpgme.c
> -index c4addb2..47c3153 100644
> ---- a/librepo/gpg_gpgme.c
> -+++ b/librepo/gpg_gpgme.c
> -@@ -144,6 +144,7 @@ exit:
> -     }
> -     freecon(old_default_context);
> - #endif
> -+    return;
> - }
> -=20
> - static gpgme_ctx_t
> diff --git a/meta/recipes-devtools/librepo/librepo_1.17.0.bb b/meta/recip=
es-devtools/librepo/librepo_1.17.1.bb
> similarity index 88%
> rename from meta/recipes-devtools/librepo/librepo_1.17.0.bb
> rename to meta/recipes-devtools/librepo/librepo_1.17.1.bb
> index 810191459d..beb8baf8d6 100644
> --- a/meta/recipes-devtools/librepo/librepo_1.17.0.bb
> +++ b/meta/recipes-devtools/librepo/librepo_1.17.1.bb
> @@ -8,10 +8,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd2=
55951079008b364516c"
>  SRC_URI =3D "git://github.com/rpm-software-management/librepo.git;branch=
=3Dmaster;protocol=3Dhttps \
>             file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-runnin=
g-p.patch \
>             file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmak=
e-m.patch \
> -           file://0001-gpg_gpgme.c-fix-build-errors-with-older-gcc.patch=
 \
>             "
> =20
> -SRCREV =3D "ae727d99086f70f39fba5695af5460e1da908c1b"
> +SRCREV =3D "4ff11d85cb06026943f297bc3e06f047dd73bf0b"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 2.34.1
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198032): https://lists.openembedded.org/g/openembedde=
d-core/message/198032
> Mute This Topic: https://lists.openembedded.org/mt/105417639/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

