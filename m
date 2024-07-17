Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AECDC3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 09:21:13 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.11223.1721208066322338313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 02:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EHIgIfW0;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so85946881fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 02:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721208064; x=1721812864; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5wOvVbfqhDWvir4pKkYVCK2Ppcg82lqA8AD4uqvZ/A=;
        b=EHIgIfW0LTHZIkD5/QpiXbY7GPRVW6Dttd5MRNfpWsHIjh8MaLULlntciKkxVR9erD
         HDv6jE4itMrk35vxsYgJDOePyrWyTFhDc/kUsjpon1DhCgNDnACH4oXzYdGybNmmIYf7
         XyB2IbvR+9Var9Y8Oz6WQ5FXpWELnYR6x5R++HjkxCDBEi+xe83szKEjkkCETKuomSIj
         ws5KUIcBIS6zdjMb0ClyTb9H88C2oZtYov7BQtEYZfVLC+TuY6b5TiJG1TvMHjjd9gdb
         w26gNtjZW89Iak5b7UVo9G/TzYGFBb+ozlSkOAmQ99dWB574ragwxZxA6Y30A9bv+1ms
         xLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721208064; x=1721812864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5wOvVbfqhDWvir4pKkYVCK2Ppcg82lqA8AD4uqvZ/A=;
        b=u/basTQM4EhbjnJlz6woOkJS+FX6E8Y63oKQr42AiVG3Bcqd/kCIM7sSNCz33nFLGT
         Vd4Ooo3JAIj31EAgvnC62YQLBYd5Lpo44V4MgIL9ELx2sDGbRRibtErD2Ksm+zZZ6Gl1
         4tYbfztFakfPg60Gw9Rh+48b3G1fA2lVkdvkdoEonnLigAbSdYWOi3/fhLqwidauAgff
         Vho9oS1jwnEUEx2boDlrVA/xdVw+Hg8JGBg61qKLi2CtPJ11YsJGAY3yvaXjlaLZgexn
         NkvTVkJsZVFMcINgEQKILF/KnLH/q4MUsq3/B/9ATwSRbjIIaYz/jUdNKMIeZygVhMP0
         xrqQ==
X-Gm-Message-State: AOJu0YxNCZQgMklu7nPUcgoL4hZt1Zpn8p11FDkVU02iCWsDDW5SArrs
	1BRe5Qd6klWYi8owwtYD1+HDwBSxjFA3nAsC4zN40BthbeBDYGZqzCBw6j9JzAZSqfBF0q7LqFN
	P7xIQiSFuNED3Lx6h+GW90wE0NWE=
X-Google-Smtp-Source: AGHT+IE8d/hOu/b5VerKWXT1uKODtaFARCWprwZW5+dT0Zyu5CZAFBOdMiEVajZjfzHAjOmbpZT8DtNQgf5dmorMjLw=
X-Received: by 2002:a2e:99c3:0:b0:2ee:8d9a:812d with SMTP id
 38308e7fff4ca-2eefd08417bmr7754691fa.12.1721208064091; Wed, 17 Jul 2024
 02:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240711112749.1212183-1-richard.purdie@linuxfoundation.org> <23423.1721207846219832779@lists.openembedded.org>
In-Reply-To: <23423.1721207846219832779@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Jul 2024 11:20:52 +0200
Message-ID: <CANNYZj8ULdOa+-4zDFUWh5_moKeqndOJ+k7tUU9fMxHQDjR_oQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: Drop generating a static libpython
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 09:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202148

You are welcome to send such a backport, but it has to preserve
existing behaviour by default.

Alex

On Wed, 17 Jul 2024 at 11:17, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hi, I tried adding this in my Scarthgap project and this change reduced d=
isk memory usage by  ~177MB, very nice find :)
>
> Any chance to have this backported?
>
> Best regards,
> Gudni
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202147): https://lists.openembedded.org/g/openembedde=
d-core/message/202147
> Mute This Topic: https://lists.openembedded.org/mt/107160591/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

