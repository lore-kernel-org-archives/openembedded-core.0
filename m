Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49EEC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 10:16:45 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.11981.1739355400994857335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 02:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C7coAnQp;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e45af17a2eso851556d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 02:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739355400; x=1739960200; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNte5CHobNgcMwOYQ9Fqve69/x72x5TK1iILHN6OJok=;
        b=C7coAnQpACCYjskVJ0xnm6JXBuXHpbxEj+Uakt+12ZmnZpfKYTzbYDK7lmNHbkgOUr
         EsyK7EQQY2zyJOuvqy8WqDam14Y1tgXqqPxFBNGhDLCS1Z4d6fhZ4Y/SsTrp80hZ4a2W
         18L6OkciMCzP9dJnCxS5Je0TH41rnvpmJOxfYhBJfzwuP/a8uxljPHMKl9HHbpIvtoKv
         idcujVs+pEDzK//EH0L37jKibiy0e0YGhwsRyfjgHaWeYFIjWvjS+HNt1Gchdo5O2uft
         uCcZbDZK7iG/QWSK2SKoQJw/6gENjhWJdESwOq1jH9/ThGddV9DEzAPo3dB+ii+v1cbb
         vYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739355400; x=1739960200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNte5CHobNgcMwOYQ9Fqve69/x72x5TK1iILHN6OJok=;
        b=Ufn+PtHlyFeAkKjGtmltXluXZ8I4zl8foaRkwrGKFComGZzlPZeZW29CVOx2uzexrj
         Pou2GfFebUjfh1hWpKftDinPK+LmTAPETHaWPaOANFNY6YbyJb0YztOJtlV+quUoZqhH
         UZsI1b8Fbbu4HCtBrPDlMgh8DK8QKzJxig8n3MBDhY0oI4pyrgSNzEAhOsnOhBCrpqBU
         QNw6ebEvU1s8Y6pwBXRv9zBKnA0rB8aQfPPfTZ8Vn0fAt045knUhUSeo5JBUfyOQeTiy
         uBLEnuOGxIP+AfiBHvWmoBD0FlIugqgOlxhDqoqW8Pn9FUNMJ4IV9pO/oIYU7UD4fZZ4
         F1ig==
X-Forwarded-Encrypted: i=1; AJvYcCX7jq0EkHuv1isSV+RVfh5xNogsth8lO5E18src5Mbq+vCoL/lnlkXe1ZgSvmaXr2ggHuQH99LjLjYrM+JWuyeIIg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxnQNP6gW0OgvVNHQACK4P+0ls04xstEPfg4B9AAlbyerARrC8u
	JRwyefoQsSIT9zsnpAhNfIYqhrD4bqqv1NklUiXl8auUEK+l/HeV/MJpnq84vv0qUpC6BPKLsxz
	cQxHIR45G9t24pGeuj/MPG5GjPTs=
X-Gm-Gg: ASbGncteixPX+k7LK9bCBbRDeRTrHHK/bHyUS6ebmX4QmZ7UXLvXKAimPrp1qfElwmD
	AiFqUBs//VlrlmWO+Zg16yFFYPtpznL/8iotLnrY/kfqx3sccVws8VmSrGXf0ljDbdLAkbojZhY
	aEaYKAeJhevBxP1YEvEVyAyweBtOudUgE=
X-Google-Smtp-Source: AGHT+IHS26hgNEiQIAu1bzsAZS1wMiEyZHLsnGQnW716HeJYJOa7lCUudN16VQRN55+i1qgSXFpW+Rqr/gcjMEKiasI=
X-Received: by 2002:a05:6214:c2e:b0:6d8:821d:736e with SMTP id
 6a1803df08f44-6e46edad5e0mr52510476d6.36.1739355399997; Wed, 12 Feb 2025
 02:16:39 -0800 (PST)
MIME-Version: 1.0
References: <20250206144907.1924993-1-oobitots@cisco.com> <E631A283-5721-4E5C-A65B-5A8CC986A600@arm.com>
 <PH0PR11MB4902635E1BEC8DB84E6D6C88D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8rSuhpT6eoWA5eudSkKZFkqcfcSWgL6YogcX1f1qjLFQ@mail.gmail.com>
 <PH0PR11MB49027CBF82294C3F722688C0D7F22@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj_BoKLY1dgiAW72Tuc+EF6BFCSfKozN2X8ibdCGqbgifw@mail.gmail.com>
 <DB5PR02MB102130601D165773C901753C1EFF22@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <PH0PR11MB4902EB32CF27A37CD32A2938D7FD2@PH0PR11MB4902.namprd11.prod.outlook.com>
 <CANNYZj8kdZ1Stvu-OqakXhShp4easJXsYbaW0hg=T-ALGQj6zA@mail.gmail.com> <SA2PR11MB49064A61A32F35C2E519AA36D7FC2@SA2PR11MB4906.namprd11.prod.outlook.com>
In-Reply-To: <SA2PR11MB49064A61A32F35C2E519AA36D7FC2@SA2PR11MB4906.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Feb 2025 11:16:26 +0100
X-Gm-Features: AWEUYZnnM_XB7gXhLNUnf1duqYfP1IkitzW0hc1HG7-PtywDjqLD2N7niHWps2M
Message-ID: <CANNYZj8khhZ0EEeJ7W=epDWNKC6tTHPfd7Xk__G1M6T=ij6oOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separate subpackage
To: "Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)" <oobitots@cisco.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Ruslan Bilovol (rbilovol)" <rbilovol@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 10:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211220

But systemctl does depend on libsystemd-shared, so a copy of that will
still be in every component. And libsystemd-shared itself pulls in a
lot of stuff, and those libraries no doubt depend on further
libraries:

    linux-vdso.so.1 (0x00007ffe9e9d0000)
    libacl.so.1 =3D> /lib/x86_64-linux-gnu/libacl.so.1 (0x00007fbc40540000)
    libblkid.so.1 =3D> /lib/x86_64-linux-gnu/libblkid.so.1 (0x00007fbc404e9=
000)
    libcap.so.2 =3D> /lib/x86_64-linux-gnu/libcap.so.2 (0x00007fbc404dd000)
    libcrypt.so.2 =3D> not found
    libmount.so.1 =3D> /lib/x86_64-linux-gnu/libmount.so.1 (0x00007fbc4047a=
000)
    libpam.so.0 =3D> /lib/x86_64-linux-gnu/libpam.so.0 (0x00007fbc40466000)
    libseccomp.so.2 =3D> /lib/x86_64-linux-gnu/libseccomp.so.2
(0x00007fbc40446000)
    libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x00007fbc3ff21000)
    libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x00007fbc3fd40000)
    /lib64/ld-linux-x86-64.so.2 (0x00007fbc40557000)
    libselinux.so.1 =3D> /lib/x86_64-linux-gnu/libselinux.so.1
(0x00007fbc40418000)
    libaudit.so.1 =3D> /lib/x86_64-linux-gnu/libaudit.so.1 (0x00007fbc403e5=
000)
    libpcre2-8.so.0 =3D> /lib/x86_64-linux-gnu/libpcre2-8.so.0
(0x00007fbc3fca6000)
    libcap-ng.so.0 =3D> /lib/x86_64-linux-gnu/libcap-ng.so.0 (0x00007fbc403=
dd000)

Put it another way, what is the difference in a 'component' before and
after this change, in size and amount of files?

I'm just struggling to justify this; it looks like a very niche need,
driven by a custom, proprietary mechanism to install additional
software into products. The change won't be useful to anyone else,
while complicating systemd packaging further.

Alex

On Wed, 12 Feb 2025 at 08:56, Oleksiy Obitotskyy -X (oobitots -
GLOBALLOGIC INC at Cisco) <oobitots@cisco.com> wrote:
>
> Component deliver something and it's content consist of:
>
> binaries/libraries/scripts, etc. that delivered by this component (servic=
e) itself
> binaries/libraries, etc. on which component depends on
>
> Technically content is per component subdirectory. Every component has it=
s own isolated content.
>
> If we have N components each require only systemd-systemctl it mean every=
 component will store (on disk) whole systemd/libsystemd package files inst=
ead of systemctl binary.
>
> Regards,
> Oleksiy
>
> ________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Tuesday, February 11, 2025 19:31
> To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots=
@cisco.com>
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Ross Burton <Ross.B=
urton@arm.com>; openembedded-core@lists.openembedded.org <openembedded-core=
@lists.openembedded.org>; Ruslan Bilovol (rbilovol) <rbilovol@cisco.com>
> Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separat=
e subpackage
>
> This still doesn=E2=80=99t make sense. Any target file is contained in on=
e and only one package. Where is the duplication?
>
> Alex
>
> On Tue 11. Feb 2025 at 19.04, Oleksiy Obitotskyy -X (oobitots - GLOBALLOG=
IC INC at Cisco) <oobitots@cisco.com> wrote:
>
> I'm sorry, I confused you mentioned term sysroot. It's not about yocto - =
we just use the same term because it's very similar
> to how it works into yocto.
> We got packages as a result of  yocto build and use these artefacts (pack=
ages) on next stage to populate
> software components content. For some reason we can't use the same approa=
ch with hardlink to deduplicate
> components content.
>
> Regards,
> Oleksiy
>
> ________________________________
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Sent: Monday, February 10, 2025 22:05
> To: alex.kanavin@gmail.com <alex.kanavin@gmail.com>; Oleksiy Obitotskyy -=
X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@cisco.com>
> Cc: Ross Burton <Ross.Burton@arm.com>; openembedded-core@lists.openembedd=
ed.org <openembedded-core@lists.openembedded.org>; Ruslan Bilovol (rbilovol=
) <rbilovol@cisco.com>
> Subject: RE: [OE-core] [PATCH] systemd: move systemctl utility to separat=
e subpackage
>
> Additionally, changing the packaging does not affect what is added to
> the sysroot.
>
> //Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Alexander Kanavin via
> > lists.openembedded.org
> > Sent: den 10 februari 2025 18:20
> > To: oobitots@cisco.com
> > Cc: Ross Burton <Ross.Burton@arm.com>; openembedded-
> > core@lists.openembedded.org; Ruslan Bilovol (rbilovol)
> > <rbilovol@cisco.com>
> > Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to separ=
ate
> > subpackage
> >
> > They're not actually copied. They're hard-linked from
> > sysroots-components/. This is a cheap operation and it doesn't waste
> > disk space.
> >
> > Alex
> >
> > On Mon, 10 Feb 2025 at 18:05, Oleksiy Obitotskyy via
> > lists.openembedded.org <oobitots=3Dcisco.com@lists.openembedded.org>
> > wrote:
> > >
> > > Hi Alexander,
> > >
> > > By 'deploying whole systemd' I mean next:
> > >
> > > Every component copy and installs packages with libraries, utilities =
and
> > config files in component local sysroot, i.e. directory used to create
> > final component image:
> > >
> > > libsystemd0_255.4
> > > libsystemd-shared_255.4
> > > systemd_255.4
> > >
> > > So, on disk we have duplication of files for every component that dep=
end
> > on the systemctl.
> > > In case of separate subpackage we have one root component depend on t=
he
> > systemd and all other components will contain only systemd-systemctl
> > package content.
> > >
> > > Of course, I understand it's quite a specific scenario.
> > >
> > > Regards,
> > > Oleksiy
> > >
> > > ________________________________
> > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > Sent: Monday, February 10, 2025 13:03
> > > To: Oleksiy Obitotskyy -X (oobitots - GLOBALLOGIC INC at Cisco)
> > <oobitots@cisco.com>
> > > Cc: Ross Burton <Ross.Burton@arm.com>; openembedded-
> > core@lists.openembedded.org <openembedded-core@lists.openembedded.org>;
> > Ruslan Bilovol (rbilovol) <rbilovol@cisco.com>
> > > Subject: Re: [OE-core] [PATCH] systemd: move systemctl utility to
> > separate subpackage
> > >
> > > On Mon, 10 Feb 2025 at 13:01, Oleksiy Obitotskyy via
> > > lists.openembedded.org <oobitots=3Dcisco.com@lists.openembedded.org>
> > > wrote:
> > > > We have next situation:
> > > > - a lot of software components that depend on packages and deploy a=
ll
> > packages they depend on locally inside component.
> > > > - some components directly depend on systemctl only (e.g. this bina=
ry
> > used in scripts), so for every component we have to deploy whole system=
d
> > locally.
> > > > - finally, all/some of those components will be merged in some way =
and
> > will use systemd/libsystemd, but until then it will be nice to get rid =
of
> > such duplication.
> > >
> > > I'm sorry, but this does not quite make sense. You need to more
> > > specifically describe what 'deploying whole systemd' means, and why i=
s
> > > that problematic.
> > >
> > > Alex
> > >
> > >
> > >

