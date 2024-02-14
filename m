Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183FCC4829A
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 06:31:20 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.36225.1707892278543007050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 22:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GWpeRNP5;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d0d799b55cso64286331fa.0;
        Tue, 13 Feb 2024 22:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707892276; x=1708497076; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwDg3LtLhx8D65LSKvsTb5HTlfSl8EOfteQruf2zA38=;
        b=GWpeRNP5n5cfQTAg2mqJuh4fdiR7NnpZEPIjY/UuEXvrRfCe5DysiyATFBqISDFKRN
         krH3GYCnEPoLZmDNRwInowh3Yv7U5gDfBFH7hM24Ditvrx4Atn2KFe80+9hooN2+qzKi
         MT78+JBLD3CSric7KUKihvqMR1JeGpm0/h2UPR/e6kwKnIUN1TeC4Sx3OJGFMEbNPZg3
         KWNn4he/dkInCCf+MThsiy4p2Wf+N+KpYzZCgLFNNC6KZ1wDh+I24KR0uk1cmCVMic8f
         qbb3APt90Hnx5rNt/DsTqbXR+YjKb796SLKAxyZMqh0j+r//pOgwrh64AlQDb2UW17La
         mMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707892276; x=1708497076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwDg3LtLhx8D65LSKvsTb5HTlfSl8EOfteQruf2zA38=;
        b=uxSjHydNZXhv1PVAtZe9Zd5IoFECoI8TRsY8QZUz6wq9nLDG3I2wuISSOT7hgEe6Km
         v4rguGDeAGe+cCk6rMTi/EIc/575D/Hsm8mSqHdbir80L+5sogFN2JTAhAwOJtFHcXGw
         ULaxqbTzgTYdkIaj2Ld7Gey72JHm4FRFaDjh6TmkbzDSP0lfle7frjruanqwr0eloiLT
         PlXKD7mfETr20tBhFnHtIx9TAK6QKVEpP2UBwdvODYH5kOtwBnKgPIDffK5Bgp7CTB4+
         QtzPLwzeOOql+HESG+52y9nhnKSaj0QF15jKbq4yIUAlqy+iPcGQqdj4qANaaAcsCEFJ
         T/UA==
X-Forwarded-Encrypted: i=1; AJvYcCVQW+QlpWj0Go2s1HzoEyrjYjCj3iEwHAnWqcb6D2wlcW6S1kQx+lQV+RjL8mAUuwMQOI2TKJ6AsMD28kNXbHOzTZyp031JBjrHU0wpnct3bZP5kv7VmlxFJ2ZRboSolypk/4T7fJkzpLqiTrf/abnE1VzN1s15gO3WQ7HQQZfBNe3VFX8PsVZYr1M=
X-Gm-Message-State: AOJu0YwBecXlFd8LaLmqV2Miam7LSplMSV9v110opPcrm8cS99CAQyP7
	c5XoRSrzdWn3FG8FkhvYHaUsslaWHgeJvgb4e+CsLp0nlYIYYc98F6lEXIhF7Wwqc7s863E4rnO
	FGY/5S0N7jdYnLffpR8DXHVxfv7o=
X-Google-Smtp-Source: AGHT+IGAi5b9ldhnB8anFvssA/zL/7G5au85uaAP7vq42Gbq4liEP51kZeZzYV3qin6TwxtBWrcf7PCNJiT8RaSCCQY=
X-Received: by 2002:a05:6512:55c:b0:511:830d:c0a7 with SMTP id
 h28-20020a056512055c00b00511830dc0a7mr1248406lfl.45.1707892276321; Tue, 13
 Feb 2024 22:31:16 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <17ACA59E7A7FD97B.16230@lists.openembedded.org> <CANNYZj9X5qRSup7i9S=rtRpwo5nCNHp8VJOZAuvu5JzqhLYD_g@mail.gmail.com>
 <f1c9d0f8cbf8ea1972aafac0c29690ca400178d7.camel@linuxfoundation.org>
 <CANNYZj8tyOy=z3L=uM9L_R8uP6eZSUkYXm9BwvsU+ERpE9QcZw@mail.gmail.com>
 <018185898b86e2fccabf68570a6aec6039a0c6d6.camel@linuxfoundation.org>
 <CANNYZj_UMqZe+hDs2RzOPaLZzRmyg=8X74+HCwytN5616jZgNg@mail.gmail.com>
 <e26e53be93a4f34b75e3e66becbaa4c6ac15133d.camel@linuxfoundation.org>
 <CANNYZj_GFnmvmYRNGBFkivTNY7Xi-Ok3GoDEJ7+wO3A=fW3JQg@mail.gmail.com> <CAJdd5Ga9nd+smcy2426QKTEF1nOPQhqOLpXrFmb0w9bb4Cov4g@mail.gmail.com>
In-Reply-To: <CAJdd5Ga9nd+smcy2426QKTEF1nOPQhqOLpXrFmb0w9bb4Cov4g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Feb 2024 07:31:04 +0100
Message-ID: <CANNYZj8ZD55bwRaZB-cX5SmktFU2Z-3VTVR9dkzoiX9XKv5wjQ@mail.gmail.com>
Subject: Re: [OE-core] Core workflow: sstate for all, bblock/bbunlock, tools
 for why is sstate not being reused?
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 06:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195451

On Tue, 13 Feb 2024 at 15:29, Joshua Watt <jpewhacker@gmail.com> wrote:
>> Yes, but I'd like to replicate what bitbake does: check configuration,
>> start the local server if needed, and only then do the mass-import
>> from the file.
>
>
> Sorry for chiming in so late; I think you are on the right track though. =
Exporting/importing bb_unihashes.dat is the think to do instead t of the en=
tire database (which you may not even have if it's remote). That should at =
least let you reuse any sstate file that is in that file. Importing the dat=
a as the new cache is (probably) fine and the easy first step, but be aware=
 it means you probably won't be able to find equivalent hashes that are der=
ived from the imported data, so you'll be looking at more rebuilding than y=
ou might expect if you change something. Reporting the hashes to the server=
 might be an option also, but I don't know if the cache file has all the in=
formation to do that correctly... Have to look
>

Let's then pick only the low hanging fruit first: add 'bitbake -S
unihash-cache' which reuses existing api and code behind it (that was
written for esdk). 'Importing' it only requires placing the file in
build/cache/ on the other end. The goal is to get to a working build
replication tool that can be tested.

Alex

