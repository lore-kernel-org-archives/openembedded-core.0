Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720E5C6FA99
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 20:45:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.5573.1678221904939416086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 12:45:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U39f6Hjd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso11264052wmq.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 12:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678221903;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FY6s4ZO9LFY7kKjTBlaaG0CkFKmy/z/enPDR5RWL0WQ=;
        b=U39f6HjduyOlWP5U+Wr92RyUztFT35c3fNCRmqv72dC1pAnKs9B9WAkofvBlUmGlL5
         EBMs7gxSlFXiNzH937fNABYgk/6lZ4GTWMX1X6d9sZDTZ+KaB9kqvXCVT2BCHcb6arlO
         RfXR4sTvp2+kbHThv4qjFhwFvEkWcmNP9S+Dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678221903;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FY6s4ZO9LFY7kKjTBlaaG0CkFKmy/z/enPDR5RWL0WQ=;
        b=5dWP62LNPedLCKTvIhMQD7Flk4nXVMPWFhKEHHUt8RCPcABEouNhxVARNwiup5HSgu
         FVY/S5rXLIMnJBwj/A71uSMMrrpdb9mS0KUhL91VRh2QpC5c2XQn3bEo/lPnWoZw49dR
         bw3/XrE3zWqoBT+H3JdckgzwbuI8Gnd7z81J/NnkLf/h7BkEOifraguLq6Wykab652Ro
         L58oX8u+Ll/pr6sxj0lKG+PKhY0A8/BIG4naFunLtKCuRq7sOC21lPAPVz2HFZJbIIXk
         LoyhBL7xzYb9G04/0HEo7QcKTg95MUk629RzrosItZ7jQfrJJi3CCwR7S46ZWjWcidVv
         d87w==
X-Gm-Message-State: AO0yUKXUp3NttrRsroNOdrf4gZJmSFnJTk+/H+38zOqAutG80sO6P9j6
	QaIP+lPCCdQZUiJzuArMVYoAaw==
X-Google-Smtp-Source: AK7set/SrWWda/3qwYwOmPyxN0gA+TvSRd21NVoqUyHl/hEw45r1E0B34aFVdUW5nV7rNG6jCvRdMw==
X-Received: by 2002:a05:600c:4fc5:b0:3ea:f0d6:5d37 with SMTP id o5-20020a05600c4fc500b003eaf0d65d37mr13695978wmq.8.1678221902861;
        Tue, 07 Mar 2023 12:45:02 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b? ([2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b])
        by smtp.gmail.com with ESMTPSA id bi25-20020a05600c3d9900b003e89e3284fasm17694908wmb.36.2023.03.07.12.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 12:45:02 -0800 (PST)
Message-ID: <72a6bfc96bebf4bc8a6d3720b072e65e38a2c515.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] sstate.bbclass: fix cleanup when sysroot
 in manifest != RECIPE_SYSROOT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ovidiu Panait <ovidiu.panait@windriver.com>, Ovidiu Panait
 <ovidiu.panait@eng.windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 07 Mar 2023 20:45:01 +0000
In-Reply-To: <b0a4bad5-3c42-5b61-497d-4e2c9a74b828@windriver.com>
References: <20230227154230.3566400-1-ovidiu.panait@eng.windriver.com>
	 <20230227154230.3566400-2-ovidiu.panait@eng.windriver.com>
	 <1bb2511c3505e7d215e74fe3aaffe8d7bbf51976.camel@linuxfoundation.org>
	 <b0a4bad5-3c42-5b61-497d-4e2c9a74b828@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 20:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178120

On Tue, 2023-03-07 at 21:04 +0200, Ovidiu Panait wrote:
> Hi Richard,
>=20
> On 3/6/23 19:59, Richard Purdie wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >=20
> > On Mon, 2023-02-27 at 17:42 +0200, Ovidiu Panait wrote:
> > > The following scenario currently fails:
> > > git clone git://git.yoctoproject.org/poky
> > > cd poky; . oe-init-build-env
> > >=20
> > > add to local.conf:
> > > require conf/multilib.conf
> > > MACHINE =3D "qemuarm64"
> > > MULTILIBS =3D "multilib:lib32"
> > > DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7athf-neon"
> > >=20
> > > bitbake gcc-cross-canadian-arm
> > >=20
> > > update local.conf to force a rebuild:
> > > GCCPIE =3D "--disable-default-pie"
> > >=20
> > > bitbake gcc-cross-canadian-arm
> > >=20
> > > Failure log:
> > > The stack trace of python calls that resulted in this exception/failu=
re was:
> > > File: 'exec_func_python() autogenerated', lineno: 2, function: <modul=
e>
> > >       0001:
> > >   *** 0002:extend_recipe_sysroot(d)
> > >       0003:
> > > File: 'poky/meta/classes-global/staging.bbclass', lineno: 164, functi=
on: staging_copyfile
> > >       0160:        os.symlink(linkto, dest)
> > >       0161:        #bb.warn(c)
> > >       0162:    else:
> > >       0163:        try:
> > >   *** 0164:            os.link(c, dest)
> > >       0165:        except OSError as err:
> > >       0166:            if err.errno =3D=3D errno.EXDEV:
> > >       0167:                bb.utils.copyfile(c, dest)
> > >       0168:            else:
> > > Exception: FileExistsError: [Errno 17] File exists: 'poky/build/tmp/s=
ysroots-components/armv7at2hf-neon/lib32-linux-libc-headers/usr/include/asm=
/byteorder-32.h' -> 'poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/gcc=
-cross-canadian-arm/12.2.0-r0/recipe-sysroot/usr/include/asm/byteorder-32.h=
'
> > >=20
> > > In this particular case, the paths in lib32-linux-libc-headers manife=
st file
> > > are prefixed with lib32-recipe-sysroot:
> > > $ cat build/tmp/sysroots-components/manifests/lib32-linux-libc-header=
s.xxx
> > > lib32-recipe-sysroot/usr/include/asm/byteorder-32.h
> > > lib32-recipe-sysroot/usr/include/asm/sigcontext-32.h
> > > ...
> > >=20
> > > When gcc-cross-canadian-arm is built, the actual files get copied to
> > > recipe-sysroot directory during do_prepare_recipe_sysroot().
> > >=20
> > > Because of this mismatch, on rebuild, sstate_clean_manifest() will no=
t clean
> > > the files in recipe-sysroot, but will instead try to delete the non-e=
xistent
> > > files in lib32-recipe-sysroot. This will trigger the FileExists error=
s later.
> > >=20
> > > Add checks in sstate_clean_manifest() for this corner case, so that
> > > RECIPE_SYSROOT gets cleaned up properly.
> > >=20
> > > This fixes BZ#15045.
> > >=20
> > > Signed-off-by: Ovidiu Panait <ovidiu.panait@eng.windriver.com>
> > > ---
> > >   meta/classes-global/sstate.bbclass | 11 +++++++++++
> > >   1 file changed, 11 insertions(+)
> > >=20
> > > diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global=
/sstate.bbclass
> > > index af93546b04..edf5c7fb65 100644
> > > --- a/meta/classes-global/sstate.bbclass
> > > +++ b/meta/classes-global/sstate.bbclass
> > > @@ -529,9 +529,20 @@ def sstate_clean_manifest(manifest, d, canrace=
=3DFalse, prefix=3DNone):
> > >       entries =3D mfile.readlines()
> > >       mfile.close()
> > >=20
> > > +    recipe_sysroot =3D d.getVar("RECIPE_SYSROOT").rstrip("/").rsplit=
('/', 1)[-1]
> > > +
> > >       for entry in entries:
> > >           sstate_clean_entry(entry, canrace, prefix)
> > >=20
> > > +        # The sysroot directory stored in the manifest file might no=
t be the
> > > +        # same as RECIPE_SYSROOT, so the real sysroot will not be pr=
operly
> > > +        # cleaned up on rebuild. Handle the cleanup here in order to=
 avoid
> > > +        # "File exists" errors during do_prepare_recipe_sysroot().
> > > +        manifest_sysroot =3D entry.split("/", 1)[0] or None
> > > +        if manifest_sysroot and manifest_sysroot !=3D recipe_sysroot=
 and not manifest_sysroot.endswith("-native"):
> > > +            sysroot_entry =3D recipe_sysroot + "/" + entry.split("/"=
, 1)[1]
> > > +            sstate_clean_entry(sysroot_entry, canrace, prefix)
> > > +
> > >       postrm =3D manifest + ".postrm"
> > >       if os.path.exists(manifest + ".postrm"):
> > >           import subprocess
> > I looked into this and as I suspected, the bug is elsewhere. I've sent
> > a different patch to the staging.bbclass code which should fix this
> > problem.
>=20
> I tested with latest poky sources (with commit "staging: Separate out=20
> different multiconfig manifests" present), but the same error is still=
=20
> triggered on rebuild:
>=20
> File: 'poky/meta/classes-global/staging.bbclass', lineno: 164, function:=
=20
> staging_copyfile
>  =C2=A0=C2=A0=C2=A0=C2=A0 0160:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 os.symlink(linkto, dest)
>  =C2=A0=C2=A0=C2=A0=C2=A0 0161:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 #bb.warn(c)
>  =C2=A0=C2=A0=C2=A0=C2=A0 0162:=C2=A0=C2=A0=C2=A0 else:
>  =C2=A0=C2=A0=C2=A0=C2=A0 0163:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 try:
>  =C2=A0*** 0164:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 os.link(c, dest)
>  =C2=A0=C2=A0=C2=A0=C2=A0 0165:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 except OSError as err:
>  =C2=A0=C2=A0=C2=A0=C2=A0 0166:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if err.errno =3D=3D errno.EXDEV:
>  =C2=A0=C2=A0=C2=A0=C2=A0 0167:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.utils.copyfile(c, dest)
>  =C2=A0=C2=A0=C2=A0=C2=A0 0168:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 else:
> Exception: FileExistsError: [Errno 17] File exists:=20
> 'poky/build/tmp/sysroots-components/armv7at2hf-neon/lib32-linux-libc-head=
ers/usr/include/asm/byteorder-32.h'=20
> ->=20
> 'poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-ar=
m/12.2.0-r0/recipe-sysroot/usr/include/asm/byteorder-32.h'
>=20
> The manifest files still show lib32-recipe-sysroot instead of=20
> recipe-sysroot (the manifest file seems to have already been cached by=
=20
> lib32-gcc-cross-arm):
> $ head -2=20
> tmp/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-arm/12.2.0-r0/=
recipe-sysroot-native/installeddeps/lib32-linux-libc-headers
> lib32-recipe-sysroot/usr/include/asm/byteorder-32.h
> lib32-recipe-sysroot/usr/include/asm/sigcontext-32.h
>=20
> MLPREFIX is set to lib32- for gcc-cross-canadian-arm, so the existing=20
> manifest file with lib32-recipe-sysroot paths is used:
> $ bitbake -e gcc-cross-canadian-arm | grep ^MLPREFIX
> MLPREFIX=3D"lib32-"
>=20
> Adding an exception for cross-canadian to the the mlprefix code added=20
> earlier seems to make it work:
>=20
> diff --git a/meta/classes-global/staging.bbclass=20
> b/meta/classes-global/staging.bbclass
> index e6d0d1d55c..a9142ce780 100644
> --- a/meta/classes-global/staging.bbclass
> +++ b/meta/classes-global/staging.bbclass
> @@ -276,6 +276,10 @@ python extend_recipe_sysroot() {
>  =C2=A0=C2=A0=C2=A0=C2=A0 stagingdir =3D d.getVar("STAGING_DIR")
>  =C2=A0=C2=A0=C2=A0=C2=A0 sharedmanifests =3D d.getVar("COMPONENTS_DIR") =
+ "/manifests"
>  =C2=A0=C2=A0=C2=A0=C2=A0 mlprefix =3D d.getVar("MLPREFIX")
> +=C2=A0=C2=A0=C2=A0 if "-cross-canadian" in pn:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mlprefix =3D "nativesdk-"
>  =C2=A0=C2=A0=C2=A0=C2=A0 if mlprefix:
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sharedmanifests =3D sha=
redmanifests + "/" + mlprefix
>  =C2=A0=C2=A0=C2=A0=C2=A0 recipesysroot =3D d.getVar("RECIPE_SYSROOT")

Was this in a clean build? The change will need a clean TMPDIR to
properly take effect. I didn't force everyone to rebuild since the
issue is reported so rarely and has been present for a long time.

Cheers,

Richard



