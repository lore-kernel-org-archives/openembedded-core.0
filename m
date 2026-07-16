Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F69C4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 08:34:54 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8204.1784190886725741052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 01:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rDUJe00b;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-902f92b8504so55977586d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 01:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784190886; cv=none;
        d=google.com; s=arc-20260327;
        b=Oiprv9NAAyp9IgcohtGq+EY/gvmo2/maHo9lkqJNP59Ik3i/edNJxAe10kxjb9fYB2
         JKBUeIHSqWOuu8ERcGjoGlKsGa89ClG4RGZrwTCVYI7ZyqacqMhi82cATVYPxOt+6U7Y
         15R/hEqZYHJKMD0ojONymTbp05CI71accbxYZKjMgpp5Irr00HsHjPlkJNp1Sw7Y1wl4
         tKD3ibtvURfB3zICU7SgyhNVRFmWchbvu8a5BH63jNBUU98s5s1P/7OoPDx0po8GiMuc
         N16SsrZK7bI/80hhHkHUyC1bIMcDLQGiCk0MkQPgKLnWnWNPhMhEJohCCPt4cApuJ89u
         Arcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CNwb4lZAO5Ul9PWpLj7Jnu1JPzBEiXh/7xoqoWjfpSo=;
        fh=aJJvhGyEhJT3zsnNvUF+cCeL5lwBOePvPl2X0kioRr0=;
        b=Rpp9NIhtdY1p2+63I/T/GIROAJ86X3A5RTMcNAQPGQ0Vm1374LgiCNycDQG5826XUm
         gLDcRy8X1UNx3wC9oDLeMni2IMLhlo5jk6aIq28OZHrIkW0Rp1tS5TJt61d+xyVd5CTC
         fzTAtunbVGrX3y6N2e75EzxlXmbVyNg5gjL5ak/zYaMSS9lcBdSXIPAjt7woLOJun2l8
         +iFy/X3an33xsXc0Tx+/NwaHMIRSXdxtFcya/F6Txja4b/qHowc1H7iOXgYe4qeRn7tJ
         hFva9V2YfMm1UfKfxM6rufxget3mNLPAHhAZbYQUlehfVKfudaI5NW5mTjRMs9dzYpWZ
         pyTQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784190886; x=1784795686; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNwb4lZAO5Ul9PWpLj7Jnu1JPzBEiXh/7xoqoWjfpSo=;
        b=rDUJe00byTs8NOc3yVimS8tYrjYGWPquhoG3g1vQbXr8OoWaq4RgCzxyonsDEDn4t8
         1nTif6qhN0b7VmolQMageNYPHdM/+v0TCwu/X6THEPPemOa/o9b5jIgEfkUAwIlvkRmK
         vE5+pDXvj1++2oDsg1UL9xa0ASuK9CtEppa5yiicTQY6Wp2IopIjuJHQA2A1tE4xO/NQ
         11s3ucS7K+Aw6yUT5Wq3WdxYdIIr8Gn+MYtlCwV/sNwb+DlYS9/LO5R4tammryHlUUSG
         kGM1NKdMuxiE7jzIWEfFEPopu1BmQK2I3usuOpjSBkvF0DLZlEeBSJHtufLrAW7+eQRT
         SmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784190886; x=1784795686;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CNwb4lZAO5Ul9PWpLj7Jnu1JPzBEiXh/7xoqoWjfpSo=;
        b=OQEk5UNT07ha/UkacaYLelFEDh9afDT9Hib8AOhQLUXuhnTLMAPYEQPE/8JIvamewF
         Tu8ujgBqQsYZiuB6RXevQTclAI3QUgdl6PV2SJytw6TCNzBfhUpsajyWGVwpjBMMi/KO
         Dk7bQv9Wkt5vnuD2H2rnup0jQpjUKUDIoCEEXnBtYSJuFlSUrFiEcziRWW0lC0v+q+2u
         dbsqEmPL7ItMi1PahuXpC5t3FaTCBMi65nqoVy8SvsDWZLN5Z/dJn1gINoBYfnhDpmAA
         QR7UJiJoRcfyijgW458GprwtDA91tqA2UV8NTq1dyQyn68TwSYSgVNsayizmu8g8UKUG
         Wwlw==
X-Gm-Message-State: AOJu0YzfYuBwAiwPs3q4/ASWCcKJZJyYm3qsJn95WCYndmh7mZ19srwJ
	C3zcNn3DOCJVznwwJGd1jakiqKAo5Yahg2PdXkYoaHL4i6OYvsERI91Tr+V5jpwtA6ncG3/9rvQ
	34Uz7iulW6ySwGT7rbakrlrHYirLjaRFAxg==
X-Gm-Gg: AfdE7clNebhWBqrsjknzSi/7YAhGPOTIWqQTJJg7EMH5+BeK1r6Bj+Kmne0AhfM/8kh
	TzBRCIeOoq5xdVX+vyY11/IMXB0qg6qWSw0r1rA5yMmcHvTK6M3LC+tu70Z00fyFxaBiTUojLd0
	VtQ11wTq8iHLjfxRmQvhexiyJm4XqZMxjuvWEfDWH4pCi3d/igGxfmqjeOXZLPCjis/c2N9G0la
	cvZEZG88dv4P1uR4CuLOu6O1te4zouztp6jm8TAt3VpW+YBfAI47MIEf84F36Qt9Fa834lZP9QL
	1Fv/5FMEitCDpXh/YTgd
X-Received: by 2002:a05:6214:2387:b0:8cc:d066:54d with SMTP id
 6a1803df08f44-90758d0de3emr65547776d6.24.1784190885365; Thu, 16 Jul 2026
 01:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr>
 <CANNYZj81E4G9gSBPHNNsxg4JiJ_wEnmCoSkNdQ2bzJBjF5q=DA@mail.gmail.com>
 <DJJ33TR36YJC.24WW5E1PX60Z2@smile.fr> <DJJV9FGWRHJB.26TA7NN2T8LVS@smile.fr>
 <CANNYZj8nhGqmvy0tTnUHCNtnjkjweE-OwqL3gDL0mOYGgQO8OQ@mail.gmail.com>
 <DJO58J8D7X5G.2FRK2OBFYWIDO@smile.fr> <3a7e0892-9656-48f0-ae64-ee9ee047b6e1@windriver.com>
 <CANNYZj-UN-4ZR=X4KQLMawCSYoe8zpWqWmPN0xwLkVGNCDNcYw@mail.gmail.com> <743437.1784163705822875917@lists.openembedded.org>
In-Reply-To: <743437.1784163705822875917@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 Jul 2026 10:34:33 +0200
X-Gm-Features: AUfX_mwfB-TFAB5TOsX8xSDNM76G-bkmJG9n2clqd7uyfVpK-deqqmYWVapmdPo
Message-ID: <CANNYZj9=88aGwqtyBXqyaQJvDGTN7p=xkgf9eH-9ESrWcJaSbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC 0/3] RFC: Fixing rust segfault (#16058) to
 support Ubuntu 26.04 on Scarthgap
To: SunilKumar.Dora@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 08:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241069

On Thu, 16 Jul 2026 at 03:01, Dora, Sunil Kumar via
lists.openembedded.org
<SunilKumar.Dora=windriver.com@lists.openembedded.org> wrote:

> I built core-image-minimal with Rust and Cargo, booted it, and verified that rustc and cargo work
> on the target by compiling and running a test program. librustc_driver now carries a NEEDED entry
> for libLLVM-17.so instead of linking LLVM statically. oe-selftest is still running on my side.
> If you and Yoann are okay with this approach, I'll submit it to scarthgap once it completes.

Hello Sunil,

Thanks for all the additional research, it's a lot of tedious work.

If you can get the working scarthgap backport for the dynamic linking,
we can probably just take it and leave it at that. There's a lot of
distros to be fixed, they all have different processes to do so, it is
not clear if they have capacity (or interest!) to do the fixing within
reasonable time. On the other hand, with the passage of time, the
older distros will naturally reach EOL and they'll be taken out of the
yocto build cluster. I want to ask: do you have more pressing issues
with the rust toolchain (or oe-core in general) that you think should
be prioritized? Our own resources are stretched thin, and we need to
use them wisely.

Alex

