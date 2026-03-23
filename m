Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C243F4611C
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:57:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17552.1774272941911636757
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=qAqeWQex;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDB6744359
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF98C4AF0B
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272542;
	bh=fOLc5X9qSryp6EDWt50j/mO642IW6FyoxsnX6KORIkw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=qAqeWQex3/7lGwXGjG4yKPDlm6xngkvSnIGxMXLcQMDRcSJtdWrqcKpPKvbQLewRg
	 33d+HPlGrP4gOjpgMPV/ca7WEjiyaHMKHB5d83+Eeaw+fG/vrRytrXHMlMJtxPyXok
	 Bjj+ggmdc9D6Cqx8tWsDeoqeuRpC22D21YVYCznUdmv5iO7zWS+0hq2X3vGm70jQda
	 vQ8co+yzXa/49+Xbj+S45rWIdxC0EoH6njsnx3irx//INuqJW30TddfdvUg7f13QlG
	 CnzYJr1yqkoXF033UH2aiIEFni4GIZuT6GHxqxbQYYMhwodWNMQfztWM8zjCt0qdTb
	 Npf6vPa0VGroA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a12c310e8aso2849683e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:29:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXexqAo73diEnHxL1y7VqrtY+3qwLWFZu/WmW74nJWuA0axxh4hVFjBRZb0Bj1iaohCc5FBeEiQcCJnqMBv4FCkcA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzd+S4zsYZyNmFrheyJNr+ZVmL7XxJHxeOJg0P7e/tTAwoqOrCL
	AHnh+IsF3cEDCRRrXYSgVuET2Q34pqOWwMYbaFd8GGn26bTgYnjIexEtfF3SdHw7Wxq4RLGN/EL
	EgC6K+WfEInbNhry/gpqC7oXeDhVdF6+8Y1UHwCtGNA==
X-Received: by 2002:a05:6512:3087:b0:5a1:2f5a:cb61 with SMTP id
 2adb3069b0e04-5a285aef835mr4166642e87.2.1774272541391; Mon, 23 Mar 2026
 06:29:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 06:28:59 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 06:28:59 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260312120024.3745232-1-zboszor@gmail.com>
MIME-Version: 1.0
References: <20260312120024.3745232-1-zboszor@gmail.com>
Date: Mon, 23 Mar 2026 06:28:59 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
X-Gm-Features: AaiRm517mIeRE2mVbLkyzey6xwXbo1Y3fKuf6LDn9Avv-uNSIr8XPMyZHROmWoU
Message-ID: <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for free threading
To: zboszor@gmail.com
Cc: "Zoltan Boszormenyi via lists.openembedded.org" <zboszor=gmail.com@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233731

On Thu, 12 Mar 2026 13:00:24 +0100, "Zoltan Boszormenyi via
lists.openembedded.org" <zboszor=3Dgmail.com@lists.openembedded.org>
said:
> One of the main points in the Python 3.14.x release notes was
> that free threading is officially supported.
>
> Add PACKAGECONFIG[freethreading] to turn it on with --disable-gil.
> GIL is the Global Interpreter Lock, which is kept enabled without
> this option.
>
> By default, keep free threading disabled, i.e. GIL enabled.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/recipes-devtools/python/python3_3.14.3.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipe=
s-devtools/python/python3_3.14.3.bb
> index 7047cd8e8d..7a1ad1e386 100644
> --- a/meta/recipes-devtools/python/python3_3.14.3.bb
> +++ b/meta/recipes-devtools/python/python3_3.14.3.bb
> @@ -112,6 +112,7 @@ CACHED_CONFIGUREVARS:append:libc-musl =3D "\
>
>  # PGO currently causes builds to not be reproducible so disable by defau=
lt, see YOCTO #13407
>  PACKAGECONFIG ??=3D "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES',=
 'lto', d)}"
> +PACKAGECONFIG[freethreading] =3D "--disable-gil,--enable-gil"
>  PACKAGECONFIG[readline] =3D "--with-readline=3Dreadline,,readline,,,edit=
line"
>  PACKAGECONFIG[editline] =3D "--with-readline=3Deditline,,libedit,,,readl=
ine"
>  # Use profile guided optimisation by running PyBench inside qemu-user
> --
> 2.53.0
>

Thanks for doing this, I'm really interested in using free-threaded python =
on
Yocto. However, when trying to enable this with current openembedded-core, =
I
ran into the following problem:

Loading cache: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
###############################|
Time: 0:00:02
Loaded 5224 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           =3D "2.16.0"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "x86_64-poky-linux"
MACHINE              =3D "qemux86-64"
SDKMACHINE           =3D "x86_64"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D
"5.3.99+snapshot-8061433fcd11eba91a29004dfafd175d449fb2fd"
TUNE_FEATURES        =3D "m64 x86-64-v3"
meta                 =3D "master:8061433fcd11eba91a29004dfafd175d449fb2fd"
meta-poky            =3D "master:c7fa63bea78248597798739aa4da49a9f4405b9c"
meta-oe
meta-python
meta-networking
meta-filesystems     =3D "master:b883bd25cdd27560fdebc5a4bf56f90e99964c4c"

Sstate summary: Wanted 254 Local 2 Mirrors 0 Missed 252 Current 2392
(0% match, 90% complete)###################################################=
###########################################################################=
###############################
                         | ETA:  0:00:00
Initialising tasks: 100%
|##########################################################################=
###########################################################################=
###########################################################################=
##########################|
Time: 0:00:05
NOTE: Executing Tasks
ERROR: python3-3.14.3-r0 do_install: oe_multilib_header: Unable to
find header python3.14/pyconfig.h.
ERROR: python3-3.14.3-r0 do_install: Execution of
'/home/brgl/workspace/yocto/python-freethreaded/build/tmp/work/x86-64-v3-po=
ky-linux/python3/3.14.3/temp/run.do_install.2092850'
failed with exit code 1
ERROR: Logfile of failure stored in:
/home/brgl/workspace/yocto/python-freethreaded/build/tmp/work/x86-64-v3-pok=
y-linux/python3/3.14.3/temp/log.do_install.2092850
ERROR: Task (/home/brgl/workspace/yocto/python-freethreaded/sources/openemb=
edded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_install)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 4513 tasks of which 4512 didn't need to
be rerun and 1 failed.

Summary: 1 task failed:
  /home/brgl/workspace/yocto/python-freethreaded/sources/openembedded-core/=
meta/recipes-devtools/python/python3_3.14.3.bb:do_install
    log: /home/brgl/workspace/yocto/python-freethreaded/build/tmp/work/x86-=
64-v3-poky-linux/python3/3.14.3/temp/log.do_install.2092850
Summary: There were 2 ERROR messages, returning a non-zero exit code.


Any hints on what could be wrong? The same config builds fine without the
new option. It's just a core-image-minimal on poky with a few python packag=
es
from meta-openembedded.

Thanks in advance,
Bartosz

