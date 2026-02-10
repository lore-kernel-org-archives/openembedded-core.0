Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67221EA3F2B
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 08:52:43 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15925.1770713560883636358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 00:52:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q/2bVT04;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so4877055e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 00:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770713559; x=1771318359; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzoTPIryKy7ElXqB8L7T1NZ6hy8nwlMBUIeW2dyY+0A=;
        b=Q/2bVT04lyAaww0cJz4iCirTxnbnazh16TtSf7dLk+FgI1JiHG2jwL9Zdi9fR5DRjS
         obyXLAXO/Pw0RmQzuL+rj6IZ8rI7n+4Zwl7eaSLNSstHhoYDz0/4zvsfXc7vE/qYYEZ8
         DYOMqmjevrMjTsV3IPjSKW3Bc8SqtergHyvpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770713559; x=1771318359;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzoTPIryKy7ElXqB8L7T1NZ6hy8nwlMBUIeW2dyY+0A=;
        b=FJjb7tny/+JOL36sJlZvOWabXW28L9uo/IG193PUidtZBFI5ItRCgIE8cOSFD7y8R4
         X+X5DFEjMqF5iM4MN0gSskj6KUbeS+cG2BebAbBSspQzWmRVkqMsBUhvFFIL0e+1fV3d
         l5i7gcAOhpCaW43kUqXXheueYzpfbu94TMyHBL+DYGRZX3ju4/B2sJp1SNvizBPWU+7q
         Ulh/FKCUpL//oxNDLKOlEPHybzBrvLoCzzBbADvOum2MSIR4k4BH4apVEwKRzuSZoljc
         8wi9Q/Ynt+oB0OJAVRei1l13EpjoX+0NtnBF4AwHcy1cR4+poWhcGq742L/g3LoP+Iqr
         c2bw==
X-Forwarded-Encrypted: i=1; AJvYcCVhXXs87eGktRZm5fpPcW6uOpH3d0zzb3CWO01u2j8qxyhVld6CxTkwIlqbGtBFmkxnHMdfoS1OQx75FwE9hjwhyQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwCA93QTnvZnvntkA7XohuKSEph2ShJ1UMca1OU1SEn8eGfY+eX
	ICacLkgMNLuQXzNVqvQfxJ2EpJgW7/izaS7uMOXCwC+Rv7u9MDGiYjaYivEChwiX2EDNRXbSIMX
	JCvS+COQGbQ==
X-Gm-Gg: AZuq6aLUPkgsyocqxgToHeVxdmPYUY4oYBSTpypz4/6lsAS6nocFmPZ0jb92eAuBXP5
	rhcKUE3y6YZuV898T08qOezlgkqIeL+A6JWenS4ubg2CxBqadH4SMNJljNJl9CFBgi7lkjoP24/
	iQibFzduzzyxhVIr3fO8VmjQ/difs5A5R4PhHy6iXMBKcPbJ7ndXnFGN1oPSSKgDt3ctKuunjFu
	eW64eblxI6L6cYlVvMk+Fc/XxRpHurO4NTxyYbX/U2QWkucobMhupwQ7nutvTQoId+KPY+CMigG
	KyMsTQ3iDOouOQNl0KQtuiNLpIxL+vCqzjFed3a1GrdsCnP5Kkvh3SsV23Jl+E8ZglyqLdyTH7r
	Wns/bTZJ5GyTHZQs2jyUI7eMOMO+t9oXS0FuSJ69SfAtWHgUaeP1en4aABXiHEalN6thLzcihB5
	9mrBSUAbfHdi3D2gz7LuTMl71EJVozZKuxUXJqaNtyrky040pId/tNucpeXMX5XvWTeciiq8W/A
	fYwlrezGg==
X-Received: by 2002:a05:600c:8b35:b0:477:af8d:203a with SMTP id 5b1f17b1804b1-48320236695mr208291165e9.27.1770713559092;
        Tue, 10 Feb 2026 00:52:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:847e:ef7e:e5c4:fa? ([2001:8b0:aba:5f3c:847e:ef7e:e5c4:fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d8f2csm67365735e9.1.2026.02.10.00.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 00:52:38 -0800 (PST)
Message-ID: <815228181136c50526453673dd9235a6b7e4ede3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 3/7] classes-global/package_rpm.bbclass:
 Remove %pre and %postin for libc6
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liezhi.yang@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 10 Feb 2026 08:52:37 +0000
In-Reply-To: <59ba081c8c874065b6cdc050a2897422be4a7a59.1770707181.git.liezhi.yang@windriver.com>
References: <cover.1770707181.git.liezhi.yang@windriver.com>
	 <59ba081c8c874065b6cdc050a2897422be4a7a59.1770707181.git.liezhi.yang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 08:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230866

On Mon, 2026-02-09 at 23:10 -0800, Robert Yang via lists.openembedded.org w=
rote:
> From: Robert Yang <liezhi.yang@windriver.com>
>=20
> Fixed:
> $ bitbake core-image-full-cmdline:do_testimage
> %post(busybox-1.37.0-r0.x86_64_x32): execv(/bin/sh) pid 624
> error: failed to exec scriptlet interpreter /bin/sh: No such file or dire=
ctory
>=20
> It is because busybox and libc6 depends on each other, busybox' elf files
> depends on libc6, and libc6's postin depends on busybox' /bin/sh, the do_=
rootfs
> works well is because dnf-native has set RPM_NO_CHROOT_FOR_SCRIPTS=3D1, b=
ut it
> would be failed for a fresh rootfs.
>=20
> In rpm 4.20.1, it let the installed files' Requires win, so it installed
> busybox firstly, but in rpm 6.0.1, it let the postin's Requires win since
> postin would run immediately after the files are installed, this does mak=
e
> sense, so it installed busybox (which provides /bin/sh required by libc6'
> postin) firstly, then we got the errors. I couldn't find which commit mad=
e this
> change because a lot of files and functions are refactored during 4.20.1 =
and
> 6.0.0 (not .1), I also tried bisect, but failed because a lot of do_patch=
 or
> do_configure/do_compile failures for each build.
>=20
> For libc6's the postin is:
>=20
> =C2=A0 #!/bin/sh
> =C2=A0 if [ x"$D" =3D "x" ]; then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -x /sbin/ldconfig ]; then /sbin/ldcon=
fig ; fi
> =C2=A0 fi
>=20
> This doesn't make sense for lib6 since there is no /bin/sh or ldconfig wh=
en
> libc6 is not ready yet, so we can just remove libc6's postin to fix the
> problem.
>=20
> And also remove the workarounds in oeqa/runtime/cases/dnf.py, they are no=
t
> needed any more since the circular dependency is fixed.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> =C2=A0meta/classes-global/package_rpm.bbclass | 6 ++++--
> =C2=A0meta/lib/oeqa/runtime/cases/dnf.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
8 --------
> =C2=A02 files changed, 4 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-globa=
l/package_rpm.bbclass
> index f4dd779a52..526ac57982 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -421,12 +421,14 @@ python write_specfile () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spec_preamble_bottom.app=
end('')
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Now process scriptlets
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if splitrpreinst:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # The libc6 shouldn't have %p=
re or %post to avoid circular dependency
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libc6 =3D '%slibc6' % (d.getV=
ar('MLPREFIX') or '')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if splitrpreinst and splitnam=
e !=3D libc6:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
spec_scriptlets_bottom.append('%%pre -n %s' % splitname)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
spec_scriptlets_bottom.append('# %s - preinst' % splitname)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
spec_scriptlets_bottom.append(splitrpreinst)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
spec_scriptlets_bottom.append('')
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if splitrpostinst:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if splitrpostinst and splitna=
me !=3D libc6:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
spec_scriptlets_bottom.append('%%post -n %s' % splitname)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
spec_scriptlets_bottom.append('# %s - postinst' % splitname)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
spec_scriptlets_bottom.append(splitrpostinst)

I'm not happy about coding a "libc6" reference into the generic package
class. It does make me wonder if there is a similar issue with musl for
example and we'd end up with a longer hardcoded list.

Could/shouldn't we just not add that postinst for libc6? You could for
example force the value of pkg_postinst:libc6 during the packaging
process and empty the postinst instead.

Also the commit message explains the problem with the postinst but not
really why the preinst is a problem? What does that contain which is
problematic?

Cheers,

Richard

