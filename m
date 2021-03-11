Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.1305.1615432602992732842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 19:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=OU3GjXiZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f176.google.com with SMTP id t4so19340749qkp.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 19:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N1oEBgCWOw/VJhxKaTinccXEBWNn7YNAafilChmwbLs=;
        b=OU3GjXiZuZPigdbros6JjGRHkAMtZPKzXBFE54nogSyQrHzeVa964P2/N3YL7ZCcQT
         spgATC/x1Rm6gF7/jvnhl4c4f2zl0aiYnTa1KEKOpCi1DFv6mAbygdnZEifoXKaLcDVJ
         8L8OZ9b0kMd4gJOxJtZrzKlDSQQRHFr3bisZsmm3S+qtTKR8ksxryni+QVE9EdFqjSXG
         9qjbQb8A/myhjDR1BYjUo4FnVUyMlCLvSAiB+syzJvB/oXi1nyPigkYCiHua1pZjfmAb
         ogLg4IXawJFno1dWBQeX9vM1SWwTHaLK/zhfG+1uvHqtgpUsoNBEKFCvitEpeajgE8MF
         nSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N1oEBgCWOw/VJhxKaTinccXEBWNn7YNAafilChmwbLs=;
        b=AVrBVt5xFg+QhBOk1r8wzBeTdHAD5qEhef+BlZ6+ZJS54Uy+QTADfKDHp6UvtPIJDr
         aJeiVsFY3ARbfwt7Iy1f+ZM+W/rSohP1MB0+2MLrEwU+QWgGnMw/QiCuNEjk6846aTs8
         oRt2NVH6Gh6ygmq2DBpEVGQvGVNhqen0Ke9AfRzHlX2gbJvSCuTy/E+Iupjrh9DKfXE0
         8bSnZwlO7AjfLwPLYGvJBbQ1i8IyfSEw29SbM+rvjyqtcAQhR7ltHshOwSSdR3nAJvCT
         2WWo4QJ0z+wOBxFltpFacSGrc2xUaRAjE9KIP6JOQkzPJ3mrMEFIN7TgjxLf+Sg5P5nY
         mQ2Q==
X-Gm-Message-State: AOAM5304S6edkPm/PuawKWpA+nof3SysCZCJXCtW8+iteK1NbWk35q+K
	S7LbF07xZCMmLOiTG84d24WNQX0PcmxYNQFsQL6Vjw==
X-Google-Smtp-Source: ABdhPJwkNBpWntRmuuoDhbeJqs3Ah8xZ3YyWdDsNiCINQfrkXx0VrT4+BpWhZzF1Kg43DMgqJj3d977b35uTF3Mdvb8=
X-Received: by 2002:a37:8606:: with SMTP id i6mr5739604qkd.130.1615432602088;
 Wed, 10 Mar 2021 19:16:42 -0800 (PST)
MIME-Version: 1.0
References: <20210310230433.29983-1-jdmason@kudzu.us> <20210310230433.29983-2-jdmason@kudzu.us>
 <CAJ86T=VPLEr=u5O=D1bo6du0nBw3fOnN5O1i_tja0hoJxca-sg@mail.gmail.com>
In-Reply-To: <CAJ86T=VPLEr=u5O=D1bo6du0nBw3fOnN5O1i_tja0hoJxca-sg@mail.gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Wed, 10 Mar 2021 22:16:31 -0500
Message-ID: <CAPoiz9xVGGS6S5LpjO3OX-Zg9A56u6NJAq=oRbFYVmN4hBSZ=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] core-image-sato: qemuarmv5 doesn't work with >256M RAM
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 6:30 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, Mar 10, 2021 at 3:04 PM Jon Mason <jdmason@kudzu.us> wrote:
> >
> > Currently seeing the following error when running runqemu on qemuarmv5:
> > runqemu - ERROR - Failed to run qemu: qemu-system-arm: versatilepb: memory size must not exceed 256MB
> >
> > This is due to the memory size being set to 512 instead of the max
> > allowable of 256.  Limit to this and everything is happy.
> >
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > Change-Id: I3339e50a53464b95f52a987ed37868ebf0935b07
> > ---
> >  meta/recipes-sato/images/core-image-sato.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
> > index e50b24a47691..8ed8f75e9f92 100644
> > --- a/meta/recipes-sato/images/core-image-sato.bb
> > +++ b/meta/recipes-sato/images/core-image-sato.bb
> > @@ -14,3 +14,4 @@ TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool nativesd
> >
> >  QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
> >  QB_MEM_qemumips = "-m 256"
> > +QB_MEM_qemuarmv5 = "-m 256"
>
> Grepping for QB_MEM suggests there are other images which need the
> same fix. Maybe good to fix all of them at once rather than one at a
> time.

I do not know if other machines have this same issue with qemu, and
this is probably not the best way to resolve this (as I really think
this should be part of the machine config file, and have runqemu be
smarter logic about setting the memory size).  I can open a bug in
bugzilla and get back to it later.

>
> > 2.20.1
> >
> >
> > 
> >
