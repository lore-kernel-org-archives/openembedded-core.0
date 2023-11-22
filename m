Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C6DC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 16:28:20 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.23896.1700670491174759953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 08:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hA91oegK;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c50cf61f6dso88741981fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 08:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700670489; x=1701275289; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsd9isH4cPe3I4YP9e1+ytWG2CzkUQQZNQeg3M73j7k=;
        b=hA91oegKNR/AUHKdurH8YNAqMt/1EIFx9YgQSNxWjHGUQrG5ujgzAudX8i/MHJBqQm
         NIJY3DLr8MEzEw9CzFkQsvPdLTXNR+76h++HkjwjdFlmL6ljAC00G9TA/vl5OlWkMdla
         FsMKtRr1qWhdHPi+mVGnrwmR/dCMfd2Sofv2IqtZVPbsc2BlIN6x2F67q4NvDjx4V/Gj
         op97C4FAGmTShpS0IPmvx1hiSzjm7fVvYDpBsfpm/MzzMTwJ6u3qfdFdWTdiDUl+a8Mb
         RCfsS6KgDhQ7jAwA9kZyhiUSPM0Y4DDJYkaMKxk7I2zetbgnZifF+NjcjqXqCQfVpUzq
         irqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700670489; x=1701275289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsd9isH4cPe3I4YP9e1+ytWG2CzkUQQZNQeg3M73j7k=;
        b=bgQlnHTGAEwKwUG5xlxrB5YtX2sVZQN6UdCm+IcfmBxxO6ueoV9ilYj3duo5NB4SaR
         EFEFYYIQFgI8q488/iNGgoAyBrQ077Lk0o6IJZ1sZisSjiFEPww1hujHB2IIO1pJBQAw
         26NnY8nn5yeu6L3GKjWGZyB3P5OVPqH7L0UyH73nAjxZZP5AV+1fZrpnqQF8hP51QEkT
         7nqDIJXndCDJoe4xLUj1qtQrHcInG+Fei0YIBjixCHobZUSjC5TWHzOpofnVXYghqypc
         xF66BlcEYsTeF1VHw84tOAOoClbYrqUfiAQlPocEeyDshFX8krEVE9dvu216l1mizb6w
         ieUw==
X-Gm-Message-State: AOJu0Yy+zWO8gGmaRTCKj9bwSngJEofImMKqp4tcqcYhely7SRWqjpry
	yOmknqbmxQ+Mc/tFiV/0jcXA16MHbivErbi1WI8=
X-Google-Smtp-Source: AGHT+IGZGMHoabuHGlaPJqIGPMxf01r9/WUfzNFhNGG4PkfBh4ApWQgoCaZsby9yjUBuhOwKMjifuZn02/fulcuJzr8=
X-Received: by 2002:a2e:a406:0:b0:2bf:fae2:f97 with SMTP id
 p6-20020a2ea406000000b002bffae20f97mr2314715ljn.12.1700670488788; Wed, 22 Nov
 2023 08:28:08 -0800 (PST)
MIME-Version: 1.0
References: <5528444bae3c60d3541ea04836b764b900c0f123.camel@rpsys.net> <31510.1700667996856303830@lists.openembedded.org>
In-Reply-To: <31510.1700667996856303830@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Nov 2023 17:27:57 +0100
Message-ID: <CANNYZj_q4Hs0dM0eGwCNdJpiW-7gL0Eip5jPiJOabt05FG8wHw@mail.gmail.com>
Subject: Re: [OE-core] [Kirkstone] joe editor broken with current ncurses
To: Tobias Jakobi <tobias.jakobi@compleo-cs.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 16:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191116

I suppose you can check, on master:

- whether dropping the CVE fix addresses the problem
- whether updating to recent patchlevel addresses the problem
- bisect changes in the patchlevel down to what is needed to fix the
CVE and not regress

Given that you have a basic build, tweaking ncurses and rebuilding
isn't too time consuming.

Alex

On Wed, 22 Nov 2023 at 16:46, Tobias Jakobi
<tobias.jakobi@compleo-cs.com> wrote:
>
> Yeah, the "causing other problems" bit is also what worries me at the mom=
ent. In particular because a lot of other packages depend on ncurses. Usual=
ly not on libncurses itself, but on libtinfo. Let me know if I can do furth=
er tests. I can't guarantee though how much more time I can spend on this. =
Our product owner is already asking me why stuff is taking so long :D
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191114): https://lists.openembedded.org/g/openembedde=
d-core/message/191114
> Mute This Topic: https://lists.openembedded.org/mt/102726054/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

