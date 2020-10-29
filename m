Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.100.1603990712512384093
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 09:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PbtlP95S;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id v19so3753075edx.9
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 09:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CY3ZpMgdRUKFXVjeKzMlC6BDdTkd6yrukC5aD7jwsNE=;
        b=PbtlP95STMs+FTjNYAZ2b4UJIKcZ7DBUO1h65YPLjL43Bi69KeU3VIE8Kl/9bOMNZz
         EjgDk4Ou8c7jHFFI5WEAKdlHhDke0GAvM2PDuWs2AFpVI2CDzD0jfkqZTEzE7XW+oly1
         EvqMH7QkmLA2EeZYJZD7ty7QEd/11cIi0VSrAnoWOwakmVIQdkOCVUcq/0yLsohBBE4C
         +8iy5LXbjXUAEJlCqC+9K0TrVUqjk7677DcyWbundXickiXT4LkB4Z+n3YKG+q2inMYR
         xJmu39tfEWIsTJd/+xDfSJCSvJwvgdDZ3Ei4vZS8DWJsuIqOO6yEPxVXDphWU7NyJsWn
         Cxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CY3ZpMgdRUKFXVjeKzMlC6BDdTkd6yrukC5aD7jwsNE=;
        b=R2BuN7cMIAPBjl3FKwKoXAvILzXV5PiR68kwlpme4js5ZuJEIOaLhXSg5ivYni0p0d
         kQ5XJKelHQzRjxmZLxEzeZhodv8J1aJgRZJf4SVp1qlGAXP2C+T2U+qEFNflKmlrFAUS
         4DmQVQc9BbPnAWvlJeZejkKvRZsc7/7bWz2GKKv3KYJvtAUuWkV5DX0D2WWNUYdsIUYa
         GsxHxzJRWNUnax/tdVmy0/16NaLRpj0DJrV70X0DrMiv5VJgkdYC4IqoJ1/dr14sirH1
         TZdvEx7MuTJ5bHd47UThv9iWnuFwi2LEejlNPCr7gzMNYoNN6Q5I5xK3mHCHthCu1izM
         GtWw==
X-Gm-Message-State: AOAM531CrTIEH8JLE9v6qahZ1l7E6PHLD9puMhvddnI2X+XkJXf969QW
	IJX8OnWEDA3XSVERYOSpnug9w4GXYi5b8gkVK1Y=
X-Google-Smtp-Source: ABdhPJzT/gzQvqsR6+X3T9aoKFG6m7PZLdehbapxqnWoi6JYz0Ig5r/JgNi4uXlR4WS1mivOBX5N7NJKibs5+Swv8b8=
X-Received: by 2002:a05:6402:17ac:: with SMTP id j12mr4879511edy.31.1603990711012;
 Thu, 29 Oct 2020 09:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
 <20201029142806.1830504-2-quaresma.jose@gmail.com> <7ff661d33eefed532bff3a1509f23fa26cc289a9.camel@linuxfoundation.org>
 <CANPvuRmmJ_kcFWErPue-Ub-N_F_8YM=MAO7n1s2DoYhuU9fwVw@mail.gmail.com> <968b3010cd55cd630332e3f5b43014cd3c8c0a5a.camel@linuxfoundation.org>
In-Reply-To: <968b3010cd55cd630332e3f5b43014cd3c8c0a5a.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 29 Oct 2020 16:58:31 +0000
Message-ID: <CANPvuRm7MQxeXPk-FwMAS5T_VTCkMgaJtapzJGfuoh=h8Yfkfg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 01/22] gstreamer1.0: Fix reproducibility issue around libcap
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will need to rebuild and check if when setcap is enabled it will
pick setcap from host on from libcap-
native.

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
quinta, 29/10/2020 =C3=A0(s) 16:43:
>
> On Thu, 2020-10-29 at 16:13 +0000, Jose Quaresma wrote:
> > It looks for setcap in /usr/sbin and /sbin but needs libcap as wheel.
> > when we have libcaps on DEPENDS as with version 1.16 and the host
> > system has setcap binary, it introduces a dependency on the host
> > system.
> > The patch fixes this situation.
> >
> > But libcap is only needed if we need to use the setcap
> > So remove libcap from DEPENDS will fail to use
> > 'ptp-helper-permissions=3Dcapabilities' even if setcap is found on the
> > host.
> >
> > In my opinion this a better description can be used in this
> > PACKAGECONFIG, something like this:
> >
> > -PACKAGECONFIG[setcap] =3D ",,libcap libcap-native"
> > +PACKAGECONFIG[capabilities] =3D
> > "-Dptp-helper-permissions=3Dcapabilities,,libcap libcap-native"
>
> So you're saying that as long as setcap isn't in DEPENDS, we're ok?
> That means your patchset as it stands should be ok?
>
> If the user enables capabilities, it won't find setcap from libcap-
> native though will it? That is a potential problem even if its not the
> default?
>
> Cheers,
>
> Richard
>


--=20
best regards,
Jos=C3=A9 Quaresma
