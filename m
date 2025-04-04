Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C99DC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 11:37:33 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.9171.1743766644813178071
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 04:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D1yhQZdn;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b166fa41bso2055368e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 04:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743766643; x=1744371443; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojXaLY7gdYXsaiafY0pPFUbTkit0Hg4QbcmFU9bcR3w=;
        b=D1yhQZdnft5EyBf5Bm1SDHcsSRI4qM1n+qPOevulzbXK8OvcgBf51UrNfvAS8qSi0B
         TuC6FEB/o9bzxmzm5tG8T+vdFtIfNl0QLVfSPJMZzsR7o6wlpTFvNfWybuP3Sb7ghncK
         zdknZHZtdUnkfxYRJlPA6esDcbLflbKivX+aqsAlXshEvCvZ2oekv4R7sqp82RyijakK
         zGUZIHLcRVrpOHLDXC33ld7GEhKU7TKs4laYMk9xsNZ9k0NgWb/54O0Jc6CQHq7FmvsW
         RPSJXafuhlmLnZzkCjXirqrU+rn9rDRxCDBWrMyAm429Db6PSbpa/7u5O6ry3qXpyyGO
         mI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743766643; x=1744371443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojXaLY7gdYXsaiafY0pPFUbTkit0Hg4QbcmFU9bcR3w=;
        b=QydOaXctyi19toLeDJWWaRYRp7K0GwM0nRX8SqoCB3yO5iRrrVeGAIdfd9XOXI/jxD
         qD/hsms1/HyBPb+7XietUgQpgLV8lkNfsZsH8hAwRz4NXTCjQ91ypinEV0zEz9ai4Z1v
         YCmQcpCsfmt251hnBAwB7B80VKEYhdPgkmKpJJ80Is4ty4i6YJqHh+kXrp5misw43hFt
         n5JGMGFJ9ulDFofZT1ftfVsp9nrq2Bg43RyGon979Z91cHkszaAGqB7by++Fy9Wio3j+
         VyadJhzDphwENlVet/mVmRMyU3v6hOIddngn6x2DDKtLgQK52dS+yUoZdj9qONmEH7VD
         ShrQ==
X-Gm-Message-State: AOJu0YzpetSHvIS8bFPrI8PWgih+/gu9pSVwincynVKeaW3+n7GE8BOJ
	1CuZZOR5LJZmWfBuG8TxEKL4n059bovW4skh5Azq59LkFBHC0Bpxpmae8M26MamcE0OjJLQy998
	VmYcw72OCemzXHngQmBIuvPg8MFw=
X-Gm-Gg: ASbGnctWO/gvZxMvkXTTDeHDPW14fN76oNuKJjWlXjLPOD3iP/M2eAhWpGAQM6IJgg2
	0k7VGGURTGdwZZeO6N8wtqwDzG5etlPr35UfRG0oX67WQYoZqOj6xL0VEmzS0WAWb+Lis2fCReX
	GeGFp0rlTZ4G4Aksiy8IVHjacQ
X-Google-Smtp-Source: AGHT+IEYEXAd3lGohNga/8jSmNj10tpCQX29SKc3vBmNpOJ0yLC1yi9M3FE+q7OR5zTimVE7tVRvMCAmYw2AjH2mivE=
X-Received: by 2002:a05:651c:890:b0:30b:badf:75ee with SMTP id
 38308e7fff4ca-30f0bdfe2aemr6893491fa.7.1743766642772; Fri, 04 Apr 2025
 04:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-connman-v2-0-8bb637312ba8@gmail.com> <20250403-connman-v2-2-8bb637312ba8@gmail.com>
 <9c292aad-cee7-47a5-a6ff-512689f188c2@gmail.com>
In-Reply-To: <9c292aad-cee7-47a5-a6ff-512689f188c2@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 4 Apr 2025 12:37:10 +0100
X-Gm-Features: ATxdqUHPvwoofhaydVS6ZEEQ8ABRUJB0tc12KUMrQnSxvoV9wSTlRgEfbdMzIqg
Message-ID: <CAO5Uq5R2x0rq5tQiSG1j78BenYCJitVgBDCJd1bZ60c9W+wGDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH OE-Core v2 2/6] connman: Delete patches for gold
 and MIPS binutils fix
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 11:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214343

On Fri, Apr 4, 2025 at 2:06=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> On 4/3/25 3:52 AM, Alex Kiernan via lists.openembedded.org wrote:
> > gold is no longer built/supported. The workaround for binutils on MIPS =
no
> > longer appears to be required.
> >
>
> It still might be required with LLD linker, I will check that once its
> staged on master-next
>
> > Also fix up tabs/whitespace in shell functions, correct HOMEPAGE, drop =
broken
> > BUGTRACKER link.
>
> Perhaps whitespace changes can be a separate patch.
>

I think this one has already landed in master - sorry, splitting the
purely non-functional stuff apart would have made more sense.

--=20
Alex Kiernan

