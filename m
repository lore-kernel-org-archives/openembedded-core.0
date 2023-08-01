Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF19C001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 10:04:49 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.9104.1690884282041124777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 03:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ghIACssQ;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-786bb09e595so150537139f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 03:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690884281; x=1691489081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+e1XK2nuSqt4ycvVexH4APCPZ/cP0X8FHnrGFblcWM=;
        b=ghIACssQbA43pFIozsQddmereHKgXpw6eWyFWa6zAFjU+imGNi7TBFYh2VG0PFOBMe
         lwlPTDXcFN3WF9q76AcfH4iP1l0YewJModQTK7YUGv7Xc9bzmM8tklj6l+TK5rKGNeFg
         kpUxqLTMc7H6BxwyrCrP24n+JltBbNeliVFPjSXoy+iuQtQ3QLeFTbGKKGHctdyD7+Af
         AQ77gE2xtvbIol35xZLWnJ8iLjAT6flzioDxthp7k4UYT+mA4GHA09eGydDMZPPthHnD
         l6P3MimeYCEISjsMrFfaq1SaUSnWKba12buPh0ZHaJzx16JbKZaUbJFL2xNKDegOYgBo
         GVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690884281; x=1691489081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+e1XK2nuSqt4ycvVexH4APCPZ/cP0X8FHnrGFblcWM=;
        b=M0kM3ACqC3zDinr7dxZyzSkkfB9f7kHnaGoz+rBy/klYfeLcgL0i6fyWvgi89ULtD+
         lRHvkRm4rgMrHrOXabN7h+INxaA9lnCq1jx4I/Nu1tJCMHqAGBeM7sU6j7Vb6pOko2Qj
         i9obHFO52OfFaiV+zw1gBe/TPv3EXQf1RUXwUYZrmzkT4+JfqAU7X0/1jlONBb18kiJG
         xg+Ccjz3/ZkPIw52X/7iM62fHZJDTSYw0qYrG10eX9xdeQklmMVPzAqMwStehhrMYFex
         n2U1vmZR65Zu4Y6FBMF6xtTr8wrrLVG6FU6ShQnfwHVwsahzPGOrCTxcN4R+/Ov05mkP
         PtiA==
X-Gm-Message-State: ABy/qLbKE96NfIunF/rzKRU6PZQm2c7KludjiLcjEzrppxN/MM1Rozka
	hOkRRoB8BF3QmXd/lLuGEv3Iw9ozleryA3jwOsc=
X-Google-Smtp-Source: APBJJlHi0EPvjzfNSBS5eGsBmdnClt1v8Xqu3gstHQ9n0kC9cTWO/fZH1yUjdr+brVuxAIyGskDJKL/KDHZRBAvXjFQ=
X-Received: by 2002:a05:6e02:1ba1:b0:349:178b:2818 with SMTP id
 n1-20020a056e021ba100b00349178b2818mr7479773ili.13.1690884281024; Tue, 01 Aug
 2023 03:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
 <7a3e6d5250d6d0cc526dbede582815007a3b3e56.1690795930.git.frederic.martinsons@gmail.com>
 <205e20dd658f80e5215b6330f387cb4f95c30d4f.camel@linuxfoundation.org>
 <CA+cAkeoSMuuZoY+u7bAXq=9CAtrjyQew5MwCLMXRo7O9KRH4PQ@mail.gmail.com>
 <8ee20428cdc9a71f33bed57893ed6683f05e620b.camel@linuxfoundation.org>
 <CA+cAkepixZXe=6SP8eKwkg7+h3p0CcK+s8s3Uyg0vYmACtH=xA@mail.gmail.com>
 <1f72dc4842eaadc8fa49eef29f2f0af4179131c9.camel@linuxfoundation.org>
 <CANNYZj96-co4wRxY=N3KS4bEsFr_v=yJphOC0ZBO92TerGtmug@mail.gmail.com>
 <CA+cAkepSOxNovN+iuRx8_=9Ut=bLXBb8YHbHG5SJJedGfGmeBg@mail.gmail.com> <d036b9e08737619b03af2e6b27bc99e9abcee377.camel@linuxfoundation.org>
In-Reply-To: <d036b9e08737619b03af2e6b27bc99e9abcee377.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 1 Aug 2023 11:04:28 +0100
Message-ID: <CAO5Uq5T=HcAVWaU0RQzqXg0vhQ=ybkOWgHg5GuXWvQEqwt+uqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] cargo.bbclass: Offer a way to use --offline
 instead of --frozen
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Randy.MacLeod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 10:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185231

On Tue, Aug 1, 2023 at 11:01=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-08-01 at 11:55 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> > zariant rust recipe is tested for devtool cases there
> >
> > The test case mentioned earlier seems to verify that we can run rust
> > test code, do we want to keep testing
> > that rust binary can run ? If so, how to keep testing this while
> > removing rust-hello-world recipes ?
> >
> > maybe we can add a simple "println!("Hello world") " in this file ,
> > compile it like it is already done and run it
> > to check its output ?
> >
> > What do you think?
>
> Doesn't test_rust_compile already also run the rust code it compiled?
>

Yes and checks the exit code - really not sure I see any additional
value in turning it into another "Hello World". I'm fairly sure the
cargo test gets you another "Hello World" test (but again only checks
the return value). I think the rust-hello-world test is covered in
other ways now.


--=20
Alex Kiernan

