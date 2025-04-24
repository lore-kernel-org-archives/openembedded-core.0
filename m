Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CDEC369C2
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 12:14:34 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.13649.1745496872325182087
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 05:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H5T40tAY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf257158fso5664185e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 05:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745496871; x=1746101671; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/MaEnbXd8b6Xv1wljAnAX1Lbm87hHmKMIiW4hUKGRJw=;
        b=H5T40tAYh/M9Lr2B0ozcfDSTnSbs5tWA3gs8HRc0/vTT3gptfVfmPSxGXVrGjVLuGo
         kuYVqQK4bYl8UhNJ8Q8kDrNi9nHVY7HEuPJ7mN0DHCRGHl6XpuimrVBtx7t1Ru3d/IOy
         SEoqoyP8pgwMsbbPyL02vsRAuyTuJHykUpYmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745496871; x=1746101671;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/MaEnbXd8b6Xv1wljAnAX1Lbm87hHmKMIiW4hUKGRJw=;
        b=pvES3shKuQuhjKwtXGTGrXRAM7EPAKl8AxvwaXCnWfZKGG+mRDP7bcda7gNtkui7QD
         bxnbbbGaPFDCCtUlXQr9TwefVkcPowEszvOyLBVgSBSq/aahT740DHxQvkVPVsEXu0ME
         BsHSHsH9x4BF4z//wmIceWlPHm23tfvhfZw3JglVjWSEkRD2c+bTMhpJqe7jXfH/MT95
         2wSm4sWlIq8N9i5d+znV6ni3fGaQPDrZQUFED2B3lUOwTAbbUvx97lQYL957GY/9Zdjz
         Ilj0YYpGCzmWq4kswvV95p7q2vVThEr+Fzsth9VlPdlqkYjA9kaAQASTyKxT5eDHuXAh
         6v4w==
X-Gm-Message-State: AOJu0Yw6lwYoPyccZMWACLJQY8h2c+pHuqhXOgPzHTA3M6RYP9cINQao
	Zt7PRqGnzmn6IIxvxHowS87viHTxD9PXRTWiiwOnX/b1SDo9ot1CSvpw90WDxUg=
X-Gm-Gg: ASbGncvwvbyd4E/sPsMPa+f9kiTfxshVG3vUBZHFSq4Ha0WNZEAIOPapEzQpjGGOnFT
	nO240CA9LZ9bH5pG++gaUbdzm3Bxt6tsVqLxuUZ1OuEeN5XaAAbM8VXfF0ge9HqEahAyt3cWgAu
	ptOjSpS+uB+FSI+TcR0QH+2+bv3aq1N2YwW/6HeJUhfi6ttg0La/28mJSnQJOBvQVkVmC8L9Mp8
	W+m5EtSdFOj5MK2cPOoy1/P2+aJvoUD/H5gfHqM+8DOapns7rVlGfA+ZmlvZc3y+zZzOb28/M7Z
	ofLaCtAjB5r+W+eiD+iG57wJIqSlNzKMyI6GQUSet8xibKJT7o5l96+hVVgRH856RvoaT8cRbGP
	MzjfH7iE4PMFnSzTpptqpV1hJ5uQ0ouQ8wcX9Gtum
X-Google-Smtp-Source: AGHT+IHY85AH4EwZ3spM+dhv5VNGVQqMpXMr51x/l2gsbBkpiCnRz9a5bvX8OGmYmidqkuF72bw41A==
X-Received: by 2002:a05:600c:3487:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-4409bd050f9mr26219555e9.3.1745496870795;
        Thu, 24 Apr 2025 05:14:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:94cb:8780:19ce:62be? ([2001:8b0:aba:5f3c:94cb:8780:19ce:62be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8070sm1959470f8f.18.2025.04.24.05.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:14:30 -0700 (PDT)
Message-ID: <64802f57b85b524ef1bab88b07a116e5af228d5c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] devtool: account for sources in UNPACKDIR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Thu, 24 Apr 2025 13:14:29 +0100
In-Reply-To: <18394019E7982924.8448@lists.openembedded.org>
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
		 <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
		 <CANNYZj9hiQ41Boji0OH5ecRbktL-5nH3q3o0=k4+XxRZ=nu2ZQ@mail.gmail.com>
	 <18394019E7982924.8448@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 12:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215369

On Thu, 2025-04-24 at 13:13 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Thu, 2025-04-24 at 13:44 +0200, Alexander Kanavin wrote:
> > On Thu, 24 Apr 2025 at 13:32, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > > UNPACKDIR was meant to help with this. If devtool is changing the
> > > location, can't it just change UNPACKDIR and leave everything else
> > > alone? S will still be under UNPACKDIR/git even after devtool moves
> > > it?
> >=20
> > Some recipes use
> > S =3D /path/to/workdir/git/sub/path
> > and some use
> > S =3D /path/to/workdir/unpackdir/git/sub/path
> >=20
> > It's that 'git' part in the middle that needs to be extracted from
> > the final value of S and appended to UNPACKDIR (or WORKDIR), and then
> > the resulting path is moved by devtool to a workspace with shutil. I
> > probably don't fully understand the suggestion?
>=20
> In the two examples above, what is UNPACKDIR set to?

Sorry, let me be more specific. What are the actual values of S and
WORKDIR for the different cases?

Cheers,

Richard

