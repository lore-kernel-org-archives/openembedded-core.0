Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E34CC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 13:59:06 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.80726.1705327139809962714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 05:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H1jEHjX3;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50eabd1c701so10612001e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 05:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705327138; x=1705931938; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2QyS/UGhQPEZ0HYvB4AVsyCUh1PO2+7hW7MqiWyGZtk=;
        b=H1jEHjX3kRuREmXgAAKp1lG37yjOn2BWNCfyxy03TyPctUMlFn5TsWDY9LtwWjwdxH
         Mg8sgShQiycNA/8Fxdguu3MjEBfcJUd9OZw7RpKCGrJhvYqd1KjUQfXCypzFwZhUTTgc
         A2kz4JqcI5N5c1JMydBA3A8/4fIt+wC56O1BQ+wz00WxFzH+doUXF1+iVAcClrvAgvRC
         Sq3LLtiHrKzZzK9WihHxXhwsNxz0qWA6EuRtFQFjx5Gb4tckEpe+78dtlw1q/ElQUT+v
         w/LKfVQ91xqMex6WG+/HGw9XlnQueN3amyK2h/ozDeURfU2ksmYE537gKS08/tp/lsGA
         yIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705327138; x=1705931938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QyS/UGhQPEZ0HYvB4AVsyCUh1PO2+7hW7MqiWyGZtk=;
        b=ZMuyLbJTnjAbdsH5LmqjL2yQ/NMECr5CXu4ywtvKiCNIJq+en3etDsbF0Ziq3LMFiQ
         QhzTtZL91oC9Zju77LzTXS0LSox8jpJWrLku1J6mfBM9I3OuaVeWXE4spDKg9nMHO6Xt
         VXB9vc3gOwrzmJlbewoXjXdFS/oODyb+HO4/ncs2RpA3l/Q49vw9Po7ShxzcelDKGFXq
         zSvPoRPTYHF3j3Molg84WaebqV/vA2DOiJea0VTJ3ktTKV6WHzhAc/3tIypnMZoK3VC/
         i3h/pZzT33XNclqsimRDv6RrX6gCokdXXNPQcWxWv2A37FIZGcxtfIclRWxdRZIq3p0r
         VU2Q==
X-Gm-Message-State: AOJu0YxVcIYH1y7BplrHOLukQUtN49/WeHDPwYXavVNKCCDmXL8AwZfL
	f9r0s2K8hz8cIJs7RszIALN7ufrq01UMlt5wduc=
X-Google-Smtp-Source: AGHT+IFWTZU1tRnemCpaKhO4zIusmRtzRa+in8SDvtkPiexVQGVRjiFJut7XY36t9gTF2sjxzyQMYQ6xr1++PJj35UM=
X-Received: by 2002:ac2:494b:0:b0:50e:d347:b83 with SMTP id
 o11-20020ac2494b000000b0050ed3470b83mr2444531lfi.115.1705327137853; Mon, 15
 Jan 2024 05:58:57 -0800 (PST)
MIME-Version: 1.0
References: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com>
 <17AA7149AA53F0BC.13033@lists.openembedded.org> <CANNYZj9yuJemGmM3aLqL+LEaixSrqchgH3406fzreQbqzjwPaA@mail.gmail.com>
 <CAHUKmYYnztYA5zJN7StJzLcBzW9gexFbD2PNhGD6rzc7BW0pmA@mail.gmail.com> <8a632115c057bcecff50ef9404802670f072c4a6.camel@iris-sensing.com>
In-Reply-To: <8a632115c057bcecff50ef9404802670f072c4a6.camel@iris-sensing.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jan 2024 14:58:46 +0100
Message-ID: <CANNYZj8jPYgXuu8FzGOLD99Rxv7wxWdy3KCMtAN5YERhibrawA@mail.gmail.com>
Subject: Re: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: "ecordonnier@snap.com" <ecordonnier@snap.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 13:59:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193677

On Mon, 15 Jan 2024 at 14:54, Jasper Orschulko
<Jasper.Orschulko@iris-sensing.com> wrote:
> GitHub also provides tarballs for the unmodified source code,
> e.g.:https://github.com/libexpat/libexpat/archive/refs/tags/R_2_5_0.tar.gz
>
> This corresponds to the "Source Code" asset that Github automatically
> adds to releases, see:
> https://github.com/libexpat/libexpat/releases/tag/R_2_5_0
>
> So if download speeds are a concern, using the source archive tars
> would be a valid alternative.

Sadly it wouldn't. Auto-generated github archives are known to be
non-deterministic, and we even have a qa check to ensure no recipe is
using them. I didn't raise this point because my objections are on the
principle of using release tarballs, not this technicality.

As for the stuff that autotools-based tarballs add to the pristine git
checkout, none of it goes into the target image, and by and large it's
the same between all autotools-based projects, so you could probably
special-case it into the reports or even the original data. But I
would first raise the issue with osselot upstream.

Alex

