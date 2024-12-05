Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1EAE77170
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 15:38:44 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.14177.1733413114091190731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 07:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gYRvhQmH;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6d8cb085d1bso8702146d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 07:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733413113; x=1734017913; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g10DiGIuF7EwG2Qu9dHANd7c10hR3r8Yh6cU7Oedynw=;
        b=gYRvhQmHPFPytmcZeU494kJBwLJWQUkaOq35I/eo7WU0XbO3zmH4ZwO1s2YNo66zOq
         XfD98o28Qg+nzvF2Tjcwmof6pRxYdmbG5a+A4ncOSXGP7cVCJ0kVGVTGNw0TiSy4EeOF
         vOuGNv0MtOTWDW+GIyVkOFootc7eZj0EjcABg7sCEd3RS/fTaZz/tWitIgxJN1exaSc4
         LRCMwyJ3Gf3lV9hI4bXsnFB3VuyWA2XSdQOZAT4+27qROFn9cx/uanN6UGkcdT/pqWFd
         dB1UUnNcY5zFlxLo/Cmo30SkJte0LsWFmwGl4aXdLwCAlB6gOTFxaNbD/ewSRBMMIek6
         otwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733413113; x=1734017913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g10DiGIuF7EwG2Qu9dHANd7c10hR3r8Yh6cU7Oedynw=;
        b=F6pcqpisFe9EJJIvZ4F47fVfHWEQRpShnvcGWUZ1gigDQtaxPbT4zAsIDrqqUiNPqQ
         7v0Cl0NFA4mTBMpFb8UaJ9I+9VwD8/7IRwB/iG9sWDxOp4JCzzRJUMlhWnN41AboJjwq
         5T/KLgmq5QI8Wott8VDJi1nnEdLOhDbA+HI1UrmJvtYT9EGvLS+sSVlfIsuVTCTZG03F
         BUglDYJLvdYudgyjTgeL9R3m+Srb9DJRxDDCykoU3/xbZAhdEaTil3TgKOFdn9Kx6SEY
         CoyJoKpDaSMXR6UXA4Rgla8jrPeSL4J3SiiypVBKE8F2bs6wCOdTXM/cfHzgHWmpU7t+
         pnfg==
X-Gm-Message-State: AOJu0YwhEZWX+s0FFcd7kPF50m/+XHpr5ltDBrwKLAM/CQB/PAiMJdqb
	2C/AINwATMVCGuK2qOvbAxHMUuWJRNtFxWe4JRyejEYHgwCG2LDsf7Uoc2Kzh5MbSfwsXkIpfdD
	Nxw4zHHDAGggnM/553J2KEkcMuxs=
X-Gm-Gg: ASbGncuhJHxYeaTgR4J+RD5/qsSylzXazv3I9Edu/58sf+pTaI1M85M6uj6kABQCYck
	AdcDJ8yJdMddheURS/pFBoKkwEKBIxZP+NuTyB0PworWLBHjxcamoBk6rSgDlhHW/kQ==
X-Google-Smtp-Source: AGHT+IGmYIEXnwtCKkRv+b5unztWgsgjdwd5ahWuB2urVRlhCJnJBFf8ZLf++hYDZ8nSMwKrGfe5+JWLyRaREDY+ipM=
X-Received: by 2002:ad4:5f4e:0:b0:6d8:8165:ef21 with SMTP id
 6a1803df08f44-6d8c46ecd45mr146471416d6.49.1733413113115; Thu, 05 Dec 2024
 07:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
 <20241204064920.817016-14-alex.kanavin@gmail.com> <181C637A-AD13-41CB-A6B5-152AA612102E@arm.com>
 <CANNYZj8m=0jYObXpvDhGta2i2aN6WYgN2p_MPJaZxGLhHQR9Dw@mail.gmail.com>
In-Reply-To: <CANNYZj8m=0jYObXpvDhGta2i2aN6WYgN2p_MPJaZxGLhHQR9Dw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Dec 2024 16:38:22 +0100
Message-ID: <CANNYZj-xBkK0a+W-cqnJtZnjJ6C4k6VZi7rkf25yOCkO7b2wAA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 14/37] dtc: upgrade 1.7.0 -> 1.7.2
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 15:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208387

On Thu, 5 Dec 2024 at 16:37, Alexander Kanavin <alex.kanavin@gmail.com> wro=
te:
> > > +PACKAGECONFIG[tests] =3D "-Dtestss=3Dtrue,-Dtests=3Dfalse,"
> >
> > Typo, =E2=80=9Ctestss=E2=80=9D
>
> I wonder why this isn't reported in a build?

Ah because it's not enabled anywhere, nvm.

Alex

