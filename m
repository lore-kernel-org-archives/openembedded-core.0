Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C18D3CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 12:58:31 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.17128.1757509103494580424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 05:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C8OqbjTt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e7428c4cbdso433058f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 05:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1757509102; x=1758113902; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vcveTRL6fqCTlSgKDMTH7zYRsz4qlKi9o8XRfw5Qqm4=;
        b=C8OqbjTtKGfPz0lI45ERoLRB8/oNy+OT2tlznaH+oPZGYAfelA7jtiH6srKlnEGaQO
         2vqyOCsnGjY2MmE0K491g6HwAzZGEc4QsIHbfGHNCRnHfKeF3cMc5hSG8IJ/cGMVQLpS
         BsQ7pu2fN1ViZm5JDPHUfWup/Hv7yHtsoZ8tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757509102; x=1758113902;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vcveTRL6fqCTlSgKDMTH7zYRsz4qlKi9o8XRfw5Qqm4=;
        b=ViqPN2QnmGoRLbfpS1qe+OSjmELxdXjVHWjt0LTTZGm39ckYyNqagm3tAC7H1ExzhE
         XCqELX+oghQTyesd2XS/xZf/95YRVfOr8lQCM7Eyk25hPOSi0WmI9eAAjT/AkR1bFAcI
         1L77jBwJ7bj6H9ykPPaBwITP3VOf2loY4XISxVOJb3/5kNn8urV3eXCInoaxPW4ny2qw
         WqklgzeZ9R9JOqnDzW3BA8qpBxDRMgiQ907VHqxxzPDy3ciUJbj/54OhgnY3H995ShwQ
         rfUTjtEQ7I0n0Fuzeyu95xLEMriFpHgBHu5S+B4dL+GFfOFuwadAiosai24v163Trpvk
         GPew==
X-Gm-Message-State: AOJu0YxeBgRrzdewwq8QqfO1+mFrfkBic3wwte5cHY+w43HGW+QUdyUQ
	axPGNOjI9E/j3bvcVSkiNcJ5FXDBRdgwxesX/qgcZ0ofSSnI9HsOlahgNc8aZog6oWA=
X-Gm-Gg: ASbGncvTH9VladJQwk+OofIYKUiTMFaPoWSSnZ6CRo76XdhfpmsuwPRTey2kK58JpdB
	YQG0IfvwXh6WZg85hiQxpHy99gLy6J8R3kOytfw9xLUpzja7xkWjjbPOzdxebrRi6v5wh03W4vd
	FoFZ0s9ApnFjB81UQAnUNwJDqUNf0/QjlFsThJ3aYAj1Lmunn0rzlg9z9/HOm8dfLizAiapV4nZ
	9PVr48rUpKCNEIsY9Y55d6ackKq+cjMbJUttuTCI7eN3efkqqAf0driT43J/LtTz/CMnk+YeQmV
	m53sKB1zTlvUVtv1qx55lI27OEVbpZPHakd+nLlKPUrTSVhul9TdreZEpIiyu3WgWec57gY2TRg
	Jt8tw4C1jh+EIEaIujMCvNgcNQy2HLYf+JXKdvioezTXb8w9tQQh+NkL7tCaVnd5RNo/gV/4B4A
	/9gWS7jSS5dL35v/yJ3VQ++w==
X-Google-Smtp-Source: AGHT+IHCwItUbZgKvY74H7gIIta2lzIpvu3wbv84G+FdcwK2uipOO/rHWgjwuFqrzz5TL2V77FH2sg==
X-Received: by 2002:a5d:5e92:0:b0:3e7:428f:d33 with SMTP id ffacd0b85a97d-3e7428f0fe6mr16335871f8f.16.1757509101867;
        Wed, 10 Sep 2025 05:58:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3ead:2ef7:6003:aff8? ([2001:8b0:aba:5f3c:3ead:2ef7:6003:aff8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521ca20dsm7384513f8f.21.2025.09.10.05.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 05:58:21 -0700 (PDT)
Message-ID: <0b543abec79fb05ad30195e268266e74e446b4a5.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/4] kernel-yocto: 6.16 fixups and genericarm64
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	mikko.rapeli@linaro.org
Date: Wed, 10 Sep 2025 13:58:20 +0100
In-Reply-To: <CADkTA4MMdRyBmWAn06Y+9UfpApwUwx1sy3foE-5Z63yjJA4DOA@mail.gmail.com>
References: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
	 <c2e11f23330c22a09a7e98a789aa2b26bd260ad0.camel@linuxfoundation.org>
	 <CADkTA4MMdRyBmWAn06Y+9UfpApwUwx1sy3foE-5Z63yjJA4DOA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 12:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223208

On Wed, 2025-09-10 at 08:56 -0400, Bruce Ashfield wrote:
>=20
>=20
> On Wed, Sep 10, 2025 at 7:16=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2025-09-10 at 01:08 -0400, bruce.ashfield@gmail.com wrote:
> > > These should cover the first set of warnings / issues that were
> > > seen with the 6.16 reference kernel.
> > >=20
> > > The first fixes vboxguestdrivers in meta-oe
> > >=20
> > > The second is the qemux86 configuration warning fixup
> > >=20
> > > The third is to get genericarm64 building and uses the changes
> > > sent
> > > by Mikko.
> >=20
> > Thanks!
> >=20
> > I don't know if I missed a patch or something else went wrong but
> > the
> > number of warnings went up. The ones I spotted are:
> >=20
> > qemuarm:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/2386
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/2343
> > qemuarmv5:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/2207
> > qemuriscv64:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/449
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/468
> > qemux86 + poky-tiny:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/2384
> >=20
> > Also warnings in other layers:
> > meta-agl-core:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/2209
> > meta-arm:
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/2245
> >=20
> > and meta-virt which I suspect you know about.
> >=20
>=20
>=20
> Yup for meta-virt.
>=20
> Something must be missing, everything is warning free here.
>=20
> Is your queue on master-next ?=C2=A0

Yes, this was with master-next.

Cheers,

Richard

