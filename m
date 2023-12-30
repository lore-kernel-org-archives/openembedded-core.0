Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B96AC46CD2
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 19:58:57 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.191473.1703966329437943652
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 11:58:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xDKl6w1O;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5553f251e3cso2763481a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 11:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703966327; x=1704571127; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XKdYL/msvxZJWT0XzAZJLyt+7qBeqiJScr5pf5IV6E=;
        b=xDKl6w1OZ8a8aNh22YM1nx5PAVE5W3o+ypH1BDnOv9xkI+frxAd/ju86UOWJ3OTawC
         tBGUM6rFdOJmAeswB5Yf6SyuIzz5T2RxdpgOcvMkp75SlSSQdmw3IAcJnkpx9X5/tbyO
         u5HPzEsFA8yrmB0f5Fm+DIxZ1pgWbmC9PZkwUVfKU8pJT17Hs+hxLIMilJZfLEoElaB2
         eAme2DsqAV4kBHThza6Dd6DuPr5L8W5v7EqG6vASsxXMzTLCiJSlZsPWq/GllYRaFadj
         q9PAM/TSVn4bejMRhWyMiXkl2PGXk3EeI/anRHnqxLeHuMGe4dBJayBejyIHsWAV0KBh
         xhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703966327; x=1704571127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XKdYL/msvxZJWT0XzAZJLyt+7qBeqiJScr5pf5IV6E=;
        b=ruRyZBBsU+ulP+gsUjXYfmiq2cS0Ljocw6546LG5cQUxPHtD1YE14UJvDlMP7jM0Pu
         6LtXqUCEcW/mIt/D14b5u4DUDmLF+ShaNqupUNRpWR/rSDvM+JYvKZNpes9J1Uo/KQmR
         Moc6vj6j3RN5mX+4HtLUAOYMpjv0vUdy5eZ5MWcYEeoXC5DW7K/POwFSabsuzGfQnDK7
         htBZ6YoyYDisbWE6IJMlet+3vmko3nXfwaOSUZ71weLsPz+/ksidY6IL/7Qt4f/9MaB2
         6txyzsWo/2CfW9QqREYOT7qsnxu4xEeS0QrkGbwPCsckHCjNofOH4Bji3hQ3HdlO4PqM
         1J9g==
X-Gm-Message-State: AOJu0Yz+iRd32NWAFTEveSYrZ/gnjDaymhst8x12cEE+T77AgAMfPzMb
	GjQl4GhZUYj7tEQPMXcwrgj9W9dN0dGfQ/5I325LxZ4yjsgxNg==
X-Google-Smtp-Source: AGHT+IEaC2GeVTNZILJhmieesEwcfjhtapV6xXX+MdTGQr/hvju8ruktJvnwCuOUMPvC8QKQYxIQwihSeb6ZM8xV4fA=
X-Received: by 2002:a17:906:73c7:b0:a27:9a96:83c6 with SMTP id
 n7-20020a17090673c700b00a279a9683c6mr1226815ejl.44.1703966327441; Sat, 30 Dec
 2023 11:58:47 -0800 (PST)
MIME-Version: 1.0
References: <5325820d4f9ca342498422d2427207e7d31270e0.camel@linuxfoundation.org>
 <CAJdd5GaP-v8rVuWNakWpkuGNgoaUA+N1tW2BESOmA96fAxabeA@mail.gmail.com> <388ea27fd963ab72dd3506204848979ee0f80904.camel@linuxfoundation.org>
In-Reply-To: <388ea27fd963ab72dd3506204848979ee0f80904.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 30 Dec 2023 09:58:36 -1000
Message-ID: <CAOSpxdYdBh_jGfbwDYQmKF0P1dGV6G0Tt5ru6g717JS3GpZT3A@mail.gmail.com>
Subject: Re: [bitbake-devel] pthread_cancel bug on ubuntu2004/debian11
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joshua Watt <jpewhacker@gmail.com>, 
	bitbake-devel <bitbake-devel@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 19:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193083

On Sat, Dec 30, 2023 at 1:31=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-12-27 at 11:30 -0700, Joshua Watt wrote:
> > On Wed, Dec 27, 2023 at 4:28=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > I wanted to write down some thoughts on this which I have all the
> > > pieces handy.
> > >
> > > We saw a nightly layer check fail for meta-openembedded:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/17=
98/steps/21/logs/stdio
> > >
> > > INFO: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > INFO: ERROR: test_show_environment (common.CommonCheckLayer)
> > > INFO: ---------------------------------------------------------------=
-------
> > > INFO: Traceback (most recent call last):
> > >   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/script=
s/lib/checklayer/cases/common.py", line 48, in test_show_environment
> > >     check_command('Layer %s failed to show environment.' % self.tc.la=
yer['name'],
> > >   File "/home/pokybuild/yocto-worker/check-layer-nightly/build/script=
s/lib/checklayer/__init__.py", line 287, in check_command
> > >     raise RuntimeError(msg)
> > > RuntimeError: Layer meta-gnome failed to show environment.
> > > Command: bitbake -e
> > > Output:
> > > libgcc_s.so.1 must be installed for pthread_cancel to work
> > > Aborted (core dumped)
> > >
> > > which unsurprisingly is on ubuntn 20.04. We've also seen issues like
> > > this on Debian 11.
> > >
> > > I noticed:
> > >
> > > https://stackoverflow.com/questions/64797838/libgcc-s-so-1-must-be-in=
stalled-for-pthread-cancel-to-work
> > >
> > > and:
> > >
> > > https://bugs.ams1.psf.io/issue42888
> > >
> > > which led me to try:
> > > ubuntu2004-ty-1:~$ wget https://bugs.ams1.psf.io/file50112/pthread_ca=
ncel_bug.py
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > ubuntu2004-ty-1:~$ echo $?
> > > 0
> > > rpurdie@ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > libgcc_s.so.1 must be installed for pthread_cancel to work
> > > Aborted (core dumped)
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > libgcc_s.so.1 must be installed for pthread_cancel to work
> > > Aborted (core dumped)
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > libgcc_s.so.1 must be installed for pthread_cancel to work
> > > Aborted (core dumped)
> > >
> > > (1 in 4 success)
> > >
> > > Then adding to the script:
> > > import ctypes
> > > libgcc_s =3D ctypes.CDLL('libgcc_s.so.1')
> > >
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > ubuntu2004-ty-1:~$ python3 pthread_cancel_bug.py
> > > ubuntu2004-ty-1:~$ python3 --version
> > > Python 3.8.10
> > >
> > > I also tried this on debian 11:
> > >
> > > debian11-ty-1:~$ python3 pthread_cancel_bug.py
> > > libgcc_s.so.1 must be installed for pthread_cancel to work
> > > Aborted
> > >
> > > debian11-ty-1:~$ python3 --version
> > > Python 3.9.2
> > >
> > > where the above workaround using ctypes also seems to work.
> > >
> > > I'm therefore tempted for python 3.8/3.9 to preload libgcc_s as a
> > > workaround for this...
> >
> > Seems reasonable to me, as long as we can restrict it to a specific
> > version range of python and have a nice comment explaining why
>
> Patch tested, sent and I've applied it to older bitbake branches too in
> the hope that it helps some of Steve's autobuilder failures too.

I pulled the patch into my -nut branches when you posted it and have
been testing too -- all looks fine from my perspective.

Thanks for merging!

Steve

