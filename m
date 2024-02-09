Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA82C4829D
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 17:13:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.17869.1707498834752110380
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 09:13:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ac1ZaUtn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4101fc00832so10003715e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 09:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707498833; x=1708103633; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JWgOicbo/SYkvpA2EwiTQlxNmdGxRRTs5/xlrx8+0Z4=;
        b=Ac1ZaUtniUkUs2/SDv28CuO5NgUFs04quRdqgtyL617zbKIqk62lCBzY3wAGpCb4mR
         6mq9/0oeONUoD9QWF6YpBoml+ACDlSPTGblBj4vE9a7AgD71g6VWF9GkiCKI/eea1wk8
         fAKAkcAD9VutCkMPLOmIlwN6WQ+Ujqaq9VO5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707498833; x=1708103633;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JWgOicbo/SYkvpA2EwiTQlxNmdGxRRTs5/xlrx8+0Z4=;
        b=O6WYJY77B1AgJ2Ti/Tk8A7xYx6GHkrMGKXASTUcfTnTc6sR8HjSPFr1l2dBef8p7nA
         xJGlpUOgFQpW0EIyho8mUdOJraAV7A8h6ObPpjZjfY/svOcA2TJSyQamp0HLD1brKTDC
         vILAwqwN+sR+3HKPUjjXI/ISD+fk/9PRK4BBAIUxV72jQRGh4aoFb5vJOcCLir8B/iXu
         A0lTA+ZgbVWCvxB82gcWJIkggmiuM6bU0wTP0STzNfBWQZsEg48sfNr6PVcj4iHgy/GV
         FbEDSfDDeNTB7Xp9qqj/mOlaHCaSce5r+UKdagvXynNKnpR/bkCps+e+N/Nj8xUd34RU
         fsRQ==
X-Gm-Message-State: AOJu0YwvQDyc7QCwqDXwl1doJeQOps9xw75AS8KVvV2blrt7XMvNMdLO
	zNashK0E4yqxCRFFl3EgHnake3wMJLuVxQSb5HjsNu6gza2zDZ3R/rGLoYCkJyU=
X-Google-Smtp-Source: AGHT+IF7e30aSWA7NDtUKUe26o9fOGeMHKoV6h0t2iQwHQ9yqPQodoK1UHpvHTgNV2RdkR5mxDd1mA==
X-Received: by 2002:a05:600c:4710:b0:40e:fc29:f527 with SMTP id v16-20020a05600c471000b0040efc29f527mr1991337wmo.31.1707498832945;
        Fri, 09 Feb 2024 09:13:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrNMrSBH2r1lIGWMkwxXnLxyGvd8nvTY25rboZV0QACwPXZy3agEDsLFjXIrZuHEEf6iZHvRgheT5vnGFF/1iDMqi+kK70NWhbAonCpLNwRhAxacMWq88e
Received: from ?IPv6:2001:8b0:aba:5f3c:47e1:ee11:154c:e6b3? ([2001:8b0:aba:5f3c:47e1:ee11:154c:e6b3])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b0040fdf2832desm1270215wmo.12.2024.02.09.09.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 09:13:52 -0800 (PST)
Message-ID: <7388dd802ce3a6a8845bd4756f51b88fd42fad69.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] ldconfig-native: Add usrmerge support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: johannes.pointner@br-automation.com, 
	openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
Date: Fri, 09 Feb 2024 17:13:51 +0000
In-Reply-To: <20231219104301.443343-1-johannes.pointner@br-automation.com>
References: <20231219104301.443343-1-johannes.pointner@br-automation.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 17:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195236

On Tue, 2023-12-19 at 11:42 +0100, Johannes Pointner via
lists.openembedded.org wrote:
> From: Johannes Pointner <johannes.pointner@br-automation.com>
>=20
> If DISTRO_FEATURE usrmerge is enabled, SLIBDIR is just a symlink to LIBDI=
R.
> ldconfig-native uses hardcoded paths for SLIBDIR and LIBDIR that are fine=
 for
> the not usrmerge case. But if usrmerge is enabled ldconfig-native generat=
es a
> ld.so.cache for the target, which is done in rootfs.py, that looks like t=
his:
> 236 libs found in cache `/etc/ld.so.cache'
>        libzstd.so.1 (libc6) =3D> /lib/libzstd.so.1
>        libz.so.1 (libc6) =3D> /lib/libz.so.1
>        libxtables.so.12 (libc6) =3D> /lib/libxtables.so.12
>        libxslt.so.1 (libc6) =3D> /lib/libxslt.so.1
>        libxml2.so.2 (libc6) =3D> /lib/libxml2.so.2
>=20
> But it should look like this, which it does in case of not usrmerge:
> 236 libs found in cache `/etc/ld.so.cache'
>         libzstd.so.1 (libc6) =3D> /usr/lib/libzstd.so.1
>         libz.so.1 (libc6) =3D> /usr/lib/libz.so.1
>         libxtables.so.12 (libc6) =3D> /usr/lib/libxtables.so.12
>         libxslt.so.1 (libc6) =3D> /usr/lib/libxslt.so.1
>         libxml2.so.2 (libc6) =3D> /usr/lib/libxml2.so.2
>=20
> As this is part of the generated image(target) this breaks for example th=
e
> Qt QLibraryInfo paths if Qt is configured 'relocatable' and leads to the =
issue
> that the QtWebEngine can find the QtWebEngineProcess,
> Qt WebEngine resources,...
> In the case of Qt this issue appears because Qt tries to determine the li=
brary
> locations using dladdr and uses this as base to access QtWebEngineProcess=
 or
> Qt Webengine resources.
>=20
> Therefore don't let ldconfig-native parse SLIBDIR if it is a symlink.
>=20
> Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
> ---
> v3: enhanced explanation
>=20
> v2: fixed sendemail.from and enhanced explanation
>=20
>  .../ldconfig-add-usrmerge-support.patch       | 37 +++++++++++++++++++
>  .../glibc/ldconfig-native_2.12.1.bb           |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconf=
ig-add-usrmerge-support.patch
>=20
> diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-add-=
usrmerge-support.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldc=
onfig-add-usrmerge-support.patch
> new file mode 100644
> index 0000000000..3041d433fd
> --- /dev/null
> +++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-add-usrmerg=
e-support.patch
> @@ -0,0 +1,37 @@
> +From 6e543f39f6bec6eb2e02eea02029c7f4ec533b66 Mon Sep 17 00:00:00 2001
> +From: Johannes Pointner <johannes.pointner@br-automation.com>
> +Date: Fri, 1 Dec 2023 11:02:39 +0100
> +Subject: [PATCH] ldconfig: add usrmerge support
> +
> +Check whether SLIBDIR is a symlink, which is the case if usrmerge
> +is enabled, and if so, ignore it.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
> +---
> + ldconfig.c | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/ldconfig.c b/ldconfig.c
> +index e826410..72ac67b 100644
> +--- a/ldconfig.c
> ++++ b/ldconfig.c
> +@@ -1371,10 +1371,16 @@ main (int argc, char **argv)
> +=20
> +   if (!opt_only_cline)
> +     {
> ++      struct stat buf;
> ++      int ret;
> +       parse_conf (config_file, true);
> +=20
> +       /* Always add the standard search paths.  */
> +-      add_system_dir (SLIBDIR);
> ++      /* Check whether SLIBDIR is a symlink, which is the case if usrme=
rge
> ++       is enabled, and if so, ignore it. */
> ++      ret =3D lstat(SLIBDIR ,&buf);
> ++      if(ret =3D=3D -1 || !S_ISLNK(buf.st_mode))
> ++        add_system_dir (SLIBDIR);
> +       if (strcmp (SLIBDIR, LIBDIR))
> + 	add_system_dir (LIBDIR);
> +       add_system_dir (SLIBDIR32);
> diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta/rec=
ipes-core/glibc/ldconfig-native_2.12.1.bb
> index 4db67c3ad4..85fc87257d 100644
> --- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> +++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> @@ -16,6 +16,7 @@ SRC_URI =3D "file://ldconfig-native-2.12.1.tar.bz2 \
>             file://add-64-bit-flag-for-ELF64-entries.patch \
>             file://no-aux-cache.patch \
>             file://add-riscv-support.patch \
> +           file://ldconfig-add-usrmerge-support.patch \
>  "
> =20

Sorry this has sat in the "to review" queue for a while as none of us
could really understand what it is doing or why.

ldconfig caches the lookups that the normal dynamic loader would make.
If you symlink lib to usr/lib and the loader search path has lib first,
ldconfig *will* look at /lib/. This is entirely correct and expected.
It shouldn't really matter whether it sees /lib/XXX or /usr/lib/XXX at
the end of the day, they're the same file, albeit plus/minus a symlink
resolution.

Your patch breaks the standard ordering. My view is we should not
change what is arguably the correct behaviour and potentially cause all
kinds of other unexpected problems due to some Qt specific weirdness
which non of us can really understand.

So sorry but no, we can't accept this.

Cheers,

Richard




