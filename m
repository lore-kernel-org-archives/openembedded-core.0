Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0704710F2873
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 22:39:08 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.680.1774651138258249868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 15:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems.com.br header.s=os header.b=Mqgdgln+;
 spf=pass (domain: ossystems.com.br, ip: 209.85.216.46, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-359fea895b5so1987600a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 15:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1774651137; x=1775255937; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYK+GpazxX1WTsy1d9v66Drmtq51EPCfBqwI8bDbVOA=;
        b=Mqgdgln+fBK7QJPbw4033ocVxiV/VM2J2BD0utkbFX6oBxUnO6wyXEd7yFd+g3fIbl
         TqOqfw3vYVLEal41gpFw2DCveW81YHEvhYZVg1D2iIGFcc603UEPH3FhmCuqrmf3fOD/
         QoqPsctmI/Y4OVpv6sP6ELc+hXtmbbesz1pyid4e/TodBy8Ok+lVVXyoNCA59vpx3l1c
         88S2qtqy9/s8O7wrkDj6ZaSOOtkK6FBz59kCUjSCUdquK7iKIVHA3mHtpaDbL7mOI/KZ
         KTeD2Rd/G1UjE56sg+7XueO5qhoGSsERyQ+o2w7a3JRZniWdQ6AIyr9e9HJ4I5XRZNEf
         1OIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774651137; x=1775255937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYK+GpazxX1WTsy1d9v66Drmtq51EPCfBqwI8bDbVOA=;
        b=ASPTf4ESimw+V6sJCWMutVRZQv2YFS4lSa1rGP68i0hVmUcKiGvx3AQsLK38zhEo7Z
         2iQWZh9BgFq+Sjhw9rB2+ox7to1kbBLJQdoUf2/Qv7uwIMGfUn8FWPaxXIkEaNMybdvw
         FaIWwTmAWRiBD9BF9oarZ46RbisTfaNFC9/9jHdRI2eSjU591syBCoN2Vth0ky+wWK+g
         HPcb5x8GaFLnDlMV6szzmcmhCY2OmP7scqkMbp+BWrpo409iHTLjJ87z4+XzIOIaqjDt
         E/Ee/4AAhl76C4R6ICnVzXO2CjW6VJEyOmSDWX/bNALANtBasujK+Xwn2By8hzfCgPDe
         L5gA==
X-Forwarded-Encrypted: i=1; AJvYcCVTUdu1hGWdLcnXUghSG0gGA70CPzXBUecUrzw4icqdeApuS9ttcdOg0vzmY17FK8vEk2nRgH7n6C5yqAQTVVgvgA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRsxkFymNWbmxDi5+1LWYzPydR3tuFDekedfK1qEPIcS7Ehoep
	MyMucBk7IZpoO7ZLwJxwHX6DvIYH2Y5wDx4HAj+PUkpsbWsqJC5d+feyS+vHJbIOhcZhM957sL2
	OojuJQH0=
X-Gm-Gg: ATEYQzxUBwwa3MSksbpBbrkpmC1wb2KIMEufhN6fx8uKai9jsPMBnnxZ7h9+GypcA3A
	0BsczFLx0nPhSJrS4FhuVlanKvS+XQunuqnTI/uk8qbRDj+HjsIr965cR5PQIZnc2cP0L1zTZqp
	Se6SGIGiZrnHV/PtV1+fVxsgt1TIrYOgC+DQ2cvDzxgAqH16h2qKujrcapkUAjBBYjrRln5m1M9
	YPRpdHpsN9eabxddRp9oC5qxR+RGJajlUpkZ419FwLRUijPO9oJ+JgmJKOLTVM8p9EtJgp7TSML
	swL3lkT+da1IMKiL42STRjs1tOWMjYGNjyWXTHvVOukMAJ5yWvKJhueSVYsalcSEcfFJQ2yYNK+
	Rm96p4SMrHzgudmMafUgP3d09dY1UaDo2SjFDyKFDgiHrac64olYS8UO6hrCFjoESgxv35ykS2u
	K/VfZBImYDkuIMyFSDy3Nh4ZrbPNUba6+Evv/U9tJIdkj8kCNI9jFQZPR7m/pZQZDho+p7h9Iuz
	MQ=
X-Received: by 2002:a17:903:19e4:b0:2b2:42da:25c4 with SMTP id d9443c01a7336-2b242da2986mr3580365ad.14.1774651136840;
        Fri, 27 Mar 2026 15:38:56 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242766219sm3351005ad.53.2026.03.27.15.38.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 15:38:56 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-359fea895b5so1987576a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 15:38:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU0EFcLHyxDx23ePamP8uJXq81P2MN7AvqSXVTff1S5n6PI0QIPtwL8HUuOxFNDUc2jz05zcMFTU/dcSx/L0IQkVg==@lists.openembedded.org
X-Received: by 2002:a17:90b:1a8c:b0:359:f22:8879 with SMTP id
 98e67ed59e1d1-35c3005be93mr3912243a91.22.1774651135740; Fri, 27 Mar 2026
 15:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <18982E1417FE35B6.1454197@lists.openembedded.org>
 <189D6251D8E3EDE7.1508127@lists.openembedded.org> <DHCXIN4V1F1Q.1RY9TMY14L13Z@ti.com>
 <ac09456378ad61595fa49feec71180919c7e4384.camel@linuxfoundation.org>
In-Reply-To: <ac09456378ad61595fa49feec71180919c7e4384.camel@linuxfoundation.org>
Date: Fri, 27 Mar 2026 19:38:43 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqBUwtmzYLesb1X4s=LyGzzfAXfKOTDShW-XFc0aoDcRw@mail.gmail.com>
X-Gm-Features: AQROBzB1ajHkDkuoJjGifFOQ0KKN3P0h-2MS0arXV8sqyPA1KFcE4Hutm06kdRc
Message-ID: <CAP9ODKqBUwtmzYLesb1X4s=LyGzzfAXfKOTDShW-XFc0aoDcRw@mail.gmail.com>
Subject: Re: [oe-core][PATCHv16 0/6] Display manager proposal for x11 and wayland
To: richard.purdie@linuxfoundation.org
Cc: Randolph Sapp <rs@ti.com>, raj.khem@gmail.com, mathieu.dubois-briand@bootlin.com, 
	alex@linutronix.de, otavio@ossystems.com.br, kexin.hao@windriver.com, 
	paul@pbarker.dev, Ross Burton <ross.burton@arm.com>, afd@ti.com, detheridge@ti.com, 
	denis@denix.org, reatmon@ti.com, openembedded-core@lists.openembedded.org, 
	vijayp@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 22:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234106

Richard,

Em sex., 27 de mar. de 2026 =C3=A0s 14:09, Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> escreveu:
>
> On Thu, 2026-03-26 at 13:35 -0500, Randolph Sapp wrote:
> > On Mon Mar 16, 2026 at 12:25 PM CDT, Randolph Sapp via lists.openembedd=
ed.org wrote:
> > > On Fri Feb 27, 2026 at 12:31 PM CST, Randolph Sapp via lists.openembe=
dded.org wrote:
> > > > From: Randolph Sapp <rs@ti.com>
> > > >
> > > > No functional changes. Just bumping PR to help with automated
> > >
> > > Hey Paul, have you gotten a chance to review this series yet? I've be=
en told you may have some comments.
> > >
> > > Randolph
> >
> > Has anyone gotten a chance to review this yet?
>
> Paul and Ross have some thoughts but we're basically still drowning in
> the backlog of patch review. We're all frustrated about that. This one
> is more Ross' area of expertise than mine so I'm waiting on that.I'm
> replying since I do feel bad we've not got to this yet.
>
> I wish it were different, I'm doing what I can with various patches but
> I'm also behind on review for several.
>
> The challenge with this patchset is it is a fairly invasive change, it
> does inject a go dependency into a core part of our graphics stack and
> as such, I think we're all quite nervous about it. It has taken a lot
> of back and forth to pass the autobuilder's tests and that in itself is
> a bit of a worry.

I understand the concern =E2=80=94 this is an invasive change and caution i=
s
warranted for something that touches such a core part of the graphics
stack.

That said, I think it's worth recognizing that Randolph has been
exceptionally persistent and responsive throughout this process. We're
at v16 now, and every issue that has come up =E2=80=94 from cgo
reproducibility to busybox-init support to autobuilder failures =E2=80=94 h=
as
been addressed. That level of commitment to getting it right speaks
well for the long-term maintainability of this work.

Regarding the Go dependency: Go support in OE-Core has a long history
at this point and is well-maintained. I don't think introducing it as
a dependency in the graphics stack is as risky as it might seem at
first glance =E2=80=94 we're not pulling in something experimental.

The problems this series solves are real. The race conditions with
weston-init and DRM device registration, the scripting sprawl around
xserver-nodm-init =E2=80=94 these are pain points that affect downstream
users. emptty offers a clean, unified solution for both X11 and
Wayland sessions.

In my opinion, this patchset should go in.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854

