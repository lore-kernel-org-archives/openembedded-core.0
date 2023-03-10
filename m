Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C3BC64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 02:37:26 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.10136.1678415836603819110
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 18:37:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=CUqgPJ5E;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id o12so14911539edb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 18:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678415835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pivYRE606Ojd3eD8L7InsSfKfUj8ry3K89FDEdIkIOo=;
        b=CUqgPJ5E2lRAK2n+JBkpv/vHEsRZg1hFI3oDlLcg0d9dN+UKitrUkb8CmBG1VuwOpI
         8uZQbJq61S424W1WTD3aRgzrdSY3Zk1vIbBAoPFDSWNQw2fucM9b40yUXQ77jkZESsBg
         iQF8BcRFH1Ox9bHjOtyKzrZEGAko3sHftwstR7XSX9mEX2iEIg5EWWlAdjrcuFkoVI2a
         t4cMR3H2l+r6gaQQ77xjh5uDOTfe93lKQ0Fsxp/umqDpGkCds1vNWoM4guzx72VBqwVC
         6uJfvTO48Vd/4FMZ+URKUNJskCxNqML57pt01BFTKLQQUjwxorBONbvXgVeK6gHrA84w
         K+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678415835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pivYRE606Ojd3eD8L7InsSfKfUj8ry3K89FDEdIkIOo=;
        b=gTsBrHDtlCodDae4QxgLIEw8BpNFnY17dlD9vEXZbVcvVIdgjgxRTFQgX1nl8ujeIa
         lDqQwme+8YG8eXSvKLpK8aDDTEEu2f9KhGNV/9/S/V2OuoHWfoP3p85UlzDze9atcEpm
         h9aBJTpiKXw4y5CVJj9NKFXjvBghzny4PcpjdOdavDhGYNuIcfUfL4evWYdbYDToyM7n
         QjS57FTAZYgCZ18OaXWft83Y15dxJ6llwWDJbhbgN64NBlWltO4uwx0Kc8b4sf+0IHsN
         VGUXWN5pfYkTnRzeRGlrmYXOmpHiXyYSgE3ehV35qzzp6GlggjPiqq2jtE0gBB0AdC9I
         54Zw==
X-Gm-Message-State: AO0yUKXgVaPb4+/sKmGRwPoFF5baNmoIefC+tEy048tcR6AKRlcQC/Jp
	uLYUVg/i1bUyat7rat8yqrbsMsPuhRmQC/Y8ikueEw==
X-Google-Smtp-Source: AK7set8UUkBSSeQ+ZWNnXWG7f2AoLsp4l/oYKuIIOLPo84GY6dig/yO9VbQQmI8eR3+L4q5nbYL8wQLFhVNu0GGpvfU=
X-Received: by 2002:a50:d08d:0:b0:4bf:5fd5:da3f with SMTP id
 v13-20020a50d08d000000b004bf5fd5da3fmr13348333edd.3.1678415834845; Thu, 09
 Mar 2023 18:37:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1678401759.git.steve@sakoman.com> <08cf44a8c2f524edf1ed353bbf38ef31d9e810e1.1678401759.git.steve@sakoman.com>
 <95c08f0a973b9adee2983ebfa51192f7b40a7806.camel@linuxfoundation.org>
In-Reply-To: <95c08f0a973b9adee2983ebfa51192f7b40a7806.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 9 Mar 2023 16:37:03 -1000
Message-ID: <CAOSpxdZePZNnkXzkF-1_PwEXBL01NXo-L8Q2w5FnzsszBEzgnA@mail.gmail.com>
Subject: Re: [OE-core][langdale 25/27] staging: Separate out different
 multiconfig manifests
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 02:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178303

On Thu, Mar 9, 2023 at 1:15=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-03-09 at 12:58 -1000, Steve Sakoman wrote:
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > """
> > require conf/multilib.conf
> > MACHINE =3D "qemuarm64"
> > MULTILIBS =3D "multilib:lib32"
> > DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7athf-neon"
> >
> > bitbake gcc-cross-canadian-arm
> > """
> >
> > and then inspecting the lib32* manifest files under recipe-sysroot-nati=
ve shows
> > them referencing lib32-recipe-sysroot instead of recipe-sysroot as used=
 by
> > gcc-cross-canadian recipes.
> >
> > To fix this separate out the manifest by multilib. It is caching mechan=
ism to
> > optimise disk usage so this doesn't break anything, just separated out =
some files.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > (cherry picked from commit 891d3faa3ed3d1cc231da58e5fa1325f05d5ade5)
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/classes-global/staging.bbclass | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/=
staging.bbclass
> > index 5a1f43de78..e6d0d1d55c 100644
> > --- a/meta/classes-global/staging.bbclass
> > +++ b/meta/classes-global/staging.bbclass
> > @@ -275,6 +275,9 @@ python extend_recipe_sysroot() {
> >      pn =3D d.getVar("PN")
> >      stagingdir =3D d.getVar("STAGING_DIR")
> >      sharedmanifests =3D d.getVar("COMPONENTS_DIR") + "/manifests"
> > +    mlprefix =3D d.getVar("MLPREFIX")
> > +    if mlprefix:
> > +        sharedmanifests =3D sharedmanifests + "/" + mlprefix
> >      recipesysroot =3D d.getVar("RECIPE_SYSROOT")
> >      recipesysrootnative =3D d.getVar("RECIPE_SYSROOT_NATIVE")
> >
>
> The "real" fix merged today so this should probably wait to go with
> that.

Thanks for reviewing, I'll hold this back for the next patch set.

Steve

