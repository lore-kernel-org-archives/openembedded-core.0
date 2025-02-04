Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391A5C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 11:03:27 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.113548.1738667002216723730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 03:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UnNzxm1p;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6df83fd01cbso22330526d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 03:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738667001; x=1739271801; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=99Bcy0gE26vhIectDzp01HqlPiF2QhZ6g/zTynwZ5/A=;
        b=UnNzxm1pc38/azrBaL+G/Qug/lhqoogQdLooWPDNGZSmBQr7DuMLGRDClP87xeWunW
         K0ytzAE4KfndD6+hG6jG6H2T1PCtibC00Fq9LjQN8ScJgNgTPjhLx56TqbrxwQ+lSUzD
         ztzPupzXBkl+M22XaeUtF4C77YIDk5BB8GVTC11ZfcS0ib/N4Y1JZguDzuXNK7ty3bI8
         2DSXILVWRdRkzzbY4/ORSm25t5GTDrF1lSJ0SZVJflvn3AcCBml8jN5/i0y1+VXH5ogy
         ob7RLpwNO0UOir7UAoeT5Dx4ktDR3sGLtjv7YQSpkfrrWocETXViR5N4OGgZdJeqcSnB
         vLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738667001; x=1739271801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99Bcy0gE26vhIectDzp01HqlPiF2QhZ6g/zTynwZ5/A=;
        b=UqPl7y1flsJvFBt6LLk1RZX7mYY6drutKPaJkhyF/Vzn/anJf7F/j7Wo9lf0jHo54s
         zFf++MxscJ0X8yBbGVQAy2CslJsJ9BGeD+O3dmaji3OQGNuGOUTPo2oZO0G+qqewyhX+
         Ov/3iI7c3dnCiZnXxshNMAjue5RS7c7uPWB74H1QYAf+OPJMC7ql0uEoLEhdakD6jVot
         e8gHIHqYuRN3mujx6kh/84SOVdN7vKysZOZXNRbIDH6xPUPjULjs+0G8qsiHSVtKdp0z
         ci9rLFmR3pMLO4Fo8KdBLKBuYd1TydIVx18Ax3KctXhNUeOEJEsKrYfXwR4TbaZuPUEM
         no/w==
X-Gm-Message-State: AOJu0YwATIkaOhi897yxiLpuQCybhJV0quc3Z6CTH1zCzrHJXVPMJZ1q
	jH78AN9fpRJRq5OrGvKdGnVNQz0+kfL/Qs3woB9vwx4cHUQalKnaJZenYxBSbA0Y4teMkOHq3Ss
	e4uyWpo9bHpcPQuBqr1D+UoWgBiw=
X-Gm-Gg: ASbGnctBcK5DZLe+1vSmeqZ+UUtIBfJBSxFElJVcnmWG/JzXfFATfuBV9GFnX82Br+5
	py8nDB/n20gUgSXpz9gH8yyIvJImUFYLzdECKzkmE3fKEXcFRU/2/c9ULIDB7AhMWFkAoxP3Pv1
	NGGOIfCucGBwIkL74jtI4jpXtt9wl1lhI=
X-Google-Smtp-Source: AGHT+IGj+/vMNjNAPISfLYChuZBUl6+5wdr2mAZi1OjPkMDAko8KTtk19L4YJBpwxxPBJcgiP19n/FO/ApEtpkdNJ/g=
X-Received: by 2002:ad4:5dc8:0:b0:6d8:8f14:2f5f with SMTP id
 6a1803df08f44-6e243bf8ce0mr395196066d6.23.1738667001266; Tue, 04 Feb 2025
 03:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20240726133559.1124668-1-sundeep.kokkonda@windriver.com>
 <CANNYZj9V8K5upKxUdA8U4OXsdvt_+TTen=MogiVjJfqkV7jOOw@mail.gmail.com>
 <74363653-308f-4465-8bf5-4f8aab01379e@windriver.com> <CANNYZj-egdbGeyLRRQKT2+ewmfNWC6SxJKy-yDDGQtaUZYp4tw@mail.gmail.com>
 <d153ffef-33eb-4c68-a2e5-6c4c7320fd9d@windriver.com>
In-Reply-To: <d153ffef-33eb-4c68-a2e5-6c4c7320fd9d@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Feb 2025 12:03:10 +0100
X-Gm-Features: AWEUYZm9GvqnrMmFAmnnjNtKscXQRNRw2xtg6yse_Hmqd-_cCE6paraQH51lGQQ
Message-ID: <CANNYZj89DxgQ8msEbCdmS7dc=ym3y-ekBw6NSA+pwof33_Es6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: rustdoc reproducibility issue fix
To: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	naveen.gowda@windriver.com, shivaprasad.moodalappa@windriver.com, 
	yash.shinde@windriver.com, deepthi.hemraj@windriver.com, 
	harish.sadineni@windriver.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 11:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210770

On Thu, 30 Jan 2025 at 04:24, Sundeep KOKKONDA
<Sundeep.Kokkonda@windriver.com> wrote:
> Sure Alex, I will look into it the ways to optimize it. As I remember, when the 'codegen-units' count is increased it is causing rustdoc binaries are not reproducible.
>
> I've to re-test it with some higher values of 'codegen-units' on latest rust sources. I'll test that.
>
> You can simply drop the patch and then rust will pick a default value
> of 16 for it. On 1.81.0 that still makes rustdoc unreproducible, I
> just checked that.
>
> Thanks for confirmation Alex.
>
> We already have an open issue for the reproducibility issue with rust community and there the rustdoc issue with 'codegen_units' also mentioned.
>
> https://github.com/rust-lang/rust/issues/134589#issue-2753629767
>
>
> We will work with upstream to find the proper fix for this issue.

I spent some time looking into rustdoc again. While I couldn't quite
get to the bottom of the issue (it's a deeply esoteric llvm subject),
I was at least able to produce a better reproducibility work-around:

https://patchwork.yoctoproject.org/project/oe-core/patch/20250204104205.3423548-1-alex.kanavin@gmail.com/

Alex

