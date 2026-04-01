Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447CED35159
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 07:49:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7710.1775029750731398656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 00:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UsTynNFq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso55946785e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 00:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775029749; x=1775634549; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+/4GLwosKgr8NXPITHebeMqRnnac94LdxVnZO/lKj1w=;
        b=UsTynNFqYi2n/PGjnoCnqlXQucO2TN6Y79QiIRvQZWRgseB+70tcfkXAd1ToiEepSX
         7N/PXg+yKj7yzasAWZCcnbFVvIlj9e8tU3M6Ayg0ZFyDh1v3X1Rccfg50y7R4vZyuba7
         qU02AX1W1fmGu8ETY7k9YLryqyY9cgKxqcOy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775029749; x=1775634549;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/4GLwosKgr8NXPITHebeMqRnnac94LdxVnZO/lKj1w=;
        b=q73mB5ILryrPIYhwhKnJ3RXyASyu7whEIK3CLlKn1eZxIjpeZvl0F1ReT6SXeWuLR4
         /FRsK0Z3CBpbleoTSQAsijOVcj7UrhE/Thu8ZZrQ5xok3WbuqM/c4PbdpA011YcCMxEW
         77U086JoRDvaJYi2TnlG9lKqQTq03kHLX5p54zXv+wFL2nR3+e5PuIdduFbtrB6Xle61
         0RDCyhEs1VkNR0GF4o3R3y97zG6hcymUmnZKH9k84OPoDse2NhiGABgz89CJHRHgx3Ps
         SNEFt+ya5OFe5OVbJc1mcPksa8yq7dbHdLVSkZi/fN3COtjD+fJeP9zyQ7pYv64QB/ff
         fu/A==
X-Gm-Message-State: AOJu0YzcbG0+InYd2mAhvSbPzZh7DMQkMjmWw2aYupn5t4xQdWY9HSmX
	7YeJhHdiyLWyCNKaxdLt4eUDn0cgYSZ9/vDA/pW0hR/j8xTH8kSqey3UKpVQ1M4ZrBo=
X-Gm-Gg: ATEYQzzylksUEim0yYBZuHsqh8GnnfFKk/WNvEZA8VSAhPB/wqkxcFTJ44qf5rFMsff
	i0SDRp5oS64HcH15hI96RyT5rbp/ge0WOMLC9s5N9YzsGsYmHSwd+LshhtrInzAe4dH2yJu09HC
	61F8NPznK/x7hXlcu2BrybMosjsuxUaylfDPnGaJM3R2ERCHA8HBxhv1sodCkGX1NcnFstVE1kA
	D0aen0dnrPHPuzMMn2dflv8vU13/uCz6zUti2NrU/8opOmgzEvvUFEIoL8LA1EMMHWqjRvjqWU1
	UrNwFmxQq1ku+Kh0GbbvjCqDljwu5NjpyMyrolVoCSP5i4kpv921u66BSFA5C/JPK9LmxjcIunf
	pYJ/KLOXiRR8mXsuANKyv/qLQ9fanPpk1QpTesHbhyX2KNPQXdUEClKuU2HGb418TV4mZSDVlbI
	dErZ/4Y1OZsPPMxIDNxNspWuJdp42T139dYitcAyx4hE9gBLYxaL6sOCqopaxLT0b2/0SmMl5II
	NMFDTaqxKgWiL2z
X-Received: by 2002:a05:600c:c178:b0:486:f8e9:add5 with SMTP id 5b1f17b1804b1-48883591777mr39717355e9.19.1775029748864;
        Wed, 01 Apr 2026 00:49:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d91c:a3aa:733d:be2a? ([2001:8b0:aba:5f3c:d91c:a3aa:733d:be2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83682fsm109858755e9.7.2026.04.01.00.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 00:49:08 -0700 (PDT)
Message-ID: <df72394376fdd01fe7d3298c4d3995f00705fc16.camel@linuxfoundation.org>
Subject: Re: [OE-core] Runqemu error on core-image-minimal
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rybczynska@gmail.com, Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 01 Apr 2026 08:49:05 +0100
In-Reply-To: <CAApg2=SPPo68XtvWioHO_T1=5EQiNABnntGJhM59hDkWhm6N9A@mail.gmail.com>
References: 
	<CAApg2=RgxG+NY7sLTBMNEhPmX-O5dNC+AHmSSUQCDREgV6VToQ@mail.gmail.com>
	 <CADySD0HH=KMgU7kXKXeNEOG38ZtVZjjb3mZ5dLpQw9XewfuV+w@mail.gmail.com>
	 <CAApg2=SPPo68XtvWioHO_T1=5EQiNABnntGJhM59hDkWhm6N9A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 07:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234331

On Wed, 2026-04-01 at 08:04 +0200, Marta Rybczynska via lists.openembedded.=
org wrote:
> On Tue, Mar 31, 2026 at 9:35=E2=80=AFPM Ankur Tyagi <ankur.tyagi85@gmail.=
com> wrote:
> > On Wed, Apr 1, 2026 at 4:30=E2=80=AFAM Marta Rybczynska via
> > lists.openembedded.org <rybczynska=3Dgmail.com@lists.openembedded.org>
> > wrote:
> > >=20
> > > Hello all,
> > > As mentioned on the call today, I have an issue in a configuration wi=
th bitbake-setup, oe-core-master fragments and runqemu:
> > >=20
> > > $ runqemu qemux86-64
> > > runqemu - INFO - Running MACHINE=3Dqemux86-64 bitbake -e=C2=A0 ...
> > > runqemu - WARNING - Couldn't run 'MACHINE=3Dqemux86-64 bitbake -e=C2=
=A0 ' to gather environment information, maybe the target wasn't an image n=
ame, will retry with virtual/kernel as a target:
> > > ERROR: A builtin fragment 'machine/qemux86-64' is used while MACHINE =
has already got an assignment.
> > > Please either disable the fragment or remove the value assignment.
> >=20
> > drop "qemux86-64" argument, it is not needed since the machine config
> > fragment is set.
> > "runqemu core-image-minimal" should succeed.
>=20
> Hello Ankur,
> This leads us to another problem (also happens if I remove the fragment):
>=20
> $ runqemu
>=20
> runqemu - INFO - Running bitbake -e =C2=A0...
> runqemu - ERROR - .zst images are only supported with snapshot mode. You =
can either use the "snapshot" option or use an uncompressed image.
> runqemu - INFO - Cleaning up
> runqemu - INFO - Host uptime: 17100244.13

Try "runqemu snapshot" :)

We should find a way to fix the MACHINE=3D issue. We did briefly remove
the support for using bitbake -e entirely but it was requested we put
that back.

The snapshot message was added recently to cleanly support compressed
images (also relatively new) but obviously the new user interface to it
could use some improvement.

Cheers,

Richard

