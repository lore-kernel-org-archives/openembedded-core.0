Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341E2C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 11:18:43 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.90717.1722597506830665531
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 04:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VgvOT276;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7afd1aeac83so2498377a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 04:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722597506; x=1723202306; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmCA4YUlazgdNj54naOLqRIh2SYgJoW3S5V07KlhiG4=;
        b=VgvOT2766ZG9fwK6A0pLa8HZRIkLatRe418tDbqnQzHyB5WoIRInssi4Xd/Uy48r5k
         vDHQ2MClBcOTVUCRnGvHANqlM3q1GUZxuvatSNrPX8JIKDbnHZp7iAddw16trGgKRNPK
         oELA+6pxLfcTzmjixQ3vWn4r0hkW2httb8Dcrm8m7OOavcmOQfT+0XDCgm53gXoPUEw0
         GbbkmAe82OsvK2B7a2LPJK3evIBqhLK1/CMukhiR42UqcBYUtfWQaHGCPSFuI7t+o6EH
         s/U0tjtcOIF9CLxpXaQuDCqVrpaeNX9ngw6t8DbaQ6efyfIbSiCVsHcYpxKm2tEDx+6E
         +4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722597506; x=1723202306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmCA4YUlazgdNj54naOLqRIh2SYgJoW3S5V07KlhiG4=;
        b=Vd+Xd6CUFqfzjsqA2w5ILxvDXyGlvF1Qi4Dbd7UrZ2wkFc+eirOZYdNH5olVCApVJY
         R6gy8pT0g4xNMqEsNRc5TiaHSt4a+eOc2eAuDGOXq0Hf5j3FGt2K7L1uolfDzFRy3bZ8
         fVqJIGQ0sYODkJbftYRNzm3bbQRHV9yysEQY5zM6jzUALUY0Q7Pml4olkYn9pp+Isz4A
         BPa9rbODZYewr0ACV5C3mVdj7JKdl4DcmQ4F0k6JmiORKo/Uy8xiho+ePAumbuBi+L8+
         XPMWxf+TLTBpKRhHyMybDUMCMXjZVEB+ewvt0wL4WDj+XG+rajiPzmAaKrxJHMMB48Ng
         2J6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWo6pLdLnDUtwDHdus/grCy2B/ixZMKTGW1pDLtKG/vR6VKYHWzpTEGTGYIUT3nv0/lPTjIgh1SfxNWzcI43hIvD1Ipu/wKX0F3f+G73m4aJS4e1vMWL+CI
X-Gm-Message-State: AOJu0YxRs3yi9KELLF66h5q1uOC5wtxzAqRYiwYhcM2PQOaw6GVAw+ll
	JbMv3YsJ43sSI54/sk+yOEL5/c6+xXF+xh4PQHi7ETYlpUqnrZInpvGNS/ta9sfOxgnHD8eXov8
	oY//KMBDS8aN/cnH29cUYTxxn/hM=
X-Google-Smtp-Source: AGHT+IFvYkGpLbfBpr0wh3ShyGhvJ1Run89KZ3K1CDVpy35bYhb6YHldzoo4qCP+bHC1bJ/TBuOrS0PXe8veLNHCptg=
X-Received: by 2002:a17:90a:3e84:b0:2c3:34f4:5154 with SMTP id
 98e67ed59e1d1-2cff0904753mr7132173a91.1.1722597505836; Fri, 02 Aug 2024
 04:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1722524523.git.bruce.ashfield@gmail.com> <8e96d9f2ce3e7f2e35a69ec2d9bec9aa6ea0f2fd.camel@linuxfoundation.org>
In-Reply-To: <8e96d9f2ce3e7f2e35a69ec2d9bec9aa6ea0f2fd.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 2 Aug 2024 07:18:13 -0400
Message-ID: <CADkTA4OANNdbYw_Xh0628fP-UHmfUr9BKB5TWPhQ05s1nhVJtQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Scott Murray <scott.murray@konsulko.com>, 
	=?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <jsmoeller@linuxfoundation.org>, 
	Jon Mason <Jon.Mason@arm.com>, Ross Burton <ross.burton@arm.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 11:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202899

On Fri, Aug 2, 2024 at 5:02=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Bruce,
>
> On Thu, 2024-08-01 at 11:08 -0400, bruce.ashfield@gmail.com wrote:
> > Here's the next batch of kernel updates. Obviously the -stable
> > updates to 6.1 are routine, but the larger changes are the
> > introduction of the 6.10 kernel as a new / validated reference
> > version.
> >
> > Some notes:
> >
> >   - I've included the poky/poky-tiny preferred version bumps
> >     in this pull request for simplicity. Yes, I know they go
> >     to meta-yocto, but it is easier to make this available for
> >     AB testing when they are all together.
> >
> >   - I'm watching the status of 6.10, if for some reason it
> >     EOLs before we release, we'll jump to 6.11, which I have
> >     under test and will push as linux-yocto-dev shortly.
> >
> >   - There's one known build issue with 6.10, it is zfs in
> >     meta-oe. The upstream hasn't updated to support 6.10 yet,
> >     so I'm watching and waiting on that .. but there's no
> >     reason to hold this request for more testing on that.
> >
> >   - I've tested 6.10 for all architectures on core-image-minimal,
> >     core-image-sato and core-image-kernel-dev. I've also
> >     tested against musl and poky-altconfig (6.1 with the
> >     6.10 headers)
> >
> > There will surely be AB issues with this, but it is now
> > to the point where I need additional coverage and eyes
> > on the changes.
>
> Thanks for this, I put it through testing after tweaking it to remove a
> rouge inherit. There were some issues:
>
> a) genericarm64 version issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/166/builds/687
>
> Warnings since genericarm64 isn't available as 6.10. Everything else
> seemed to miss the preferred_version and build 6.6
>
> b) crypto-dev failures:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9329
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/9340
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9313
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/9161/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/5141/s=
teps/12/logs/stdio
> (the latter taking out the reproducibility build so that wasn't tested)
>
> c) meta-virt xen issues:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3455
>
> d) meta-agl kernel config fragment warnings:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/4556
>
> e) meta-arm kernel config fragment warnings:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/5810
>
> f) qemumips64 parselogs issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/9240/st=
eps/14/logs/stdio
> "failed when register_sysctl_sz sched_fair_sysctls to kernel"
> "failed when register_sysctl_sz sched_core_sysctls to kernel"
> "pci 0000:00:00.0: [Firmware Bug]: BAR 5: invalid; can't size"
> (and other BARs)
>
> g) qemumips parselogs issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/9256/st=
eps/15/logs/stdio
> Similar to qemumips64
>
> h) qemuarmv5 config fragment warning:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/160/builds/989
>
> I've copied agl/arm people.
>
> Probably nothing too surprising. I'll drop some of the patches whilst
> we resolve these but see if we can keep the headers upgrade and the
> point release bumps.

Sounds good, and yes, this is along the lines of what I expected. With
the AB in flux, I was staying away from using those resources before
sending.

I'll come back with a v2 early next week and will rebase to see what
you grabbed before sending.

It's a holiday weekend here, so I'd expect Wednesday next week
for a v2.

My -dev bump to 6.11 also based my smoke testing, so I'll have it
ready at the same time.

Bruce

>
> I'll try and test the crypto-dev upgrade on the list as that might help
> that issue.
>
> Cheers,
>
> Richard
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

