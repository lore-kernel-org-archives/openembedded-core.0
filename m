Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57B2C54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 13:20:52 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.35697.1710076844218221176
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 06:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zs5MIEpj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.175, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d2ab9c5e83so32587261fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1710076842; x=1710681642; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tkr28QD5VvNtKTi1PI4BrPEPlzdEBGGz9+sT46zW9QM=;
        b=Zs5MIEpjaNU/iNnI1pFCDg6rBXmH+3FhWInZY71dpaxJV9YM2WHr6RS85kJuUwomMR
         z5HqoYcLGfGwfTlzPGL0S5grBkfXUxiNfRMc2LZtHcWEKpt3ojjq2rAVEAlo8hgFY70u
         BP7s65kQP+/dYW3+VjqNJ+Bk3VTYGo9oGgC/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710076842; x=1710681642;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tkr28QD5VvNtKTi1PI4BrPEPlzdEBGGz9+sT46zW9QM=;
        b=EHwjmRc2QJNdugT7iOsD42Bxe2ifW8EwcQ6HBtNr3HGgCqlgybvbaTqOiMketJdccn
         BUDYnr775UgvIzXPRWgtdNxpf1DvD1QVNbr4r4/fTOk/hhCz1u0j6jsAUTNyJCcgG1xg
         +bTRgLLeLAd4avQaqFxsZ8nCijv1UeBDd7LWjrHSzpp9Wy6CaShSuiNxXzVJkiOtKIUB
         dPwAHwo1X77MppxEJt78/aiFmqxozxc/mYRNJ7LW2KuhD9NEOPAILmmN7lNl76acBepq
         LxGM+2/LixXvbz4TjugG+4vOW26UlSBd/aMzVisXwmtJsJNkQmY4x42POK5AfV0RkxhM
         YVKA==
X-Gm-Message-State: AOJu0Yxrq140W83oN2uJn5T/RLwRpIfcIs8Pofz841FYen3MaQB/L8bK
	BJ06uCVxds+m6L+UAVB+CFwgpmnh/7PumuJjaM4TGeTCu/kmOPG+PX3gFHoTmLE=
X-Google-Smtp-Source: AGHT+IHjcn1+gDsd8H7WwGsq98OiRUMT2giQrfP7PwdMuejfRq60VPnRDphPbhNtZ5B1cvDub9SzYA==
X-Received: by 2002:a05:6512:3e05:b0:513:a03f:1522 with SMTP id i5-20020a0565123e0500b00513a03f1522mr3080443lfv.56.1710076842213;
        Sun, 10 Mar 2024 06:20:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2055:91db:c2b7:cfde? ([2001:8b0:aba:5f3c:2055:91db:c2b7:cfde])
        by smtp.gmail.com with ESMTPSA id fa5-20020a05600c518500b00413298e9c8esm495493wmb.35.2024.03.10.06.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 06:20:41 -0700 (PDT)
Message-ID: <565d7305cc49d901dfe1fcc74427e25b35944e58.camel@linuxfoundation.org>
Subject: Re: [OE-core] [REGRESSION] linux (git/curl-native) and autorev
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Max <max.oss.09@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Max Krummenacher
	 <max.krummenacher@toradex.com>
Date: Sun, 10 Mar 2024 13:20:40 +0000
In-Reply-To: <d3359086952367d978a794500c474a472e6bc1cb.camel@gmail.com>
References: <20240309175750.2621579-1-max.oss.09@gmail.com>
	 <CADkTA4PBJDhGub=P0JbuhKHj0d2tXt8kx2SXDyvXRy6c2M7iww@mail.gmail.com>
	 <d3359086952367d978a794500c474a472e6bc1cb.camel@gmail.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=mQINBGN1PzgBEADqZynxX+ivalgYtZ+AoHoGynCiJw0lR+H9rC83sj9z38nlKHBCuh8r8KOqelDUf1B73E9oCLjZQVwqKLmao6ZDQYt7utG+h6qGLEgyDfeochYkLwElvRtjhTp0Ks5WPIHUgE4lwfqmsLrHbkEfRYui9eSd+zJpPKTRgQ7WhTGfRaXPEVYn24fWEo637biLyoEop1qaZMoY/mPsflDYDISWgAeunFx63oL9zNAhOWbLIy2uicKq2GyS56CooPzQkpUv7ssQBOqXp/FSuGJ49RV7Npj/eXyEepAh3BtMliJF08rAj07Hpywp3skXku8YcwUAD7TqOnJ4Wr6G8vpJlQKSITIGMBqtq3f8+SwImWEMRVXxDzrmznihOC7qEUWH4tN/AEkz2BJQbGYnp3iQjZqsoqKblyC83/5MCCUHHpDg20HooEWVNTUxUa8dGWaJehKC5fX1276Sm4WLaoqbQwSGCmwS1e+LjO9lFT80WHIELw07iDhQxshNqVLIxCt3pZfWRlf9fHCtxStiQIRrQLAKN7ze+//YjExjkDOt1ZFIsgMmKIQmJ6b8kRAAmQUraTcn4E/hy0mArFLmROyPSc1nD8hQMeELDcjyjEmo7j3qQCsU464v4tcvJVXyqPc4TU1GDQdZBaKP0/jR68aR3ZOvzx99jdocPdHNW4Kpbv6PnQARAQABtDNSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz6JAlcEEwEKAEECGwEFCQPCZwAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQQRclb3b/q6zLA9Fn+aUMY1GLyygAUCY3VBgQIZAQAKCRCaUMY1GLyygAtOEADglyjAhkCSGGetbs40FJ4
 xdHKck7aaB1FgbpGn9e9/WAeAPC722eJsxhujxgKaS9b7mHcTcWeMP7KFut4yKTDHovt4VbQOd PGqwyUmi8z0yd2ORlT9E3RjEEllpj/Z2Wfzs3H4qR5wz3Rij1BCirDH8LD5yAO8PpIW2N1Y4VbzFDTPX2KtLGQYIraOHZQQe8XjAJnXflVQbzSIbNw14IlVWnF94UwkamxRhhCVAdA4139ebU+R0inaVsG0Bb7GP3KiED4C1I/tj171G4bOsyz3zYkpuV64yuq5pVevLBuCJv1Z/yiBdbB02B+FkosKLWRvoZFa2gqK2xpZT8RvDdkBQTmZTs/hP59mh1QSt4d2p1KsBu7cx2fjRBuf9XVG+uR/XnbD5T1BQRVV641ZNzPTjtE3rEZzR1nsUv+vcFYv0V/FPcLg5f3Ui+4cuYj/xDykMKZlrBIVGExBOJr7Anbzwq8o4nYUsrbFE3Fu88l8/mWrQCkAIZqc2NRyuXplZrDanB9Abi2XmZO0B3Q9wKvzmH0yJyLfswmzrejf3oVOJNEKJP5acPnXfQqAr5F7gdeLvdHbOAtg1iU8GujkOvRA7ad5ahT/1mDzKlkjaf36p4jodsGzPydOks2/jbVZxbZsR1il3BuDXb0agChNXJH4IpcnrjAliBtTKwnEYuLQeLQsUmljaGFyZCBQdXJkaWUgPHJwdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz6JAlQEEwEKAD4WIQQRclb3b/q6zLA9Fn+aUMY1GLyygAUCY3VBEAIbAQUJA8JnAAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCaUMY1GLyygA0tD/4l5GVZ1OTKoCsHzQuSUVnyzmSwYmJD7W7E1VeVVvVk5bfFf/w6p3dXfGjhZ8zFackE+RmT3//8kQ+Zs68csd0wjX8klyFXgA5PWP3DxNkejnHCq7wiLouOGC/E9RSUULn1DYb68yPzvdGQBooqPQZORtXzNgM
 NuWDKH+9uvhGbdvURJHCRPTpgcdCo64d+IMzA+XmZUg0P722IyVmB+I2TgjaIRr/NsbsGP4x3u8 TVfJPXmE1IS9nrKEm023ntuy1AH9JlACLZ4LGvpxf8x7ZVKaXXqWOQ1aQ5BCQoOc41AiVUyeiq2wdLRQaNOxbb8+ED34BYLyMjZdII9eovZMbMt7kLSjkbOs/k3s7wtQ2eY7QnSggf8/MWUSUaJzLKHnOBRcqGjdFdlZ0BKXL+v9NrpjcUBsG1TY5XORIahk6Pt1+cPyIsKdycKU4RHtNfwX5fidE8AhU97U04z3tIYs121J4M/EG3bEfOtwDaH7BRTZHK5B05Mks/kX608CwLSJSbX2dSENInh5+dSVQ0egbFbXQGcHFmCCMjYH09hcNUSEyI4OUQHVu8HHQIfvutPqIsZEtJ1K/s3ZD3Zyq35UUiwnCu5hYohX9B0o0TwgDaI85dS2edHy2bnM3a9yuTPiwNYpfR6dp6cg8BM+9qqkJvwp5LiMcZcJC8S5xR3U0FtbQiUmljaGFyZCBQdXJkaWUgPHJwdXJkaWVAcnBzeXMubmV0PokCVAQTAQoAPhYhBBFyVvdv+rrMsD0Wf5pQxjUYvLKABQJjdUEhAhsBBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEJpQxjUYvLKA/iUQAJJkVW2yDzxrH/5szOuG0ZDDH6X6Yrdp+m+F4hHHJQkTYgdRPeoHYKyXNOettdVKrZyEDkztBWkB7Sd7zuVHR3Q4PVTsEh09ZzkqBgN8OevMA7RPHZOa2PYJ8pAx7eTah1whM2eOf+VZGKrW1R9ouTluV7/c4o5loaKuh+t61W2nH6E+lQt3/gKnwj4QmUb5V957ZSHO1cnjtHrd4FFmkYQOCbolEfC25lT9vh4ldY+dILQPcq4at/LEABp4xEgS6R7K4E3cDnjWogrZTiniAUrR7P0SNYv7WCpAbvk4Z9DGCHXpKod
 KjTi3em7xDpqA1Rxd/rV4z9VQJrbpL/oiPCnTW/iCx+eMH70dRk+gHxSU8FWVf+CucFZprvO9UMi tGHLvfpBxfnGDT2EOqOoFOYgYHq7MfSDZT+zM/gBWfHXbyz6W9RYqycwWCIhG5jhMhT2sEWr4FlwmXfogvSqxvKondwPfXsgNT1MdBqa0Hhm0pIJYs4ovKWnvymTraziqSWI2C9X5lPmf6ugNiuzJt5BqlilNHxsej9OC53HfBbkgDONdcJbduW9nrJlIl9OLanB4/fvuqG1ZIS/eFFAkb2YnBBuS2TNz3aPd7vFkOoMU7VegDic/sH23eZPGQm3XWcTYwIY2djBU8Jzyy4mRIOQZMGXb/ygrGXAuIxL2R2O1uFYEY3VB1RIIKoZIzj0DAQcCAwQzkAYGjbS/m2SeumSYfDZKeazIkOpwUxpTQ7kPxz0ijiquKSsEZzlPMFzhA+iBJh2jdCyabi5K+8+v3VZZglbWAwEIB4kCNgQYAQoAIBYhBBFyVvdv+rrMsD0Wf5pQxjUYvLKABQJjdUHVAhsMAAoJEJpQxjUYvLKAr6UQAMyaDatvvCkxvOyFgO6jxLLzbkwl40hTNB/TsG5RdwL6FXnBMzkIa5lEfgV1u2zwu0p7SKWH9J3DSNqYKjUCAfwDEv6aDKrFYqGQZMuke1ZAfKqmWTIYOKYG4vRgvvF1u0aCOrRJiipjEPnrw1LC6eaqpnI3WGJyy8Wgr8aO0RBUO93ax/+Mpw3QG+jQqZjuomBWGvUwsjRtzE9j2QUcGxjyTrocVsR2qjK0boE4jLGJWNreSIgs5Nllww++3l0pabmXhyXqDdoYE1U0WkI/yemsc8ydDtjpeG4uzv9rfd5VUqHoZpuYZ1sc4DTGFrEAoght/9FXWsOFOtX8vZprLFFi7iFNSDChIFEsyuizHOW5wl/PYkGCCMZvwPK61IvCARKwevdnSrle9omYEqjnU/HjVZ/kvtKxn1VN15j1NNF
 0zgmm+/RfbZFHbeuea/lVInXpNBMDj+pl3VyygUae65DMFWgYVSLtXPTRLVMb2mIxiNpk3T2UcuVW 1XC9LWup6h8jHEJ0zBCPjPyd1tFQ9hHVOJnwRthV+VG3zuBf8sri1TPnz5XjNpu3Q3r/6turvh+Khal2itb980tITH5fDbLUewPiA2jCAgZCkVMQcvYTS4rZCC+hpHSMte4m1n7AcmF9ohhw6tt41AEhwbMh+nRkyjDkY+k/vivg0obC2JpruDMEY3VCGBYJKwYBBAHaRw8BAQdArl5/9Fe2aA9JEc+HRm2rnCl6NMb7DZJLnM0xmQg1ouyJAq0EGAEKACAWIQQRclb3b/q6zLA9Fn+aUMY1GLyygAUCY3VCGAIbAgCBCRCaUMY1GLyygHYgBBkWCAAdFiEEHKt8QO5c0zRDdmiGodJewzbIKeYFAmN1QhgACgkQodJewzbIKeawUgEAzEwjSYf8lXVNcZVYL/4SLX9FEop83Q8+WmwT2rGhA+MBAKga5Fl8afYVHuPlPOxB/M7aQdP8vfYEx/cWmHmQEUICQxQQAJd85C4//BU0FOUPlEQ1vofZGNC1wTzVA7cQtYlIRrgQOmjR4tOFTxEzusA8QvXxOYkMkDlaa/Ai4/nicMqadnWPQ37BmTAW3/O5PVA22mWaC/ZVeG6DGBGVWb/OAwZe9KMxOR6say+bEIM6B6iDgc3V/HNsLWYYPHaj5HebHOKAJ7dqGGUlFV02OrVW5yAaOUEI61cKw0QuwoN1fZgih94EvFicNaLnDVDV64cbOnNyxGlJhbv4WMErtU4RVD3tT1soESmDB4jS2v49reBpsVVXg2G/M1xFO3sUcczHeo5LRaKtXpkXNh4WO3HDT/eb/IWP8Me2YKpwa5dzlrUz0AYi2s+h+LGclOP0Mls0tgS8sQSVdTj/feLk1FSSQGhSKdHMMGTlSsqj7XjToTAnIheq+5sdaY8UCEYu4s6jDiKu6G02HlF
 WpERQ9FmtGo2PVqnMaZy2w9lkNNn8ccyMWpP2EwGuCxONQrc22a7WnCYLTpOukLUSD7ApH7M2Jk8on
 kPGvi48NFq7PWaTkvG3vuSm+eApSToeyz7AVtFt8QOUnHTiNHbuiNpQsDd3y5bLLhU9mIJTbsWNP/72oXV7Tcz7w8zVh2qmuZqhu5qz9rcox3D9unGQ49N3i+CO9c7SqxcLckEjd9o62HsDDpqYv3cdtFNajNsHD8bFU9bb+swCuDMEY3VCRhYJKwYBBAHaRw8BAQdAjoQBsbbnpigttLSFJOFohHY6BGWmjCi520kt0UBBgG+JAjYEGAEKACAWIQQRclb3b/q6zLA9Fn+aUMY1GLyygAUCY3VCRgIbIAAKCRCaUMY1GLyygAQbD/0WyvGz8jA3CTAMTa8yoAlcX73+7aHQaP+DT1PaVU6W85Mm/Bv5JXJ+RWyCCa1jllAWTOhqkOXZ1lXqgislBGtpY22LdwlXW4NGETWwZb79ypR+nayuIPnjOrxkxPOFpcH+wCk9wX0qYi4/8xFTeIZtoty6ayP2bZUZL8aQ91kyUn7nrLmAymPhDq1AAjg+Dkz6DDyzkzXDsY6OY9SpKcWxLkcOm8oXn5B5K5Pl3FaRfYrmX2pAZ6DliQsvPMtXlA01qJ6W4nvRN5ROfjXefNGdyRK8LfJ8BkfDqtZ9/5UrMrW1b7CPA9/7dC5P2jfImtU6R90fz/S4ua2jzeVY2gt7olSDsBqJDOMBPwqEETDROu1+oCIXvdrrZszBu0pTCLV8r+rQqqjICZtK17CEXH3jmDeD/Q6MmAQqeyIhi3uQpGOaveP81WMiC8DDLRXmSuMYOIH/KebzgNnaCQzlQl3a+8tD2qQ48RqzR6JLcKu6h0A6KWItZScfshopNRVsm7FIWM1XUGm1nG6lmPtpVYsXF75hx+YxpAogbzm6fOnUJWFiP1/NVRgtWiii2HG8YCIrEeR3LCUQd/5aYS0CI0cy8WATg/1qkLbcr0lVaCRLT2KZd5WH7tz/4IBanSdCAj6vEfovE5ilWNThQHwg8aPQI6COaHFcTcervMD4Sy
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 13:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196883

On Sun, 2024-03-10 at 13:31 +0100, Max wrote:
> Am Samstag, dem 09.03.2024 um 13:04 -0800 schrieb Bruce Ashfield:
> > On Sat, Mar 9, 2024 at 12:58=E2=80=AFPM <max.oss.09@gmail.com> wrote:
> > >=20
> > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > >=20
> > > Hello
> > >=20
> > > If one builds a kernel using AUTOREV invoking bitbake only works
> > > once.
> > > Any subsequent bitbake invocation fails parsing the meta data.
> > >=20
> > > Reproducable with:
> > > - latest poky, b5624ee564
> > > - Kernel with SRCREV =3D "AUTOREV", e.g. in local.conf
> > > =C2=A0 `SRCREV_machine:pn-linux-yocto:forcevariable =3D "${AUTOREV}"`
> > > - bitbake virtual/kernel; bitbake virtual/kernel
> > >=20
> > > On the second invocation parsing fails when the fetcher tries to
> > > evaluate the latest SRCREV:
> > >=20
> > > > ERROR: ExpansionError during parsing meta/recipes-
> > > > kernel/linux/linux-yocto_6.6.bb
> > > > Traceback (most recent call last):
> > > > =C2=A0 File "bitbake/lib/bb/fetch2/__init__.py", line 1245, in
> > > > srcrev_internal_helper(ud=3D<bb.fetch2.FetchData object at
> > > > 0x7f8e26f5f290>, d=3D<bb.data_smart.DataSmart object at
> > > > 0x7f8e26195890>, name=3D'machine'):
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 d.setVar("__BBAUTOREV_ACTED_UPON", True)
> > > > =C2=A0=C2=A0=C2=A0 >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 srcr=
ev =3D ud.method.latest_revision(ud, d, name)
> > > >=20
> > > > =C2=A0 File "bitbake/lib/bb/fetch2/__init__.py", line 1667, in
> > > > Git.latest_revision(ud=3D<bb.fetch2.FetchData object at
> > > > 0x7f8e26f5f290>, d=3D<bb.data_smart.DataSmart object at
> > > > 0x7f8e26195890>, name=3D'machine'):
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 except KeyError:
> > > > =C2=A0=C2=A0=C2=A0 >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 revs[key] =3D rev =3D self._latest_revision(ud, d,
> > > > name)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rev
> > > > =C2=A0 File "bitbake/lib/bb/fetch2/git.py", line 850, in
> > > > Git._latest_revision(ud=3D<bb.fetch2.FetchData object at
> > > > 0x7f8e26f5f290>, d=3D<bb.data_smart.DataSmart object at
> > > > 0x7f8e26195890>, name=3D'machine'):
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 outp=
ut =3D self._lsremote(ud, d, "")
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 # Tags of the form ^{} may not work, need to
> > > > fallback to other form
> > > > =C2=A0 File "bitbake/lib/bb/fetch2/git.py", line 833, in
> > > > Git._lsremote(ud=3D<bb.fetch2.FetchData object at
> > > > 0x7f8e26f5f290>, d=3D<bb.data_smart.DataSmart object at
> > > > 0x7f8e26195890>, search=3D''):
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.fetch2.check_netw=
ork_access(d, cmd,
> > > > repourl)
> > > > =C2=A0=C2=A0=C2=A0 >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 output =3D runfetchcmd(cmd, d, True)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not output:
> > > > =C2=A0 File "bitbake/lib/bb/fetch2/__init__.py", line 957, in
> > > > runfetchcmd(cmd=3D'export PSEUDO_DISABLED=3D1; export
> > > > DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1003/bus"; export
> > > > PATH=3D"build/tmp/sysroots-uninative/x86_64-
> > > > linux/usr/bin:scripts:build/tmp/work/qemux86_64-poky-
> > > > linux/linux-yocto/6.6.20+git/recipe-sysroot-
> > > > native/usr/bin/x86_64-poky-linux:build/tmp/work/qemux86_64-
> > > > poky-linux/linux-yocto/6.6.20+git/recipe-
> > > > sysroot/usr/bin/crossscripts:build/tmp/work/qemux86_64-poky-
> > > > linux/linux-yocto/6.6.20+git/recipe-sysroot-
> > > > native/usr/sbin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > yocto/6.6.20+git/recipe-sysroot-
> > > > native/usr/bin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > yocto/6.6.20+git/recipe-sysroot-
> > > > native/sbin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > yocto/6.6.20+git/recipe-sysroot-
> > > > native/bin:bitbake/bin:build/tmp/hosttools"; export
> > > > HOME=3D"/home/krm"; git -c gc.autoDetach=3Dfalse -c core.pager=3Dca=
t
> > > > -c safe.bareRepository=3Dall ls-remote
> > > > https://git.yoctoproject.org/linux-yocto.git=C2=A0',
> > > > d=3D<bb.data_smart.DataSmart object at 0x7f8e26195890>,
> > > > quiet=3DTrue, cleanup=3D[], log=3DNone, workdir=3DNone):
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 >=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rais=
e FetchError(error_message)
> > > >=20
> > > > bb.data_smart.ExpansionError: Failure expanding variable
> > > > fetcher_hashes_dummyfunc[vardepvalue], expression was
> > > > ${@bb.fetch.get_hashvalue(d)} which triggered exception
> > > > FetchError: Fetcher failure: Fetch command export
> > > > PSEUDO_DISABLED=3D1; export
> > > > DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1003/bus"; export
> > > > PATH=3D"build/tmp/sysroots-uninative/x86_64-
> > > > linux/usr/bin:scripts:/var/home/krm/build/poky/build/tmp/work/q
> > > > emux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroot-
> > > > native/usr/bin/x86_64-poky-linux:build/tmp/work/qemux86_64-
> > > > poky-linux/linux-yocto/6.6.20+git/recipe-
> > > > sysroot/usr/bin/crossscripts:build/tmp/work/qemux86_64-poky-
> > > > linux/linux-yocto/6.6.20+git/recipe-sysroot-
> > > > native/usr/sbin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > yocto/6.6.20+git/recipe-sysroot-
> > > > native/usr/bin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > yocto/6.6.20+git/recipe-sysroot-
> > > > native/sbin:build/tmp/work/qemux86_64-poky-linux/linux-
> > > > yocto/6.6.20+git/recipe-sysroot-
> > > > native/bin:bitbake/bin:build/tmp/hosttools"; export
> > > > HOME=3D"/home/krm"; git -c gc.autoDetach=3Dfalse -c core.pager=3Dca=
t
> > > > -c safe.bareRepository=3Dall ls-remote
> > > > https://git.yoctoproject.org/linux-yocto.git=C2=A0 failed with exit
> > > > code 128, output:
> > > > fatal: unable to access
> > > > 'https://git.yoctoproject.org/linux-yocto.git/': error setting
> > > > certificate file: build/tmp/work/x86_64-linux/curl-
> > > > native/8.6.0/recipe-sysroot-native/etc/ssl/certs/ca-
> > > > certificates.crt
> > > >=20
> > > > The variable dependency chain for the failure is:
> > > > fetcher_hashes_dummyfunc[vardepvalue]
> > >=20
> > > Note:
> > > One gets out of that parser error by deleting the git binary in
> > > the
> > > kernel's work recipe-sysroot-native
> > > `rm tmp/work/qemux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-
> > > sysroot-native/usr/bin/git`
> > >=20
> > > Bisecting poky leads to commit
> > > f7fa98cca8 ("kern-tools: depend on git-replacement-native")
> > > Reverting it on top of b5624ee564 makes the parsing pass.
> > >=20
> > > I assume that `git-replacement-native` does not work with https,
> > > the
> > > fetch error also goes away if changing in SRC_URI from https to
> > > git.
> > >=20
> > > Any comments?
> >=20
> > I didn't even know that curl was coming into play :)
> >=20
> > Adding DEPENDS:class-native +=3D "ca-certificates" to the curl recipe
> > should resolve the issue.
>=20
> Looks like curl-native resp. libcurl hardcodes the lookup to its own
> work directory, i.e.:
> x86_64-linux/curl-native/8.6.0/recipe-sysroot-
> native/etc/ssl/certs/ca-certificates.crt
>=20
> So even if DEPENDS/RDEPENDS will install ca-certificates in the
> kernel's
> recipe-sysroot-native the parsing will fail if the curl-native
> directory
> is not/no longer populated, e.g. because curl-native came from sstate
> or
> rm_work is in INHERIT.

This all gets a bit messy.

We've relied upon scripts that use openssl to set variables like:

export SSL_CERT_DIR=3D"XXXX/etc/ssl/certs/

so in theory we might be able to set an environment variable in a
wrapper around the git commands.

It may be better if we teach curl a relative path to the certs...

I suspect this isn't going to be an easy/neat fix unfortunately.

Cheers,

Richard

