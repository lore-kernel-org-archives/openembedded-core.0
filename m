Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFE7CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:30:20 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.234078.1697567411414622838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 11:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D68GxPfI;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1e0ee4e777bso3802294fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 11:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697567411; x=1698172211; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ro36fnFU8tBq9UyHDjBhMty/p3k4pDH2p4jvzlNPUD0=;
        b=D68GxPfIGTVISPJJewQtNhMAQe3WOEBHJELDazEDL3CeVIa7H2hoBFnKxG/LKqp2KY
         28i1RvfmwKZh0HgKliKA0P0LTOx9WVWPj56qve91IkBSqRYkoGa08X8ch66nYUqjcXU8
         GkGmraj/mH4v6ROmJc+7TRR47njbroUGWt2o69s9Y2X4AB76EhOXsIsFOflMMVAtsW4i
         X5gbtjfwsJC+I5rOFwP3JRw4RUBM4DnQ1ZbT7d9f7sASD6eZfrfcIkGUNufFGH9omOGT
         Q7rCNSl/YqL9wy5UMhzderlF0i0o7IDlHZNCa2luXO50/4h6Sg+XVW6NFwrRF7ASGxT7
         SAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697567411; x=1698172211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ro36fnFU8tBq9UyHDjBhMty/p3k4pDH2p4jvzlNPUD0=;
        b=b35u3xvwFEF+v+ZM0G/N9bVRafO7X8GJsjEpyF5MmufsbxAmVdzG+gatdTE63gTTJf
         Czn7goHX5Arpg9tsfcnIPF+7AKfhoNWcx7kHoOVUeHJT6osQYorbILt5+A+NqTsAAYZK
         hrR0GGIaTaXBV/2tauGvNEwmDyR77QJG281NMoxp5lnQ7bHK6xPxAmd6hdl9OQiqYtbf
         y6KcYFz81fCO8KklknIzUEFevuTI55SX7aTPQ9lto+hLdXBHN216YpicuJSo4hX8sOjt
         8gwkNGmIzVagncBZeCW6EgK0AqJatqDjB6rPw9h3mV4TkxvfRWZKx9xMJixWSqbe4Oeb
         MO0g==
X-Gm-Message-State: AOJu0YxEm8j2ls6bQ8bES2gB79jbgsOxsabE/O7QZjj80e1HFoIjf3iI
	leeLqLOJgqjOg81JpgVyoggM/TYKtwIsKCeOAvw=
X-Google-Smtp-Source: AGHT+IE6k36sn6RJJ7X8eDmf8ntuAS/jGWT73DjdhOu1yWo6XL54L+17tlAj531YacwGkNsHwGofDh0lRw/vRUBBEqM=
X-Received: by 2002:a05:6870:212:b0:1e9:a770:61eb with SMTP id
 j18-20020a056870021200b001e9a77061ebmr3667577oad.29.1697567410662; Tue, 17
 Oct 2023 11:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <A3F3DAF2-8744-47F1-A9B3-EF93448DD30E@geanix.com>
In-Reply-To: <A3F3DAF2-8744-47F1-A9B3-EF93448DD30E@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Oct 2023 11:29:44 -0700
Message-ID: <CAMKF1sog+WKmSSu-vXcVnrkqYmu-Myt44uRTiyXahDsjXf07zA@mail.gmail.com>
Subject: Re: weston-init: how to debug with systemd
To: Sean Nyekjaer <sean@geanix.com>
Cc: denis@denix.org, alex.kanavin@gmail.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 18:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189350

I have systemd based system and I can see it in journal e.g. see

https://snips.sh/f/jleAzcqMVd

On Tue, Oct 17, 2023 at 6:05=E2=80=AFAM Sean Nyekjaer <sean@geanix.com> wro=
te:
>
> Hi,
>
> To my understanding the weston.service doesn=E2=80=99t log to journal. If=
 I'm is running the weston binary there is fine output on stdout.
>
> Looks like TTYPath is eating the logs, but I could be wrong.
>
> Adding:
> ExecStart=3D/usr/bin/weston --modules=3Dsystemd-notify.so --log=3D/tmp/we=
ston.log
>
> Will of course give logs in that file
>
> /Sean

