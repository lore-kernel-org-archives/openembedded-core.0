Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web08.19863.1608439620145699425
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 20:47:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=leCqdWqn;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id 7so4558996qtp.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 20:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v5ulVavpC2hpn7rxzjxJm+A2himKxGFXiuJLZJQ1Frc=;
        b=leCqdWqnnMunbnQ2PfkgX6llP9WifvauspJZNC7Dj3O+HuRBGEf77LMjX3RCL81v/s
         jeLdOHjZpSFQ6HFJNo4T6C4ugXaGss9QV/xcNrkEAmtkP8Rfl7ko4LiRaRV5ZmitOBo3
         XfSkPHw9d992+IeepGp0oEdj/7az+Nwt0slOBcxPqSXUtFHvS7TnjYzH3/49f3olmYlc
         Cd2q9TB4HGYoK4tBkfe5AsjTxwnw818IknSFkqW8aOb8z0j3gNozQ2wWyswBhOSoAy5U
         VN0Og4NctxD9WTsdnIfRGbcRtTmTgjZNJc16tFUEUAuAazcQl3cL6XclcpoDym2Z1cVb
         fp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v5ulVavpC2hpn7rxzjxJm+A2himKxGFXiuJLZJQ1Frc=;
        b=r7hhxbeLnCGL4Sg7DmUtWgrgSqQmljNpDQgscE9mwxxdaVsmqVq6rE6mB+vHSfACSZ
         vF0KUTLq3vE9wKfWcrZupeeh39RxzQ/ZQkOdYWGlX0M/dxHZDyxiUt54TzZouILdhBeA
         ApFJv6FezGeUeCzc8ABYAkMUgFp3KDH6c7KvETgWdQ3JjQEKLoCH0zeJawQejz004Anf
         /q0A4s72Pe3R/wLLLomNEq/pvDhmjyweHhKN8l4lELk/Ea298wTXdCaza88iY7L1M0iX
         ezRupkgwsZyymAgB3e5adIuyQEIP6HKf4IX990R4NOENea67jsrokHDVBZ9QaiULRY48
         I9Dg==
X-Gm-Message-State: AOAM531DjPdV4ZSEd32nyAQJ3ITNjP0eLa+/2qs1fN4E9iRrdt3AGmGd
	BQpZEnSs/hTeLEmyO4/jZ2Phb6fxFNO6nYuyHcQ=
X-Google-Smtp-Source: ABdhPJzHJicLdh+IkLLuB4pZJirvwn3Sbh8afE8Y4mZ7Jj4lija+DX1Xk9wRuxRB2XunBMFiF2OlNGp9gOO486hPYLY=
X-Received: by 2002:a05:622a:1c3:: with SMTP id t3mr11641771qtw.378.1608439619271;
 Sat, 19 Dec 2020 20:46:59 -0800 (PST)
MIME-Version: 1.0
References: <Groupsio.1.uzea.1608323419985389915.mRo2@lists.openembedded.org>
In-Reply-To: <Groupsio.1.uzea.1608323419985389915.mRo2@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 19 Dec 2020 20:46:33 -0800
Message-ID: <CAMKF1sokjzyb0kPZ1tmb1Anr5kD8GPZtVeoeWoWkqSYG=16a2g@mail.gmail.com>
Subject: Re: [OE-core] How to set the password Hashing Algorithm for root user to SHA256 or SHA512
To: Sourabh Banerjee <sbanerje@codeaurora.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 19, 2020 at 11:58 AM Sourabh Banerjee
<sbanerje@codeaurora.org> wrote:
>
> [Edited Message Follows]
>
> The image I generated seems to use MD5 for root password hashing.
> I understood this from the /etc/shadow file in the image., the file has following line:
>
>     root:$1$b7X30f8f$au21weqL.9.ExM4N84AtA0:18614:0:99999:7:::
>
> Is there an OE config I can change to change password hashing from MD5 to SHA256?
>

somewhere you must be setting the password something like this in local.conf

EXTRA_USERS_PARAMS += "\
    useradd admin; \
    usermod -p 'XXXXXX' admin; \
"

Now how you generate the password could be done separately via

something like ( for setting password to me 'test' )

python3 -c 'import crypt; print(crypt.crypt("test",
crypt.mksalt(crypt.METHOD_SHA256)))'

Replace XXXXXX with the output of the above cmd

aside from this its perhaps better to use sha512 than sha256

> I am using Thud version.
>
> --
> Regards,
> Sourabh
>
> 
>
