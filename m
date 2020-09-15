Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.3440.1600132458205586061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 18:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u80YXfGD;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id cy2so1010543qvb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 18:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zEfFZDUlAeNmsz5WvE9eynoag47C9L0nZvK0AqOUrvo=;
        b=u80YXfGDt/59kzzIwq0Yru7i8vVHoGIGdijpWiapXxmec1CgoAYsEDlVEhHzvsvpxc
         DVtvox92ubxBvCLIpxcv/mPfWQA+10aCdO9BLFSVwRkkSlVJP6t0tSt/HqQ4Z7Cewhvk
         b/FB9cyBows7BJAMjMsZfDEbCl4lSaH749JXEaSMV1LOP4GV/SvAzz/3jWCJd9PsynB4
         IJqWQRLcNxQIi3DVjB02fZnkC4RBF6cAeGq6Nuo2a83M75lB7apStuMBB/kJBZJv/QUr
         ixQF+h2Y5rD3CHITUnfdH9MofjhhGrOcnVzpyboSCPaBdquPf2+QSIY1woWXS5lJbSDD
         6HQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zEfFZDUlAeNmsz5WvE9eynoag47C9L0nZvK0AqOUrvo=;
        b=exB9ONjDGysPYjsL1KInoQVBp7U3ZN51yzZnQQdkezQ7CSnlwsama5ps6JEjldKst4
         8+YACDzoyeReRLA2lhfkt9VlVe+G9zIuCJ0uLP6fntpT66WgNrSwVyhD44TlGutgXOL1
         C5uiwvfLmDDQHynhR3vCb9UhtNt4qKT3dY7VT7UO4GCXOUDCM5pH064F1ZVwN6OFZ6jX
         Lh7yXjs2Nq4JFtZi2ZYOIluLw4JoDMXRw7kwR7iJngnf/WIu1x3f6qT6kCie3+jlDcOa
         M9EpAOdTqvFSgBF2HbL+RTJiy80ktmYfIh+vtQoY4j/O/z+rYOJ+WfevOLLSPmvbidJV
         tzZA==
X-Gm-Message-State: AOAM532y3recwCaBgNcBSUpsk7cZ01F1CMuoe4AWvcQQel4Q9nM8sZhD
	/Drt55zTYArY6ysOPxu9qjhD3ng3VADbVundXd0=
X-Google-Smtp-Source: ABdhPJy5DGHa4JhmPWnvcCHn9WyTVHkKqrIc1pUVAFrBKUa2aCOWy8r2qtiDYFHEqWS1KZ6TBWV7KdSelYfZRnDiI/g=
X-Received: by 2002:a0c:e383:: with SMTP id a3mr15769144qvl.125.1600132457171;
 Mon, 14 Sep 2020 18:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <08f090d6-65c6-da98-ac7f-a2bc803c805a@taitradio.com>
 <CAMKF1soFHoBkMBQTtp7YXjxgzy1uyQQS=CePsOrOf_9BWV5chA@mail.gmail.com> <2bc4eb24-82e0-2638-f204-1be9fa9c3aac@taitradio.com>
In-Reply-To: <2bc4eb24-82e0-2638-f204-1be9fa9c3aac@taitradio.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 14 Sep 2020 18:13:51 -0700
Message-ID: <CAMKF1sr=zQ8Wctqv7JyUh0YT_u-M7e=pJnFrnLKPjQ-eK7Ky_A@mail.gmail.com>
Subject: Re: [OE-core] nativesdk-linux-libc-headers with two different MACHINEs
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK please test this patch for full SDK builds and any other testing
you do and report back if it works in all cases.

On Mon, Sep 14, 2020 at 5:42 PM Douglas Royds
<douglas.royds@taitradio.com> wrote:
>
> Yes it did, thanks!
>
>
> On 15/09/20 12:31 pm, Khem Raj wrote:
>
> > I think MACHINE should not matter for nativesdk packages. Does
> > something like this work
> >
> > diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.b=
bclass
> > index 7f2692c51a..bb1dfd84c0 100644
> > --- a/meta/classes/nativesdk.bbclass
> > +++ b/meta/classes/nativesdk.bbclass
> > @@ -10,7 +10,7 @@ LIBCOVERRIDE =3D ":${NATIVESDKLIBC}"
> >   CLASSOVERRIDE =3D "class-nativesdk"
> >   MACHINEOVERRIDES =3D ""
> >   MACHINE_FEATURES =3D ""
> > -
> > +MACHINE =3D "${SDKMACHINE}"
> >   MULTILIBS =3D ""
> >
> >   # we need consistent staging dir whether or not multilib is enabled
> >
> > On Mon, Sep 14, 2020 at 5:13 PM Douglas via lists.openembedded.org
> > <douglas.royds=3Dtaitradio.com@lists.openembedded.org> wrote:
> >> For the experiment, I wanted to see whether I could achieve no task s=
ignature change when building nativesdk-glibc for two different MACHINEs, b=
ut I found that the do_install sigdata for nativesdk-linux-libc-headers cha=
nged. We're installing the linux-libc-headers for the build machine, so it =
seems to make sense to take control of the TARGET_CC_KERNEL_ARCH:
> >>
> >> diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.=
bbclass
> >> index 32c3aa32ad..655439dd73 100644
> >> --- a/meta/classes/nativesdk.bbclass
> >> +++ b/meta/classes/nativesdk.bbclass
> >> @@ -47,6 +47,7 @@ TARGET_VENDOR =3D "${SDK_VENDOR}"
> >>   TARGET_OS =3D "${SDK_OS}"
> >>   TARGET_PREFIX =3D "${SDK_PREFIX}"
> >>   TARGET_CC_ARCH =3D "${SDK_CC_ARCH}"
> >> +TARGET_CC_KERNEL_ARCH =3D "${SDK_CC_ARCH}"
> >>   TARGET_LD_ARCH =3D "${SDK_LD_ARCH}"
> >>
> >> Which leaves me with:
> >>
> >> basehash changed from 42ed3480096bb7ea53b60dc876da0613 to 38ea60bdac0=
41673f2c491d7bbabe17c
> >> Variable MACHINE value changed from 'qemuarm' to 'qemux86-64'
> >> runtaskdeps changed:
> >> linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:nati=
vesdk with hash cbb186fe33cd69cb0b06384e4d50a244
> >>   changed to
> >> linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:nati=
vesdk with hash 4d34d6981b79d0fccc768566bf2fa533
> >> Hash for dependent task linux-libc-headers/linux-libc-headers_4.18.bb=
.do_compile:virtual:nativesdk changed from cbb186fe33cd69cb0b06384e4d50a244=
 to 4d34d6981b79d0fccc768566bf2fa533
> >>
> >> The configure and compile tasks for linux-libc-headers are both set t=
o noexec. For the experiment, I added an empty do_configure task, with this=
 result on the do_configure sigdata:
> >>
> >> basehash changed from f13c2a2066fa48f0ccac35c085537c71 to bb13f2b1b1e=
7e6666376f3fb5a8ec888
> >> Variable MACHINE value changed from 'qemux86-64' to 'qemuarm'
> >>
> >> What to do? Why is the MACHINE variable included in the task signatur=
e (it is unset in run.do_configure)? Adding it to BB_HASHBASE_WHITELIST had=
 no effect. What am I missing here?
> >>
> >>=20
>
>
