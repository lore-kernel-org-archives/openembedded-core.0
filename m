Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B039FF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 13:30:34 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13489.1777383027804634119
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 06:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dUejrW78;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so151016945e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 06:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777383026; x=1777987826; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAfKOrh4FD6pY7adKi7rni+VmGFS4KRQ5KoKCHAN9Oo=;
        b=dUejrW787hTFVVKwJ+Sv+Yzxr0uu606xD9GchjVb2dOJdQPAopEYDHrU3SDndaBzMA
         mxdllxwoandFaT249/R10pIpWWMzxTzwoCT20AvQ7blAuJA2mkieXkmJVgrx1wLm4Jqg
         7JEHhU6IZA4UlXSy8S3tBkugSZtMvNiygh6HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383026; x=1777987826;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAfKOrh4FD6pY7adKi7rni+VmGFS4KRQ5KoKCHAN9Oo=;
        b=Ytvl6f0Nrx8sPwq7VQGZpZ1cGEV1VMZsC7qiiAff8ESfaGX/gd42WOdjjG4x3Fz1cP
         KLDtsmwRwAXPrf/WFmIpDzemG8vWBCZkt3yH183xUGikuBYWQtnDjm5hvesT8+RhWEgz
         gbr42+cbt+ebW/apQ0FFFiwLpmrGE8CCWU3mtEZbF/cDAyl+cuyH/5MNt3hPZP+dFylA
         G8166l1MwVddIau056iyo5GpCcFo/w3iCdqseBaf76FfAwJdKlxxVY+kFn1X/rxDO5cP
         sgLZuoeksfl4wykK4spUgeE/3Nk7T+pX72HsOPlypYO5PV7AOVhUqCkOcgz37AlvZMI2
         4ssw==
X-Forwarded-Encrypted: i=1; AFNElJ9fxXHR8Qe+6Hj4xCWMUu5gTC412nxh7Xz8MeB7KOUXdhZrS5+MUme8iBn1eOAwBhwWntmdao/dCSYrfK1V2tsR2Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwTBo5EgJRDyVgHiH9M0gS7GmvPfwaiemLytIokEBe50ylvh7aJ
	vua0XWIO+CiVOz3/os8a9MjK1P7KSyXHJF9eoufB2Cpk7Jw4KqICVAWOQpkKj8/nmE/+lCttpkp
	f51IpKjc=
X-Gm-Gg: AeBDievUA8yglEAm8YoXnPjKz2eIHOLREVVXPvSKH6YyI0oHz+WLoIfU+SZXmSFmuT6
	B41UJyedpjHr+mnZh+7yhDzRusq8D5/IqBLWLHqAscICo6Vf5pzOchik8yKphgoMcDtwqSUBh78
	M71hnfmknpPhs13ngtqr8eZYRR+xXGHwNmx7G4WnwPblyEKSRgv257Ez+4Ag1AEvcUfMDfWZssy
	GjgR4OnGOWLXRBcExG3gyYbbpa2T834LQc957C8honGXYWlXUVLRiwCmA4/61LvQ+COoqJhUYuC
	8hZ3YYLitcs/rasLgyi3TUH/8BgnYItPFYGRSrdBtUrOkaJuaZU/exBIA+gqcbYse8CJOWnJgLS
	Wm0U17lqGYXilJXYpJ8/O36x+bXLAPl+Oy5iDuM1slG3JHWePdsSAwpcki6LvCAfZT5b+i/QTe6
	WVoSD003ycXJ1gi0ZygTZZ4iBulbicl8mT+OnpmdF7/vAu+wBxMkGEk7g+WTrghe8SkEkVqk3Bi
	E7tahHCUvUjzXsAa7QoQ4a92fA=
X-Received: by 2002:a05:600c:81ca:b0:488:7ff6:1f75 with SMTP id 5b1f17b1804b1-48a77b1468dmr50233775e9.21.1777383025902;
        Tue, 28 Apr 2026 06:30:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d7fe:f02f:1ae8:3ae9? ([2001:8b0:aba:5f3c:d7fe:f02f:1ae8:3ae9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77aab1b4sm49902615e9.0.2026.04.28.06.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:30:25 -0700 (PDT)
Message-ID: <dbaf3205ce1b343bd235e086dd6a8843df16ae06.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] python3-cython: make generated _cyutility.c be
 reproducible
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zhixiong.chi@windriver.com, openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2026 14:30:24 +0100
In-Reply-To: <20260424035607.419983-1-zhixiong.chi@windriver.com>
References: <20260424035607.419983-1-zhixiong.chi@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 13:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236064

On Thu, 2026-04-23 at 20:56 -0700, Zhixiong Chi via lists.openembedded.org =
wrote:
> While python3 module use cython to build library, the generated source fi=
le
> _cyutility.c is not stable at each build and made the generated library n=
ot
> be reproducible
>=20
> This commit replace un-predictable tmpfolder string with fixed symlink in
> generated source file to assure the generated library should be reproduci=
ble.
>=20
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
> =C2=A0...link-to-the-unpredictable-tmpdir-for.patch | 65 ++++++++++++++++=
+++
> =C2=A0.../python/python3-cython_3.2.4.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A02 files changed, 66 insertions(+)
> =C2=A0create mode 100644 meta/recipes-devtools/python/python3-cython/0001=
-Create-fixed-symlink-to-the-unpredictable-tmpdir-for.patch
>=20
> diff --git a/meta/recipes-devtools/python/python3-cython/0001-Create-fixe=
d-symlink-to-the-unpredictable-tmpdir-for.patch b/meta/recipes-devtools/pyt=
hon/python3-cython/0001-Create-fixed-symlink-to-the-unpredictable-tmpdir-fo=
r.patch
> new file mode 100644
> index 0000000000..005ee4224c
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-cython/0001-Create-fixed-symli=
nk-to-the-unpredictable-tmpdir-for.patch
> @@ -0,0 +1,65 @@
> +From 42bb8d553defb250cd3ccdd539ff5a9c14a8421a Mon Sep 17 00:00:00 2001
> +From: Zhixiong Chi <zhixiong.chi@windriver.com>
> +Date: Thu, 23 Apr 2026 00:19:59 -0700
> +Subject: [PATCH] Create fixed symlink to the unpredictable tmpdir for
> + sharedmodule
> +
> +When the option "--generated-shared" is used to generated __cyutility as=
 the
> +link https://github.com/scikit-learn/scikit-learn/pull/31151/files, the =
path
> +for filename_table in the generated pyx/c file contains tmp dir which is=
 not
> +predictable, and it caused the generated output file is not stable at ea=
ch
> +build and made the generated library is not reproducible [1] between bui=
lds.
> +
> +example as python3_pandas:
> +
> +vim build/_cyutility.c
> +......
> +/* #### Code section: filename_table ### */
> +
> +static const char* const __pyx_f[] =3D {
> +=C2=A0 "../../../../../../../../../../../../tmp/tmpXXXXXX/_cyutility.pyx=
",
> +=C2=A0 "<stringsource>",
> +};
> +
> +Replace with the fixed tmp symlink, it is no harm to tweak comments in s=
ource
> +file, after applied this commit, vim build/_cyutility.c
> +......
> +/* #### Code section: filename_table ### */
> +
> +static const char* const __pyx_f[] =3D {
> +=C2=A0 "../../../../../../../../../../../../tmp/cython_shared/_cyutility=
.pyx",
> +=C2=A0 "<stringsource>",
> +};
> +
> +[1] https://reproducible-builds.org/
> +
> +Upstream-Status: Submitted [https://github.com/cython/cython/pull/7634]
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +---
> + Cython/Build/SharedModule.py | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/Cython/Build/SharedModule.py b/Cython/Build/SharedModule.py
> +index b466e57ed..f99fdabb6 100644
> +--- a/Cython/Build/SharedModule.py
> ++++ b/Cython/Build/SharedModule.py
> +@@ -76,9 +76,14 @@ def generate_shared_module(options):
> +=C2=A0=C2=A0=C2=A0=C2=A0 context =3D Main.Context.from_options(options)
> +=C2=A0=C2=A0=C2=A0=C2=A0 scope =3D Symtab.ModuleScope('MemoryView', pare=
nt_module =3D None, context =3D context, is_package=3DFalse)
> +=20
> ++=C2=A0=C2=A0=C2=A0 fixed_tmp_link =3D "/tmp/cython_shared"
> ++
> +=C2=A0=C2=A0=C2=A0=C2=A0 with tempfile.TemporaryDirectory() as tmpdirnam=
e:
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pyx_file =3D os.path.join(tm=
pdirname, f'{module_name}.pyx')
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c_file =3D os.path.join(tmpd=
irname, f'{module_name}.c')
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if os.path.exists(fixed_tmp_=
link) or os.path.islink(fixed_tmp_link):
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.u=
nlink(fixed_tmp_link)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.symlink(tmpdirname, fixed=
_tmp_link)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pyx_file =3D os.path.join(fi=
xed_tmp_link, f'{module_name}.pyx')
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c_file =3D os.path.join(fixe=
d_tmp_link, f'{module_name}.c')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with open(pyx_file, 'w'=
):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pass
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 source_desc =3D FileSou=
rceDescriptor(pyx_file)
> +--=20
>=20

During review we realised this hardcodes a /tmp/ path. What happens if
there are mutliple builds running in parallel?

Ross also mentioned we may be able to tweak the cython class to improve
things.

Cheers,

Richard

