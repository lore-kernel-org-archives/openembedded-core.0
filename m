Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE03C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 12:12:30 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.27678.1657541536789176713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 05:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ewDxLhKo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 d13-20020a05600c34cd00b003a2dc1cf0b4so2896093wmq.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 05:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=vMjAyCIT9alBHUseDaGl5NOJ5OjmNWQHwZkhfKTT+KA=;
        b=ewDxLhKoM2eMMKw7VQRZNqxEMZVRNEX7AuFaNmwlfx9KFN3+mZ2/jsehvHMpA5Huil
         LwoOoM38XFESS57HnrAknS+o93XkWA5U2qKut3EY0FXJEayWpSIonkK/RDATgOS9YVEt
         GCC/hoMCdmPyJa3k1U0GrlF8SOUvlhaf77axw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=vMjAyCIT9alBHUseDaGl5NOJ5OjmNWQHwZkhfKTT+KA=;
        b=eGXFl/xMNctWKrngEbVhL+spZldTjD+0I4m428/T3PbHYp8Jn0dseXXc4wXa/VEDM/
         cYKDNmU0Q6rep2nhSim1RdTdHwOZzlAi7988JdQk2RIvS/UJmTpKyBV7iikiGkCffLcl
         brwJQTCne67K9jNfPDClnissn1iFXhlAO4Bs2k4Gblc9QOTSTv8dLOKrHbJ+vn7IVAI5
         0UBBQN6x3dnbhYQVtUhT0tCPxg3pqQ7AthrzbOtEV55hRc5wyGFSBjG+tSnAIGFzQlMz
         aE1V8zJaExqvli6WQ0zlff067RblhsKBt9nQ5awPDihKqSnxybPkgTR4RDmptCmC2w/E
         wa8A==
X-Gm-Message-State: AJIora9IiTqCjD1q8O6KMQRjTOKVZrUo4WhLwRiFEP4Q+IdNdzcIbLkL
	HxFZwk9myJF/f/kQy2Cn/FG5Yg==
X-Google-Smtp-Source: 
 AGRyM1seNYYqWLhOXNYik+8z5Nh51f+Xl7PjrLsO4MNQ9dSUSe/t5fL+wy/vv7BMhD9uuUDCh+FtvA==
X-Received: by 2002:a05:600c:22da:b0:3a0:4e7b:4237 with SMTP id
 26-20020a05600c22da00b003a04e7b4237mr15185762wmg.101.1657541535073;
        Mon, 11 Jul 2022 05:12:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f9ee:ac79:b0a:1aa9?
 ([2001:8b0:aba:5f3c:f9ee:ac79:b0a:1aa9])
        by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c3b0800b003a2ead2c884sm222678wms.13.2022.07.11.05.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 05:12:13 -0700 (PDT)
Message-ID: 
 <72eca448989f313fa322e19a59751d46ef7babc7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package.bbclass: Fix base directory for
 debugsource files when using externalsrc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>,
	openembedded-core@lists.openembedded.org, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Date: Mon, 11 Jul 2022 13:12:12 +0100
In-Reply-To: <20220701020939.62295-1-alhe@linux.microsoft.com>
References: <20220701020939.62295-1-alhe@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 12:12:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167866

On Thu, 2022-06-30 at 20:09 -0600, Alejandro Hernandez Samaniego wrote:
> While executing do_package, bitbake checks for a list of
> debug source files and uses a pattern to match the ones
> to be included in copydebugsources.
>=20
> Previously when externalsrc was in use either directly or by
> using devtool, the source location changed and this pattern
> no longer matched, hence debug source files failed to be
> included in the corresponding package.
>=20
> Check when the source directory isnt the default (based on
> WORKDIR), and change the pattern used to match debug source
> files if that is the case, allowing us to perform do_package
> properly.
>=20
> Workaround debugsource.list containing paths from the host by
> moving debug source files away from the host directory
> structure  to avoid host contamination (this seems to happen
> when packages use $TMPDIR/work-shared and externalsrc is
> in use).
>=20
> Test matrix included using:
> - devtool to use externalsrc automatically
> - externalsrc with a non-devtool based source directory
> - No externalsrc at all
> Tested the following packages to be working:
> - glibc ($TMPDIR/work-shared based)
> - libxcrypt ($TMPDIR/work based)
>=20
> [YOCTO 8015]
>=20
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsof=
t.com>
> ---
>  meta/classes/package.bbclass | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 62050a18b8..4850134022 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -553,13 +553,25 @@ def copydebugsources(debugsrcdir, sources, d):
>          strip =3D d.getVar("STRIP")
>          objcopy =3D d.getVar("OBJCOPY")
>          workdir =3D d.getVar("WORKDIR")
> +        sdir =3D d.getVar("S")
> +        sparentdir =3D os.path.dirname(os.path.dirname(sdir))
> +        sbasedir =3D os.path.basename(os.path.dirname(sdir)) + "/" + os.=
path.basename(sdir)
>          workparentdir =3D os.path.dirname(os.path.dirname(workdir))
>          workbasedir =3D os.path.basename(os.path.dirname(workdir)) + "/"=
 + os.path.basename(workdir)
> =20
> +        # If S isnt based on WORKDIR we can infer our sources are locate=
d elsewhere,
> +        # e.g. using externalsrc; use S as base for our dirs
> +        if workdir in sdir:
> +            basedir =3D workbasedir
> +            parentdir =3D workparentdir
> +        else:
> +            basedir =3D sbasedir
> +            parentdir =3D sparentdir
> +
>          # If build path exists in sourcefile, it means toolchain did not=
 use
>          # -fdebug-prefix-map to compile
>          if checkbuildpath(sourcefile, d):
> -            localsrc_prefix =3D workparentdir + "/"
> +            localsrc_prefix =3D parentdir + "/"
>          else:
>              localsrc_prefix =3D "/usr/src/debug/"
> =20
> @@ -581,7 +593,7 @@ def copydebugsources(debugsrcdir, sources, d):
>          processdebugsrc +=3D "sed 's#%s##g' | "
>          processdebugsrc +=3D "(cd '%s' ; cpio -pd0mlL --no-preserve-owne=
r '%s%s' 2>/dev/null)"
> =20
> -        cmd =3D processdebugsrc % (sourcefile, workbasedir, localsrc_pre=
fix, workparentdir, dvar, debugsrcdir)
> +        cmd =3D processdebugsrc % (sourcefile, basedir, localsrc_prefix,=
 parentdir, dvar, debugsrcdir)
>          try:
>              subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubproce=
ss.STDOUT)
>          except subprocess.CalledProcessError:
> @@ -591,9 +603,22 @@ def copydebugsources(debugsrcdir, sources, d):
>          # cpio seems to have a bug with -lL together and symbolic links =
are just copied, not dereferenced.
>          # Work around this by manually finding and copying any symbolic =
links that made it through.
>          cmd =3D "find %s%s -type l -print0 -delete | sed s#%s%s/##g | (c=
d '%s' ; cpio -pd0mL --no-preserve-owner '%s%s')" % \
> -                (dvar, debugsrcdir, dvar, debugsrcdir, workparentdir, dv=
ar, debugsrcdir)
> +                (dvar, debugsrcdir, dvar, debugsrcdir, parentdir, dvar, =
debugsrcdir)
>          subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.S=
TDOUT)
> =20
> +
> +        # debugsources.list may be polluted from the host if we used ext=
ernalsrc,
> +        # cpio uses copy-pass and may have just created a directory stru=
cture
> +        # matching the one from the host, if thats the case move those f=
iles to
> +        # debugsrcdir to avoid host contamination.
> +        # Empty dir structure will be deleted in the next step.
> +
> +        # Same check as above for externalsrc
> +        if workdir not in sdir:
> +            if os.path.exists(dvar + debugsrcdir + sdir):
> +                cmd =3D "mv %s%s%s/* %s%s" % (dvar, debugsrcdir, sdir, d=
var,debugsrcdir)
> +                subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubp=
rocess.STDOUT)
> +
>          # The copy by cpio may have resulted in some empty directories! =
 Remove these
>          cmd =3D "find %s%s -empty -type d -delete" % (dvar, debugsrcdir)
>          subprocess.check_output(cmd, shell=3DTrue, stderr=3Dsubprocess.S=
TDOUT)

This has merged but unfortunately it introduces some kind of
regression. If you build a kernel after this is applied, the kernel
source in /usr/src/ for debug information is no longer present.

This is why I was seeing build failures for the buildpaths QA test
addition whilst Bruce was not since I didn't have this applied in that
particular build.

We need to find out what broke here and how to fix it.

Clearly we need some better QA tests as well to detect this.

Cheers,

Richard


