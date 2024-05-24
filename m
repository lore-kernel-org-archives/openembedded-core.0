Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211BAC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 07:49:39 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.10831.1716536978401972544
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 00:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ge1wxeQS;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5295a576702so636141e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 00:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716536976; x=1717141776; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G5a59tPzuoA19CGkQWHsU74f6xpvRKQJ+PNZcKwgwKk=;
        b=ge1wxeQSqK+DvMHIEyyqM5GfDmVSKjH4rYIbL2bEf3Z9viDbm0m1q5F2TDi2MMNUqJ
         yJ8K403fm5Xlr4t95c16OnyBbSnKSJCI0yeGCHQ5rra53DthJ4jtqd2yZ94KBothDFGc
         yHTvtM/x7I7XLH4WxYGGs4eM9ukQWmR47FfzgR6WZSTNYyZq81Yy+5b1Q+sDB0hP3V4X
         zo5xMKx8tRZ7RADf88ptyY+rII2ImTRUf+iY7lLDy9D4patAUrk6Lkk0wRULsdYKy1aw
         cFS6OZ3AzjJP/9yPG2vWep2LyuSIFL6x/puJyT4a5VPoqdD6vEVyWkiRcNu4IOofRbIm
         H1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716536976; x=1717141776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5a59tPzuoA19CGkQWHsU74f6xpvRKQJ+PNZcKwgwKk=;
        b=Xl3EkDX9Phs/5dO1MK4SVdUZ5dKC+0eMZggwN/8L3HjUcO+cMe8P7hL8q352jiPKho
         oix6l9vSwXjgxacNhEy1snYrCCLfiALDc49JSe+sancBL7JdqW2Tzi3dYLUQj4ybQFJ+
         a/64q04eM5jsb16pr8sLthSmyvqUCz5LWXi0y/3STm1XWwwtSBsdZsF6PxQaImTR3hmA
         s9Er/K8FRaOdck10HGsLG/FEKAZxFR28kfmJDq7p8myZwOu2tmbsI/p1Twkk6s+fRz1l
         6mlUEv84qkYZT3tyw4uz/gsZ/zhCVqzIJUnt4FatYGqlTFD2zyksO/lJGWH2O+PpMyHU
         4dFw==
X-Forwarded-Encrypted: i=1; AJvYcCWJQ+3rQJsl0HKHzfGhQHzmP18xq6kuz8TvUdb+acI+jGXgWrS5ZFE8Medz6PcgB0Ow1iLATfpbI7o0QkMIcHoDuRMa4AQFoo9HNlyCRORav1TYOeidG4pv
X-Gm-Message-State: AOJu0Yw/Ad8fMVzcgw+MYh5u5kNOl/bK9C/c2eGkhYP8d1DKTsLAPjs8
	2H0zEirHA2+xUJI9ewUbPSE9XSrkYZKVzycQotIrMWdOqr2sXsGlgTUGW1h/TIgJkoratyaqrKs
	zcvcsbDnWF4P3ERs+uB/3OxzdeU4xTg==
X-Google-Smtp-Source: AGHT+IGuy2UGAbPuPboZzOhVNNOR3bDHE3rryPRdSbydY/190+imVrx3uPRXj1rJUQfzCEqK8nR2HN/IkZOGxdfzHRA=
X-Received: by 2002:a19:ca01:0:b0:523:99a4:a187 with SMTP id
 2adb3069b0e04-529645e356amr756571e87.26.1716536976369; Fri, 24 May 2024
 00:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240523125441.45922-1-emil.kronborg@protonmail.com>
 <a1e40553b608081c1f251c1ac61310f2583ee015.camel@linuxfoundation.org> <7ubt3kdspc5rp6ab4k6qip2gakgh7wf77oj2llf677gkach6xe@fsqhtqt4eeed>
In-Reply-To: <7ubt3kdspc5rp6ab4k6qip2gakgh7wf77oj2llf677gkach6xe@fsqhtqt4eeed>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 May 2024 09:49:24 +0200
Message-ID: <CANNYZj_FkqJzCW_dkFr8=Dnu86UUuzjLE74KfSnrAvoASZxUfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] insane.bbclass: use HOST_ARCH to check for
 32-bit symbols
To: emil.kronborg@protonmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, rasmus.villemoes@prevas.dk
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 07:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199832

On Fri, 24 May 2024 at 09:47, Emil Kronborg via lists.openembedded.org
<emil.kronborg=protonmail.com@lists.openembedded.org> wrote:
> There is obviously a problem when building binaries for an SDK and using
> OVERRIDES for the check. To me, HOST_ARCH looks most correct, but if it
> misses some cases, it should not be used as a one-to-one replacement for
> OVERRIDES. Is there some proper way in BitBake to catch all 32-bit
> architectures? If not, would adding i686, and potentially other missing
> names, to the list of 32-bit time architectures, i.e
> thirtytwo_bit_time_archs, be feasible?

I vaguely remember that at some point I ran 'bitbake -e recipe'
against qemux86 machine to study that question, and looked through all
related variables, and couldn't find anything better. But you're
welcome to try that as well.

Alex

