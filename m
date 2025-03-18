Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06865C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 16:20:36 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.935.1742314827522216851
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 09:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=glTL3DA1;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f8ae3ed8f4so3065689b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 09:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742314827; x=1742919627; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugM0Cz2PG1ImUDNGLntwe6Wh6e2De+i/ARpEQmfz0UY=;
        b=glTL3DA19ksYRwkSEsUF52ZkJJnlwR2puVq9VRYJz/uJPirDAucAM8MKm9VthqLYhU
         M7HpVlXahu/FAWDW2cL8dyN5yaJZgrYb5Qm2S/fuaVfNLtTJ7VbaKUdgs10x9TxA2oaX
         cWBN/dzShx7xKprLXUeELUqTf7rzzIMHoPwgYk4PH7ukvge5PD5ZS7SX+U9cihVu8+fH
         7lYApKr1vam1IaJIrBBBby7AeUdPxfJfW3G9weJKUplRlm+pXhkKTUXOelIbiuV3Sa+B
         JnkoCSEKbEPSmsbJSUlPWOLK4DbmqFxyG4Y+NZi77DYAiYi9mSu63c3HGM93o7A95ZBD
         9eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314827; x=1742919627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugM0Cz2PG1ImUDNGLntwe6Wh6e2De+i/ARpEQmfz0UY=;
        b=ajBHSYcZzfTVY1zqTKxvWH/MRk7pjxQ/iJdTpPxU0nMW0idGqObqgaalWoP8HZrMuN
         YsLtj8cxUQ6Sk++9GDm4AeEUjU1qAaIcd2omgbSAVouwnBZt3MmMnIqwfzdCd9vhZqXp
         R7uvUBkhzaoKXD8r12apDAaJ1hd16rWIkU2QkssUMyx4gseGSPCW2whMSJJSGJnZUSpK
         tKxd+RN+5wXSi4ZvNMJBZw7ZkYQSmpHbcVKLhqbJiYjYob6hjl8lJdiG8KFvzQ5RMzrw
         ag6B1Z9q/velDy0yBuBWrkDyZlYqqxEFhseK6ujKu0M08brwrpw8jlAtBg2AYY+0R9G9
         /RVQ==
X-Gm-Message-State: AOJu0YwMg7xYeihXiFqelD+DXvoO7XB4ntgcdapiPt6bZEdmIcn8GWjP
	CLAvmw2FN0IVetiwhQ+3aIGBbiVMuaq4mJ2Wq0iCsYqcQ8qRRLxcDSvwdN1oE1V74E/ZE1rd6Lq
	znwMeYj7CH1iMw52h1j+o2VXV5Ao=
X-Gm-Gg: ASbGncuC7GTVulwPZq/w3PGd7SBaUaJsFFkc+qW3LkByywAUvwfYwghk8zTi7ZQiq8z
	OKnB46I6hgW4st3kZ712K/Sk1X/Mrmo6Q7aFlyVLLledLYHV04cHFfKo3ET3alJmLGeN3NgKiFZ
	gvk03mH48Pr5C68J67k2GCGgBo1b7Doo2UtTw=
X-Google-Smtp-Source: AGHT+IFemYIh+8uCIbdLuZSVsTvYZkn5246CnoLJpMKdqWV+S7ltDs2Smi6SheoA4D+vThGZ7/BF0hxo8Af1sW4p+hA=
X-Received: by 2002:a05:6808:e85:b0:3fc:219:c620 with SMTP id
 5614622812f47-3fea1831c80mr2703920b6e.23.1742314826731; Tue, 18 Mar 2025
 09:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250318043846.2422141-1-raj.khem@gmail.com> <20250318043846.2422141-8-raj.khem@gmail.com>
 <182DDC388EFCF3D4.9747@lists.openembedded.org> <CANNYZj_zS7j0JseaRLMxDng1S=AdkXbsbxgRLJB=nPqWu6Sc2w@mail.gmail.com>
In-Reply-To: <CANNYZj_zS7j0JseaRLMxDng1S=AdkXbsbxgRLJB=nPqWu6Sc2w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Mar 2025 09:19:59 -0700
X-Gm-Features: AQ5f1JqFFlUxDqhULU0DGQPqHCbXsRoCNSQZearr0PcrS7pRCWg3FzQr9ST52QA
Message-ID: <CAMKF1srJ3JytTW=gi=H_EqxWo9mz-8EyZ+cspx9n6geq=XYh-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 08/24] readline: Fixed build with GCC-15
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 16:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213221

On Tue, Mar 18, 2025 at 2:51=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Tue, 18 Mar 2025 at 10:39, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > On Tue, 18 Mar 2025 at 05:39, Khem Raj via lists.openembedded.org
> > <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> > > +Fixes builds with GCC-15
> > > +Sourced from Fedora: https://src.fedoraproject.org/rpms/readline/c/c=
47eb813afb942128253213ad5b8221770557e48?branch=3Drawhide
> > > +
> > > +Help getting packages like bluez5 building
> > > +
> > > +Upstream-Status: Pending
> >
> > Please no new Pending.
>
> Per https://tiswww.cwru.edu/php/chet/readline/rltop.html the
> submissions should go to bug-readline@gnu.org, chet.ramey@case.edu

yes thanks, I have sent is now, I will update the status in V2

>
> Alex

