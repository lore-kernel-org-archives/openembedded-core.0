Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F60D0E6ED
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 10:38:27 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.43436.1729507098412210022
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 03:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WgWskubm;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e1543ab8so7104260e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 03:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729507096; x=1730111896; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4X5KmnSaslbLvU2CMoZbXQzXIqYJ0qrN6JflFr/pZfI=;
        b=WgWskubmRlFfEg/t9XpQpdE2f4mDsQg3BOCvE3gKhUdaE0zvGP1Awb5tz7hwtezip/
         kdxZHG9PVV9+lpwCbXZsJm8tVFw64DUilKWerM6d8lCGVpWJ+zbK/7TcvsQuuhqEHe19
         gC42P4tYU1FSFAVNT/0dggU816XCiODhydPPHEuRpM2HS2a7sJvD7tjzYecL/DqPkrMi
         njUTR7OB6lHFGyZ+iBgjlLCtyum7pIL4szsuta5Mnerhgz4CJXOb8wHNNLhvecJJ7cLE
         dJKgEqMi4wvYnHY5GjR0R5Fl49sO7mX0p1dfI9hbqo5gkYjfLJFEmzyE1eXyO83la0Bd
         ThGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729507096; x=1730111896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4X5KmnSaslbLvU2CMoZbXQzXIqYJ0qrN6JflFr/pZfI=;
        b=ecLFVrf0gVux2+CglGIiyedd9vJ6ZpsHCdAxkW/WZDobx+ZD4dIkA+ha2a7vFMrqFt
         /JkxldidU7dvqPXPysCsD1cTSxBRrIgwKQh9FY26XY3SUUaPEwCTzlglx0EyC8UaukHd
         7ZaVVzh3GRsFxiwIkqFmUxkR5CneAsT6ZwJcY4kNQNMePGiJmDB9fHXXZ0+au4lJkbrT
         g8fW2sTiRyKAT4FN4M5V7j7U3PT3350W0AERF+b1exvMlGzBxG2WRXX8cIpuUT8yROEr
         eBJOU2oDvOsb1PW/kapU5C3chqlPebqGjIfCQh6ORQpK1ac3En2Bhi+6Za3OSs7uqyjP
         5VsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsoOF5hjl7rGpDoFtjnXNvhGxWbhWZxpZAR4wMeZbXW02E0eHs1hfVFtn2mpcJCLfNPcRJSegugfB5ZtOhs19bxA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzL00i9GwNQJIrtTh7aYSAWlZQ3xBQ2Pefj4cyRUDzYLNsNntC8
	jd5NDCAKfSncbo4DxBlBYOhHLi+mwqV5A9dRJ2bX/eUap+iemoLoUDtLuV7sHltXYUuxyKgUj17
	7bUCa/uhEuGLYaw+hAtYyxZwpj3U=
X-Google-Smtp-Source: AGHT+IEdTttO6f9phQ8GtovwNvC2HW+b8TYkmje/shfVIgQKGDv6bMp4hfFSaz0Fj18D95nPriSxVANft7/EzyJ2h7k=
X-Received: by 2002:a05:6512:2388:b0:539:9767:903d with SMTP id
 2adb3069b0e04-53a154eb91emr6449468e87.60.1729507096205; Mon, 21 Oct 2024
 03:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241021074210.751082-1-thakur.virendra1810@gmail.com> <40e35aec-8f81-4117-a49a-a18d04ea67ab@cherry.de>
In-Reply-To: <40e35aec-8f81-4117-a49a-a18d04ea67ab@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Oct 2024 12:38:04 +0200
Message-ID: <CANNYZj-_4WSnP_AyPV8zYoL-ZS3Uiia=oDgd-ip5psk71vXkRQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] libyaml: Add libyaml ptest
To: quentin.schulz@cherry.de
Cc: thakur.virendra1810@gmail.com, openembedded-core@lists.openembedded.org, 
	wangmy@fujitsu.com, Virendra Thakur <virendrak@kpit.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 10:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206109

Also this needs to explain where example.yaml is taken from. Is there
an upstream location we could put into SRC_URI instead?

Alex

On Mon, 21 Oct 2024 at 10:44, Quentin Schulz via
lists.openembedded.org
<quentin.schulz=cherry.de@lists.openembedded.org> wrote:
>
> Hi Virendra,
>
> On 10/21/24 9:42 AM, virendra thakur via lists.openembedded.org wrote:
> > From: Virendra Thakur <virendrak@kpit.com>
> >
> > Install libyaml test suite and run it as ptest.
> > The run-ptest script iterates through executable
> > files copied from the host, runs each on the target.
> >
>
> Is there a reason this is targeted towards kirkstone and not master? We
> have some rules for patches going into non-master branches, c.f.
> https://docs.yoctoproject.org/contributor-guide/submit-changes.html#submitting-changes-to-stable-release-branches
>
> Cheers,
> Quentin
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206098): https://lists.openembedded.org/g/openembedded-core/message/206098
> Mute This Topic: https://lists.openembedded.org/mt/109128334/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

