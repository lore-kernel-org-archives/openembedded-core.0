Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9611BC48BF6
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 16:31:33 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.76497.1709483484465529829
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 08:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CI3v1lAX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.177, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d1094b5568so44636851fa.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 08:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709483482; x=1710088282; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JPIetiGux7rDEMXSpccwKUs3T1a9ddcmOufpXCZM1Nk=;
        b=CI3v1lAXCgEhykzXs8GF8ZTn/5gIoxgK3it2z4zr8YRIXJDi5Bmz2/D++dIx4oGfD3
         o/BkaLaciN2BJCVPdvlWNWXRJLrjwc6/g3a+0OkbSDqSfw50wjpUw5EzuiHb2kg6RHEH
         IF0amHZ1U9a09MiO5s4wCOVaqviaZcPyG9FZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709483482; x=1710088282;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JPIetiGux7rDEMXSpccwKUs3T1a9ddcmOufpXCZM1Nk=;
        b=HJIleXu2ZQQ2Ukij7oUFJu9qRzhAxHJXnKh/thXUBpM6lPnB+Azb3IHKJOHILGUizB
         sfHAFaiw7PNsHjtS/DaPhEcwuV/llNGURp+2zRCR2TP8XfCRABKN+ymBTdnemlZIHOWV
         hu+YxU7oHe1vSoNdetNLucK17Khz9eWNoh1uY1t0F1StqWZ7zCfFYH8GEFRRJsfnva7z
         3JCFJpYI1oAuA4ZFGJ9l9ZnFRo5sZ+gu5IQq1T5ttFnBuUSYGg1gtVrnQIUhybPtrFFB
         TNHDiKoOQphi8hORmLdLRd70gumDU1P4977448m9dgIveEklO1QMMNtyfVWmkr2HoBHZ
         rynw==
X-Forwarded-Encrypted: i=1; AJvYcCWic0XyEDhOj2QwAjH2ZfsJVsc5Cm/ATgS/1a+vccRmxu4UD4pZwIQ0lulZtOgNjizzddTaFsGf3cIXYjAKGTEWC81qwX2bKPOBOy5wvOehFFbtyeOKxa0Y
X-Gm-Message-State: AOJu0YyZ1JCnCkp67nLNVC/wb+ux1AMivVpVeTmE+HZdT4jvnr8J1Az/
	XNaYnwLVq23WK0OuGlDjxxM2CdwNUtJgOBL87VS1jO4QJNHcKeS54TAD4fzSYlo=
X-Google-Smtp-Source: AGHT+IFe/1Kti/QMLICPIxjrfBVEFSAIh5lmYqHUD0LPhrfvyMs80mNc3fqYYcrB9Ja+0Edj7rEQ5A==
X-Received: by 2002:a2e:9b10:0:b0:2d2:9a8e:94a9 with SMTP id u16-20020a2e9b10000000b002d29a8e94a9mr4118445lji.46.1709483482483;
        Sun, 03 Mar 2024 08:31:22 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1b68:114e:8f9b:9a96? ([2001:8b0:aba:5f3c:1b68:114e:8f9b:9a96])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c351300b00412b6fbb9c3sm11994283wmq.9.2024.03.03.08.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 08:31:21 -0800 (PST)
Message-ID: <7fb48d27acb136ee014d8e0bcd7c56e79657bd55.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC OE-core][PATCH v2 6/7] go: upgrade 1.21.5 ->
 1.21.7
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Date: Sun, 03 Mar 2024 16:31:21 +0000
In-Reply-To: <17B89B4F303DC3DB.30419@lists.openembedded.org>
References: <20240228183011.1495807-1-jose.quaresma@foundries.io>
	 <20240228183011.1495807-6-jose.quaresma@foundries.io>
	 <17B89B4F303DC3DB.30419@lists.openembedded.org>
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
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 16:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196567

On Fri, 2024-03-01 at 09:53 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2024-02-28 at 18:30 +0000, Jose Quaresma wrote:
> > Upgrade to latest 1.21.x release [1]:
> >=20
> > $ git --no-pager log --oneline go1.21.5..go1.21.7
> > f29208030a (tag: go1.21.7) [release-branch.go1.21] go1.21.7
> > 2fdad8af6d [release-branch.go1.21] cmd/internal/obj/arm64: fix
> > frame pointer restore in epilogue
> > 01c93ad049 [release-branch.go1.21] cmd/go/internal/generate: call
> > modload.InitWorkFile
> > db74bfba18 [release-branch.go1.21] Revert "crypto/internal/boring:
> > upgrade module to fips-20220613" +1
> > 916e6cddf1 [release-branch.go1.21] runtime: fix Pinner.Pin
> > documentation
> > 6552f3d4ac [release-branch.go1.21] cmd/go/internal/toolchain: apply
> > the -modcacherw flag when downloading a module to determine what
> > toolchain it needs
> > 3960318b87 [release-branch.go1.21] crypto/x509: properly gate test
> > on macos version
> > 00f974eb1f [release-branch.go1.21] go/types, types2: don't lose
> > position info of interface embeddings
> > 2f91c16e68 [release-branch.go1.21] runtime: properly model rwmutex
> > in lock ranking
> > 2540b1436f [release-branch.go1.21] slices: explicitly discard
> > results of some functions
> > 7e34c4308f [release-branch.go1.21] runtime: clear g0 stack bounds
> > in dropm
> > 491c1e7e95 [release-branch.go1.21] runtime: allow update of system
> > stack bounds on callback from C thread
> > caafb50c0d [release-branch.go1.21] runtime: don't print "unexpected
> > SPWRITE" when printing traceback
> > cc85462b3d (tag: go1.21.6) [release-branch.go1.21] go1.21.6
> > d2cb140194 [release-branch.go1.21] crypto/tls: align FIPS-only mode
> > with BoringSSL policy
> > 368e2a9461 [release-branch.go1.21] crypto/internal/boring: upgrade
> > module to fips-20220613
> > 8c6078adfb [release-branch.go1.21] runtime: add race annotations in
> > IncNonDefault
> > f6b203c828 [release-branch.go1.21] maps: fix aliasing problems with
> > Clone
> > 43818206dc [release-branch.go1.21] runtime: put ReadMemStats debug
> > assertions behind a double-check mode
> > cf65d74bc5 [release-branch.go1.21] runtime: add the disablethp
> > GODEBUG setting
> > ad1ec60a5b [release-branch.go1.21] runtime/pprof: fix generics
> > function names
> > bbab863ada [release-branch.go1.21] os/signal: skip nohup tests on
> > darwin builders
> > 7dc67e8f29 [release-branch.go1.21] os/signal: remove go t.Run from
> > TestNohup
> > 9f8b3ac8c4 [release-branch.go1.21] cmd/compile: fix escape analysis
> > of string min/max
> > 8c840b10d0 [release-branch.go1.21] cmd/compile: fix memcombine pass
> > for big endian, > 1 byte elements
> >=20
> > [1] https://github.com/golang/go/compare/go1.21.5...go1.21.7
> >=20
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> > =C2=A0meta/recipes-devtools/go/{go-1.21.5.inc =3D> go-1.21.7.inc} | 2 +=
-
> > =C2=A0...binary-native_1.21.5.bb =3D> go-binary-native_1.21.7.bb} | 6 +=
++-
> > --
> > =C2=A0...oss-canadian_1.21.5.bb =3D> go-cross-canadian_1.21.7.bb} | 0
> > =C2=A0.../go/{go-cross_1.21.5.bb =3D> go-cross_1.21.7.bb}=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0
> > =C2=A0.../go/{go-crosssdk_1.21.5.bb =3D> go-crosssdk_1.21.7.bb}=C2=A0=
=C2=A0 | 0
> > =C2=A0.../go/{go-native_1.21.5.bb =3D> go-native_1.21.7.bb}=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 0
> > =C2=A0.../go/{go-runtime_1.21.5.bb =3D> go-runtime_1.21.7.bb}=C2=A0=C2=
=A0=C2=A0=C2=A0 | 0
> > =C2=A0...go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch | 2 +-
> > =C2=A0.../go/go/0003-ld-add-soname-to-shareable-objects.patch=C2=A0=C2=
=A0 | 8
> > ++++----
> > =C2=A0meta/recipes-devtools/go/{go_1.21.5.bb =3D> go_1.21.7.bb}=C2=A0=
=C2=A0 | 0
> > =C2=A010 files changed, 9 insertions(+), 9 deletions(-)
> > =C2=A0rename meta/recipes-devtools/go/{go-1.21.5.inc =3D> go-1.21.7.inc=
}
> > (89%)
> > =C2=A0rename meta/recipes-devtools/go/{go-binary-native_1.21.5.bb =3D> =
go-
> > binary-native_1.21.7.bb} (78%)
> > =C2=A0rename meta/recipes-devtools/go/{go-cross-canadian_1.21.5.bb =3D>
> > go-cross-canadian_1.21.7.bb} (100%)
> > =C2=A0rename meta/recipes-devtools/go/{go-cross_1.21.5.bb =3D> go-
> > cross_1.21.7.bb} (100%)
> > =C2=A0rename meta/recipes-devtools/go/{go-crosssdk_1.21.5.bb =3D> go-
> > crosssdk_1.21.7.bb} (100%)
> > =C2=A0rename meta/recipes-devtools/go/{go-native_1.21.5.bb =3D> go-
> > native_1.21.7.bb} (100%)
> > =C2=A0rename meta/recipes-devtools/go/{go-runtime_1.21.5.bb =3D> go-
> > runtime_1.21.7.bb} (100%)
> > =C2=A0rename meta/recipes-devtools/go/{go_1.21.5.bb =3D> go_1.21.7.bb}
> > (100%)
> >=20
> > diff --git a/meta/recipes-devtools/go/go-1.21.5.inc b/meta/recipes-
> > devtools/go/go-1.21.7.inc
> > similarity index 89%
> > rename from meta/recipes-devtools/go/go-1.21.5.inc
> > rename to meta/recipes-devtools/go/go-1.21.7.inc
> > index f009ea77c7..6de24e1e22 100644
> > --- a/meta/recipes-devtools/go/go-1.21.5.inc
> > +++ b/meta/recipes-devtools/go/go-1.21.7.inc
> > @@ -15,4 +15,4 @@ SRC_URI +=3D "\
> > =C2=A0=C2=A0=C2=A0=C2=A0
> > file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
> > =C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0
> > file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch=C2=A0=
\
> > =C2=A0"
> > -SRC_URI[main.sha256sum] =3D
> > "285cbbdf4b6e6e62ed58f370f3f6d8c30825d6e56c5853c66d3c23bcdb09db19"
> > +SRC_URI[main.sha256sum] =3D
> > "00197ab20f33813832bff62fd93cca1c42a08cc689a32a6672ca49591959bff6"
> > diff --git a/meta/recipes-devtools/go/go-binary-native_1.21.5.bb
> > b/meta/recipes-devtools/go/go-binary-native_1.21.7.bb
> > similarity index 78%
> > rename from meta/recipes-devtools/go/go-binary-native_1.21.5.bb
> > rename to meta/recipes-devtools/go/go-binary-native_1.21.7.bb
> > index cc79a277ff..d8826e20f1 100644
> > --- a/meta/recipes-devtools/go/go-binary-native_1.21.5.bb
> > +++ b/meta/recipes-devtools/go/go-binary-native_1.21.7.bb
> > @@ -9,9 +9,9 @@ PROVIDES =3D "go-native"
> > =C2=A0
> > =C2=A0# Checksums available at https://go.dev/dl/
> > =C2=A0SRC_URI =3D
> > "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar
> > .gz;name=3Dgo_${BUILD_GOTUPLE}"
> > -SRC_URI[go_linux_amd64.sha256sum] =3D
> > "e2bc0b3e4b64111ec117295c088bde5f00eeed1567999ff77bc859d7df70078e"
> > -SRC_URI[go_linux_arm64.sha256sum] =3D
> > "841cced7ecda9b2014f139f5bab5ae31785f35399f236b8b3e75dff2a2978d96"
> > -SRC_URI[go_linux_ppc64le.sha256sum] =3D
> > "1f6dd06aa34f292f33c2c70ea9b4456e3a9e5cbd1d99968f3f463a4805b40ece"
> > +SRC_URI[go_linux_amd64.sha256sum] =3D
> > "13b76a9b2a26823e53062fa841b07087d48ae2ef2936445dc34c4ae03293702c"
> > +SRC_URI[go_linux_arm64.sha256sum] =3D
> > "24744edcaeb827aafb76c67ebd406b5ae13291023b0ad9f061dd7a0e75b275ba"
> > +SRC_URI[go_linux_ppc64le.sha256sum] =3D
> > "48a99ecce9b1e632870c29420088f61cf17a6f0c5bdb3cc821ff5c00e14b1a8a"
> > =C2=A0
>=20
> I checked and for some reason, some of these checksums aren't correct
> in this or the previous patch. I'll try fixing them up locally.

With the checksums fixed, 1.21 seemed to pass enough to merge. There
were some meta-oe recipes which failed.

1.22 still has further issues blocking it.

Cheers,

Richard

