Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645D6C77B7C
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 16:23:10 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.22030.1683735787592969241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 09:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GQyZVXTf;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-390723f815fso2359361b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 09:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683735787; x=1686327787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxmgUTLXwKNOtpD0w/42npBLtz9FMQLELmrN2t9WThA=;
        b=GQyZVXTfcm16ejID1L1sWp1KAH+JGNcHYl/m04SbGgytRsAC34PvrGjgF4gEVl91r1
         L9r0vghMR/Q4E+Exl5prHXzZ/QjEcGkqBu87Yehi7kqgsC26h2anwFBMUqOauE0BBh6l
         5jQVduBR4GmiD0vk8TwAzi20a/wUdvUOizITMW4Sbhkqp846j/kseXPeclxVF3tDuajg
         5ku6+2/7o49MgW5M8Ru3UCsgDA3mBAn1xtlpwePpWhJlHkXWi9rbzt0nsjYrCYeIKD6h
         JImkA7AsAMXaQCqQWvaWpFJC2b4l9/2mgTHL70hWgq1qdeTnEHb9E0+vwbtRmsraPT8Y
         ZKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683735787; x=1686327787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxmgUTLXwKNOtpD0w/42npBLtz9FMQLELmrN2t9WThA=;
        b=HzIDb3Tt1zsF6m3kP+qrw6BEG06XjNbG0B4H/Grx9E9A+UGX22swmuhcUHIoUA+Ybe
         B0zUtOkkRqExpyLNNicX2yUcg5yNiF6kgLspxfkG5jAIDdkqCRv16mwqcLaMkjZZEXYz
         DjL81idOT52pX4QmYoj5uTJVY8L6kF9yvSBeiwuDDNIKVkD14Cutmw/vCuiHwQnibyj3
         mqfHLM5nTXALKbrkC04PlhPHZ5STv8BllZI2jYdLAOqKuM3/lyA8f/SuIx3tgVDX9g+T
         cA+Ak8bldYqKRyTEzhl6VlqmRfEwA88zg3uKz3PGMUwC3+an9YNE0I9G9t4TZcAHvLam
         dJ0Q==
X-Gm-Message-State: AC+VfDzpu8w9I1Tv6NfAt1oSjJVTbg0OpiBdYtWyZuf6DUw9Prjy0+rg
	U8iARuPkW7Vfk8tZZd0nhikBZ+zD9HYhoU77AAc=
X-Google-Smtp-Source: ACHHUZ6T20CpT7E6lL/ljAl7dI80bEAU2bdtVDkl6stU4HT0I30UoL2k9FroKSHB9sXhs2jvtmGBlJcav2APG4IKUVg=
X-Received: by 2002:aca:1715:0:b0:38e:8990:663b with SMTP id
 j21-20020aca1715000000b0038e8990663bmr2966343oii.52.1683735785405; Wed, 10
 May 2023 09:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230429150611.1521134-1-raj.khem@gmail.com> <CANNYZj-xUm84mDJch71_MS4GeAMd3EjMCh-whN9K3yOHvVnHmQ@mail.gmail.com>
 <84034359e82c7d2e31019e5ae0998a6234faca49.camel@linuxfoundation.org>
In-Reply-To: <84034359e82c7d2e31019e5ae0998a6234faca49.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 May 2023 09:22:39 -0700
Message-ID: <CAMKF1sq2vFpVke2RqSQma24tmoUSEhcNSCgLGKGC8v6XaAicLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] apt: Use a valid download location for 2.4.5
 release tarball
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 16:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181118

On Wed, May 10, 2023 at 9:10=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2023-04-29 at 17:20 +0200, Alexander Kanavin wrote:
> > Does the upstream version check still work?
>
> I'm very nervous about moving away from the release location like this
> even if it is no longer there, I think I'd prefer to leave this and let
> our mirror fallback handle it until we upgrade.
>

ok

> Cheers,
>
> Richard

