Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D24C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 18:09:10 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.28938.1714414143295793640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 11:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ewdAzW2w;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2351c03438cso2127405fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 11:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714414142; x=1715018942; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTRrtndupXBtLNboHmHGNoZV77bCSUMCeYDmhOKEM0M=;
        b=ewdAzW2wiOzTmNfeWjqWCThZTillI43ypW+NCx3R/tukyOO9/R3BGM6GGxvvMhlIvN
         fkp31xEA3v2B7MucbS/iAAO3i6pTcNgbAId1IzZk2go24tz7tviyEXWcALwprj+slt4u
         PegiB7hH73T+XGsxna15AVgOKkwUgmjCi/hl/cYPo/mqg4T9EVudxAIvnOagi+GoqVBN
         8+T2xNeaLYqsIxbiPNTPSKNDcpYJAj7VeiV9c65rzGobXNfHOhR5MT0B8ezkQ5WbuVbd
         t5B4AzdPSRKcc/lBIRfMCDef2WNJZBscGz/pO1l9qly++TMdLRgEIZQ9LUAyYX//LslB
         ZkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714414142; x=1715018942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTRrtndupXBtLNboHmHGNoZV77bCSUMCeYDmhOKEM0M=;
        b=mC3XYZ3OsHv5itHrzu7dSrrupo2XvIFQL4b9BkljHhK0qRgOGp2ipPvKMcOGx4LMEs
         6XoDE703Bn+FVs3rW0BwSTFYtaXK+91oICc1jhr+rxkeNYzHG03MFQZ+kfmQiq3arAUl
         4wyXVsqEYxxAo/8R8KTFXfgimpk+qISGrxACNpWEEkq1QqUKZFaR11KTaQWX15hhlXSX
         zUWg3/TH0xolL02mJxP5KQRCW7wLpni4/v0s2Wqb4Q/J/TVAf8s6U1ecv1nwEtjIfXtm
         1v7gmU/ynpJL7zJYHR/ylURFAYr5cUopT5wnTwCcKMBeJjjo/s5CcZqO1DjfcTryPq6F
         p5OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ/t68IXCRnzoMwhyLBaESGEDubmcR4OEDKepjs0Hx19lMdFoExa+8NorYr4o1RIzu0cIGuNf2VBktaCe5NXj808u3nqeyYPRGMwmcOimHGm4OktkFepZR
X-Gm-Message-State: AOJu0YxYLZMVRNV1dIRxNxXyGz1Fg25Dj2YxrRuJGUZuNdXpk0ZLtGu3
	xQgA4lWhxj4f1ePBsd/+05/TOZSl59HrGtO0Ce8JdrbbyO2J0oUB3QeGdzVk14RwHnB6BBxWSYH
	NTGDoOCmWI5PbI8RVvHhUq2w6+ss=
X-Google-Smtp-Source: AGHT+IEaIkmsF8vwS5N0TNjm+X2khtjXyX8o9CbCk4t4qrZx1q/1WMwBEIttuURfJe2IsBiwwlQybCSxLElnSFxhc28=
X-Received: by 2002:a05:6871:2205:b0:23c:5194:e19d with SMTP id
 sc5-20020a056871220500b0023c5194e19dmr5905799oab.24.1714414142474; Mon, 29
 Apr 2024 11:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240429102959.3493324-1-zboszor@gmail.com> <CAMKF1so2k-N0VvfNnzOdu5L2pMLppN6UQqkK2VQRhG_ww73z-Q@mail.gmail.com>
 <b0e91df1e218fa314ec717d1192134a0f9e5c02f.camel@linuxfoundation.org>
In-Reply-To: <b0e91df1e218fa314ec717d1192134a0f9e5c02f.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Apr 2024 20:08:36 +0200
Message-ID: <CAMKF1soN5FJ5gLH5i6z=k1bkSmtsmTv=UHtpYUL02x1rAbDj_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cracklib: Modify patch to compile with GCC 14
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: zboszor@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 18:09:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198751

On Mon, Apr 29, 2024 at 6:37=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2024-04-29 at 08:03 -0700, Khem Raj via lists.openembedded.org
> wrote:
> > Thanks for fixing this, however I would also suggest to submit this
> > upstream and see if this is acceptable
>
> The patch this is changing one of our patches but I can't tell if the
> code being patched by the patch is "ours" or upstream.

its the behavior coming from our own patch so in that case perhaps
no need to bother upstream. However, the patch itself is also submitted ups=
tream
which has some feedback to reimplement the logic, so perhaps for now
we are ok to accept it locally.

>
> Cheers,
>
> Richard

