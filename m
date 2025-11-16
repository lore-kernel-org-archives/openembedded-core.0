Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E869CD4F3E
	for <webhook@archiver.kernel.org>; Sun, 16 Nov 2025 18:20:44 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1506.1763317235190379748
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 10:20:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Xufd24MY;
 spf=softfail (domain: sakoman.com, ip: 74.125.224.51, mailfrom: steve@sakoman.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-63e19642764so2907513d50.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 10:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763317234; x=1763922034; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a+3CroqvNWBZyHNzSKenBFTxBXQPQR3RjpDRDsxcoA=;
        b=Xufd24MYaKtENqqYqQUeYkfCpyrdIQqFIeE3GOgcXyL/J/dBzaQ3XorybKULb7J6Fa
         DOGuUwUIJaDT+1i+DtRf/AeoUCdVgocnphnC+0D7dcskZso2CtTqwXuSVY9LZMdHZak/
         U20WK3Rdjrg2rQV/S3o2P7atmDLMo4NuFnhfBS6wlIDZchXhN1RP9Z4duFx1KW6R8RW1
         dZ+wQ5Bq8XPGPQ3BqIDqICmSQn64SGmxDsqWMLh3HTuRs+YJZsVU3cKGzlJNz5kuzYBU
         CSu/f+Wyl9uuBBmfK27e8B0DMMXFr8PrS21IZBLVbdSFGOyISL8lKSYMddMKfkxoBu9/
         krcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763317234; x=1763922034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0a+3CroqvNWBZyHNzSKenBFTxBXQPQR3RjpDRDsxcoA=;
        b=bV0Mpvf0MADLrmxqWApmlqv9SBOCUu41Y0Sj0uI+j2y3GYh6QzY8exuoQDdKNnjr9N
         LGGuhXuiYAJlTrE0284YkY51xn1Y5Gl1jUNonFGhs4heUB8E/6Ozz9rp5Cc56KPSnku3
         ZzUKyVbk6qPFZ2ONdyI5jitbzsmNsco3+R1Uqaq+z5JCuLytdQhrKv8FvihgwRoBRuoH
         31EwHiYHi3zwAxHc3o6TzuGEI8so+Kq0/Xl6Ih4YhnBcC2u/FPgQH9z8RsP+BzvIxhCH
         lRtO+jBrLT3BIjSU6cVVKcIuSPT2htkZkBuOe9tAFzsKpqYGzryvTlT2VTqMhx8qF6Wq
         iVng==
X-Gm-Message-State: AOJu0YwmvKet10wBHuCrTkFXSGqyDa8BtIw1d2Av4kQ6IG1HslQf154G
	XfxgqICaasIXAJynf/63rNGsXjCocxaHGduN6RkEq0+j43IHWvYx/nYpG7vnJ3CMkuWyrBPrB3j
	iisYcvvPXrVOjJ9Lz9R4q5OrFf4riROW6Tkk4eOaSfw==
X-Gm-Gg: ASbGnct0hIuCPM7+c8+vAAR+lOv3WcQW1OpXb/iWZl56iOv6348jHs8VIv+FaB14Wz7
	qbrPwvNjp5hgxiM4zw/4biZXpFY20G7uwRVPM5frQCIhj5HBkN6unampyQP64wTt2cSiwHU6cw7
	GfqaLxlsCV1CVcWofq0qUmJ7mnZUo0PJHAwofyVB0wQW5izTz2Jzv5Bd0BxODIE45LeXGwKWrp0
	zbh1YnAPUP5yy5bNFjgY1Qp7+sdcvjofSJs/8M6j1v+5Kprqa+8QFQ+PlmDBgZPKP9Y8KMrPowp
	1MlkyyrdxLfjydGp+k6oW9mBIvg=
X-Google-Smtp-Source: AGHT+IELZJRDJWN7UZnR/MlStOP5xN+k+/VdQ5DqKKzotohj4GopfcFaaOkyU1T7rH3cT+v99NQiA0zmJ05tHTKaYhY=
X-Received: by 2002:a05:690e:d58:b0:63f:9ff9:1496 with SMTP id
 956f58d0204a3-641e75531a6mr8390502d50.2.1763317234277; Sun, 16 Nov 2025
 10:20:34 -0800 (PST)
MIME-Version: 1.0
References: <20251109114632.331C31001C6@builder.sakoman.com> <b96e80dd-fde5-417a-a2af-6a05a6832b83@gmail.com>
In-Reply-To: <b96e80dd-fde5-417a-a2af-6a05a6832b83@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 16 Nov 2025 10:20:22 -0800
X-Gm-Features: AWmQ_blu_fnU7Y3DdXmbXc7OnddMbsXNHO5qgp0dMTqEG5TQySfCTTrSqPjDI0A
Message-ID: <CAOSpxdbQSCrYfN6LpDCN0xBAqtYJEQ8GukDswA7hKjvNu=uLsA@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for walnascar on Sun 09 Nov 2025
 01:44:35 AM HST
To: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 18:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226476

On Fri, Nov 14, 2025 at 7:16=E2=80=AFPM Clayton Casciato
<majortomtosourcecontrol@gmail.com> wrote:
>
> > Branch: walnascar
> > [...]
> > Removed this week: 34 CVEs
> > [...]
> > CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-4010 *
> Hi, Steve
>
> Can you provide insight as to how/why this was removed?

The walnascar branch is end of life and not changing, so I suspect
that this was removed due to a CVE database change.

Steve

>
> Thank you!
>
> --
> Clayton Casciato

