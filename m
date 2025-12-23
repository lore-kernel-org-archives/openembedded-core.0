Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877AAE6F097
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 14:45:54 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.101880.1766501152858397986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 06:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dWETzltT;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34aa62f9e74so6631097a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 06:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766501152; x=1767105952; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NKEkLzjdcA98Uofi3niDb24x0tXcqFPAgHeLoCB65Y=;
        b=dWETzltT5Ie5fq9C3eivv4BHlyi4PQH0bfd3Wp0BsX7rlInFxJ9HmeVJDqH6pOgGMw
         JRimsbl8DfTANlQ3tKb+vDQ5BcqTAq5IbchLd/M5k56l/pvs1mLeRzLDL1exD42pzo+T
         YMvKpTJ8GOC1m3mMqLeSo81vLTlzjRrv0dIrucwX/5bCqRx0M6jSlzRRCnJMtlheIxzO
         ppe4uObv0rr56WR24Zzre74nc4rpwlPGBhvTtg2zTT5/gjBewmPlJY6EWcycW24+ecir
         Hq8jQzeGGEhF4neU/VEmbtMyjzx8QsbY6/U8Oy3CoZjHss4arjYp2e2I1Wen5RfIpvRZ
         +EAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766501152; x=1767105952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5NKEkLzjdcA98Uofi3niDb24x0tXcqFPAgHeLoCB65Y=;
        b=RR7o/OXWu4uHecIXYtsYseBXXOnZq/4o12a7PlbTB57HH3JUMeq2SkEnZV+VdtmSyR
         aYzNd/dSPkOXmFoaok9BDuAIjAh/xB/UPRpO++zNgytoTgTqnupixTIwUJl6qIAlKRl6
         Xpq4mFY3kYzuldOBu4XGzl8gpwdkjhDIfW+VpUhW3D3qCxOa/TIWfof/nHszE3QY4t3z
         SpYBBmFDXESZKog7t68KdZkkk4n8JUfnP7l18b0npDaMrSrNbqwDIgiUZ96uSwKhAhaD
         uhLSC29HKSv4ikEtp9NSEuvt9W2pUiiHUtQhRevoMKP9ZmXXAYwNyt5a0JvdS1mSiweb
         /q3g==
X-Gm-Message-State: AOJu0Yx8ZsxHJ/Dw0eLC8NVuG6eW1jGgMtzxxGR0ASKWUbbQ7Tl2Xpuz
	EMWO1uzKddtJX6f+XBQtPAVcOpsA9ZIiGA2wEsPc1470FLrNvOLRreZvAwGJ95P1avweEl2DgaN
	khe2WOJcanOyIlg6p6359UrNx1G4LJWA=
X-Gm-Gg: AY/fxX4OOMvDMXzYjiwbu6cHlf6lJ7zx7mAoA+ZAUUMaplGnq7UuIlOnHAf/mxuAlqt
	NPFT65id7Yfuxy3q57g/OPq6jsXU57TA5qfjJbiwUgc2JghvmnqgJRAdL1uMrsb+FvXJIWyi7gO
	qxIWnz6yMAkAbnkDm+TOM9XYMWQY9uJ3qShnpdY4AHhg1zxMniYAhcM9/NF5/LPFSEySQFzEwG8
	zU7AA7zFHurd7SQ/g2FM6j7aQAdNXPuGLokDOB5kxjphlyzYC2GyBYcJ42gFy/ByZb5Lg==
X-Google-Smtp-Source: AGHT+IH040qAK3sU36Lk2e3J5ZAuwwnXFxoot/Mg3MRI6o2i6Mdojw5DKe+nSdxPB/K23vo6lLddVlt58tVnhhhtin0=
X-Received: by 2002:a17:90b:2251:b0:340:c179:3657 with SMTP id
 98e67ed59e1d1-34e921eaecbmr12362459a91.33.1766501152135; Tue, 23 Dec 2025
 06:45:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1766087617.bruce.ashfield@gmail.com> <5044d0ec483159af764bfd2b51baf08e6410ec8e.camel@linuxfoundation.org>
 <CADkTA4OCyZUO5ASTEi+i7iyhYD9Zp8byzYOa+4UBLfGt2w+xnA@mail.gmail.com> <fe02c529dee3b548177d158746f2748eba74f071.camel@linuxfoundation.org>
In-Reply-To: <fe02c529dee3b548177d158746f2748eba74f071.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 Dec 2025 09:45:40 -0500
X-Gm-Features: AQt7F2oK-1WVyp78uPzT6bE2lM5twbHVK2qvmKedfZ0YPYJCg3jH4Nr5hyJcDXw
Message-ID: <CADkTA4MK5mqVb_O31kTOveLpm12Ez1-JpbJjofkW5Zt++R8tHA@mail.gmail.com>
Subject: Re: [PATCH 0/21] linux-yocto: combined and consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Jon Mason <Jon.Mason@arm.com>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 14:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228470

On Tue, Dec 23, 2025 at 8:45=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2025-12-22 at 22:34 -0500, Bruce Ashfield wrote:
> > On Mon, Dec 22, 2025 at 9:13=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Hi Bruce,
> > >
> > > On Thu, 2025-12-18 at 15:22 -0500, bruce.ashfield@gmail.com wrote:
> > > > As discussed in the weekly engineering call, I'm sending this as
> > > > single series even though it crossed boundaries of the repositories=
.
> > > >
> > > > I don't have access to meta-yocto-contrib yet, so I haven't pushed
> > > > the component parts to contrib branches yet, but will do that for
> > > > future pull requests.
> > > >
> > > > I'm using this as a first run through some things I've cooked up
> > > > to coordinate the patches across the repos. The formatting is my
> > > > own, so apologies if it isn't clear .. and we'll see if it all
> > > >
> > > > Now to the series for OE-core:
> > > >
> > > >  - We have stable updates to 6.12
> > > >  - A kern-tools fix
> > > >  - Updates to 6.17
> > > >  - Removal of 6.17
> > > >  - Introduction of 6.18
> > > >  - Bump to libc-headers to 6.18
> > > >
> > > > I've built and booted what I can locally, and I know that the
> > > > major architectures work, and are functional with respect to
> > > > core features.
> > > >
> > > > I have more libc-headers testing running against meta-oe and
> > > > muslc, so there may be some breakage there and I'll help deal
> > > > with that if it happens.
> > > >
> > > > The update and then removal of 6.17 is on purpose. In case any
> > > > one was using it, they should get the latest tested before it
> > > > starts to be removed.
> > > >
> > > > For meta-yocto:
> > > >
> > > >   - removal of any remaining 6.17 references
> > > >   - introduction of 6.18
> > > >
> > > > The meta-yocto default changes are obviously REALLY RFC/RFT
> > > > there will be issues, but I've provided them anyway to make it
> > > > clear that we are going to 6.18 as the new default for all the
> > > > variants.
> > > >
> > > > Once we get 6.18 fully green and the h/w references udpated,
> > > > I'll remove 6.12 and 6.16 from master. That isn't in this series
> > > > by design.
> > >
> > > I ran this through some testing and it isn't straight forward.
> > >
> >
> > Back online after a 10 hour drive!
> >
> > > We need a newer strace with the newer kernel so I queued that patch
> > > from Robert. That caused ptest failures so I disabled the failing bpf
> > > strace ptests.
> >
> > ok. I'll ignore strace and assume that bump will handle it.
> >
> > >
> > > ltp failed to compile so I backported a patch to fix that.
> > >
> >
> > ack'd
> >
> > > We still have a cryptodev-module failure:
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/292=
2
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/28=
97
> > > (all world builds I think)
> >
> > I can handle this one, it'll be.a day or so, but I also haven't checked
> > the  autoupdate list yet to see if this is in it. I'll check the lists =
before
> > I start and see if anyone else has an update in flight.
>
> I'd tried the srcrev change on master next and it worked. I've taked
> your patch, thanks!
>
> > > and an initramfs module space problem:
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/29=
31
> >
> > And a config warning (easy for me to fix).'
> >
> > For the space. Is it only genericarm64 that we do this test on ?  It
> > could either e normal kernel size increases, or it could be all the wor=
k
> > that has been done in genericarm64's config that has causes this.
> >
> > If it is normal kernel, then I can have a look for something obvious,
> > and then we can increase the size. If it is only genericarm64, then
> > we should get Mikko's opinion on what might be options we could
> > tweak to reduce the size.
>
> I don't want to break things too badly given it is the holidays but I
> do want to keep patches moving. I've therefore taken most of your
> series except the bits making the default 6.18.
>
> This gets us on the new point releases, bumps the CVE info, drops 6.17
> and adds 6.18 for testing along with switching to the 6.18 headers.
>
> I included the cryptodev-module tweak, the ltp fix, the strace fixes
> and a tweak to increase the initramfs size by 20MB.
>

Sounds good.

> The initramfs issue is genericarm64 specific and Mikko was in favour of
> increasing the initramfs size. I am a bit worried about the size issues
> there but that is a bigger issue to think about at a different time.
>
> This does leave genericarm64 kernel config warnings:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/2902
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2933

I see the patch for this from Mikko

>
> meta-arm failures:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/2786
>
> meta-virt failures:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/2761

And I've fixed this on master-next of meta-virt while I was doing
6.18, I just haven't had enough time to finish testing there. It'll be
pushed at some point before Jan 1st, so no concerns there.

Bruce

>
> as the issues we need to resolve before we change the default to 6.18.
> Hopefully a sensible compromise for the holidays! :)
>
> Cheers,
>
> Richard
>
>
>
>

--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

