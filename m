Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web09.1323.1619031213993796432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 11:53:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lnC2LnSx;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id a5so11928238ljk.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Apr 2021 11:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q7pUCwTG/fY2BD/QVT7u60yYwj7vlG9fdod8iVVlu+I=;
        b=lnC2LnSxM7RoB+g5vWItZxXxPPXpOZTjXTEoamI+QahRUatJ/7z5CuTsz8j/UwOZX4
         qsiWYBbeXPi1B4cgVpIiDj5kBgcRAQwe4sSO43NW0+xvrwcDahuHYQlA203rNwApSk3y
         p2M0oGzxBZQ4PaGh2UEUwN9+xVO3FQcqQlrA1gSGXYCUkcBbg3rVaD48LpKAjqyI+GDj
         awwaU70MNaj4LESWtlG5PhHnwKSfnnuZ9J5iyAKp4FjxK93gq4RaWyabT27TGHpAoQUo
         JroQiBSi7svKARPEylS9Rdxa7f06FvuXoBNeMbE8iNR7jcZfR4iQ2VUnZ1rmKxiU953E
         xUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q7pUCwTG/fY2BD/QVT7u60yYwj7vlG9fdod8iVVlu+I=;
        b=dxxiEVewHCXqMkAG9T5hXaSkTFJ0vCIGg5rXUlew+MlZUS40stm46KJS3uAQmNxMeV
         4zeL7oE2YWUJ4Zd4U4K2SSA8a9TgEHp65QD82AtEIowOpoN1tKlQKI0kdDHiVV7UeUCF
         MBYQFSidVWtsdZ05pOZMqdnZRfygmP5ivHtLbUrB6H9WSPPvwWBvlhPu2NfGMpTD9rea
         ILQEgRZocQvZE2yt2bRDC4VMEuR62g8czBlCURwZlTrLW1L7+zwwDBxFrFoz7udl5ZcA
         2j3HQ8P9Bbn6MGteW/8DwbYmzE5EORAo/SKIv++4+5U3bRf2bmZ8RzDSSxtISBa7Uk20
         tNkA==
X-Gm-Message-State: AOAM530F5FWsZDUkrpx9UKX5riLcohETx2kLd8CqYL1GqUJsMBm7mHqF
	+xZ+oD9JzEI2alWpil7Pa5OClnr9zdJDzSAshuo=
X-Google-Smtp-Source: ABdhPJx4UlvKrkhd6hL2auBInpYMjm6WCMDDNk/4QDeOg++h5QlvAPUdyXbKGn2Y9c61FmJbtA/gKSsLqlmb24Aj2FQ=
X-Received: by 2002:a2e:b88f:: with SMTP id r15mr19581037ljp.432.1619031212155;
 Wed, 21 Apr 2021 11:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ86T=W1995MMCUqA9pjWf=DVp9ws+Dpq7kPttksfOUNPT2Uyg@mail.gmail.com>
 <1397.1618996934194619727@lists.openembedded.org>
In-Reply-To: <1397.1618996934194619727@lists.openembedded.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 21 Apr 2021 11:53:20 -0700
Message-ID: <CAJ86T=XTvHcuH4ZrP+JHy1nP=TscjzwcgOtSxH-DZV05em-38w@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] [PATCH] busybox: use openssl for TLS connections whenever possible
To: Shachar Menashe <shachar@vdoo.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 21, 2021 at 2:22 AM Shachar Menashe <shachar@vdoo.com> wrote:
> On Tue, Apr 20, 2021 at 1:46 PM Shachar Menashe <shachar@vdoo.com> wrote:
>
> Last time we talked about this I thought we would need to change something in openssl build settings to make the openssl binary get built just for this solution, and that was what got rejected.
> But actually now I see (or perhaps it got changed) that the openssl binary is built anyways, in any build that already relies on openssl.
> So my suggestion is to enable this feature. Like I said in builds with openssl it will make everything more secure in a transparent manner, and in builds without openssl it will display a warning just like today.
> I wouldn't consider it a hacky solution since this is the official solution for this issue.
>
> It's very clearly a hack. Maybe it's the "official solution" for
> supporting https with busybox wget, but OE has a wider scope - we're
> not limited to busybox wget if a better overall solution is available.
>
> This is also exacerbated due to the fact that there are no other alternatives for secure download from CLI (ex. the sato build doesn't contain the "curl" standalone binary)
>
> I don't see an issue with adding curl to any OE reference image which
> needs an https client.
>
> OK, so do you suggest adding curl and removing wget? (that would be a patch with a configuration change to busybox)

Yes, sounds good to me.
