Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD94D1BDE1
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:04:30 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26692.1764795867445646344
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I2NgPGZv;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6443bc360bdso140178d50.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 13:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764795866; x=1765400666; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6s6mRhC90t8J5RKieYPESIbRL1DbwBNCnOij4CwQ/lg=;
        b=I2NgPGZvZIB2hvNX9xCypLGkh3uNmYYmFlqBcu4lHR4XX9I5f4x8HDAqHvImFb5V4y
         bGJCvbu4VzZjOvLC7n2fHCtB2odqCEwFVDtyVyxg2F4dj6H9ZTFWiEvIZkoTRLnB99s1
         zjxMO9iFtNeIYvgzQRY1L/9XeeP/7OKPVD3cP38lZRxCkvbafoBnXR+S/Dw+uDARoVtg
         YnYe7m/nt+KDJ0ATZMoAx5D7XFiDFPTeRqkBRJRw1d5Zgyr0Mvx3XRNRqJUu5oMJYtjW
         Jmq2ae53csn6cGrfbpGFWzlqevXYmOOhjYk4K5f64IW9YbHe6pFluVng7IX2lY9LIeiW
         8c2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764795866; x=1765400666;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6s6mRhC90t8J5RKieYPESIbRL1DbwBNCnOij4CwQ/lg=;
        b=BJJhFgnqHsxb3snlz2B4k7otZ/tpBysN7g29zzJouuuKWlysFZIr14bqamXM9D+eQt
         kj107cXnlnx0xQiJvOJwnUXWEIe2p6HuvwexzXBuXPZNQcL4SU9pwUvgte9gu/8Ehutf
         qLwxcJSVzSN40/s3pLq/MSfM2TMrPKs9IhKCad9hImcmdVXa6He71lO2uruT8RusM+eP
         CH9tnaqunsD8On0ESNU4ptNXmFIEMwVNtf/o3W81erGT74R6fX10CG0Q4Y0vGvv9rwQr
         4ffB41NPDcs2J/kwNGvwtLsWPmeOCvwsZolv28BxUYDpJEp7ph1X42mNMPXa7TYSnEcp
         +N0g==
X-Forwarded-Encrypted: i=1; AJvYcCUxGYDmIEq+mA5Xqw8EqNrJIOyuJENcEpioZPyS+7v9MZ4s1fk99/TnLNmqwaiKh0fhgf2keirjwYfAapO4I6Q0hw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzNIxoKD/lhCWaSWQTa3TReNQxXe+6e/hKImUyn2XVFVxaVFri4
	6u5RD8aYb4MmHXbtGtlZX6W/BiDG6O5+R+gQAWZGrWj9Ggc/nUoCPNA50PZUdrGk/DBNXUeHU2x
	RiUIe9COFoReCmgFGnnpcr49OSOa11Ng=
X-Gm-Gg: ASbGncvqrJzNt/b13WlpYr99Mt8+20e3DOsIwK28acsLObtEMExrz7rRlQVHyh+UCNS
	EhK2UV99ukabhbyWIAHE93PjYVfxHcSbe86x6JWrhcKTSzalJyek6cBMrJ+Orra72Es3X9qsjY+
	38hrv0NxNQNnwXr5qtZqwj/mP5N4aL+MW/jdNovmv8pl3x2eLTY5W4xG+NFptFR6UA1O1AH14zj
	bK9cNwcdxqHP07a8xG0RRQuTAqvAQ6N4mMcuQOBWQ06jbUMNuXM+U2kClniCUBQ8n/8kEGYmM71
	v7jfjD2npPfXQtvU8xJgPkapliHhEwBBPtFydRrn5MiPh6cWWmVa0ZM5AjYbWqF2hQN/b93rofO
	gdSAyVRNczU1ITWtU09UmuyE=
X-Google-Smtp-Source: AGHT+IG1O6amLeUkeFCOJjkvf5Y03g+B+fso3IK2d9NUS90UUfTu2i/yo+DICF9iQaiLjWidRhCcI4QFXi2oVjxl+3I=
X-Received: by 2002:a05:690c:893:b0:787:cf3d:5232 with SMTP id
 00721157ae682-78c188c00b0mr8661787b3.43.1764795866369; Wed, 03 Dec 2025
 13:04:26 -0800 (PST)
MIME-Version: 1.0
References: <20251023134656.2059483-1-ecordonnier@snap.com>
 <20251023134656.2059483-2-ecordonnier@snap.com> <2da2af64-1607-49f3-a438-43525b4b8b02@gmail.com>
 <CAHUKmYbfri0mDeJJ6FH1YVtNe9R_YTdC8iFQxOx7zLRqizvhKA@mail.gmail.com>
In-Reply-To: <CAHUKmYbfri0mDeJJ6FH1YVtNe9R_YTdC8iFQxOx7zLRqizvhKA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Dec 2025 13:04:00 -0800
X-Gm-Features: AWmQ_bmIDMrkmPbDpmyId8lNF0CJkwIMH1PXRMt945jdkonkdPGGoyFy5zVM6E0
Message-ID: <CAMKF1sqn_G1QjZB0SJhvWXKS8e5amjs5e2swZUZNsakivNs+Eg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4 2/2] opkg: upgrade 0.8.0 -> 0.9.0
To: ecordonnier@snap.com
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b751bc0645128e28"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 21:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227240

--000000000000b751bc0645128e28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am starting to see the following crash in opkg when building image.
Anyone seeing something like this?

(No debugging symbols found in
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/=
1.0/recipe-sysroot-native/usr/bin/opkg)
[New LWP 34493]
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/usr/lib/libthread_db.so.1".
Core was generated by
`/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image=
/1.0/recipe-sysroot-native/usr/bin/opkg
--volatile-cache -f
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/=
1.0/opkg.conf
-t
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/=
1.0/temp/ipktemp/
-o
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/=
1.0/rootfs
--force-postinstall --prefer-arch-to-version --force-depends remove
glibc-binary-localedata-en-gb glibc-binary-localedata-c
glibc-binary-localedata-en-us'.
Program terminated with signal SIGSEGV, Segmentation fault.
#0  0x00007f50a8190d20 in stringpool_strn2id () from
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/=
1.0/recipe-sysroot-native/usr/bin/../lib/./libsolv.so.1
(gdb) bt
#0  0x00007f50a8190d20 in stringpool_strn2id () from
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/=
1.0/recipe-sysroot-native/usr/bin/../lib/./libsolv.so.1
#1  0x00007f50a818a3dc in pool_str2id () from
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/=
1.0/recipe-sysroot-native/usr/bin/../lib/./libsolv.so.1
#2  0x00007f50a84fe4ad in ?? () from
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/=
1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1
#3  0x00007f50a84ff4df in opkg_solver_remove () from
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/=
1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1
#4  0x00007f50a84e9bfb in ?? () from
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/=
1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1
#5  0x00007f50a84eadb2 in opkg_cmd_exec () from
/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/=
1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1
#6  0x00005557220b6a9d in ?? ()
#7  0x00007f50a8311f68 in __libc_start_call_main () from
/mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
#8  0x00007f50a831201b in __libc_start_main () from
/mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6
#9  0x00005557220b6bf1 in ?? ()

On Thu, Nov 27, 2025 at 10:11=E2=80=AFAM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> Hi Gyorgy,
> I have sent a patch to opkg upstream which disables the ACL option by
> default again (it is https://lists.yoctoproject.org/g/opkg/message/175 ,
> however the web-view doesn't seem to work at the moment. I only see
> "Forbidden").
>
> =C3=89tienne
>
>
>
> On Thu, Nov 27, 2025 at 6:08=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail=
.com>
> wrote:
>
>> I just tried this, but it seems that the ACL switch was toggled during
>> the CMake transition. With Autotools ACL was disabled by default, but
>> with CMake it seems to be enabled - and it complains that it can't find
>> libacl on my machine.
>>
>> On 10/23/25 15:46, Etienne Cordonnier via lists.openembedded.org wrote:
>> > From: Etienne Cordonnier <ecordonnier@snap.com>
>> >
>> > See release notes at
>> > -
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctopro=
ject.org_releases_opkg_opkg-2D0.9.0.release-2Dnotes&d=3DDwICaQ&c=3DncDTmphk=
JTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkS=
Ga66m67E&m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvEf9K=
x5&s=3Dqvmy1QT46Bl7mVt_XDbuHiic2IjU6z7Zku_Gid-CVYc&e=3D
>> >
>> > [0.9.0] - 2025-06-27
>> >
>> > Semiannual opkg release.
>> > Bumping the minor version as a result of the project build tooling
>> changing from autotools to cmake.
>> >
>> > - Added a Dockerfile container definition (`:docker/`) for a valid
>> developer build environment for opkg.
>> >   - It's recommended that project contributors use this container to
>> build and test their changes.
>> > - The AutoTools-based build framework has [been replaced](
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.=
org_opkg_commit_-3Fid-3D3f6040e321634471ec442fb0e80f140f1437e90b&d=3DDwICaQ=
&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9Ts=
Rih1DULJTKUkSGa66m67E&m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_Q=
GHVaD7rHvEf9Kx5&s=3DGgRxioBjt-ii5JWUrYQ0I-FmXvKxVxKNH3Nj22i_jiM&e=3D
>> ) with a more modern, CMake framework.
>> >   - Refer to the `docs/CONTRIBUTING.md` documentation for updated buil=
d
>> instructions.
>> >
>> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> > ---
>> >  .../opkg/opkg/0002-config.h.in-fix-typo.patch | 27 ++++++++++++++++++=
+
>> >  meta/recipes-devtools/opkg/opkg/run-ptest     |  2 +-
>> >  .../opkg/{opkg_0.8.0.bb =3D> opkg_0.9.0.bb}     | 22 ++++++++-------
>> >  3 files changed, 41 insertions(+), 10 deletions(-)
>> >  create mode 100644
>> meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
>> >  rename meta/recipes-devtools/opkg/{opkg_0.8.0.bb =3D> opkg_0.9.0.bb}
>> (76%)
>> >
>> > diff --git
>> a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
>> b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
>> > new file mode 100644
>> > index 00000000000..626bbd01b68
>> > --- /dev/null
>> > +++ b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
>> > @@ -0,0 +1,27 @@
>> > +From 5a81faadbc2397d554bc598d535fd2d44cbc8d10 Mon Sep 17 00:00:00 200=
1
>> > +From: Etienne Cordonnier <ecordonnier@snap.com>
>> > +Date: Mon, 20 Oct 2025 18:57:56 +0200
>> > +Subject: [PATCH] config.h.in: fix typo
>> > +
>> > +Upstream-Status: Backport [
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.=
org_opkg_commit_-3Fid-3Dd723a90bfe6409c7ad983ed911225d4aefbfd09e&d=3DDwICaQ=
&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9Ts=
Rih1DULJTKUkSGa66m67E&m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_Q=
GHVaD7rHvEf9Kx5&s=3D5scf6nlpBtSePSuPjyopoX7FmlAyiSwI03Ry11w4tl8&e=3D
>> ]
>> > +Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
>> > +---
>> > + config.h.in | 2 +-
>> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>> > +
>> > +diff --git a/config.h.in b/config.h.in
>> > +index 4fa9842..877b8c7 100644
>> > +--- a/config.h.in
>> > ++++ b/config.h.in
>> > +@@ -2,7 +2,7 @@
>> > + #cmakedefine01 WITH_XZ
>> > + #cmakedefine01 WITH_BZIP2
>> > + #cmakedefine01 WITH_LZ4
>> > +-#cmakedefine01 WITH_LZSTD
>> > ++#cmakedefine01 WITH_ZSTD
>> > + #cmakedefine01 WITH_CURL
>> > + #cmakedefine01 WITH_SSLCURL
>> > + #cmakedefine01 WITH_ACL
>> > +--
>> > +2.43.0
>> > +
>> > diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest
>> b/meta/recipes-devtools/opkg/opkg/run-ptest
>> > index 5fb7077eec9..d485a4aace5 100644
>> > --- a/meta/recipes-devtools/opkg/opkg/run-ptest
>> > +++ b/meta/recipes-devtools/opkg/opkg/run-ptest
>> > @@ -2,4 +2,4 @@
>> >
>> >  OPKG_PATH=3D$(which opkg)
>> >
>> > -make OPKG_PATH=3D$OPKG_PATH run-tests
>> > +make -C tests DATADIR=3D/share SYSCONFDIR=3D/etc VARDIR=3D/var
>> OPKG_PATH=3D$OPKG_PATH
>> > diff --git a/meta/recipes-devtools/opkg/opkg_0.8.0.bb
>> b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
>> > similarity index 76%
>> > rename from meta/recipes-devtools/opkg/opkg_0.8.0.bb
>> > rename to meta/recipes-devtools/opkg/opkg_0.9.0.bb
>> > index 12e2edf7e3f..ed2f36d636b 100644
>> > --- a/meta/recipes-devtools/opkg/opkg_0.8.0.bb
>> > +++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
>> > @@ -15,34 +15,35 @@ PE =3D "1"
>> >  SRC_URI =3D "
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctopro=
ject.org_releases_-24-257BBPN-257D_-24-257BBPN-257D-2D-24-257BPV-257D.tar.g=
z&d=3DDwICaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuM=
IGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24=
AF_PScvk4Y_QGHVaD7rHvEf9Kx5&s=3DmKc8LzZ_Q2orQLqa_38Jr7E7tfyD4-rcsgI-wPkx_Zg=
&e=3D
>> \
>> >             file://opkg.conf \
>> >
>>  file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch =
\
>> > +           file://0002-config.h.in-fix-typo.patch \
>> >             file://run-ptest \
>> >             "
>> >
>> > -SRC_URI[sha256sum] =3D
>> "582a4c9e220cce0b7d08a0915c95db9f24ae43ad372ed5d42d5ec5f6cd413f0c"
>> > +SRC_URI[sha256sum] =3D
>> "440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa81a6a85493f0c89d0f5"
>> >
>> >  # This needs to be before ptest inherit, otherwise all ptest files en=
d
>> packaged
>> >  # in libopkg package if OPKGLIBDIR =3D=3D libdir, because default
>> >  # PTEST_PATH ?=3D "${libdir}/${BPN}/ptest"
>> >  PACKAGES =3D+ "libopkg"
>> >
>> > -inherit autotools pkgconfig ptest
>> > +inherit cmake pkgconfig ptest
>> >
>> >  target_localstatedir :=3D "${localstatedir}"
>> >  OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
>> >
>> >  PACKAGECONFIG ??=3D "libsolv"
>> >
>> > -PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,\
>> > +PACKAGECONFIG[gpg] =3D "-DWITH_GPGME=3DON,-DWITH_GPGME=3DOFF,\
>> >      gnupg gpgme libgpg-error,\
>> >      ${@ "gnupg" if ("native" in d.getVar("PN")) else "gnupg-gpg"}\
>> >      "
>> > -PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl"
>> > -PACKAGECONFIG[ssl-curl] =3D "--enable-ssl-curl,--disable-ssl-curl,cur=
l
>> openssl"
>> > -PACKAGECONFIG[sha256] =3D "--enable-sha256,--disable-sha256"
>> > -PACKAGECONFIG[libsolv] =3D "--with-libsolv,--without-libsolv,libsolv"
>> > +PACKAGECONFIG[curl] =3D "-DWITH_CURL=3DON,-DWITH_CURL=3DOFF,curl"
>> > +PACKAGECONFIG[ssl-curl] =3D "-DWITH_SSLCURL=3DON,-DWITH_SSLCURL=3DOFF=
,curl
>> openssl"
>> > +PACKAGECONFIG[sha256] =3D "-DWITH_SHA256=3DON,-DWITH_SHA256=3DOFF"
>> > +PACKAGECONFIG[libsolv] =3D
>> "-DUSE_SOLVER_LIBSOLV=3DON,-DUSE_SOLVER_LIBSOLV=3DOFF,libsolv"
>> >
>> > -EXTRA_OECONF =3D "--enable-zstd"
>> > -EXTRA_OECONF:append:class-native =3D "
>> --localstatedir=3D/${@os.path.relpath('${localstatedir}',
>> '${STAGING_DIR_NATIVE}')} --sysconfdir=3D/${@os.path.relpath('${sysconfd=
ir}',
>> '${STAGING_DIR_NATIVE}')}"
>> > +EXTRA_OECMAKE =3D "-DWITH_ZSTD=3DON"
>> > +EXTRA_OECMAKE:append:class-native =3D "
>> -DVARDIR=3D/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE=
}')}
>> -DSYSCONFDIR=3D/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIV=
E}')}"
>> >
>> >  do_install:append () {
>> >       install -d ${D}${sysconfdir}/opkg
>> > @@ -56,6 +57,9 @@ do_install:append () {
>> >  }
>> >
>> >  do_install_ptest () {
>> > +     # the ptest class uses a Makefile for installation, but cmake
>> uses Ninja per default so we need to install ptests manually:
>> > +     cp -r ${S}/tests ${D}${PTEST_PATH}
>> > +
>> >       sed -i -e '/@echo $^/d' ${D}${PTEST_PATH}/tests/Makefile
>> >       sed -i -e '/@PYTHONPATH=3D. $(PYTHON) $^/a\\t@if [ "$$?" !=3D "0=
"
>> ];then echo "FAIL:"$^;else echo "PASS:"$^;fi'
>> ${D}${PTEST_PATH}/tests/Makefile
>> >  }
>> >
>> >
>> >
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226864):
> https://lists.openembedded.org/g/openembedded-core/message/226864
> Mute This Topic: https://lists.openembedded.org/mt/115910660/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b751bc0645128e28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am starting to see the following crash in opkg when buil=
ding image. Anyone seeing something=C2=A0like this?<div><br></div><div>(No =
debugging symbols found in /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64=
-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/opkg)<br>[New =
LWP 34493]<br>[Thread debugging using libthread_db enabled]<br>Using host l=
ibthread_db library &quot;/usr/lib/libthread_db.so.1&quot;.<br>Core was gen=
erated by `/mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-k=
iosk-image/1.0/recipe-sysroot-native/usr/bin/opkg --volatile-cache -f /mnt/=
b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/o=
pkg.conf -t /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-=
kiosk-image/1.0/temp/ipktemp/ -o /mnt/b/yoe/master/build/tmp/work/raspberry=
pi4_64-yoe-linux/yoe-kiosk-image/1.0/rootfs --force-postinstall --prefer-ar=
ch-to-version --force-depends remove glibc-binary-localedata-en-gb glibc-bi=
nary-localedata-c glibc-binary-localedata-en-us&#39;.<br>Program terminated=
 with signal SIGSEGV, Segmentation fault.<br>#0 =C2=A00x00007f50a8190d20 in=
 stringpool_strn2id () from /mnt/b/yoe/master/build/tmp/work/raspberrypi4_6=
4-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/../lib/./libs=
olv.so.1<br>(gdb) bt<br>#0 =C2=A00x00007f50a8190d20 in stringpool_strn2id (=
) from /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk=
-image/1.0/recipe-sysroot-native/usr/bin/../lib/./libsolv.so.1<br>#1 =C2=A0=
0x00007f50a818a3dc in pool_str2id () from /mnt/b/yoe/master/build/tmp/work/=
raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin=
/../lib/./libsolv.so.1<br>#2 =C2=A00x00007f50a84fe4ad in ?? () from /mnt/b/=
yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/rec=
ipe-sysroot-native/usr/bin/../lib/libopkg.so.1<br>#3 =C2=A00x00007f50a84ff4=
df in opkg_solver_remove () from /mnt/b/yoe/master/build/tmp/work/raspberry=
pi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/../lib/l=
ibopkg.so.1<br>#4 =C2=A00x00007f50a84e9bfb in ?? () from /mnt/b/yoe/master/=
build/tmp/work/raspberrypi4_64-yoe-linux/yoe-kiosk-image/1.0/recipe-sysroot=
-native/usr/bin/../lib/libopkg.so.1<br>#5 =C2=A00x00007f50a84eadb2 in opkg_=
cmd_exec () from /mnt/b/yoe/master/build/tmp/work/raspberrypi4_64-yoe-linux=
/yoe-kiosk-image/1.0/recipe-sysroot-native/usr/bin/../lib/libopkg.so.1<br>#=
6 =C2=A00x00005557220b6a9d in ?? ()<br>#7 =C2=A00x00007f50a8311f68 in __lib=
c_start_call_main () from /mnt/b/yoe/master/build/tmp/sysroots-uninative/x8=
6_64-linux/lib/libc.so.6<br>#8 =C2=A00x00007f50a831201b in __libc_start_mai=
n () from /mnt/b/yoe/master/build/tmp/sysroots-uninative/x86_64-linux/lib/l=
ibc.so.6<br>#9 =C2=A00x00005557220b6bf1 in ?? ()</div></div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Nov 27, 2025 at 10:11=E2=80=AFAM Etienne Cordonnier via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ecordonni=
er=3D<a href=3D"mailto:snap.com@lists.openembedded.org">snap.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr">Hi Gyorgy,<br>I have sent a patch to opkg upst=
ream which disables the ACL option by default again (it is <a href=3D"https=
://lists.yoctoproject.org/g/opkg/message/175" target=3D"_blank">https://lis=
ts.yoctoproject.org/g/opkg/message/175</a> , however the web-view doesn&#39=
;t seem to work at the moment. I only see &quot;Forbidden&quot;).<br><br>=
=C3=89tienne<br><br><br></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Nov 27, 2025 at 6:08=E2=80=AFPM Gyorgy Sarv=
ari &lt;<a href=3D"mailto:skandigraun@gmail.com" target=3D"_blank">skandigr=
aun@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">I just tried this, but it seems that the ACL switch was toggle=
d during<br>
the CMake transition. With Autotools ACL was disabled by default, but<br>
with CMake it seems to be enabled - and it complains that it can&#39;t find=
<br>
libacl on my machine.<br>
<br>
On 10/23/25 15:46, Etienne Cordonnier via <a href=3D"http://lists.openembed=
ded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt;<br>
&gt; See release notes at<br>
&gt; - <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__dow=
nloads.yoctoproject.org_releases_opkg_opkg-2D0.9.0.release-2Dnotes&amp;d=3D=
DwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWW=
RXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&amp;s=3Dqvmy1QT46Bl7mVt_XDbuHiic2IjU6z7Zk=
u_Gid-CVYc&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefens=
e.proofpoint.com/v2/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_op=
kg_opkg-2D0.9.0.release-2Dnotes&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF=
_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E=
&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&a=
mp;s=3Dqvmy1QT46Bl7mVt_XDbuHiic2IjU6z7Zku_Gid-CVYc&amp;e=3D</a> <br>
&gt;<br>
&gt; [0.9.0] - 2025-06-27<br>
&gt;<br>
&gt; Semiannual opkg release.<br>
&gt; Bumping the minor version as a result of the project build tooling cha=
nging from autotools to cmake.<br>
&gt;<br>
&gt; - Added a Dockerfile container definition (`:docker/`) for a valid dev=
eloper build environment for opkg.<br>
&gt;=C2=A0 =C2=A0- It&#39;s recommended that project contributors use this =
container to build and test their changes.<br>
&gt; - The AutoTools-based build framework has [been replaced](<a href=3D"h=
ttps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_=
opkg_commit_-3Fid-3D3f6040e321634471ec442fb0e80f140f1437e90b&amp;d=3DDwICaQ=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24=
AF_PScvk4Y_QGHVaD7rHvEf9Kx5&amp;s=3DGgRxioBjt-ii5JWUrYQ0I-FmXvKxVxKNH3Nj22i=
_jiM&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fid-3D3f=
6040e321634471ec442fb0e80f140f1437e90b&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjI=
DPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvE=
f9Kx5&amp;s=3DGgRxioBjt-ii5JWUrYQ0I-FmXvKxVxKNH3Nj22i_jiM&amp;e=3D</a> ) wi=
th a more modern, CMake framework.<br>
&gt;=C2=A0 =C2=A0- Refer to the `docs/CONTRIBUTING.md` documentation for up=
dated build instructions.<br>
&gt;<br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../opkg/opkg/0002-config.h.in-fix-typo.patch | 27 +++++++++++++=
++++++<br>
&gt;=C2=A0 meta/recipes-devtools/opkg/opkg/run-ptest=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
&gt;=C2=A0 .../opkg/{<a href=3D"http://opkg_0.8.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">opkg_0.8.0.bb</a> =3D&gt; <a href=3D"http://opkg_0.9.0.bb" =
rel=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a>}=C2=A0 =C2=A0 =C2=A0=
| 22 ++++++++-------<br>
&gt;=C2=A0 3 files changed, 41 insertions(+), 10 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-config.h=
.in-fix-typo.patch<br>
&gt;=C2=A0 rename meta/recipes-devtools/opkg/{<a href=3D"http://opkg_0.8.0.=
bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a> =3D&gt; <a href=
=3D"http://opkg_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.9.0.b=
b</a>} (76%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo=
.patch b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch<br=
>
&gt; new file mode 100644<br>
&gt; index 00000000000..626bbd01b68<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch<=
br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +From 5a81faadbc2397d554bc598d535fd2d44cbc8d10 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" =
target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; +Date: Mon, 20 Oct 2025 18:57:56 +0200<br>
&gt; +Subject: [PATCH] <a href=3D"http://config.h.in" rel=3D"noreferrer" ta=
rget=3D"_blank">config.h.in</a>: fix typo<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://urldefense.proofpoint.c=
om/v2/url?u=3Dhttps-3A__git.yoctoproject.org_opkg_commit_-3Fid-3Dd723a90bfe=
6409c7ad983ed911225d4aefbfd09e&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_=
4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&am=
p;s=3D5scf6nlpBtSePSuPjyopoX7FmlAyiSwI03Ry11w4tl8&amp;e=3D" rel=3D"noreferr=
er" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A=
__git.yoctoproject.org_opkg_commit_-3Fid-3Dd723a90bfe6409c7ad983ed911225d4a=
efbfd09e&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw=
&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D1A1uWL9SVAUWAO=
RYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&amp;s=3D5scf6nlpBtSePSuP=
jyopoX7FmlAyiSwI03Ry11w4tl8&amp;e=3D</a> ]<br>
&gt; +Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@s=
nap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; +---<br>
&gt; + <a href=3D"http://config.h.in" rel=3D"noreferrer" target=3D"_blank">=
config.h.in</a> | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"http://config.h.in" rel=3D"noreferrer" target=
=3D"_blank">config.h.in</a> b/<a href=3D"http://config.h.in" rel=3D"norefer=
rer" target=3D"_blank">config.h.in</a><br>
&gt; +index 4fa9842..877b8c7 100644<br>
&gt; +--- a/<a href=3D"http://config.h.in" rel=3D"noreferrer" target=3D"_bl=
ank">config.h.in</a><br>
&gt; ++++ b/<a href=3D"http://config.h.in" rel=3D"noreferrer" target=3D"_bl=
ank">config.h.in</a><br>
&gt; +@@ -2,7 +2,7 @@<br>
&gt; + #cmakedefine01 WITH_XZ<br>
&gt; + #cmakedefine01 WITH_BZIP2<br>
&gt; + #cmakedefine01 WITH_LZ4<br>
&gt; +-#cmakedefine01 WITH_LZSTD<br>
&gt; ++#cmakedefine01 WITH_ZSTD<br>
&gt; + #cmakedefine01 WITH_CURL<br>
&gt; + #cmakedefine01 WITH_SSLCURL<br>
&gt; + #cmakedefine01 WITH_ACL<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest b/meta/recipes-=
devtools/opkg/opkg/run-ptest<br>
&gt; index 5fb7077eec9..d485a4aace5 100644<br>
&gt; --- a/meta/recipes-devtools/opkg/opkg/run-ptest<br>
&gt; +++ b/meta/recipes-devtools/opkg/opkg/run-ptest<br>
&gt; @@ -2,4 +2,4 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 OPKG_PATH=3D$(which opkg)<br>
&gt;=C2=A0 <br>
&gt; -make OPKG_PATH=3D$OPKG_PATH run-tests<br>
&gt; +make -C tests DATADIR=3D/share SYSCONFDIR=3D/etc VARDIR=3D/var OPKG_P=
ATH=3D$OPKG_PATH<br>
&gt; diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.8.0.b=
b" rel=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a> b/meta/recipes-de=
vtools/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=3D"noreferrer" target=3D"_=
blank">opkg_0.9.0.bb</a><br>
&gt; similarity index 76%<br>
&gt; rename from meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.8.0.bb=
" rel=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a><br>
&gt; rename to meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.9.0.bb" =
rel=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
&gt; index 12e2edf7e3f..ed2f36d636b 100644<br>
&gt; --- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.8.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
&gt; @@ -15,34 +15,35 @@ PE =3D &quot;1&quot;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttp-3A__downloads.yoctoproject.org_releases_-24-257BBPN-257D_-24=
-257BBPN-257D-2D-24-257BPV-257D.tar.gz&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjI=
DPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSG=
a66m67E&amp;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvE=
f9Kx5&amp;s=3DmKc8LzZ_Q2orQLqa_38Jr7E7tfyD4-rcsgI-wPkx_Zg&amp;e=3D" rel=3D"=
noreferrer" target=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3D=
http-3A__downloads.yoctoproject.org_releases_-24-257BBPN-257D_-24-257BBPN-2=
57D-2D-24-257BPV-257D.tar.gz&amp;d=3DDwICaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4v=
CHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&am=
p;m=3D1A1uWL9SVAUWAORYc1-msE0HUGrhCWWRXTj24AF_PScvk4Y_QGHVaD7rHvEf9Kx5&amp;=
s=3DmKc8LzZ_Q2orQLqa_38Jr7E7tfyD4-rcsgI-wPkx_Zg&amp;e=3D</a>=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://opkg.conf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-opkg_conf-c=
reate-opkg.lock-in-run-instead-of-var-run.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-config.h.in-fix-=
typo.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI[sha256sum] =3D &quot;582a4c9e220cce0b7d08a0915c95db9f24ae43ad=
372ed5d42d5ec5f6cd413f0c&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;440ef321862e01f83da4d02884a0cbb4d9d7b32f=
82faa81a6a85493f0c89d0f5&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # This needs to be before ptest inherit, otherwise all ptest fil=
es end packaged<br>
&gt;=C2=A0 # in libopkg package if OPKGLIBDIR =3D=3D libdir, because defaul=
t<br>
&gt;=C2=A0 # PTEST_PATH ?=3D &quot;${libdir}/${BPN}/ptest&quot;<br>
&gt;=C2=A0 PACKAGES =3D+ &quot;libopkg&quot;<br>
&gt;=C2=A0 <br>
&gt; -inherit autotools pkgconfig ptest<br>
&gt; +inherit cmake pkgconfig ptest<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 target_localstatedir :=3D &quot;${localstatedir}&quot;<br>
&gt;=C2=A0 OPKGLIBDIR ??=3D &quot;${target_localstatedir}/lib&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;libsolv&quot;<br>
&gt;=C2=A0 <br>
&gt; -PACKAGECONFIG[gpg] =3D &quot;--enable-gpg,--disable-gpg,\<br>
&gt; +PACKAGECONFIG[gpg] =3D &quot;-DWITH_GPGME=3DON,-DWITH_GPGME=3DOFF,\<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 gnupg gpgme libgpg-error,\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@ &quot;gnupg&quot; if (&quot;native&quot; in d.=
getVar(&quot;PN&quot;)) else &quot;gnupg-gpg&quot;}\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; -PACKAGECONFIG[curl] =3D &quot;--enable-curl,--disable-curl,curl&quot;=
<br>
&gt; -PACKAGECONFIG[ssl-curl] =3D &quot;--enable-ssl-curl,--disable-ssl-cur=
l,curl openssl&quot;<br>
&gt; -PACKAGECONFIG[sha256] =3D &quot;--enable-sha256,--disable-sha256&quot=
;<br>
&gt; -PACKAGECONFIG[libsolv] =3D &quot;--with-libsolv,--without-libsolv,lib=
solv&quot;<br>
&gt; +PACKAGECONFIG[curl] =3D &quot;-DWITH_CURL=3DON,-DWITH_CURL=3DOFF,curl=
&quot;<br>
&gt; +PACKAGECONFIG[ssl-curl] =3D &quot;-DWITH_SSLCURL=3DON,-DWITH_SSLCURL=
=3DOFF,curl openssl&quot;<br>
&gt; +PACKAGECONFIG[sha256] =3D &quot;-DWITH_SHA256=3DON,-DWITH_SHA256=3DOF=
F&quot;<br>
&gt; +PACKAGECONFIG[libsolv] =3D &quot;-DUSE_SOLVER_LIBSOLV=3DON,-DUSE_SOLV=
ER_LIBSOLV=3DOFF,libsolv&quot;<br>
&gt;=C2=A0 <br>
&gt; -EXTRA_OECONF =3D &quot;--enable-zstd&quot;<br>
&gt; -EXTRA_OECONF:append:class-native =3D &quot; --localstatedir=3D/${@os.=
path.relpath(&#39;${localstatedir}&#39;, &#39;${STAGING_DIR_NATIVE}&#39;)} =
--sysconfdir=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;, &#39;${STAGING_=
DIR_NATIVE}&#39;)}&quot;<br>
&gt; +EXTRA_OECMAKE =3D &quot;-DWITH_ZSTD=3DON&quot;<br>
&gt; +EXTRA_OECMAKE:append:class-native =3D &quot; -DVARDIR=3D/${@os.path.r=
elpath(&#39;${localstatedir}&#39;, &#39;${STAGING_DIR_NATIVE}&#39;)} -DSYSC=
ONFDIR=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;, &#39;${STAGING_DIR_NA=
TIVE}&#39;)}&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install:append () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sysconfdir}/opkg<br>
&gt; @@ -56,6 +57,9 @@ do_install:append () {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install_ptest () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# the ptest class uses a Makefile for installatio=
n, but cmake uses Ninja per default so we need to install ptests manually:<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp -r ${S}/tests ${D}${PTEST_PATH}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;/@echo $^/d&#39; ${D}${PTEST_=
PATH}/tests/Makefile<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;/@PYTHONPATH=3D. $(PYTHON) $^=
/a\\t@if [ &quot;$$?&quot; !=3D &quot;0&quot; ];then echo &quot;FAIL:&quot;=
$^;else echo &quot;PASS:&quot;$^;fi&#39; ${D}${PTEST_PATH}/tests/Makefile<b=
r>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226864): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226864" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226864</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115910660/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115910660/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b751bc0645128e28--

