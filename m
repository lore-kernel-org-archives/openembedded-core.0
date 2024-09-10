Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C686ECE564
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 08:50:01 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.18414.1725958195243168181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 01:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H6Xxi3qg;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f761cfa5d8so29511421fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 01:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725958193; x=1726562993; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6spXawaIgygVN6+MYvXxPCwJ532fiibbUz6HleCjrrU=;
        b=H6Xxi3qgZKIGbmXDRa+VvkWZgSegqzvZQwWCW4z6DMyjLVLt5OfYkxQnXVtDKn31ec
         dVoOHyOaOXYb35gbHOKlqwHHfioz+Nb7/CV5QCxHByGQEyh5SAoPUH4CkBDeafoufEvh
         fkuncMcjnf1iA+FTZ1WG3ZijnIVA+9vdxvKyEsSVGCCpOTJu3tOt+mAZqAdreQhxjovg
         E9VqkzalKwbGn1ADztIf9lKf87ZXOwGPeHiMxfF8te0zsPZz9jWzRATjUeuP9J4Pq6oE
         uK314GXkq10yUYUAckFsHqAY4ViEEK78R4zNr2hOM9JfhksrWrYCckIVN5YLf7xQYSzA
         QAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725958193; x=1726562993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6spXawaIgygVN6+MYvXxPCwJ532fiibbUz6HleCjrrU=;
        b=ZZ88ceB4ze+ZsSO32FqAK415NIiodtm+WIoSkYYuM8EJTBfHxZ95Axh6/IkQeDDoFi
         icE7wrax9hPCb0M1IcGsVQvhloyzFUxVuS3SZOmUeHdKa5scqxcoZYySJ2H7RUfZd2hn
         coG7LsZ9igUdXxiNFQbv5BkAcByLSh6Xnxpb3uZLdUMRe/2FDOg711PRU6SyONVSv4IA
         pdq//PTbCClFD6bToVTvyEHlLccIqhUL678E4Vppa3zt7nrk6cY7u+WMqVvyDuXvPBvC
         DSOVzIQ6TjqmpkEQuRqaoIF+l1dyk4cISO4GyXjo6G0ReszU70tH8KkRpFifCPwuqRAZ
         j0Hw==
X-Gm-Message-State: AOJu0YyuHju6+wFOtWihKFhgQXCW9KuEQPjK+MsRARgy2Zz7fILO+8Rl
	blD0lCnjaZmaQYAlORlMMpNjhct4O0osq4Cu9wOJ3XxSkNHFN84vwYl+oNwlsPLTiuwrArwZSCR
	xEYTjilxuo2XpIC23T/2ve+dC2oo=
X-Google-Smtp-Source: AGHT+IEyQdrdziE6zWL7UhDEDc1zSSFV46XBPDKNAsF/Zc8A/RcqP9czGFZmktkm9SXgfqyuWTHFd5PQ0jpGqLIkN/8=
X-Received: by 2002:a05:651c:1546:b0:2f7:5b47:ac1f with SMTP id
 38308e7fff4ca-2f75b47aee9mr60260481fa.29.1725958193283; Tue, 10 Sep 2024
 01:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240910072006.3938401-1-ejo@pengutronix.de> <20240910072006.3938401-3-ejo@pengutronix.de>
 <CANNYZj_zpBOjperL-mxO+D5rEM768Sed8VFohUkTJbnR6piDNQ@mail.gmail.com> <4f6f8ac030656c18edb7972c5d8e6f0574683daa.camel@pengutronix.de>
In-Reply-To: <4f6f8ac030656c18edb7972c5d8e6f0574683daa.camel@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Sep 2024 10:49:42 +0200
Message-ID: <CANNYZj8nzNzpGRqqSkYtKEuxu6hbBapNQSGkMh8HjRUVLb7GsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 2/7] barebox-tools: add initial barebox tools support
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 08:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204343

On Tue, 10 Sept 2024 at 10:45, Enrico J=C3=B6rns <ejo@pengutronix.de> wrote=
:
> > Can this be merged into the main barebox recipe? Does it need a separat=
e recipe?
>
> not only that it would complicate the main recipe (we had tried this befo=
re), but I really see no
> point in doing and supporting barebox native builds (in contrast to bareb=
ox-tools).
>
> And some of these tools might also be useful without using barebox.
>
> I guess u-boot-tools is separate for similar reasons.

Then you should put the common bits into barebox-common.inc, same as
u-boot does. Also there should be a good DESCRIPTION in there. Why
barebox, and not u-boot, for example?

Alex

