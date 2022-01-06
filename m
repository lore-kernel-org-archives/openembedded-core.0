Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13EAC433F5
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 19:19:57 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.13380.1641496796670203606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 11:19:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a3H3S3XQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id iy13so3279126pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 11:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NeTi1WPC9o7+Dcn8u7XOoBr4hDGY1DZHCCrQ2HCLmCg=;
        b=a3H3S3XQGrOfIdGx2fBGek7PRgycXCx9Be8vknhSN2O7f9YvsAn5Dz+bQp/QakBWvm
         WjdMSn5hbXMRQqm/PYKLBHdBWSV//ZpPXNJ3GOsLIkD2+F9V7btvTTq/aXgutEyC6If2
         CrUV9hJTDMtgWia1hW64cIQ/Cwz7x8IZNteWqxhfzYhSNnY4QjLy9tnJ9j0JOHrQsE8l
         Y5RUI/9og1XVWQhOIEOBIoA+tN/oychN2Ym+ULFESYR+8E6C6APgjt49WsSq0P/d9P1R
         h00mX6QAhgCQlhfALyo9LOKvt3IqIauQSjWcIY5vOtHELiW0cj88ejGKCuI6nNdfjTUo
         R/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NeTi1WPC9o7+Dcn8u7XOoBr4hDGY1DZHCCrQ2HCLmCg=;
        b=z0J/OToxw5L3oZdBvHay7Bm3KyMUYHf8ILGWfGE6zdHjtjYWBokW3FAs9y0kaY77G7
         ZyezcHWZwAjBDZf6SzisTxamf+nCeKn3EoY3Ed9TmVprVLJOVowja6xrnBRxT3nxp7IS
         ja+2viiD9ghlackYv6XJ41tCihpfaCyuqbTYPzUnRCI/N1eiHrSbbJKtDTdHGD8/fkdx
         3vKoeZR9/6KHo76yAh2wn1oistRnnlVO8nnZbJkgulqfnTM9YYqyxRDIc82/94YdyM0b
         YIIuHpu4leMhmLL5F1SuLJJlKzimzETjlIIt5/H1c/nhP4vvvqZRD6ZtJHoPhlag1zqw
         dIvg==
X-Gm-Message-State: AOAM533JJvAeLKFbr2AG0nflSpfRsI3sreJEFVD+RjlFLfN0fz9SoXsc
	K/6t8E3drKRhL6fiGE5cyoWpvfVPXM+m1k/xltw=
X-Google-Smtp-Source: 
 ABdhPJxPz48S8aZe9FtJV57JvSizg+vx2ksoEjL+ak3xkmQFO7CSuF6Rf3KZtI2+1vZJseCL/FIBjUOhpEYEfjm5UaM=
X-Received: by 2002:a17:903:120d:b0:149:ab6c:75d4 with SMTP id
 l13-20020a170903120d00b00149ab6c75d4mr29554302plh.3.1641496796064; Thu, 06
 Jan 2022 11:19:56 -0800 (PST)
MIME-Version: 1.0
References: <20220106185443.3522510-1-raj.khem@gmail.com>
In-Reply-To: <20220106185443.3522510-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 6 Jan 2022 20:19:43 +0100
Message-ID: 
 <CALbNGRSOFo5MPmRhHyr2azQHg4X6MJcR5BxygiO3P0niO0ehJg@mail.gmail.com>
Subject: Re: [PATCH] libsdl2: Fix build when libunwind is not used
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 19:19:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160242

On Thu, Jan 6, 2022 at 7:54 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> clang provides libunwind.h and cmake adds a check to
> find libunwind when this header is detected, which was
> not the case with automake. The check however is expecting
> specific unwinder implementation which provides libunwind-generic
> solib, this is not a standard library that all implementations
> will provide, therefore make this check optional.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Had just started to look into before I saw this. Thanks for taking care.

Cheers

Andreas

