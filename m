Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.3200.1607991150605865305
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 16:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jWxjkD3u;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id u16so8712421qvl.7
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 16:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=M/oCBweVx7YREQhuO0jT7I+Uu59Jr0ZTKKyFkDNCFMI=;
        b=jWxjkD3u2MVhS0E+MisDHx1BBDqMhjKcQpJCnUWq40ZmFhSLF/yrH/5kiKBgg7ICvu
         co/x7ZjvCXbl45KACd4FcHvgqvovJeikYJA8qZ5C1nGtDf7Ch9RVR8NKKg6HlCoZOazH
         V2/u3CC2cpP35wYjIpyyjlZ8VrjB3aVCZexmmP8ukz3bRuwTBqLcEgnetWVxQBKil4Dr
         PW6BacFfj9uoA7fDrUz8RVhjpQhQWYbD7o38q36p9yMu8ygOHcL8baJGClETsFAmDb/P
         EKBTeg9ESbhAoOcWNr/3bttQGPjswpuJIVCGe3mVLXtucUPE1Op7mA8jwD6zWOf59RSc
         J+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=M/oCBweVx7YREQhuO0jT7I+Uu59Jr0ZTKKyFkDNCFMI=;
        b=uSw1lBHHvYCn2rqpP3q9cagxqqcxVDFpWEE78kGlDKnGemFu1YPdA1PbDOJ94J5Ndi
         XH5ko4EB7jNegiscHL/kJBjusLsXaOth81IIFiCFeXxHOMxEFES/G47CEYF6z+dBlzw4
         1V6aBvECq+o5I8myWO+eXVOqm52FyZnu44NAMy1gtQO8rcIQuX9uvCIJRcQYE7wPArom
         ENV0kO22MvHoxa5QbpJf6TiLBClGFHuS4yx+wizfczoJGMkb/fvOdCniLFSGnoKUCcXe
         v4/H5gDfH+XfGF6t4FnsHyYCCEgmz202+yoayeZ/34N+NG4zBxV6qTaQT4CtP3EYePnh
         tEnQ==
X-Gm-Message-State: AOAM532h6V3Um2EkdIfHAGWS1ClY4tw2sHameqIaF6QifNnEdANaZmvp
	VLt7OBfu3cTtmVaElS7PiadREZmFUdfjvyikSqI=
X-Google-Smtp-Source: ABdhPJx2/EZdx7pL3+92xAzCb8IQOZi3bLcfRkIDJVUrdQBuCmd7seYFUjOoLuy7IC4PlCwhYMb2QyM55VuxUmLTmUc=
X-Received: by 2002:a05:6214:14af:: with SMTP id bo15mr23400932qvb.19.1607991149494;
 Mon, 14 Dec 2020 16:12:29 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKpXfVcDjtMwUvSRi68+-BHnK9nF6B-5wFX7nzW2wi2adQ@mail.gmail.com>
 <20201214225851.yqscuyms4pwihtfy@apollo.localdomain> <CAP9ODKqt6mQeckiFPhTrO8b1kZvbPOWE-S27pQp5PNj09EOviQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqt6mQeckiFPhTrO8b1kZvbPOWE-S27pQp5PNj09EOviQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 14 Dec 2020 16:12:02 -0800
Message-ID: <CAMKF1srVeApTW9Ym7-qrmTpSyttY8BG7LofAhMTBX02M4EG_dg@mail.gmail.com>
Subject: Re: [OE-core] Strange segfault on native Go binaries
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 3:50 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Em seg., 14 de dez. de 2020 =C3=A0s 19:59, Khem Raj <raj.khem@gmail.com> =
escreveu:
> > On Sat, Dec 12, 2020 at 08:52:34PM -0300, Otavio Salvador wrote:
> > > Hello all,
> > >
> > > I am trying to debug a strange issue on native Go binaries. We're
> > > seeing it on 'glide' for example.
> > >
> > > If I build 'glide-native' and I go to its tmp/work/.../image/bin/glid=
e
> > > it works just fine. For example, running it we see the expected error
> > > as I am running inside a clean environment without any extra tools:
> > >
> > > otavio@yocto-env ~/.../build %
> > > ./tmp/work/x86_64-linux/glide-native/0.13.3-r0/build/bin/glide
> > > [ERROR] Error getting version: exec: "go": executable file not found =
in $PATH.
> > >
> > > Now, if we run it from the sysroot-native, it segfaults:
> > >
> > > otavio@yocto-env ~/.../build %
> > > ./tmp/work/cortexa9hf-neon-oel-linux-gnueabi/updatehub/1.1.1-r0/recip=
e-sysroot-native/usr/bin/glide
> > > [1]    26085 segmentation fault (core dumped)
> > >
> > > And this segfault is also happening inside the build. I ran the
> > > readelf on them and it seems to have been modified to use the
> > > uninative libc loader but I am in doubt how if this is the culprit.
> > > Can someone shed any light on this?
> > >
> >
> > It looks like a known regression in 1.15.5
> >
> > There was a linker regression which crept into go compiler in 1.15.5
> > which was immediately patched and we also backported that to OE-core
> > however, recently we have switched to using go-binary-native to
> > bootstrap the toolchain which means the bug was still not plugged in th=
e
> > native version even though we patched our go versions, we cant help the
> > prebuilts.
> >
> > Luckily we now have .6 release which came out last week, which means we
> > can upgrade to it and that should take care of the segfault, I have
> > improvised on the patch which was sent for upgrades and sent a v2 [1]
> >
> > Please try it out and let me know.
> >
> > [1] https://lists.openembedded.org/g/openembedded-core/topic/patch_v2_g=
o_update_1_15_5/78964072?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,=
78964072
>
> I tried it but it did not solve the problem. The behavior is the same
> for this specific issue. The cgo issue documented was indeed fixed but
> the relocation one is still happening :(

The issue seems to be in stripped glide binary in sysroot but normal
unstripped binary is ok. So the issue is indeed orthogonal. I am
looking into what changes during strip
step here

>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
