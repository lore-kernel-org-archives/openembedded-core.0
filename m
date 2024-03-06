Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3F2C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 19:21:44 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.3008.1709752894957975251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 11:21:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mD+w8dix;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6e4eb1ec4e9so62372a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 11:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709752894; x=1710357694; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BV+FfABanjWjozToEdb5jkdSUwI15VHe+5srtOVG/2w=;
        b=mD+w8dixpvwdNyEqQYacL52uIcZzkDJwp8SXFc6pqICD3X8y2yl+ZoX320ZVG1FdCf
         9gJfXIrmmzJIOQ7aPSROgeiEcQp+iaNTsvYSKGQsAMbBu9Vr0EpTmf178QKXZ4gPrKwi
         bcV/3WAaQSXwYsvHrACZy+I96GA1CjqXsJHCvjc57+H2kZ+yTTEKx9RzwWrDCx5OToyA
         wdJTEarTzk1NFw4UAngB7alWwPCExElfOChgYp3Tk4ojc8QK3riNiWGUMIoMs2khmKhn
         7FRnZll9rAWKuGSWGHUq4KbANZzU0dh/W9bKK0T+1BvH+OloGG7tu7AEVQ2tBfrZWRK0
         XR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709752894; x=1710357694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BV+FfABanjWjozToEdb5jkdSUwI15VHe+5srtOVG/2w=;
        b=kb5lWgKJqHOTM3FbazRA9BHVUdrsTY35SaEWhMxR8D9ganBf2TxMd1oJAbJ8ZgNNzQ
         1HpdWaxn2lF5fK5KX63ICNv5QhqaFp3b/8O+kaHFUBtgTL80VJYpV0ulAxTfm+Nngc/i
         3Hy1tCWrAOcbQUyT4pvPrOriwYhjr1IrGDYT8kitWv41j5KIbp05ArpQ6QJgMLhbjS1M
         a2dWE8u+2fEHt1488yoTXrqTy6JCvcaeuNk5FrU3YMSUk/JXaLuhDALxQzNswKGg35P8
         raxCDgRTeZqDa5R6vHhGtkXl3xEcUgXFgzqhMuRZMC3FShfKrNPH/Gdyduijv6bijF25
         OZjw==
X-Gm-Message-State: AOJu0Yy3BcUOtVoXIGNXaWRUpTN7zkSxQiYxw8H0dQ4riQnAv5VNJq11
	KkASefj9T1YyESKEX0f80HxrfWtk4mCGra/s+gc45vzUxTNq4ThMqxcWiA/cwg48d/2UwsGAvGZ
	LNsGITxvF03GtxrVi5ebo0bS4mzqWUlAf7qg=
X-Google-Smtp-Source: AGHT+IE1GJlWo1W2D1gPawvGswNQZH77jCJ3VxN30/UIXyk5YyfvdO4anRDNUWz7z8GUwELuNiFezhFzLIqlJ6gResg=
X-Received: by 2002:a05:6870:961f:b0:21f:cd9a:35ad with SMTP id
 d31-20020a056870961f00b0021fcd9a35admr6262030oaq.41.1709752894202; Wed, 06
 Mar 2024 11:21:34 -0800 (PST)
MIME-Version: 1.0
References: <92123ee8-5896-cdf7-cb6b-4b6e754d32@crashcourse.ca>
In-Reply-To: <92123ee8-5896-cdf7-cb6b-4b6e754d32@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2024 11:21:08 -0800
Message-ID: <CAMKF1srb=83wQeHwX5cDcZDtjb1k1AUOSt0MJm2R3fwi4h54-A@mail.gmail.com>
Subject: Re: [OE-core] if "bitbake-layers" HOSTTOOLS fails check, does layer
 fail to add?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 19:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196753

On Wed, Mar 6, 2024 at 6:11=E2=80=AFAM Robert P. J. Day <rpjday@crashcourse=
.ca> wrote:
>
>
>   was just handed a sizable YP/WRL project and i *think* i can see
> what the problem is, so i'll keep it short (he said, optimistlcally).
>
>   the symptom is that, of the dozens of layers that should end up in
> bblayers.conf (all this running on a VM in a docker container), one
> layer is missing, and that's the one that defines all the distro
> config files, so the eventual error is:
>
>   DISTRO 'slartibartfast' not found ...
>
> well, yeah, and that's pretty clearly because the corresponding layer
> is, for whatever reason, not being added to bblayers.conf. so why not?
>
>   look further into output and notice that, just above that, there is
> an error that shows an essential tool cannot be found:
>
>     ERROR: THe following required tools (as specified by HOSTTOOLS)
>     cannot be found ...
>         snafu
>
> and, sure enough, the missing layer does insist in its layer.conf
> that:
>
>   HOSTTOOLS +=3D "snafu"
>
> so i am assuming that, because that layer was being added via
> "bitbake-layers" and that layer had a HOSTTOOLS requirement that was
> not satisfied, that's why the failure of the layer addition, yes?
>
>   just to bypass this issue, is there a bitbake-layers option that
> bypasses that sanity checking? i can see "-F" but that claims to
> bypass recipe parse verification, which is not what this is.
>
>   this all depends on the assumption that that failed HOSTTOOLS test
> is what caused the failure of the layer addition, which cascaded down
> to other errors.
>

The layer is expressing that it can not work without that tool, maybe use
HOSTTOOLS_NONFATAL but if it is really needed then it should be installed
on host and prerequisite.

> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196680): https://lists.openembedded.org/g/openembedde=
d-core/message/196680
> Mute This Topic: https://lists.openembedded.org/mt/104766066/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

