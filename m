Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC21C54798
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 10:38:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.9324.1709030322299235288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 02:38:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c6AgL4wu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-412acb93e2aso3843745e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 02:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709030321; x=1709635121; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NUAS3KPxZorwQCW0qdet9+kpk/+iqopTKJnX0vhu2v0=;
        b=c6AgL4wu5EvR5UJt9oSBxrJpgc2eAEguklrxEh5hpqz/TLnyDDh1TFhrqGmusuDaot
         X8JNG1yIYu/C4d3/U1t030I7t2YunI8I/nWgzZSQeyWnt86+1dHrS9t0YoRWNmLu4phR
         hcC+tvzv016FuNVTr0cwdFkMOYq4KG+vznCWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709030321; x=1709635121;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NUAS3KPxZorwQCW0qdet9+kpk/+iqopTKJnX0vhu2v0=;
        b=VuWUlu0Uq71hpN5oJF17y9CoxnoUbCTs0Copn5qCzRHUMwROyyf26k9WeicbIy9Y19
         9sYugI/uq+REUegDn6hMIhnKwSLZYf1trxK6TY9aw7rySzT5rUVisqDCTevr8R+zNTdS
         qEZoUeYupbllzInD5aCAebqtkG6vTZhO/Zj08Vp8OTFZHZ890lvUMcmvvNfWNW12lwrZ
         2xCtHDjYizmtRTezGL+33g4wDdEUZKMRPql6L9N2uivV0lvxwT7KPM9W/xgcpeiintIN
         UZ79843V4YDJYAzHFCFfbHBEmblSvjUgVUbD/bjFIwuhziGtFDDY+lQ3s8pNf0qFXQLq
         1nXA==
X-Forwarded-Encrypted: i=1; AJvYcCUJskdmoDGuZHgl4pf73q2I0r3FJRvp1Dm4rLV+1h/P+G6ycvq6IlKsWmknmlomARqttJkEJ2m/Qtbp9Eix3ivxRObIU96nrec0/Fo7bUNjMwbYGIRqJzyP
X-Gm-Message-State: AOJu0YzKt+lpAcA9i1lNY6EQuy71dtoJSBAGBZasbUJe4/Y8kUCUk4SZ
	vTLBuy2b3pX611uuMHP4HqPSW0X6h7nWRFteEt6bpJWolBaS2152AN4BAAtPaw4=
X-Google-Smtp-Source: AGHT+IF3SuYSsJALiHK42QdDaVklNze9oT3bVFxMfM+0St2uKpksHGjjAUsi8Qiwwr1vS+rucwtc1g==
X-Received: by 2002:a05:600c:3ac8:b0:412:ad31:5ae5 with SMTP id d8-20020a05600c3ac800b00412ad315ae5mr999685wms.22.1709030320635;
        Tue, 27 Feb 2024 02:38:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6a04:c13a:16bd:e588? ([2001:8b0:aba:5f3c:6a04:c13a:16bd:e588])
        by smtp.gmail.com with ESMTPSA id j5-20020a05600c488500b004127de1ba84sm515479wmp.0.2024.02.27.02.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 02:38:40 -0800 (PST)
Message-ID: <69d08be1c7b875758a4147225e316f76fff3997f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: make pkg-config variables
 globally exported in the class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kamatam@amazon.com, openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
Date: Tue, 27 Feb 2024 10:38:39 +0000
In-Reply-To: <20240226234417.270628-1-kamatam@amazon.com>
References: <20240226234417.270628-1-kamatam@amazon.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 10:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196254

On Mon, 2024-02-26 at 15:44 -0800, Munehisa Kamata via lists.openembedded.o=
rg wrote:
> Rather than repeatedly exporting the variables in the different functions=
,
> make them globally exported in the class for better maintainability.
>=20
> This is essentially "v3" discussed in [1].
>=20
> [1] https://lore.kernel.org/openembedded-core/20240222202827.3675576-1-ka=
matam@amazon.com/T/#t
>=20
> Signed-off-by: Munehisa Kamata <kamatam@amazon.com>
> ---
> =C2=A0meta/classes-recipe/kernel.bbclass | 20 +++++++-------------
> =C2=A01 file changed, 7 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index db4461e551..fce810a9e4 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -239,9 +239,15 @@ KERNEL_EXTRA_ARGS ?=3D ""
> =C2=A0EXTRA_OEMAKE +=3D ' CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" OBJCOPY=
=3D"${KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_STRIP}"'
> =C2=A0EXTRA_OEMAKE +=3D ' HOSTCC=3D"${BUILD_CC}" HOSTCFLAGS=3D"${BUILD_CF=
LAGS}" HOSTLDFLAGS=3D"${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}"'
> =C2=A0EXTRA_OEMAKE +=3D ' HOSTCXX=3D"${BUILD_CXX}" HOSTCXXFLAGS=3D"${BUIL=
D_CXXFLAGS}"'
> -# Only for newer kernels (5.19+), native pkg-config variables are set fo=
r older kernels when building kernel and modules
> +# Only for newer kernels (5.19+), native pkg-config variables are set be=
low for older kernels
> =C2=A0EXTRA_OEMAKE +=3D ' HOSTPKG_CONFIG=3D"pkg-config-native"'
> =C2=A0
> +# setup native pkg-config variables (kconfig scripts call pkg-config dir=
ectly, cannot generically be overriden to pkg-config-native)
> +export PKG_CONFIG_DIR =3D "${STAGING_DIR_NATIVE}${libdir_native}/pkgconf=
ig"
> +export PKG_CONFIG_PATH =3D "${PKG_CONFIG_DIR}:${STAGING_DATADIR_NATIVE}/=
pkgconfig"
> +export PKG_CONFIG_LIBDIR =3D "${PKG_CONFIG_DIR}"
> +export PKG_CONFIG_SYSROOT_DIR =3D ""
> +
> =C2=A0KERNEL_ALT_IMAGETYPE ??=3D ""
> =C2=A0
> =C2=A0copy_initramfs() {
> @@ -352,12 +358,6 @@ KERNEL_DEBUG_TIMESTAMPS ??=3D "0"
> =C2=A0kernel_do_compile() {
> =C2=A0	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> =C2=A0
> -	# setup native pkg-config variables (kconfig scripts call pkg-config di=
rectly, cannot generically be overriden to pkg-config-native)
> -	export PKG_CONFIG_DIR=3D"${STAGING_DIR_NATIVE}${libdir_native}/pkgconfi=
g"
> -	export PKG_CONFIG_PATH=3D"$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkg=
config"
> -	export PKG_CONFIG_LIBDIR=3D"$PKG_CONFIG_DIR"
> -	export PKG_CONFIG_SYSROOT_DIR=3D""
> -
> =C2=A0	if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
> =C2=A0		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may n=
ot
> =C2=A0		# be set....
> @@ -408,12 +408,6 @@ addtask transform_kernel after do_compile before do_=
install
> =C2=A0do_compile_kernelmodules() {
> =C2=A0	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> =C2=A0
> -	# setup native pkg-config variables (kconfig scripts call pkg-config di=
rectly, cannot generically be overriden to pkg-config-native)
> -	export PKG_CONFIG_DIR=3D"${STAGING_DIR_NATIVE}${libdir_native}/pkgconfi=
g"
> -	export PKG_CONFIG_PATH=3D"$PKG_CONFIG_DIR:${STAGING_DATADIR_NATIVE}/pkg=
config"
> -	export PKG_CONFIG_LIBDIR=3D"$PKG_CONFIG_DIR"
> -	export PKG_CONFIG_SYSROOT_DIR=3D""
> -
> =C2=A0	if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
> =C2=A0		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may n=
ot
> =C2=A0		# be set....
>=20


I'm really not keen on this. global exports are painful to remove later
as you can't really tell when they need to be set (e.g during
do_configure). Given that these reverse our usual usage of pkg-config
too, I really don't want to be doing this at all.

Until we have a minimum kernel version which has saner pkg-config usage
I appreciate we have to retain this but I do want to make it easier to
remove=C2=A0later.

I'm therefore leaning against doing this.

Cheers,

Richard


