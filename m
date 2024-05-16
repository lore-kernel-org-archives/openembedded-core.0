Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CABC25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 16:25:29 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.18700.1715876728661673305
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 09:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gaAc3gyi;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e271acb015so13410921fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 09:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715876726; x=1716481526; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTCFivIyF2rHALHGX4HQosm+j365SPZYZEnEHkhSqCs=;
        b=gaAc3gyidOt/k+f5Mli6iC0Gaq9CHDV8QAES+kCIKgpEjZnxxMoxM062sTWp1lRf6j
         HdQhHD7HRJX2ZS7FyOQZXbpqA8YBibDQSS44j+v9SeaHjdipRcmmfnnywwycmhhROKuT
         WpxHFtofBan2D6vrvxBdGXbWI7SwMxxh69PQ0sezMowg87VBXjQ5RA8I2YH87ZmiKvTg
         vWjFoQO0AVEgzVeiOwDtRtIVh7Mo7Zu/d4eSeA237IwMM2Xr0CtRad/NW5iUPWOFohkX
         lgHOnV3a27dLP7QqYue98eZABPYiHTjxUMvQQiNoacPExOo/ooURwfyxqpNXfmBKezKo
         Y40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715876726; x=1716481526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTCFivIyF2rHALHGX4HQosm+j365SPZYZEnEHkhSqCs=;
        b=difLKE9KgaOLtu53y7KuCjS4Ta6YSPt4pQEvYq7ALdyKlhi/GSNnLGK9Tj5Qa9cGdP
         kk2bi54KfcnRtijiyd4difd02Yj9r0L6zrvMYHktR2F/TS120jTjsZFJV+rs8xXdJ2Rv
         L7TFGYk+XvvaY6NVpWuRmPfUMSUsoETxIntbK0borxZubf3ivPUz2FhfZXaDv/KriWEK
         ySanZu6bCnE1t94J7jVyj/7chMRgWpF2GhkyuSggo2PqvlGqm6blmvMiI6U9riVLw2Qr
         N346cc0xFwlElRMLf9ZLgtlWdbb9Kdm661wEHVqFVdX9VLVLIO/XPIgD+4Hh1KzREgxG
         WKIg==
X-Forwarded-Encrypted: i=1; AJvYcCVTPnxM0+BtfUBF39QdnPcfh6gYGNY1/gmCPDxR+qeAcLC8w1YjaagH0YABD/3LtdirnEpr2/TyYl6uUvIVtXCXO4V6VuigtLHvjPehy42aCBybndCJFiKn
X-Gm-Message-State: AOJu0YyfkO8RSqcG+DOqpXs5Eo18lOO0oeGZvVV4K9smQrykhNRrGYZZ
	F5zCp+xtKVP1jyzdQEYnB+HeJqH63dcAj7aGEv/EMIIfL3sDwD7T5DE3Q6fQfl/kf6ZwUlogfa5
	v1ATEr80UwMzRVfVMkQYjc96XYnc=
X-Google-Smtp-Source: AGHT+IFL3oorHUiDwlPw8pvoxCDipqHHANC5mfV8Jm4yxiopjqirPAQDSJ7UXEJhowO7SUoyXd0YXGU1nEBiGvwIuX0=
X-Received: by 2002:a2e:8748:0:b0:2e5:6795:f556 with SMTP id
 38308e7fff4ca-2e56795f5edmr115694511fa.43.1715876726200; Thu, 16 May 2024
 09:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <005A0B7B-2F65-4997-88B2-BDD86FC2970E@arm.com> <d31ffb101aede9f36ecf42e4de452377fdf2eaf3.camel@linuxfoundation.org>
 <A16B8D9F-CE5F-41A9-89A8-F819F684B7BF@arm.com>
In-Reply-To: <A16B8D9F-CE5F-41A9-89A8-F819F684B7BF@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 May 2024 18:25:14 +0200
Message-ID: <CANNYZj_3BEViDQ4KOackB=VLk2Hvt=w+FD9u0sLPObU5M2FapA@mail.gmail.com>
Subject: Re: [OE-core] iso/live/hddimg images, cdrecord, burnia, the future
To: ross.burton@arm.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 16:25:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199494

On Thu, 16 May 2024 at 17:57, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
> > I'm fine with moving out iso but hddimg has proven to be used by more
> > that you'd think. It also has fairly complex code in core which if
> > we're keeping it, I'd like a way to test it=E2=80=A6
>
> Unfortunately an hddimg is an ISO on a FAT, so they=E2=80=99re tangled to=
gether.  hddimg are _horrible_...

We can also do it with a two step deprecation process. I'm going to
write a proposal for formalising that, as there are quite a few more
things I want out of core, but the key to getting there is knowing who
the users are and how they're using those things. The only way to find
out is to give them deprecation warnings.

Alex

