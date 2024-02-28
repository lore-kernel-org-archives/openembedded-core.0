Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9674C54E41
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:42:02 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.8520.1709106114493076433
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:41:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FJjS8cqY;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso79835661fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 23:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709106113; x=1709710913; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U8lsxhlBZjwNszlGVhfnHNHnmefW1GmHAHfqIivlcUo=;
        b=FJjS8cqYaFJz69mV0IbPuPYT1mk5tGZeV6LrxYti49iirDmYtS4p3COMsQKjAFftkn
         gWLJwcRoIQZL+g2R/IhFH/uG349SXomlX6pOyQ0WBRvYFsfxx+UMuq4QGW1BSL0GmATp
         HLvV1FR5e8fQBbe/paE+PSHAnL2pFHspI5c+KjW0CIW+SGRmWQNoV2dY5+rNvexdduHn
         XVqRwZl9QRYMmTHaQCw5Gc8rmN9tGSR55ucRJNNa/jFKMlZgzjEHPb8EfhnTxhxUdi4J
         befvstclWF8lu8s6M/s5kAf1MteRjv+D5fQWwNaPXJCxm7rCscKNySAN6D3tbeL9I177
         J5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709106113; x=1709710913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8lsxhlBZjwNszlGVhfnHNHnmefW1GmHAHfqIivlcUo=;
        b=EJRW88hALQiiGrdRaU8yU1NY5YpEhJfrQNUiwSlBI4lq2ZGo42oS8foyy2KYLNnkiW
         pmmudalcX+ggQDByx0cPMIf7JI5uwhLEk6gU2r+JKnTVUscRERNHxCmRRB67EwL5xdaM
         6f4w8ziiCrG+Jc6g5mXfNUKj1OrX3gtkSfj9LH7SIzhp6OZXFfAAYukpNSfAfQCXPF1t
         EcXi73VlQ1lnZ+davQZc+ZwAWWOAaUz13SSob0k3kO0I5KLK1yQljhb54xTErWhV8Qv6
         bccELosvU7kjse/3mh9cul6ZM9YrBX5VEFyDXbUFJXM1ElvlecJRPhZoV18L+kUaziFw
         FY5g==
X-Gm-Message-State: AOJu0YxhvIAgXZ9ooev1YAVJOY9IFBjbeU1ThrqJLtGiXd/dUU3bkwki
	ItqZeS3UG/30fQHtBIb0XYu7zMZPFE/tFpt4eJx0Hwa/iWU7ioAyxEKNyCwYfpJimiD5lmxv0xh
	gxl5H6hs8140Vk1zy/w/cQeEKduA=
X-Google-Smtp-Source: AGHT+IHElJRrZrI5RprrCmzQQwD5faeaGV1AkeCSwDxRWkajC+cc+EqazvS+/VAtsmv/qe0asBCawbFvvX4PITWTu0I=
X-Received: by 2002:a2e:7817:0:b0:2d2:259e:c2c3 with SMTP id
 t23-20020a2e7817000000b002d2259ec2c3mr7416556ljc.37.1709106112468; Tue, 27
 Feb 2024 23:41:52 -0800 (PST)
MIME-Version: 1.0
References: <20240228062139.473528-1-philip.lorenz@bmw.de>
In-Reply-To: <20240228062139.473528-1-philip.lorenz@bmw.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Feb 2024 08:41:40 +0100
Message-ID: <CANNYZj8E+pdih9P8j-T+9N1=qxcAEir74xNpdGu2sA6ZtcSOvA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 0/1] package.bbclass: Expose list of split
 out debug files
To: Philip Lorenz <philip.lorenz@bmw.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196376

On Wed, 28 Feb 2024 at 07:22, Philip Lorenz <philip.lorenz@bmw.de> wrote:
> However, this relies on debuginfod scraping the debug packages for their
> build IDs. This is not only inefficient (as all packages need to be
> extracted again), but it also does not scale well when covering a large
> number of builds.

Is it possible to see numbers behind this claim? When there is a
proposal to increase code complexity, that needs to be justified in a
way that can be locally observed.

> Is this extension something that is viable to be merged? We are
> considering open-sourcing the other parts needed to implement the setup
> described above, but as those parts are still in the prototyping phase,
> it will require some more time.

The patch looks okay, but it's not useful without those other parts,
so you need to get them ready and submit the whole set.

Alex

