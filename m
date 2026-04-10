Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9DDBF36BB6
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 06:14:22 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.150148.1775801658532301668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 23:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lakCM45u;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38c620f1699so17993081fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:14:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775801656; cv=none;
        d=google.com; s=arc-20240605;
        b=ciEhlhSz7JhnwgJCrt60s5TXT90PYPibnxGmmuhnycnT0ptfKC7Vyodk7CyQVdWXdq
         em1fbIhxPgMD2v6+p52Li0JcifCWI89nNBoDHPWGSAk9kQ3DNqGboQnZjRi8ckFj6FO7
         8EihSOyE96D+GKV/mH4axr4s4Lqdp++7eODbGi1zjnYj4FFgNjond2vbYJpuQX6h4vYV
         Shzcbl4S9alU4Oa4sMF65NVdGBT6FY4Mde+yLIwdRaOz1aZSwr1NWV1e4WKHmWNdY7pN
         KytGmVQITSfdCrBDetcQWFcTqe43BjTmz/Cy4vzZxSoKxzvp+TWbAHhcP1HACpCeznc8
         7Bag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zuCZFSA98FRqYy4yV1UQPVIP38NMoL0rFxZUH55zJ0A=;
        fh=gFYyWJxhNBl5YqIta+H/0QndpFr6+snxmq5zzLWaEEg=;
        b=hD5OLwM26i3qDoHMyqc5gbZZEI/E7rtnKXcxBfgmgTfUHYuSFbli6su/hI1d3eI4i3
         cHXGvd9AnaN8gXdyZdARtwQflOOXw6dLYKrUId0GwQy3V/MVQW1+OxLnj6YS7Nb34u1b
         ++C4Ewwdvhlg7FFg/livJIHLVXIdOZjVf8gy9SnvpQvSI9kFU0VLD3n6ZyEmH8H4TID4
         OmZx1T5b+bNndhPUYCgDnV1gnGY0OAWrrt4AFSiyJX9VbrsvPWKuAFcJF50X44f26jKz
         TT46pgb+rn0jxcc6vBVzxlPmy2ZqOB/VUw+uDfn5hEUHX9brrOXtkiviQqeB1Ggh/XQF
         aLew==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775801656; x=1776406456; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuCZFSA98FRqYy4yV1UQPVIP38NMoL0rFxZUH55zJ0A=;
        b=lakCM45ub/8ZQlVmCYbu3JNptWSSqNUfrUH8wUwqN7eWQkNPFp43xWEZO0cHdSwqz6
         zJ9WeRdO5wLa9b1vW7hiUw8Ox4GNpi9LKuEPkGrU/zcbtcqTT0sZe/wG33uSpqvj1qRV
         7c3mpary35yyXV0jNpXPawddn2HHV9oSoUL60DSXAZTw9a/sObLl+JrHfJjTxXAQ/hdf
         t/m12NYs5JnOJ6bjTdiwfMbJNYJYPNCqCt5apK+o7AW69N7Vg8QW+h6egbeIefNZkGf0
         qgk2UozUO7anrh0NgzrWI4MZPwRu9mO3Awiuu2Vk0ROHjQ+EaKq6IssY30J9QG0QpnIa
         fzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775801656; x=1776406456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zuCZFSA98FRqYy4yV1UQPVIP38NMoL0rFxZUH55zJ0A=;
        b=SwtjoKepAm0qwdUxqw/0CL6mnEkFSamMg5eojzXdxtIcUDYoBY0c6sShTJMfUPh1eg
         C1Lbq/eOcHlMeFXqAWwSRFgoH6YtabJuMIDhoANgJmqY8UCBnssFCE2PnJUsyKhDQTHL
         WoPJVazrR6rJNtK1CCy3FKdL+KzcdrNSBxY9MvVR4SuDOoa7UD9SUyXaypchvIUqAnQC
         +cvnlEPAgn3yKGjjZJKiNrM5O9rDweemRPxDlVSMVisyTfZibijsRCi1NNgVKJWG++BY
         squWLM/u16Va9Vo+cEWlvqeC3AqXKUY1OQ5LY1UzdoQePzCYVmflTIiK2zOyTKXRaVar
         cDUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFKxYnL1qUcmpRpZKKEIDmWg7RKcf/NfPEJOzS7gqlvvLiyi79fkORYbVLYvI+vGIgKdaYZnIwM4ie5YXJCgRsIQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzJp4aXzDEqft0AMYHaM1rjiZ4DMd5qy8n0qEYrCmkWsHesCVhQ
	BSy1TbE0GVjewJVe805xUVRVHPquFnArkvRtHN+HLJcgacAhIsa7WIohfOMNlpQUYMq1n5Gopm7
	y8nk4ag7+vqvhULChSTjZyX5rCkDJU4I=
X-Gm-Gg: AeBDietRFenp0fVBYA/T0eWTf6DpT37mycm3WJq4VFC6e5SF+1Jf1P7MgtzRAuro/jF
	mINhfOjfKsHrlIEu2Ks2/4Oca2LeHZkOZVZOqnnLSq278TlWA5H4WtsbUt93csckqGZ0G15edt7
	a3D5nqDESfg+WhkQijbhgsEAEIC/pMY86Hy/SVf8GB0YXqNUAyMF7UXlQJRLLGRE1Xp2YsmvZpx
	l/1jOQLFwSSnbqHM1Am2ZVtVnco7PUqZXYs3J1ge7v4G4tNedEkmG6C/xZ6+D1dpTvb70+hWOdU
	94Cok4EFsdAvKWNmL6dhB4+/p7BXAlntUpIzB4jnF5x7iIVQ7H7w5SYDhKrQQGLtJA==
X-Received: by 2002:a05:6512:10d3:b0:5a2:bf50:763d with SMTP id
 2adb3069b0e04-5a3efb4c712mr760013e87.38.1775801656149; Thu, 09 Apr 2026
 23:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
 <DHOV6DD1DEG9.2REH24GS0QYC3@smile.fr> <18A4CD91CED0CFD1.657799@lists.openembedded.org>
In-Reply-To: <18A4CD91CED0CFD1.657799@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 10 Apr 2026 08:14:00 +0200
X-Gm-Features: AQROBzAujppxC47QmWfV9vtVBWqTj4lhgsC5uwQnHms-widtoKZxLcg504vIZDQ
Message-ID: <CA+chaQcw_PzMQvtz+fw5MCKn4zgfM8e4T7uUZKeaiW8RtyWndg@mail.gmail.com>
Subject: Re: [OE-core] [whinlatter][PATCH 1/9] dtc: backport fix for build
 with glibc-2.43
To: martin.jansa@gmail.com
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 06:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234991

On Thu, Apr 9, 2026 at 11:29=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Thu, Apr 9, 2026 at 9:17=E2=80=AFPM Yoann Congal <yoann.congal@smile.f=
r> wrote:
> >
> > On Thu Apr 9, 2026 at 5:28 PM CEST, Martin Jansa via lists.openembedded=
.org wrote:
> > > From: Martin Jansa <martin.jansa@gmail.com>
> > >
> > > glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native:
> > > https://errors.yoctoproject.org/Errors/Details/903983/
> > >
> > > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function =E2=80=98overl=
ay_fixup_phandle=E2=80=99:
> > > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignment d=
iscards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=
=3Ddiscarded-qualifiers]
> > >   424 |                 sep =3D memchr(fixup_str, ':', fixup_len);
> > >       |                     ^
> > > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignment d=
iscards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=
=3Ddiscarded-qualifiers]
> > >   434 |                 sep =3D memchr(name, ':', fixup_len);
> > >       |                     ^
> > > cc1: all warnings being treated as errors
> > >
> > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.c=
om>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> >
> > Hello,
> >
> > I've started a whinlatter bringup build on the new Ubuntu 26.04 worker
> > with this series applied:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/96/builds/23
> >
> > It got 2 errors (Other errors are most likely consequences of these one=
s):
> >
> > ERROR: shadow-native-4.18.0-r0 do_configure: configure failed:
> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/96/builds/23/=
steps/12/logs/stdio line 6269:
> > | checking for crypt in -lcrypt... no
> > | configure: error: crypt() not found
> > | NOTE: The following config.log files may provide further information.
> > | NOTE: /srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x86_64=
-linux/shadow-native/4.18.0/build/config.log
> > | ERROR: configure failed
> > | WARNING: exit code 1 from a shell command.
> > NOTE: recipe shadow-native-4.18.0-r0: task do_configure: Failed
>
> Hello,
>
> for shadow please read
> https://lists.openembedded.org/g/openembedded-core/message/234119 the
> important part:
> "libcrypt-dev is no longer installed as a dependency in my minimal docker=
 image"
> I guess it's now missing on your ubuntu-26.04 host as well.
> It used to be typically installed by build-essential -> libc6-dev ->
> libcrypt-dev but not anymore since 2.42-7:
>
> 25.10 questing with 2.42-0ubuntu3.1:
> https://packages.ubuntu.com/questing/libc6-dev
> 26.04 resolute with 2.43-2ubuntu1:
> https://packages.ubuntu.com/resolute/libc6-dev
>
> https://changelogs.ubuntu.com/changelogs/pool/main/g/glibc/glibc_2.43-2ub=
untu1/changelog:
> ...
> glibc (2.42-7) unstable; urgency=3Dmedium
>
>   [ Aurelien Jarno ]
>   * debian/control.in/libc, debian/rules.d/debhelper.mk: drop libcrypt-de=
v
>     dependency from libc6-dev. Thanks to Helmut Grohne for proposing that=
,
>     doing an archive rebuild and filling the bug reports.
>   * debian/control.in/main, debian/sysdeps/linux.mk: enable SystemTap sta=
tic
>     probes.
>   * debian/debhelper.in/libc-dev.NEWS: add a NEWS entry about the removal=
 of
>     the obsolete termio interface.  Closes: #1124068.
>   * debian/rules.d/debhelper.mk: ensure that linker scripts work even whe=
n
>     /usr is unmerged.  Closes: #1120508
>   * debian/debhelper.in/libc-dev{,-alt}.lintian-overrides,
>     source/lintian-overrides, rules.d/debhelper.mk, salsa-ci.yml: drop
>     unpack-message-for-{orig,source} overrides, fixed in lintian 2.128.0.
>   * debian/control.in/main: drop Rules-Requires-Root: no, this is now the
>     default.
>   * debian/libc6.symbols.i386, debian/libc6-i386.symbols.{amd64,x32}: rem=
ove
>     the workaround for GLIBC_ABI_GNU_TLS.  Closes: #1122038.
>   * debian/control.in/{libc,i386}: ensure that libdpkg-perl is fixed wrt
>     GLIBC_ABI_GNU_TLS.
>
>  -- Aurelien Jarno <aurel32@debian.org>  Sun, 04 Jan 2026 10:07:24 +0100
> ...
>
>
> I'll have a look at virglrenderer-native tomorrow. khem already fixed it =
in:
> https://gitlab.freedesktop.org/virgl/virglrenderer/-/commit/3f0f775edb2df=
5ea54c37863286ad565ccddb276
> https://git.openembedded.org/openembedded-core/commit/?id=3D8e85dc6b7f5f7=
668a610b5fd3754c716f0af65b0
> https://git.openembedded.org/openembedded-core/commit/?id=3D5ff5aac9ed9e5=
3a2e06515cc480c7d89a8aa3171
> will add a backport in whinlatter and possibly scarthgap as well.

Backport for whinlatter sent:
https://lists.openembedded.org/g/openembedded-core/message/234990

for scarthgap there is a similar issue in mesa-native first, will send it l=
ater.

Cheers,

