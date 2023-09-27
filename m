Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0079BE7F15E
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 03:52:14 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.10281.1695786732252121866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 20:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z+bw+HHD;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1dc6195bf93so5557758fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 20:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695786731; x=1696391531; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8lKfTjohixfciJTf8Oe0aoJmjImiO2ZGa+5ReRYM7I=;
        b=Z+bw+HHDhQgQGqe3qLBi3F9hbutn3RDJ4mGs7rjca13E0cDI2/QXJLa6ntoq+pPei3
         HFwl9Y/jbEFiGYW9ePQFgqUBaQLBMFZzgx8bmVyt0xRh/JDhtjFfc+iBSk0jGkzM0rxR
         D3YgfEip9Ei/fgVnNqe3Hh5tWr1h8+ggCb/zOvgEJk5dWJbtjY2pzqLfJn7+iDp9GGRr
         TgEJBGAKWQ0V5fS7MTsK/hLyt6OkrpQDFtlCT6RcVlzaMwZd/+/eMhVreQZyyUlFAzI0
         l5zFNu1ERanYCgW/7ZSHoZNikPapk0ciSxMITA4xN6EuPQQhStec95Tsccu7GoOcIx6Q
         vwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695786731; x=1696391531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8lKfTjohixfciJTf8Oe0aoJmjImiO2ZGa+5ReRYM7I=;
        b=gmpWQMS9t4UDDNPKzp8OXLDoSk9aRO/ancLN855fH5h7CdV2qZ+FX3lci24gPUkKFO
         Ofz64qC1/zhV7HNn6vGIhXE5qhxVCaOE0obHFMkVvCubgsA3tJT4Q067daRBY5lnZOm7
         4Q00SS6QBcGuKlkLDJMRZqSQrNJP3l9grmvE7bSitvLeBuusLoH9djUuwYqhmo/OWaz4
         sSaFtjcpokzZQmdGeGSHnPNQqwLFQxLXKt3GssIaXFdC/hhGxD3JQn453YeRnhCJnNm9
         JFZW4BmaiM5k5SwBtLUjkuScB2oh7pD4rRLxlwOIatCezXlXbW077JY6MkbQH/1YNKMV
         8pVQ==
X-Gm-Message-State: AOJu0YxVdZHQorrHmf02uve3FV7UqNeHZVKuuM1u108QZqK5JW/s23f3
	NhOGnUN61W4lhQnzEl7ytRvYE9bPpVU+gOAIDhcOfgks9sxfmg==
X-Google-Smtp-Source: AGHT+IFREzGOTEnyE4S4vwtc7zlPU9usqNkqOz4TBcoRZGssWuhNSYFX/kkPS0CCkrtMtPrzJPNLxVoJ4FtFQbMbjG0=
X-Received: by 2002:a05:6870:f611:b0:1c8:bae6:527d with SMTP id
 ek17-20020a056870f61100b001c8bae6527dmr1140590oab.55.1695786731356; Tue, 26
 Sep 2023 20:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230923172500.3425735-1-robert.joslyn@redrectangle.org>
 <CAMKF1so02nmDcYJHYodzU9Q7OzxU9VTjkJ6xp7gXhjWJOvdP3A@mail.gmail.com> <2f1c0aa0-872b-485b-9497-34114b93bb8a@redrectangle.org>
In-Reply-To: <2f1c0aa0-872b-485b-9497-34114b93bb8a@redrectangle.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Sep 2023 20:51:44 -0700
Message-ID: <CAMKF1sq5X88ida1avvUp8ndC2BQoEr5sUvbkdm0LPDRB8KNiMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] curl: Update from 8.2.1 to 8.3.0
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 03:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188290

On Tue, Sep 26, 2023 at 7:55=E2=80=AFPM Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:
>
> On 9/26/23 7:55 AM, Khem Raj wrote:
> > I am seeing a ptest failure on qemx86-64/glibc
> >
> >    Failed ptests:
> >    {'curl': ['test_1474', 'curl']}
>
> In looking at the test, it is marked as flaky with the comment:
>
> # Because of the timing sensitivity (scheduling delays of 500 msec can ca=
use
> # the test to fail), this test is marked flaky to avoid it being run in
> the CI
> # builds which are often run on overloaded servers.
>
> https://github.com/curl/curl/blob/curl-8_3_0/tests/data/test1474#L21
>
> My server is pretty lightly loaded while running the tests, so that
> could explain why I haven't seen it fail normally. I was able to induce
> a failure by running a very heavy load while running that test on my
> desktop (which is older and slower than my build server). If you'd like,
> I can send a follow up patch to skip tests marked as flaky.
>

another run resulted in yet another failure

  test 0587...
   FAIL: 587: protoc!
   There was no content at all in the file log/2/server.input.
   Server glitch? Total curl failure? Returned: 42

prior to this upgrade my test setup never saw curl failures and it has
same amount of load etc.


> Thanks,
>
> Robert
>

