Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB680C30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 09:50:26 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.14113.1720173022402887989
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 02:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YahZJkb1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-356c4e926a3so801277f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720173021; x=1720777821; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l1Cp9087rJzTL6AKwJc5YnOgKkeodhJgmtRM8wnq0uE=;
        b=YahZJkb1+OrtG7jl0XktgZSH89wpdyHEoOIostGVHp+xDediwhoLCaKPWMpuid6fOm
         W0fE/O6RGnDtwVVfavvxfog2mY4KuGSpVgMkCAEUt1eaS2E25D7GZFBv0AWHGF2JVpeD
         e4cXAw7thHHVqrcX6icN59j/RhLFP5fPo5Eug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173021; x=1720777821;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1Cp9087rJzTL6AKwJc5YnOgKkeodhJgmtRM8wnq0uE=;
        b=uAWaXY5x7p80oSMed0ymMNMKfk1CnY9HMb7EqtnJIRy445ZzZarl8m/FXGy90SUTJj
         pyUpQfcBO/4srxtq/D6wOP9c1SCFUHcU8WlM9HAW+cbCuzYqo/Ob9B7ULE6In1svZD2y
         HDDUl2dIXnMZwt5btPMKp9nQuYcGXAM0i07MfkVfS47M6h2E9D96YjsDtHmZcSk7M+0H
         nGaz8MOtlR8ugPzZgcLnBwP9GIYgazLi4gvpuxCqGBzvki9/SHhu4qOFDnFRozOlvFs1
         GP13zg8yb56XhkLhNhdS/nTBsT5NMiJ8Sbkvc8V8JoA54zisM+b2VfbLB4CQPF/BO5EG
         BREQ==
X-Gm-Message-State: AOJu0YyPaj4u4roBawKrWSQ0aLLwBmAAiX++TFRl68bX5z6bYW/2gECE
	q7nRhPLGQiZuy9ptMQE4fIn9KMIRdW+w/isdHE5S3CcdLg8eLWv8+n+DGOKaaA4=
X-Google-Smtp-Source: AGHT+IFKH3JRP/6MxDbv55DuipE6wU3UcsXOXDiGysT0pfge2KcIjVZ9wOXvhAYX0fwhpxKiZsU7CA==
X-Received: by 2002:adf:f3c2:0:b0:364:348:9170 with SMTP id ffacd0b85a97d-3679dd63d98mr2935752f8f.54.1720173020791;
        Fri, 05 Jul 2024 02:50:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb88:bb2:1190:3f2c? ([2001:8b0:aba:5f3c:cb88:bb2:1190:3f2c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679983882csm4212278f8f.78.2024.07.05.02.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:50:20 -0700 (PDT)
Message-ID: <fa0ed889c977c8f48b7e7919179a45bb8a43bf2a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] u-boot: do not pass O=$B, if $B = $S
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?J=F6rg?= Sommer <joerg.sommer@navimatix.de>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 05 Jul 2024 10:50:19 +0100
In-Reply-To: <q22jlsvqxcrfo7bpgeu6iqox23lji3t2fgwxkptddo2a75dru5@eod6dk7stnyx>
References: 
	<9e5273afdef2797f48970927998cd5f6d5b1e63f.1720120588.git.joerg.sommer@navimatix.de>
	 <8ebaf41b89622ecc6b27b140cb8264bf50d15f68.camel@linuxfoundation.org>
	 <q22jlsvqxcrfo7bpgeu6iqox23lji3t2fgwxkptddo2a75dru5@eod6dk7stnyx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 09:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201597

On Fri, 2024-07-05 at 11:41 +0200, J=C3=B6rg Sommer wrote:
> Richard Purdie schrieb am Do 04. Jul, 20:38 (GMT):
> > On Thu, 2024-07-04 at 21:18 +0200, J=C3=B6rg Sommer via
> > lists.openembedded.org wrote:
> > > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > >=20
> > > The u-boot Makefile (even v2024.07) doesn't like it, when `O=3D=E2=80=
=A6` is
> > > the same
> > > directory as the source directory and complains about a dirty source
> > > directory; see below. This happens when `UBOOT_MACHINE` is set and
> > > not
> > > `UBOOT_CONFIG`.
> > >=20
> > > ```
> > > % make O=3D$PWD all
> > > make[1]: Entering directory '/home/joerg/git/u-boot'
> > > =C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/timestamp_autoge=
nerated.h
> > > =C2=A0 Using /home/joerg/git/u-boot as source for U-Boot
> > > =C2=A0 /home/joerg/git/u-boot is not clean, please run 'make mrproper=
'
> > > =C2=A0 in the '/home/joerg/git/u-boot' directory.
> > > make[1]: *** [/home/joerg/git/u-boot/Makefile:1928: prepare3] Error 1
> > > make[1]: Leaving directory '/home/joerg/git/u-boot'
> > > make: *** [Makefile:177: sub-make] Error 2
> > > ```
> > >=20
> > > Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> > > ---
> > > =C2=A0meta/recipes-bsp/u-boot/u-boot.inc | 8 ++++++--
> > > =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > Can we not just always ensure B is set to somewhere different to S?
> >=20
> > Building in S is generally a bad idea and we try to avoid that with
> > anything that supports it.
>=20
> I did some tests and yes, setting $B solves my build issue and does not h=
arm
> a build with UBOOT_CONFIG. But I must admit, I could only test this with
> kirkstone.
>=20
> Would it be possible to get this patch in kirkstone and scarthgap, too?

A patch setting B is more likely to get merged than the one you
originally posted. To get into kirkstone/scarthgap, we need to fix
master first, then backport as appropriate. Any patch does really need
to be tested with master first too.=C2=A0

Whilst not essential, it would also be nice to understand whether there
is automated tests we should have to cover any particular scenarios
which are missing.

Cheers,

Richard



