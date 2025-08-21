Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E48CA0EED
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 01:09:25 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.1180.1755738557620794661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 18:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OoLLVcv8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.174, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3354a8790c8so916881fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 18:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1755738556; x=1756343356; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1L0E8fVD5xTOhb1Mc3QfYfy4wsXss3VjZtS6cG5tqwY=;
        b=OoLLVcv8vnZ0I2nKuLsE/1cI8EsBd7KAUCpzrnK+kY3DhTVFEeNxGVuAK9+M5A5Rzd
         1ITW1SUkzCU/Y0v2nv8CIdUj+jUQWypSGz9CuKLlzsPs7ApEj4gHKg0pvxH/DKfLP2bd
         jPgj0qyKC5H3X93oJ99nkBwQPwU4dZUnUg3lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755738556; x=1756343356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1L0E8fVD5xTOhb1Mc3QfYfy4wsXss3VjZtS6cG5tqwY=;
        b=qo0XEntXkymUYxq2xOa3p0PiTxDk0f5IYHTaINNosDXCobXxeQ/LKriuvJP6L8yKVq
         Red416xVCXmmlJZNFTbzDIkyqFSLux6ex14bjleqm/aK/Xcc8S/gxeyIdcNrsdRUupx4
         IUFxCdf8iqizzztNn7lvJChUAn/aPo9jSIup7rPZ1tjM+oXG3njVqKaIKZ55zy1mWA/l
         SEsf8NEXtFmkOM2dJncOzn8RznMk6IgTn1Ww+bgkKDuIWdNXbhoXQbMFzNMcoclEv6TM
         UlSxmJjqU6D8E5Iykt9DE2kBWdImH73l/B/U71rslATk5VYe70u2U0mg4sjeTAMf7r14
         g2jg==
X-Forwarded-Encrypted: i=1; AJvYcCVZYrT+Ctyo3tAauSHzFtIkDgY7lrzG5a8nN4pcZNN2GVunaC4gVMkPkAtC8hDcu80YHFEsE7JLiX4et5YC+NrQrg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxgaT0AMkFthkpXXIpCGAXn89nxdaxCa4DQhGQclWFaD6CfXQCB
	KvxxneOkAZK4miwIPG9rEQjVdC8i+zr/C1NakxOK8HRe5SepoFni/cqeIClKixL7bIPx8MkKGoE
	D9zpPfVOU0Qi8XE41PASYjcwrRqbUr2tUKNb7SJssjw==
X-Gm-Gg: ASbGncsxqvod/ZaenGzx4GRBBd9WXUnbyOnaWI4vcv1EO/xnXQeytVbeNR8Kr0BPWNo
	h2WLPvyPxZAWRhWY/iCRLufNvC/eM0SPGcOQu+gb3ugTBC3dwZw/U1NUeIks1HBUgefI312i9uu
	1N68oE5Cl77aNklJ4uQTYLNuRdknYNjM/83V56tMpdOYHC2nfL+g9sJLhZ2yWlU2FWP3N+qYFEE
	bT2O5G/P1fhJP/2cexQNHzyfxGqdeoAr34ACHJmpA==
X-Google-Smtp-Source: AGHT+IGFty7ZyJ2cHBs+z0zCfD1+BSkCEpJMspx2yYeFIZGp683EKkVyJ52VTYvasc0ADu7QckVeQt1og6Us8Vb2mCo=
X-Received: by 2002:a2e:a553:0:b0:30b:b956:53c2 with SMTP id
 38308e7fff4ca-33549e802d2mr1507991fa.11.1755738555636; Wed, 20 Aug 2025
 18:09:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=TZnJGDvBN8LBEoVbRcTJ6k1fGdOXVzss3bQmjZH4WknA@mail.gmail.com>
 <63a28aea-58c9-453b-9b03-3df29118044b@ibeeto.com> <CADfgfoZKuU2uMcPZFO3nMrXYJQMA66qL_b3O-1LJhWVdq13sQA@mail.gmail.com>
 <5430a536-ff40-43c3-a2f0-5df8f91d5e0c@balister.org> <CAApg2=SzTW70zZ7qbSON1=AA_Hn34r6K8vWKwiB2XFj8r35u5Q@mail.gmail.com>
In-Reply-To: <CAApg2=SzTW70zZ7qbSON1=AA_Hn34r6K8vWKwiB2XFj8r35u5Q@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Wed, 20 Aug 2025 18:09:03 -0700
X-Gm-Features: Ac12FXzJN7dVDH0AXphCXua5I8P7yOag0ObWEO2fPjkmBdh1SdMm3yoHBDuKfvg
Message-ID: <CADfgfoY5YhZo15CU3+DA0MnrGP3aRYUOi0BLqgF51_UVYyNsjQ@mail.gmail.com>
Subject: Re: [OE-core] [yocto] Renaming the yocto-security mailing list
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: Philip Balister <philip@balister.org>, yocto@lists.yoctoproject.org, 
	rudolf.streif@ibeeto.com, yocto-security@yoctoproject.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 01:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222199

On Wed, Aug 20, 2025 at 5:35=E2=80=AFAM Marta Rybczynska <rybczynska@gmail.=
com> wrote:
>
> This is an excellent question. We do want new discussions around security=
 topics, so this moderation should be efficient.
>
> Kind regards,
> Marta
>
> On Wed, Aug 20, 2025 at 11:53=E2=80=AFAM Philip Balister <philip@balister=
.org> wrote:
>>
>> Michael,
>>
>> Who are the moderators?

I am currently the only moderator. I'll email the security group and
ask for more volunteers.

>>
>> Philip
>>
>> On 8/19/25 6:41 PM, Michael Halstead via lists.openembedded.org wrote:
>> > I've updated yocto-security@lists.yoctoproject.org to require
>> > moderator approval for new topics. This should prevent private
>> > security reports from being posted publicly by mistake.
>> > security@yoctoproject.org is not a private list but instead forwards
>> > email received to members of the security team.
>> >
>> > I believe this solves the issue without requiring changes to the list
>> > name or documentation.
>> >
>> > On Tue, Aug 19, 2025 at 2:50=E2=80=AFPM Rudolf J Streif via
>> > lists.yoctoproject.org
>> > <rudolf.streif=3Dibeeto.com@lists.yoctoproject.org> wrote:
>> >>
>> >> I don't any specifics about the incident. I suppose security-relevant
>> >> information was submitted to a public mailing list. A private mailing
>> >> list may help but in the end it's security-by-obfuscation. A mailing
>> >> list for submitting CVEs is not the best choice imho. A secure web fo=
rm
>> >> should be better. We have a CVE Status page
>> >> (https://wiki.yoctoproject.org/wiki/CVE_Status) that lists the curren=
t
>> >> acknowledged CVEs but of course reported CVEs should go through an
>> >> investigative filter and potentially sanitizing first before put on t=
hat
>> >> page.
>> >>
>> >> :rjs
>> >>
>> >> On 8/19/25 8:08 AM, Marta Rybczynska via lists.yoctoproject.org wrote=
:
>> >>> Hello all,
>> >>> yesterday's incident confirms that yocto-security has a confusing na=
me
>> >>> that might cause confidential reports to arrive there.
>> >>>
>> >>> What about renaming the list to yocto-security-discussion or similar=
?
>> >>> And eventually redirect yocto-security to the private security list.
>> >>>
>> >>> My reasoning: we shouldn't rename the private list as people might u=
se
>> >>> old versions of documentation and we want them to address the correc=
t
>> >>> private list when needed. It is less critical if a message expected
>> >>> for the public list reaches the private one, than otherwise.
>> >>>
>> >>> What do you think? What is the process to do the change?
>> >>>
>> >>> Kind regards,
>> >>> Marta
>> >>>
>> >>>
>> >>>
>> >>
>> >>
>> >>
>> >
>> >
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#222151): https://lists.openembedded.org/g/openembe=
dded-core/message/222151
>> > Mute This Topic: https://lists.openembedded.org/mt/114790185/384425
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[philip@balister.org]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>>


--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

