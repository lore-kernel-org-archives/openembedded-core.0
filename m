Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.5611.1608115207750630547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 02:40:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=DdipTbR/;
 spf=pass (domain: burtonini.com, ip: 209.85.167.46, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f46.google.com with SMTP id l11so47133905lfg.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Dec 2020 02:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DrCwTkvhecpQ6VEvLvqxXCRcnDoAWGdNfID3I8I2XC0=;
        b=DdipTbR/DdIZrjPC6Mr8DGhhkc5+Y38YxDEIEbfW5jZHvsJPUBFtyZAgc1gB3bKdF2
         vkGavX3PLNsfVFj+61EkTv2gOwJImZdzS7uHbDQxAeN3Ry9qcr7DcQ69bPcyMfZDnGrf
         ecx6tvM6kHaUX3WxU9cOH3QvwgKf7O+eCh+8bdKMvEpTjabgYNnj13JbWOuiFksJTN4T
         MkaHnGKoXC5lSbsAZYv9Y2qep4L0W954UkfsK27l46DU8osevMc9Fgj0VfJnPlXSl2cY
         y6TyRKnZptamjmXRHTOnRbNaJM5Svp7i/3ME2DQ3/pyLkop5qJechC3e6206BHMqItuO
         S7Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DrCwTkvhecpQ6VEvLvqxXCRcnDoAWGdNfID3I8I2XC0=;
        b=GVT5aW5Uu2eaFCvi6Fw4ZqdNa3JoXYpDVzwV+YUjpSMJI5uiR3f2LaCySXsNYLDCCI
         WnuyZ8x87O+QNMUvkVGA3MxRu0ly4k5e9p61snH44Z5vBfw2A22QDjnNtUkqvw6LRYP1
         sSoLbzIPainyzcgIvyaTBOB5J/rClWOK612d42d/bVnQUbJGL5yGiarcIMDpXw3zzpWX
         9xnKc/D1RZDKtKqTlQF+NrXMoO0hTq2G+BRm9/HoibHx6nH2T96864/EPWpMzsecS04C
         oVInnSo98uzQatlBEpTd2TELOjhb6gA63EgUNEvhom3LxMhSM1MriYdUZMM3kMqaF6dq
         0hyA==
X-Gm-Message-State: AOAM532IYLNPc1qRwfqNhiXgiA5qfqF/Fg+dVc9zdp2tgAPWvylFClB9
	2+ddU5JusyWQp31nEY22wJty9p+S2tO20FucQmJI9w==
X-Google-Smtp-Source: ABdhPJx2CTyMtjzZtEqpCDrkcSjldnfbORgpM/qSp0k2DHY3NvcDR9rxN/2tukKeA/OjpmU7DQnhxeplF/Ybde2s09g=
X-Received: by 2002:a2e:8844:: with SMTP id z4mr888446ljj.412.1608115205610;
 Wed, 16 Dec 2020 02:40:05 -0800 (PST)
MIME-Version: 1.0
References: <20201211160922.4125554-1-ross.burton@arm.com> <51192976-54f1-a6dc-6be0-0780c3006338@gmail.com>
 <CAAnfSTvfQZWGXCjduUU_1M4ae=vnmqLO95JBsS-ZeNrHf6KbEw@mail.gmail.com> <09e9d4fe00cf8d42f3bb9cef83ae0988452df050.camel@linuxfoundation.org>
In-Reply-To: <09e9d4fe00cf8d42f3bb9cef83ae0988452df050.camel@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Wed, 16 Dec 2020 10:39:54 +0000
Message-ID: <CAAnfSTuEtACqZ1paX9FSBh6o0rHBco-uzfv91vJHg=r9pLGfmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: set COMPATIBLE_HOST to *-linux
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Dec 2020 at 23:09, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > Maybe?  Depends on the matching in anchored.  If it does by accident
> > then explicitly matching would be better.  What machine has a triple
> > like that for testing?
>
> Most arm machines I think? :)

Only old ones, which are dead to me. ;)

> It is unanchored, something which I have to wonder about. I also don't
> like the overhead adding COMPATIBLE_* adds but I guess we just have to
> live with that :(.

So prior art in meta:

meta/recipes-core/systemd/systemd-boot_246.6.bb:COMPATIBLE_HOST =
"(x86_64.*|i.86.*)-linux"
meta/recipes-devtools/dmidecode/dmidecode_3.3.bb:COMPATIBLE_HOST =
"(i.86|x86_64|aarch64|arm|powerpc|powerpc64).*-linux"
meta/recipes-devtools/gcc/gcc-sanitizers.inc:COMPATIBLE_HOST =
'(x86_64|i.86|powerpc|sparc|s390|arm|aarch64).*-linux'
meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb:COMPATIBLE_HOST =
'(x86_64|i.86).*-(linux|freebsd.*)'
meta/recipes-devtools/valgrind/valgrind_3.16.1.bb:COMPATIBLE_HOST =
'(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'

35 users in total and none are anchored, they all implicitly let the
expression match -linux-gnueabi.

Ross
