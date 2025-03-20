Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF1CC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 16:23:10 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.12207.1742487781051713099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 09:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hnW9C/uS;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54991d85f99so2321182e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742487779; x=1743092579; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/B9wxZfinAaa5qjcP+AunAHiV3ZQ4RPUHku7h8lvrU4=;
        b=hnW9C/uSsRl5vu0w9uQuH07/RFi8YRSz7mj5ziAHzJFEJfh6bo9DVFBeIrmBaEbxrM
         wmVQ0Uxer6wne1z/JXDkQF+e19Yg1S96obt8Yp4GosuAXlZvk7toSOgXqiXNrKtm89uI
         iioKnL9AkyCCx1+kxFlBEJeVG6AFRAFahnrbHEOAxGQst+nu70BhoW95aB26mNITZzna
         BhUdhPuvnrkqtyHenbAbzvnEg1tUX4FgLLT/NbwHvPwiGi0WMA7WjCKU43Q6BiNWoUwo
         OBxI9H+egxRgGG/96DhnWlXLrsiIaHzO5mW/C1KZ4eLw2eL5xd2ojP8U8ZCT4J9CfeAd
         u8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742487779; x=1743092579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/B9wxZfinAaa5qjcP+AunAHiV3ZQ4RPUHku7h8lvrU4=;
        b=bkSls1j90kjCKL1FWc/Fyz7krx3vImGbETGC3ifDZtjyP53BfiGvpclgCDKbj+tNBX
         f3BSiD1oT00YA6WUG/aPajXFqWZlBXn7RtBSp4YQmBJTAlkxonOdqB8iB+mwauG6NrOB
         j7eiXESxHtmoH6yQyn99eEGg3eNi3qB9xWxcycGtiDvFpdTDAkuk5QLJ0+V9lv/PjcHz
         aVKK7MoIUWsedgBg+aXc8HwF2OiMto8bLh4x3LVBDhOr2XID0rWoewSUkbkFL/W2Lv8k
         xFlJZzKvtY5MtAW++cprn60AbZeCLXO4F5jivBMnch5SsARYG8c4gDvtj+BzW/jzWQQ9
         urcw==
X-Forwarded-Encrypted: i=1; AJvYcCVpFkgaIYaPgmoqW66joWA7zzsyvZBI20+MmTMzZoYFh7uR28dqApJx8E4liYLg3dR0UK2JvVC9NVdkUnHg3UXQBw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxHStASlRFfmqilGFLi3vEwDkJvAK6PG8q93kRPWn0Voo727vVx
	oEYwmPy9gqwW8ZKTLzvDgv40+OYSoj9dwFSLVz4odEEHW3cwVrQZigzCI0H94fjvB+pnD/7PbHL
	zQZGmMpO0CkoI2YQsSTtsOmClgTA=
X-Gm-Gg: ASbGnctGs1A7uVRnMDndyTBqU2bHB6uyMHGGnq+vfjX7kIBZb5gdvYFFpiS+3GL0Tj2
	PFo/GqJb9Ajg/clIlmtpRCG1ALXqBq6fVefz+ec+K3UcfY9/j8kPkwAlOV0vCBe6sWqlGuXh4JV
	DauHVE7WeEr0DiAwgR9oMCBuGa4+Wg
X-Google-Smtp-Source: AGHT+IGvPxNmLpuK6ahwLjTxwRkKp2Wd3usZxCYpcQs7q4ijiS5Cto2vW/XAJbDWb4ISf3DgbBYlqNTuELVmvfrgayA=
X-Received: by 2002:a05:6512:3d17:b0:549:981b:169d with SMTP id
 2adb3069b0e04-54ad60240dcmr91623e87.3.1742487778919; Thu, 20 Mar 2025
 09:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741980835.git.steve@sakoman.com> <d3c294ee0afe4d2eb46320945d41064ebfb5cbff.1741980835.git.steve@sakoman.com>
 <b3d803cb-dbf0-4b05-b7af-a0fa3a8f7a69@ti.com> <CAOSpxdaPLDeHadupRrH=OxhsZ5KKVzn4x40i_Lgod=qME5dmNQ@mail.gmail.com>
 <CA+chaQe26ese9KdXR6X8tdstyMB_RQRWZLHSzd9u8HqV5BUi3A@mail.gmail.com> <CAOSpxdao8QXCRr4yCbw-rAe+pykO8gZzSX4B=Kq2utZ2wukx9w@mail.gmail.com>
In-Reply-To: <CAOSpxdao8QXCRr4yCbw-rAe+pykO8gZzSX4B=Kq2utZ2wukx9w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 20 Mar 2025 17:22:45 +0100
X-Gm-Features: AQ5f1Jpw9ASOS01DdfnmtDsv4oM0-a7fJgv-r3mhH_C5gdvnhwjN2_RGuRHAIko
Message-ID: <CA+chaQc6h142OBBZHwsDy3O6d2oiuBRx6gkFbx2Db5kZvKRCnQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 4/4] gcc-cross-canadian.inc: Fix buildpaths
 error for pthread.h
To: Steve Sakoman <steve@sakoman.com>
Cc: Ryan Eatmon <reatmon@ti.com>, Sana Kazi <sanakazi720@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 16:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213413

On Thu, Mar 20, 2025 at 5:18=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> On Thu, Mar 20, 2025 at 7:52=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > I think we should backport:
> >
> > https://git.openembedded.org/openembedded-core/commit/?h=3Dstyhead&id=
=3D350ff7d53f7506de2bc01f0efc569b8294b9afea
> > https://git.openembedded.org/openembedded-core/commit/?h=3Dstyhead&id=
=3D9221e4ab8cca4c06dc3d5c1de2fd4ce46477578a
> >
> > to fix this issue in scarthgap, that's what I did locally in
> > gcc-cross-canadian bbappend.
> >
> > Steve: should I send the backports?
>
> Yes, please do!

Actually the first one was already applied in last scarthgap update,
so I've sent the 2nd one.

Cheers,

