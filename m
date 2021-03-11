Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.5772.1615468096258600540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 05:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=UPSI4A5o;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id n79so20453775qke.3
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 05:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HxnHIz8vBi6hE+VFTgWlI14NI960PO9PosDQALn+6Iw=;
        b=UPSI4A5olSBCJIgBec8Pphk7gXzCmm2yC/wJsh3A+egPm93e53P/GUaCZjbeXVoE4J
         pdhBBo4T8tLZ5azoSxGjyPfnCs4ZB1fHWbZ0uw22C7BunsDUZzY3D3O06E8q3eVPNWUI
         vGLA55KfBo1kK52+3PmoF1snG7ZE3X5H3FT/tfaN1fxx3Eo6EqiXpxcheCE7GF3uMB9Y
         vi+IS+DHPfo41VSrZg1tKrMLqEQNTCqRTngu69tSvdtosatgFf4gjfzFXbYXJQ8hiD2s
         ucOnGWH/0TYP5+Ui4hxRIEBv2AzmAKYYrL1eiXDsB2wJvULMb6AQXfp67fg0wzNEqaVr
         DRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HxnHIz8vBi6hE+VFTgWlI14NI960PO9PosDQALn+6Iw=;
        b=FnOmr36gFI5sQtWS33ZKw7wMNhNbp7tNyes85xFu5fGqvJ73u92C4ObxRndAlnZzyp
         kT9VnTH5R/3umoSU/YDMgfIZasMDlNxBpPwg26rsyGbfhT+HCIsSA6IpCIhq20od6Lrs
         ZxwMpGeDoOUPAsBMb2kzGqLn7mz2qHVi/8ndQWaCx9C/SoSRuRJ5MT6d1qNEDPckNyDx
         nM9Gc2i/Y84igY3Qa95+uVnQLiXAypfwApwSlHIYLarIJ9U3xeI0U4K9zSwCgQ/C87wz
         BzXZ91nT1hVR9en+oPCS18ieRwIGTTMvG3ebXcb/ZVDv6tA+Lf6SVHBeO63T1rERKDiq
         Zrkg==
X-Gm-Message-State: AOAM532sEdZH669icth6iOt9M1EHhYxl6S2U8AV3beLad1eyjIokeKeB
	3qZ4BpWbbU04wVZY2GVmTuOEGxW586SjmBiecX3AjQ==
X-Google-Smtp-Source: ABdhPJwEF5qUdmkoMcPn0RTxwnalweIsC8EevXiMIMueU0hPcYLIwUTf+XEEPdRcLPjC2GlqGt9BYUk2GW0tin8xI28=
X-Received: by 2002:a05:620a:135a:: with SMTP id c26mr7236096qkl.110.1615468095438;
 Thu, 11 Mar 2021 05:08:15 -0800 (PST)
MIME-Version: 1.0
References: <20210310230433.29983-1-jdmason@kudzu.us> <20210310230433.29983-2-jdmason@kudzu.us>
 <CAJ86T=VPLEr=u5O=D1bo6du0nBw3fOnN5O1i_tja0hoJxca-sg@mail.gmail.com>
 <CAPoiz9xVGGS6S5LpjO3OX-Zg9A56u6NJAq=oRbFYVmN4hBSZ=g@mail.gmail.com> <622f75d8-819f-5c6d-ef56-5c7780f1cccf@gmail.com>
In-Reply-To: <622f75d8-819f-5c6d-ef56-5c7780f1cccf@gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Thu, 11 Mar 2021 08:08:04 -0500
Message-ID: <CAPoiz9zanA6HHSCDSDUvkcR99kMi6ag6_QGGy5pdWD_=dh6Sxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] core-image-sato: qemuarmv5 doesn't work with >256M RAM
To: Khem Raj <raj.khem@gmail.com>
Cc: Andre McCurdy <armccurdy@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 10:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 3/10/21 7:16 PM, Jon Mason wrote:
> > On Wed, Mar 10, 2021 at 6:30 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >>
> >> On Wed, Mar 10, 2021 at 3:04 PM Jon Mason <jdmason@kudzu.us> wrote:
> >>>
> >>> Currently seeing the following error when running runqemu on qemuarmv5:
> >>> runqemu - ERROR - Failed to run qemu: qemu-system-arm: versatilepb: memory size must not exceed 256MB
> >>>
> >>> This is due to the memory size being set to 512 instead of the max
> >>> allowable of 256.  Limit to this and everything is happy.
> >>>
> >>> Signed-off-by: Jon Mason <jon.mason@arm.com>
> >>> Change-Id: I3339e50a53464b95f52a987ed37868ebf0935b07
> >>> ---
> >>>   meta/recipes-sato/images/core-image-sato.bb | 1 +
> >>>   1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
> >>> index e50b24a47691..8ed8f75e9f92 100644
> >>> --- a/meta/recipes-sato/images/core-image-sato.bb
> >>> +++ b/meta/recipes-sato/images/core-image-sato.bb
> >>> @@ -14,3 +14,4 @@ TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool nativesd
> >>>
> >>>   QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
> >>>   QB_MEM_qemumips = "-m 256"
> >>> +QB_MEM_qemuarmv5 = "-m 256"
> >>
> >> Grepping for QB_MEM suggests there are other images which need the
> >> same fix. Maybe good to fix all of them at once rather than one at a
> >> time.
> >
> > I do not know if other machines have this same issue with qemu, and
> > this is probably not the best way to resolve this (as I really think
> > this should be part of the machine config file, and have runqemu be
> > smarter logic about setting the memory size).  I can open a bug in
> > bugzilla and get back to it later.
>
> perhaps we should define MAX_MEMORY to define this limit for every
> emulated machine and present a diagnostic if QB_MEM exceded MAX value

I'm making an assumption that QB_MEM is the max.  If we simply added
sanity checks to the places where it is overridden, there would be no
problems.  It shouldn't be too hard to do, but based on other comments
I think it's best to abandon this series and simply remove qemuarmv5.


>
> >
> >>
> >>> 2.20.1
> >>>
> >>>
> >>>
> >>>
> >>>
> >>>
> >>> 
> >>>
