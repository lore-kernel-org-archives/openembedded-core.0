Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F113CC25B07
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 09:00:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.9520.1660035601307492195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 02:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IT2grGID;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 h125-20020a1c2183000000b003a5360f218fso305009wmh.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 02:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=ygT7dq8dv0DyArCCQrn2toIboK56Y171ZLLHfw73VbM=;
        b=IT2grGIDzJEskQZnwU6bxJdTzi/thTFj9S5eTkQVgPlbbrnWDRkg5YNeL57pa/h2JJ
         R/2yDxZRXP9VeVJMZyy4h+NWeGWsDEu66yCE3dffeXFcUzqL/cKonvJz6QDTbtGZ4VlE
         jxOLe5V2y2lA5SCdcSxGtMwTjWlzCoubiqN+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=ygT7dq8dv0DyArCCQrn2toIboK56Y171ZLLHfw73VbM=;
        b=bdqF2+1kP8vmYL9ea6NIBugEX8r8Gl2lGKLuljf9vcKXZyDSVlCzH4yVBw8Oa0vdaS
         hEbdaMT77reV5E6uREeHuukENqph/EbZyao00iO1YnXp44d0iMDNv9/R9FOoBytn/xa4
         0soQPt6zABHWWBTncGyNKM23u+ALOgmoDEieqlX0ZS/4S9Xe4+U5HjphHBFhbdOevAUv
         tqn7qGAmxdrHe7hatnJD1qODvH5ySMon69CqRg+hXLjEWmVxtCT0CGXaeFpY1/z1AO2E
         CYGeSj48GXvjKgJ7SqsZs/6YVRzAmSs0yK+v/DE4IhNoQmvBLJkFCFxr2Ne+OO3I+kZx
         hn8Q==
X-Gm-Message-State: ACgBeo20KbNY+/FZesDodhg5u6yegP+9wk5bu9xn38Ar9naMXyzljH39
	Ni5aYsR4GV7HknyPjy4lnTgkZg==
X-Google-Smtp-Source: 
 AA6agR4RjXB1iROShsmgaFFVTnkwS1iXhgolOsjXCm2EgPomNEtv7ISMOWQiFKXyC7Ss0Td7oe72fQ==
X-Received: by 2002:a05:600c:34c2:b0:3a3:62d3:de5 with SMTP id
 d2-20020a05600c34c200b003a362d30de5mr15408466wmq.29.1660035599618;
        Tue, 09 Aug 2022 01:59:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e4b1:e2c4:e19e:2222?
 ([2001:8b0:aba:5f3c:e4b1:e2c4:e19e:2222])
        by smtp.gmail.com with ESMTPSA id
 k30-20020a05600c1c9e00b003a38606385esm1484628wms.3.2022.08.09.01.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 01:59:58 -0700 (PDT)
Message-ID: 
 <42071e5296d8b1df2e55086df95296d1eccbe5bc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate: Don't abort if installing a sstate
 package fails
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alban.bedel@aerq.com, openembedded-core@lists.openembedded.org
Date: Tue, 09 Aug 2022 09:59:58 +0100
In-Reply-To: <20220809083527.1221635-1-alban.bedel@aerq.com>
References: <20220809083527.1221635-1-alban.bedel@aerq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 09:00:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169142

On Tue, 2022-08-09 at 10:35 +0200, Alban Bedel via
lists.openembedded.org wrote:
> Currently if the installation of a sstate package fails the whole
> build is aborted although bitbake could just fallback on running the
> real task.
>=20
> To fix this issue we replace the call to bb.fatal() in
> sstate_setscene() with a simple sys.exit() to pass the error to bitbake
> without aborting the build. The error message that was passed to
> bb.fatal() is just removed as all error path already contains a
> warning or note.
>=20
> Then to further improve the build resilience we add a try block around
> the sstate package unpacking. If it fails, for example because the
> package was corrupted, we now print a warning and optionally remove
> the broken package to allow it to be rebuilt. The cleaning of broken
> packages can be disabled be setting the SSTATE_CLEAN_BROKEN_PACKAGES
> variable to 0.
>=20
> Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
> ---
>  meta/classes/sstate.bbclass | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index de6e7fa9608a..069901483bb2 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -108,6 +108,9 @@ SSTATE_SIG_PASSPHRASE ?=3D ""
>  # Whether to verify the GnUPG signatures when extracting sstate archives
>  SSTATE_VERIFY_SIG ?=3D "0"
> =20
> +# Whether to remove broken sstate packages
> +SSTATE_CLEAN_BROKEN_PACKAGES ?=3D "1"
> +
>  SSTATE_HASHEQUIV_METHOD ?=3D "oe.sstatesig.OEOuthashBasic"
>  SSTATE_HASHEQUIV_METHOD[doc] =3D "The fully-qualified function used to c=
alculate \
>      the output hash for a task, which in turn is used to determine equiv=
alency. \
> @@ -375,9 +378,18 @@ def sstate_installpkg(ss, d):
>      sstateinst =3D d.getVar("SSTATE_INSTDIR")
>      d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
> =20
> -    for f in (d.getVar('SSTATEPREINSTFUNCS') or '').split() + ['sstate_u=
npack_package']:
> -        # All hooks should run in the SSTATE_INSTDIR
> -        bb.build.exec_func(f, d, (sstateinst,))
> +    try:
> +        for f in (d.getVar('SSTATEPREINSTFUNCS') or '').split() + ['ssta=
te_unpack_package']:
> +            # All hooks should run in the SSTATE_INSTDIR
> +            bb.build.exec_func(f, d, (sstateinst,))
> +    except bb.process.ExecutionError:
> +        bb.warn("Failed to install sstate package %s, skipping accelerat=
ion..." % sstatepkg)
> +        oe.path.remove(sstateinst)
> +        if bb.utils.to_boolean(d.getVar("SSTATE_CLEAN_BROKEN_PACKAGES"),=
 True):
> +            bb.warn("Removing broken sstate package %s" % sstatepkg)
> +            oe.path.remove(sstatepkg)
> +            oe.path.remove(sstatepkg + '.*')
> +        return False
> =20
>      return sstate_installpkgdir(ss, d)
> =20
> @@ -763,7 +775,7 @@ def sstate_setscene(d):
>      shared_state =3D sstate_state_fromvars(d)
>      accelerate =3D sstate_installpkg(shared_state, d)
>      if not accelerate:
> -        bb.fatal("No suitable staging package found")
> +        sys.exit(1)
> =20
>  python sstate_task_prefunc () {
>      shared_state =3D sstate_state_fromvars(d)

How are you corrupting sstate files? They're moved into place
atomically at the end of processing so this should be really hard to
do.

As such, I'm reluctant to take any patch like this as it simply
shouldn't happen, and if it does, there are bigger issues which need to
be fixed.

Cheers,

Richard



