Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D732C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 19:33:41 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4884.1783625619840535507
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 12:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aIk5xMuI;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c953950dfso605141fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 12:33:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783625618; cv=none;
        d=google.com; s=arc-20260327;
        b=Xgfu1kyLNB1ZoggtADuG4Y8Biv+24th+YDJ459bDOd6dtVTEXEfEi6GvW93DeTIU6S
         cOaXiD9jfxslb82gil61B7ZRGmaLVaccShYJlvxEi+y8fJUobh6zHQnnZ1uYjY2Q+C+T
         q/NKym9wOM+hZRwLB2z0Ujda3mq4O0+vthLLMOaMCuwJUlgNiXOSU5l5Ju5kzzXv0Qqv
         i/D36TkmTK41wJ9HaiVwRXnkP3fetixHyZzE8GOm8LJukUAgUafWsAUnVCpM5V4MNhZl
         uCzN4i9j1ZkZ2q6gTlZiLVUM7hOLrgw/ItA9qVRMW43YG563nSorF/ds9wNgd0hwJoXN
         7qIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=joh09yYIFqjbCFBj49t6qHLPFNuQr6IjnN/3WejwQyc=;
        fh=9km6isHd+JFCfPC9JYrJ8dr6VPuPxqDlDOUoacP0SE8=;
        b=iJ7qmizpWaYsuMt8Y8RQinaDqOKx6lowkG1MJV9vHAotoxxSpjueIM/rXukvTSZypQ
         luT0hCrmpdsrLyj/UBK/yp8oKNK4SHaDqI7tlhS0bCW7byWZStvSTRIWjI4FO4CAHRy9
         ou4FVRBaFsdjLJh46zyEMFwk7NV2/k/ZhrKWfk+cTC1v/lTOoHsGBVwvVK8B+KBhwlGg
         T9jtMUpIU2hCYof86fQZi7u2gXBWEeZxqstGnjuLFD6e8VZpfGbhhLrUz7EBYQw4f7ci
         S6nqtT44/Pq0kvVTb2hhvWRz1EmDCRXD15Epji5nnek7X/0A6jjSFeRmC7sH3i+7et1D
         gEMA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625618; x=1784230418; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=joh09yYIFqjbCFBj49t6qHLPFNuQr6IjnN/3WejwQyc=;
        b=aIk5xMuIwyKr59EFdxHpEb+ZJUOSUztVTJgUr8iDA+kDZeohJH0xpQHL1fGiaj6Efv
         kHiaiUEsvGQP1SJxJ1e5qMo4+bPjATD3/hQXKK9k9k3/GhkfVQAw6g7xeeU/RZAqC6vv
         8WbT/grHwge2NGXfh45RVJzT9WEcsJRafMjai6mKxg+RyGd22QQlsBbC0VnzmzHnR2fr
         LBRLBbdHkbmm3WQXCIimointrEvLbohNk6ZrO3MfZfzbqKnyMLzLZYMxQZJMlZQREz/Q
         +2ghsxBKxLe2AsQkGLNqCTk0qN5Db4xducA+RPHuLhVO1wUyVvUXnXeEzIPBm3BlMgUv
         dtbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625618; x=1784230418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joh09yYIFqjbCFBj49t6qHLPFNuQr6IjnN/3WejwQyc=;
        b=eINMkyqWyebvPdGy6jKuhBmomYbJfd7MCCDbudHeuo8RQlAJfGVLPIxWuP15wV6C5l
         n6yKfGk+nQjqtUoOnijhMcvHNuckv/IFmXYIsDNa/KQUD4BLnlyXdGu9thSV6/tL2WyG
         bMfyXtunTtGZqPPBJLwL80kUVP21hM6EFQnAJGqtwPqNE7vStDENo0+NU9oXtO2DIljV
         JgRgF6F1Daptka/EgVn6tS5IJEIZtEhPX7go8+RdouiNJxZlVJOsvq2IEEIOoF45kreU
         T8o98Q2JjK3vAmyvVj+fXBowDt0NAWemsOZZiW7PAreApCBwyjkYhGj+CxOpRv6Ph+/j
         MUvw==
X-Forwarded-Encrypted: i=1; AHgh+Rryg2dQKUF6qPtg/uIVKWdUNLWWB3XUzZ3VBklAgstFkR9knETxrv8W406Y5WuPRKJNUUfB/EAMOTbCKy/AGzTYyg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzY26mDYAZwYAwkMuSnLVoabIe3jf69h1MtfzFosKaYpjPirvpb
	gR/JQgTV1xltX/K5VqhBkGA0NCKbJ5k1l8a/qzDdxtWtKYBFyCpkrSIdh2erG4vOA3DXKE8CDhQ
	eK7V8YagJfsSypwNTJfwRxo0OxicboQU=
X-Gm-Gg: AfdE7cl0OkkeA+N65/q0SBQ+gQhovavEXejog7L6TYbhPepXGPDI5hQd9IwT/PbQKZE
	580Fc4dRnykLbiQJdt4ZJouWoetdKODq2FeiNStkWGIKm/FGxD0cNKMlSDFhOrxuVInrj5xutxv
	g8LAKrk3EZLeVoXv9lLcpZEMowDae6XgrPORnTg0AWw1Frk7poR6yLVC+h56ns5/ngY40nxxZPW
	ny3LGO1ghurqKA0b3rPj9StES+WkXPcs3nVhwCbtp7MPwbYCVstO3JMBcR/VlfGfzHWhjQ=
X-Received: by 2002:a2e:bcc7:0:b0:39c:84cb:ca79 with SMTP id
 38308e7fff4ca-39c84cbcbc5mr8986591fa.40.1783625617557; Thu, 09 Jul 2026
 12:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260629165056.2489582-1-mac@mcrowe.com> <DJS7O5671XMZ.OZRLCFBNZFYP@smile.fr>
 <ak_xh2CM7n4X8_c_@mcrowe.com>
In-Reply-To: <ak_xh2CM7n4X8_c_@mcrowe.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 9 Jul 2026 20:33:24 +0100
X-Gm-Features: AVVi8Cf96d07LaQ6kbw018iEhiBqJsYA48MlQtwJ8gLcZMtBmCuQAtVGIHGBEDg
Message-ID: <CAO5Uq5Sh7MuFmb=xhQ=kaeyZcBaCDgjfTZ-Uwa25+swo66e3TA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] dropbear: Disable DSS correctly
To: mac@mcrowe.com
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 19:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240591

On Thu, Jul 9, 2026 at 8:07=E2=80=AFPM Mike Crowe via lists.openembedded.or=
g
<mac=3Dmcrowe.com@lists.openembedded.org> wrote:
>
> Hi Yoann,
>
> On Tuesday 07 July 2026 at 10:54:38 +0200, Yoann Congal wrote:
> > On Mon Jun 29, 2026 at 6:50 PM CEST, Mike Crowe via lists.openembedded.=
org wrote:
> > > From: Mike Crowe <mac@mcrowe.com>
> > >
> > > Take upstream patch that stops sysoptions.h unconditionally turning
> > > DROPBEAR_DSS back on even when it has been disabled (which is the
> > > default).
> > >
> > > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > > ---
> > >  ...PBEAR_DSS-is-only-forced-for-fuzzing.patch | 29 +++++++++++++++++=
++
> > >  .../recipes-core/dropbear/dropbear_2022.83.bb |  1 +
> > >  2 files changed, 30 insertions(+)
> > >  create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Fix-so-D=
ROPBEAR_DSS-is-only-forced-for-fuzzing.patch
> > >
> > > diff --git a/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR=
_DSS-is-only-forced-for-fuzzing.patch b/meta/recipes-core/dropbear/dropbear=
/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch
> > > new file mode 100644
> > > index 0000000000..b9705a2bbb
> > > --- /dev/null
> > > +++ b/meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is=
-only-forced-for-fuzzing.patch
> > > @@ -0,0 +1,29 @@
> > > +From c7dfaebd5f6a4cde4198f4d2a7baabaa1f632274 Mon Sep 17 00:00:00 20=
01
> > > +From: Matt Johnston <matt@ucc.asn.au>
> > > +Date: Tue, 6 Dec 2022 22:34:11 +0800
> > > +Subject: [PATCH] Fix so DROPBEAR_DSS is only forced for fuzzing
> > > +
> > > +Regression from 787391ea3b5af2acf5e3c83372510f0c79477ad7,
> > > +was missing fuzzing conditional
> > > +
> > > +Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/c0=
43efb47c3173072fa636ca0da0d19875d4511f]
> >
> > This patch is missing your signed-off-by.
>
> Well, it's not my patch. :)
>
> I wasn't aware that I was expected to add one to the patch itself for a
> backport.
>
> https://docs.yoctoproject.org/scarthgap/contributor-guide/recipe-style-gu=
ide.html
> doesn't seem to say that a SoB should be added to the patch. It does say:
>
> | Of course, if another person later takes care of submitting this patch
> | upstream, the status should be changed to Submitted [where], and an
> | additional Signed-off-by: line should be added to the patch by the pers=
on
> | claiming responsibility for upstreaming.
>
> which sort of implies that a SoB should be added for original patches tha=
t
> are suitable for upstreaming but this patch is a backport which originate=
d
> upstream (without a SoB) which isn't the same thing.
>
> Adding a SoB to an unmodified upstream backport patch feels like
> appropriation on my part, but I can do so if that's the policy.
>

You're certifying that the patch you're submitting is appropriately
licensed; it says nothing about who authored it.

--=20
Alex Kiernan

