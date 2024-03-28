Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E20CD1283
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 16:24:35 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.802.1711643068660601037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 09:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TWiONeDb;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1dfff641d10so9183235ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 09:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711643068; x=1712247868; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTlPDCEG0+44oA1H1nMg3gjKwoiDHtieYW9ow7zN7A8=;
        b=TWiONeDbFNa50whbdxbMCbZHI9vB9iNBSRf+Ti0PtjzguN2mIx1RKDgrh6ZDrDyuiQ
         TpSbDYANanEU5OhD9RiKp0W6/iQLCYEj8TZa89oru8jDupZYMmrf3u3eB+59zKwQFCkM
         ttNWR6MzDJtzhWOStOBq8BTtPbsjiC4g9yRJz3+gIpoUVV/uWT+kPwdXm18ANmvo4irI
         1OevUegXi/yIUXurIl17HSkMCz40dTRFzJVKrfv/Y4Sb/qH33ZfCZ4E9amKktqqMfb5P
         Bgyosclx3f8cRFAxjUu9q1Yu/WY19vgn7uhFdHNCiiVn8fhO7eylD4YPlz8ST4yv1biU
         eS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643068; x=1712247868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTlPDCEG0+44oA1H1nMg3gjKwoiDHtieYW9ow7zN7A8=;
        b=NtJf4Bicnkbd5Q/ug2KM6w3nS5aHXdB1kuWLceF3KjkHKg9gqo5KkrXvDNN7dVxLk8
         pN2oa2DVUQ0u5nkmgdvtzP5jsdNHIpJo7cfB4pAwGEL7b9SRHObGBrESpwhadeSX0tkL
         rkyHaG8YJAvvwbgoujXRxfj3kjRDp5sZGzfITpZiucqe4fLF6VBl01/PBpmSSs8qv52Q
         4tLxfoKJaYjz7sU1nYHk9yGBqHMR2328QoLx0XtAo949bpISXNhtKeJkH4LVXLEcj2Gt
         LAbICoRAv9PVVf5S0emWhLqgnFlzbGugtfoem4YZJIhkCB44KPxg8vLhibiQ/ORvfA1+
         UYLA==
X-Forwarded-Encrypted: i=1; AJvYcCXGIkR5lSjqBxRWjZ4xtu0DeUd+9sWDMvUcUPHf9T8bvGoh0SQ+kQcoqEI6YTx/FTa32KSb3lNNOz+X3+mWXW1TPy5ZSnEsy4ct7Tm0jl4perK9L/TsCNCo
X-Gm-Message-State: AOJu0Ywqu8sgLxHFDKexxl/IREIcAXcNQEcZ63lk0wDBFXM3qhrunJe1
	00Tiv8udwV3ovIeV4oQxh+xpHm6cJ31du58uNwWNDGio6w3pISVZ0D698U9MrkJtOxvRuSL0ZEj
	NIC96aDHEc3473sxJkCvN6ngZsN4=
X-Google-Smtp-Source: AGHT+IFxUz3gbQE7NUgfYkCTQQwEiXQWbrMR6llHRrBFHjsmkE205MM/EmBqR6UxDFBG+ezk5N4uC4p6KD3yRqVPItg=
X-Received: by 2002:a17:902:f607:b0:1e0:b62a:c0a2 with SMTP id
 n7-20020a170902f60700b001e0b62ac0a2mr3627626plg.51.1711643068079; Thu, 28 Mar
 2024 09:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdZ61RdORZc_9nN4RAAUbL9igYAqqiGSgoPrKf-fp_N_5A@mail.gmail.com>
 <41DC1D74-16D9-4736-BDA6-A87CB6E0FF09@gmail.com>
In-Reply-To: <41DC1D74-16D9-4736-BDA6-A87CB6E0FF09@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 28 Mar 2024 17:24:15 +0100
Message-ID: <CAApg2=SM6TYabzBhbEP1xMxT6kzjvg-5BgUb0r+qgPXtb0sD4g@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 24 Mar
 2024 01:00:01 AM HST
To: Rich Persaud <persaur@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 16:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197590

On Sun, Mar 24, 2024 at 3:25=E2=80=AFPM Rich Persaud <persaur@gmail.com> wr=
ote:
>
> https://www.darkreading.com/cybersecurity-operations/nist-vuln-database-d=
ownshifts-prompting-questions-about-its-future
>
> > Next week, vulnerability researchers will gather for the VulnCon confer=
ence in Raleigh, N.C., where an "NVD symposium" is on the agenda. Perhaps m=
ore details will emerge then.

I'm following this closely.

Marta

