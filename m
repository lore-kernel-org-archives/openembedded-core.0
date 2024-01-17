Return-Path: <cordonnier.etienne@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA62AC47DA2
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 22:37:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.1314.1705531069059675257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 14:37:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LJXSCcFL;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: cordonnier.etienne@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e60e137aaso66918825e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 14:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705531067; x=1706135867; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4iExGmYajkO1ZvHfBhS7DmAbh8Jsicx23kriS/ueiA=;
        b=LJXSCcFLEleVG1HlGfEoxnK6V2Jo5vbA/cyXCsG7MCRlkjuxU/Cf+H3/oPSaCQh8Yi
         9OfP4a2fGIpnyCLmxgqp3bqs9eUAqGQz8hOx/umMXgnUGWsXS2pouPcXnNH7o5aqJyh4
         NrVXKaqnHcg8lj6CEVEyUYG3lAhTdoVQ/AdEn0BhwVftxr4MH4nWpHKIKtTxwiu/tbLx
         ovZbDWpSWfo59k0roT5ILh6qF4Bju+mDzOP9MSy647AOasqNehZjxZLQOQ4JandUMzby
         ggvtF9A4x7x4JW2kE+yVW6xaxYy1bHFFG6FiFPjhhsUSrD8CBsgCC4GvA/DeCA53pAhq
         V4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705531067; x=1706135867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4iExGmYajkO1ZvHfBhS7DmAbh8Jsicx23kriS/ueiA=;
        b=DmmnSkwjw9NCO6YPKAeBCImjcNzrbDcuhKC4jlfBsvW2MpCZ81qIYo041aBP1Rrau7
         PLogSHLTpoWVs5jJ3bCozYbH+jQuE3mRTKwAAFEB9VZekPn9UqrKAXAaNsaw7P3CSiqe
         C9QTBrYIiLG7mlSuRPt1RpmZ5zSXUtFOuXCXFeExg+MnAA6PdIBwYX8qawPy92HpgMfA
         YtuSoJI4qnsTZekBlo9SZQtNCf3fgN1W137/WfVhaMddRM2zqjnpmqQAZrjpRQ9wpm4H
         QympJlH4lcPZ3PMHBqqsY9eVCuchC4OgE6kqnyTSuX36SG2CpMjWZN78xaqBRKqeTH6n
         EuUw==
X-Gm-Message-State: AOJu0YwD8dK7GHgnlZUwSYkmu2NSESKip6cNcE7OGDIxavRpRpTjovkC
	8ayKSiDRQyON1GLIcWn4N5rhPSDHntNHDrfCy3I=
X-Google-Smtp-Source: AGHT+IFmjhUpqmSOWdnBx0uumttT9RmqYowCtBHmVvNDUHcjwtpQpKslWDSoYMGPKuWpbiwlbxtGWiMqICSR0P7xF8E=
X-Received: by 2002:a1c:4b0f:0:b0:40e:52ce:f05 with SMTP id
 y15-20020a1c4b0f000000b0040e52ce0f05mr5371652wma.70.1705531067189; Wed, 17
 Jan 2024 14:37:47 -0800 (PST)
MIME-Version: 1.0
References: <20240117150720.3585669-1-ross.burton@arm.com> <20240117150720.3585669-2-ross.burton@arm.com>
 <CAHUKmYZVhp9gsE0xoe0sZqgxuh8ayJhUz70Wo_0UefcLfD1+uw@mail.gmail.com> <9515FA52-1B65-4356-86DD-29279498CA5A@arm.com>
In-Reply-To: <9515FA52-1B65-4356-86DD-29279498CA5A@arm.com>
From: Etienne Cordonnier <cordonnier.etienne@gmail.com>
Date: Wed, 17 Jan 2024 23:37:36 +0100
Message-ID: <CAJFWPWYB5UXsAsczQrL1H5cLR4wcfrs1zOYzkGaq48B3cDacXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] libunwind: merge .inc and .bb
To: Ross Burton <ross.burton@arm.com>
Cc: Etienne Cordonnier <ecordonnier@snap.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 22:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193948

OK, good to know. I mostly use gitk and it doesn't do a good job at
following renames, so I thought that was the reason for this file
structure.

Etienne

On Wed, Jan 17, 2024 at 6:26=E2=80=AFPM Ross Burton <ross.burton@arm.com> w=
rote:
>
> On 17 Jan 2024, at 17:19, Etienne Cordonnier <ecordonnier@snap.com> wrote=
:
> >
> > Hi Ross,
> > I thought the main reason of having .inc files was to have a stable git=
 history, since the bb files get constantly renamed with each update? There=
 are many recipes using a split .inc file without a need for it, so I assum=
ed this is the standard codestyle of poky? Is it not the case?
>
> It originates from when openembedded had multiple versions for each recip=
e, to share logic.
>
> Some people say that it helps track history, but unless you put _only_ th=
e checksums in the versioned file then you need to track the renamed file a=
nyway, and git=E2=80=99s =E2=80=9C=E2=80=94follow=E2=80=9D option does a re=
asonable job.  I don=E2=80=99t consider this a sufficient advantage conside=
ring the inconvenience of having a recipe split arbitrarily between two fil=
es.
>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193940): https://lists.openembedded.org/g/openembedde=
d-core/message/193940
> Mute This Topic: https://lists.openembedded.org/mt/103787498/7259375
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [co=
rdonnier.etienne@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

