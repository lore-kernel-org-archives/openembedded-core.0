Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.29898.1598564390302830466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 14:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RhoslyrV;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id n18so5908462qtw.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 14:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hv49CM3sfz7Ii+tl3lD2a3w6iMJ+woKYfS4zXDmDE+w=;
        b=RhoslyrVp152Hu7I0gGO7kOA6mbaIf7u3kvWTcDB1zzV+a1s/Et7PhW7H2hgr71ZJD
         dVhd942fxFeH2QpPJXvcxxA2gte+5PhZydBr+glxzwiBvHoazanbs4+xoBPe1ilxVnO7
         jC8A18VZq+MP3SEzpPTZIMl+VEpixczL5v9wV++n7Q5l4AAWA823rFX/5gtZFhjBFKya
         jFyqj6FbZH4kr3EmfAgDDhSw3r6vLT+02n4i+MiylHuL4mUs3q3JOlikR1RhG7gGmRB8
         scVs99kJGsbOuB56bhrzgysmhGo4xfYksn3VTxYhK4oumUwUsbQSKv7cZBFFcbxC9xFj
         sMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hv49CM3sfz7Ii+tl3lD2a3w6iMJ+woKYfS4zXDmDE+w=;
        b=UV3GZFLBsBAkotseF3+tt5/d98XhR+aj9wmCJ/hh9EFTEnrvBh9SUdxXpkEiIIT2+y
         lcR2svg/rcG5OZKOGa85fQDjGrN+LJgOdGovYXCtfTCmDa3E17G4CVJz76x5Gr3owqNX
         OmiKn293yGjgHd0omoNuMYnlwKY8GAE3/ePj0xfeJhxwPf3SBmiLwNl33Q4Oax1806tK
         UUJlBwKqPLFplTACkegZ9ArN7pIh3LM3qkOeIvZVkG5goaI7ImsjUPB6AT3h9nRbMRN2
         Kdj60m670hLYO1IsS59nltBHs8DTZJ/CaZgs/8c07df9S7euO/slCs6IN1a6AqtXQfZq
         AZlg==
X-Gm-Message-State: AOAM533NQ11BuIFDFvOQii7wKKObqzSWNQcUbz/4hrDxzW5LEJnue9In
	dfB09Kvg5utIYVA4cePcrgV4mE0WSbnzMj+IWUM=
X-Google-Smtp-Source: ABdhPJz4Srk2iAh7HnU1//4BnddqsEcm0dgj+T85W6vrkQxe02eCZVNpm+ZDns7kHjAgIO6lDlq0pgQOFwv64SgNPlM=
X-Received: by 2002:ac8:4d0c:: with SMTP id w12mr20402865qtv.194.1598564389422;
 Thu, 27 Aug 2020 14:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200827105933.3575-1-alex.kanavin@gmail.com> <20200827105933.3575-4-alex.kanavin@gmail.com>
 <CAMKF1sp8-t1KascRyh9KF3zYM5-3BDWcPHB-hQJ5bVZDCyaBuw@mail.gmail.com> <CANNYZj_COviOHYu8bgbOhfrP9xOzc8UeDdOP+dPxj0BNdKnqpg@mail.gmail.com>
In-Reply-To: <CANNYZj_COviOHYu8bgbOhfrP9xOzc8UeDdOP+dPxj0BNdKnqpg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 27 Aug 2020 14:39:23 -0700
Message-ID: <CAMKF1soU90C1e9a+KRCWgHhP9bbXQ1P_eDMU9oOvD4ju1fwPUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/6] oeqa/x32lib: rework to use readelf from the host
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 27, 2020 at 2:36 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 27 Aug 2020 at 23:31, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Thu, Aug 27, 2020 at 4:00 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > It is difficult and error-prone to ensure binutils gets
>> > installed into target images where this test may run;
>> > on the other hand readelf is always present on the
>> > host, as it is a part of HOSTTOOLS.
>> >
>>
>> this would mean that we are relying on build host provided binutils to
>> be compiled with all bfd support
>> since now we also have aarch64 build hosts it spreads he risk a bit
>> more. maybe we can
>> ignore this test if target does not have binutils installed or depend
>> on binutils-native for providing readelf
>
>
> The test needs to be explicitly enabled, and requires a very specific build configuration (see config.json from the AB); it is unlikely someone will stumble upon it randomly.
>

that makes it less frequent but the logic problem still remains isn't it.

> Alex
