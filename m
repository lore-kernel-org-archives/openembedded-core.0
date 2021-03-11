Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.1776.1615435852133161522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 20:10:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eiRsW47A;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id f26so377343ljp.8
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 20:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K/ROuHikARWHN9nx+0wYKxWJIyCin9dIXLtabJBrMHM=;
        b=eiRsW47AOgh/OrwjxKJGGMur3NpEZ0tAR58dX46Avq8/HZsywgKA0oFl9OVNw+XCOZ
         UhnxhZM2yDTtJesZTpn1Yplj1x5yx9GUo6cLJN2vYvE8takupTxMrl6EHeKnclHEjc6O
         9KVy6Y9JSsd873o5jMJrr6uKfCc/dFLT6SOTk5XtC0ouxGkYssEPc6V0qqRPiTNFwE1Q
         C7if9LFmq0xhHBVWKdUrUzDo0Rsd7G9VTmRj2l6RUJ5kNs6HMt31GbfdTY7T/jXS0M5P
         djD5L9O7dFryHK4Xhka3NObK50JLp2FL0knECcPv6ULd8wFaNHq8LJwIEuo71tM0WNF8
         h/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K/ROuHikARWHN9nx+0wYKxWJIyCin9dIXLtabJBrMHM=;
        b=KdojfeIjBkvM/WrP5J91VtaSUjAaE+wXYu/taZjjdrHb9dsvtxJdTjTspUba+vrgzZ
         QGSOcztd3NzOHa0o1p6HRSsmTpY2Tdr/WXcby4dPSgZjudT6bwR8zW9V7jpUtz7FMp80
         qBbEUqjsj/fpKf6UGmf0zGTqBW0NjKMX6RDAx+Gh0dNL7TK+w3QPIrPjjOCHh5or4lkE
         FTJI0NW5z/Q+1fpgYhpx7DdqVNJyt1rduyJaVV1/g5lCte9azvq75pL1mScyUetPOM/8
         Vzz+P8fUj42CCudNESvsHohm+raTL7H+Qr/IUrwbEDcGTleTcVbCeY1W1+NG5CyEL653
         lUSg==
X-Gm-Message-State: AOAM53096BH/9CwuLES+CXZWCkv7aq/VY0hW59MCtwn8z/eREk+2ghqV
	NF//nUUgQqc2rs1Oq5HWxKRoiz0obsvlpf8zY1E=
X-Google-Smtp-Source: ABdhPJwlehBHipCv9MyH7SSv1Rp7XSArLziXbBhYDLrDJnIGH84jVm+E7X2D/pKnoZMMmVb/UDsRpoXDE8kEL9kv86Y=
X-Received: by 2002:a05:651c:387:: with SMTP id e7mr3749508ljp.425.1615435850098;
 Wed, 10 Mar 2021 20:10:50 -0800 (PST)
MIME-Version: 1.0
References: <20210310230433.29983-1-jdmason@kudzu.us> <20210310230433.29983-2-jdmason@kudzu.us>
 <CAJ86T=VPLEr=u5O=D1bo6du0nBw3fOnN5O1i_tja0hoJxca-sg@mail.gmail.com> <CAPoiz9xVGGS6S5LpjO3OX-Zg9A56u6NJAq=oRbFYVmN4hBSZ=g@mail.gmail.com>
In-Reply-To: <CAPoiz9xVGGS6S5LpjO3OX-Zg9A56u6NJAq=oRbFYVmN4hBSZ=g@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 10 Mar 2021 20:10:39 -0800
Message-ID: <CAJ86T=XUJNfRZHS0-9kxEvv4+0BB42FaqFoDD6RwBEuPUVijag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] core-image-sato: qemuarmv5 doesn't work with >256M RAM
To: Jon Mason <jdmason@kudzu.us>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 7:16 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Wed, Mar 10, 2021 at 6:30 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Wed, Mar 10, 2021 at 3:04 PM Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > Currently seeing the following error when running runqemu on qemuarmv5:
> > > runqemu - ERROR - Failed to run qemu: qemu-system-arm: versatilepb: memory size must not exceed 256MB
> > >
> > > This is due to the memory size being set to 512 instead of the max
> > > allowable of 256.  Limit to this and everything is happy.
> > >
> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > Change-Id: I3339e50a53464b95f52a987ed37868ebf0935b07
> > > ---
> > >  meta/recipes-sato/images/core-image-sato.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
> > > index e50b24a47691..8ed8f75e9f92 100644
> > > --- a/meta/recipes-sato/images/core-image-sato.bb
> > > +++ b/meta/recipes-sato/images/core-image-sato.bb
> > > @@ -14,3 +14,4 @@ TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool nativesd
> > >
> > >  QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
> > >  QB_MEM_qemumips = "-m 256"
> > > +QB_MEM_qemuarmv5 = "-m 256"
> >
> > Grepping for QB_MEM suggests there are other images which need the
> > same fix. Maybe good to fix all of them at once rather than one at a
> > time.
>
> I do not know if other machines have this same issue with qemu

It's not related to other machines. There are other images which set
QB_MEM to "-m 512" based on the opengl distro feature. If
qemu-system-arm versatilepb can only support 256MB then these images
need to force QB_MEM to 256MB in the same way that you have done for
core-image-sato.

Cleaning up QB_MEM and how the qemu machine configs may more cleanly
control it is a separate issue.

>, and
> this is probably not the best way to resolve this (as I really think
> this should be part of the machine config file, and have runqemu be
> smarter logic about setting the memory size).  I can open a bug in
> bugzilla and get back to it later.
>
> >
> > > 2.20.1
> > >
> > >
> > > 
> > >
