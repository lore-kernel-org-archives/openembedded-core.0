Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5CEC433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 17:11:11 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web09.193.1664557867046298877
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:11:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k0Bij6US;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id
 z9-20020a4a4909000000b0047651b95fbdso2639813ooa.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=4lp1j1tqWfPVMyVJDWxwf9xJfrZUQ13YQXprlqNFlyw=;
        b=k0Bij6USvhB9s2dFFweKQ/4H3Wf0n2RHwCyZWPDp+ouskmcEXqJChspJyWNnvAZgVN
         0Cp/UCQpXIgvNJvdZafTrNI7bBIq6xHlf4T1hFzL36ah732IV69fUBskLWcyfZL809wR
         xkVJy94vm1rPJwEZi6hVLkSjZvBzlo6nFJGilkzBtQTnuF+f4pQZaqY599lKNnP1kbeL
         jAQGjRRSXp+qhgl6M5oR4DuL8wC3eRGLkaY9s6lPhP6ndsi+L26Cbr+HfCXbZnhiiAGi
         ve2kRzS6s58mMA1SJd9B/jffq9l/lgull+Oy0zccLg/yhVel81ll5ipQ/kLD6gDXjnVT
         FTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4lp1j1tqWfPVMyVJDWxwf9xJfrZUQ13YQXprlqNFlyw=;
        b=xuZGEOoWjgfCajBs6pBvzo/hJC6x8qb9pRf4QNKpp5fMw2YQqUqfWPTOdU5ca+O3ko
         CEw8gdQR77Eu6+hDp8EgxRwv/AmrHcHxJ/Mv/JZCyOtsccT14REOUMmlYCtAO43+w3A6
         bFptOS2pjda+Zz45P+ombuVXDTgpU0Oo2XL3QMH7MGC0B8YmvQtfvz8ZR+WAziarWjtd
         kS5GcdIRQMLEk/s35FTeJAzHRqrp3eQlN4gtUXxZ3DjMmJp7gLc0PTlWI9kiBxQYf+nh
         rXUPPC3Slh+JGD/Lb4G0+hojHICRzvOkcoACvIKUQ5ZnPGFuanmIvQRZAa6k0U22eQSK
         BHNQ==
X-Gm-Message-State: ACrzQf1KxUW5eFxlpkm1HxnyAwnXxiIkkLxMHiKBDfuu9URcY7ulFFeH
	/jfrJzhu1/jJxGWvxT/SpVV4jt/9phnZP1bGj1MlAHRnHeN1Gw==
X-Google-Smtp-Source: 
 AMsMyM7NEQCkqvzD8aPrvzyVqNif6VUExN3ZD41Pi3PeKLl5e9ZEeAL/UlOyGKsHhR0+0m622swXyfPlkTdwNPZRnT8=
X-Received: by 2002:a05:6830:2019:b0:65b:f320:8cd2 with SMTP id
 e25-20020a056830201900b0065bf3208cd2mr3928013otp.111.1664557866249; Fri, 30
 Sep 2022 10:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220930041614.2704304-1-raj.khem@gmail.com>
 <C9A0CBAD-5373-4F4C-BB73-0AD10A2DF000@arm.com>
 <042F0314-BF16-49A5-AD68-81DFD17739E6@arm.com>
 <CAMKF1srZEorOx-hPiD1zZx1DMiJdZbHgknub04hfyfRFzEhNcg@mail.gmail.com>
 <EA0EFA99-9A83-4699-9D0D-AD5279C58B81@arm.com>
 <CAMKF1sqwQcT-vpk5Ycydd8BCk3OCmPP-zCKZ-MwRr0G+XPHHNA@mail.gmail.com>
 <01558808-3100-4CFA-98DB-244F487435D4@arm.com>
 <CAMKF1sp=ujH14XbTybycQkJWaL93OMfm0dS6FvM_XR+K71EQaw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp=ujH14XbTybycQkJWaL93OMfm0dS6FvM_XR+K71EQaw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Sep 2022 10:10:40 -0700
Message-ID: 
 <CAMKF1sp1oqMEXLvXPJhquoFjuDrhc-rtEN5-b05b_FVtYo9w=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 17:11:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171231

On Fri, Sep 30, 2022 at 10:08 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Sep 30, 2022 at 10:01 AM Ross Burton <Ross.Burton@arm.com> wrote:
> >
> >
> > > On 30 Sep 2022, at 17:42, Khem Raj <raj.khem@gmail.com> wrote:
> > > > Good point I will check in think it worked fine with glibc but not =
with musl based images I see that Perl-modules is fully empty in packages-s=
plit area so soMething does not add up
> > >
> > > It will be empty as it=E2=80=99s a metapackage, but it should have lo=
ts of rrecommends.
> > >
> > > Right that was the point the folder should not have been empty it sho=
uld have had those rdepends control files
> >
> >
> > My perl-modules pkgdata built with musl:
> >
> > RRECOMMENDS:perl-modules: perl-module-cpan perl-module-unicore perl-mod=
ule-b perl-module-compress-raw-bzip2 perl-module-compress-raw-zlib perl-mod=
ule-cwd perl-module-data-dumper perl-module-devel-peek perl-module-digest-m=
d5 perl-module-digest-sha perl-module-encode-byte perl-module-encode-cn [=
=E2=80=A6]
> >
> > Can you retest?  Unless you=E2=80=99re running in a no-recommends build=
 I can=E2=80=99t see how this can be.
> >
> > Arguably, perl-modules should depends on the packages, otherwise it tot=
ally breaks in no-recommends environments.  If you install perl-modules you=
 want the entire library, not just a fraction of it.
>
> are you building with opkg ?

and here is my list of bad recommendations

BAD_RECOMMENDATIONS +=3D "eudev-hwdb udev-hwdb libmodule-build-perl"

>
> >
> > Ross

