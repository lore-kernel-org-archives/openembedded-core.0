Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E91AD5B86B
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 19:40:40 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3451.1765827631452390984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 11:40:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fHA20y4X;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-450823a7776so2498340b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 11:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765827631; x=1766432431; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hBEVWtzWTA6KmkI9TGmY7zzdRtfDdgwOrTz9VKsa0kk=;
        b=fHA20y4XcMxvl698MVMCc0DoKpoYNxMe7gWEncq2taG87KiBDOB77bbREKGwHK443V
         Ri9Hb1tazvHgB3UP9eyW06Ah9gUaZz3zC5X3xF944pahhz2ha80getyWX/6JRvGfwbzk
         3ggac7ZmbfuQGo7PfVj7GQvJ0cEF6UazTK0nQt/iUtd5Ua4IRIXBGppKBrG8g8xR6t9p
         LaSQ4FTRVTWUG/tQJI84y3JJaZ18inDMTxYKwZwwYSEmn0rKOR//QNfxu9LN7XY+aXsW
         s09YtURZw2xqJ62wUw493YCj41vI8aSMtp5+R72Al9RWMztg/HZiSCnQVZ95o/r+K9US
         nCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765827631; x=1766432431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hBEVWtzWTA6KmkI9TGmY7zzdRtfDdgwOrTz9VKsa0kk=;
        b=nXtTsbCy8BlmCGnHspz2rFOKAWexgldYXfeH1/YgCQhh+8SvFTHGaksI6A5nSApf0d
         NiqZf8Tcv8Qt0XHVq1za2q/p78PXbNpNq9K4wW0KItDrOz0IxJj2hoac68pFqzpyOsht
         WVqY5I7akrxx/j03Okuz+kJfda5xLhk3jKnqEeqgke8nXBzvEz3bA1Dj3dIByz7M5NTE
         537vFKCSq11ZN4liV1TGtvBodgAADjARSDtbV8aMKtKqUlrKKxkg1Jco7vlDuhSSrOfb
         7mZGC/zsXDk7g62w/2Nd35zt1SuAbO+Guf+xQtZ7f65X08gjWSwGQmxWBRXNywJcqdN+
         goPA==
X-Forwarded-Encrypted: i=1; AJvYcCUHk04dDHFS3GF6hHI9MpywyLOdZUcZaBZ+Tywxga5PDYXCZCCC4ZhJWYF/pzZLq5m8fAFsQO/OmEFcV4xkFkouiA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQgGuxSdk6qBW6FRMQEhbIweUhP01FgNtdARBMeh+ofDJV5kZN
	51T8uMRAHdfDenqjkL3/Wpwy5D10o+JLepkNIvkBHfLP5kzp6M1MfZhEMc9MgSuikZ06g4uHZCr
	4K7qMpggLtU7XDtau8erwhrNbzx1W6Fw=
X-Gm-Gg: AY/fxX7fMW6axezBeSlbzqjBFjpkqazF3GJ5hQpE016e4OgQ9brbiXn1dYsAdT9kjJB
	ZCEDmvaRbnVbVBxLuTHysBlGy2aC8ucqjclRXd7lveyKg6E9goVyRt5tUP/WImhyOpY+DqFPz2U
	3lUBkADzQn+4D+9CugG2DQLUNy9/FsHEa0YOWbH1EaAji2Vcht8U6CmLkf5pOJYrMs7l2k09Kjk
	UC0/SKCZvHyNPrvewJH4gnd3hLKH142llySRGa2BEvpuCSJHXwlv7P624Oo4NUx4F6jxQ0srg==
X-Google-Smtp-Source: AGHT+IFfarMh/xEJ8Zb45+4LAGyHKnHMzQobIAjRtASV6CcnwaneDIb4EuLWGXk3Y0uODlJZcxdbAN48h3jaFcfsxxc=
X-Received: by 2002:a05:6808:1b21:b0:450:794a:6cee with SMTP id
 5614622812f47-455ac85f34cmr6136924b6e.21.1765827630687; Mon, 15 Dec 2025
 11:40:30 -0800 (PST)
MIME-Version: 1.0
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
 <20251213095931.2571498-66-ankur.tyagi85@gmail.com> <1ed25eb81b19a2c92bbb2d802fccc2afd15a8ace.camel@linuxfoundation.org>
 <CADySD0ELk1D35KYVsraUy896brQjELFvH+0ng5dq1z2uWG4J8A@mail.gmail.com> <CANNYZj-G5HsU4y35b-gRfqtoxFPxc+P0i7PA64WaMf4EhRiO=A@mail.gmail.com>
In-Reply-To: <CANNYZj-G5HsU4y35b-gRfqtoxFPxc+P0i7PA64WaMf4EhRiO=A@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 16 Dec 2025 01:10:19 +0530
X-Gm-Features: AQt7F2qR1TeeBb1743gTXixcO5f08-UAj1k32Vn_ysE2yRSljohoAoCeDAUeJgU
Message-ID: <CADySD0GVyePJQmQ+ap5amtyuHSOesG=X0JbvMDWBSp+dDqdsxg@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 66/67] mesa: upgrade 25.2.5 -> 25.2.8
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 19:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227754

On Mon, Dec 15, 2025 at 3:39=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Sat, 13 Dec 2025 at 13:44, Ankur Tyagi via lists.openembedded.org
> <ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:
> > In case either of these patches is not meeting the criteria then
> > please let me know and I will re-review it.
>
> The criteria are described here:
> https://docs.yoctoproject.org/ref-manual/release-process.html#stable-rele=
ase-process
> https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_Patc=
h_Acceptance_Policies
>
> I too think you need to trim down the patchset significantly, and send
> bug/security fixes only. You can't expect stable maintainers to filter
> these 67 patches for you.
>

Hi Alex,

I certainly don't want to burden maintainers.

Will review them again and reply to individual patch mail mentioning
whether it should be dropped or share more details about why it should
be accepted.

cheers
Ankur

> Alex

