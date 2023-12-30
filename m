Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4881C46CD2
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 10:40:24 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.182218.1703932819655000487
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 02:40:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KGFNZ99C;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e7e1ddaddso5116550e87.3
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 02:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703932817; x=1704537617; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hq36MDtcic3YU4dkfR/PK3rsSe0vXlJVjZ1SRRHolkc=;
        b=KGFNZ99CU6bDTfPadnSndeGINdrZxlRZm5y2PpRKu6un9gPoQelTr5BT/6orXxs/8A
         VdEDSsKsT1SaeDF5nWVwqqV0HT8eMurQi02voB+jkuYyVtkjP6rG5gufnqArAI7nT/cK
         W9H5PSb2b9tqwqBkSsGbXuj0DeY9+gpd8JZegYKaZ+cIQlbYzKg2LhB1NiHeYsRGJAvr
         mnoRRf6DXPH3YWu5B1Tipr8lo9EPNtgMC4soDItWJD3um5MlaXV+a+D2H/XE1TeStDKA
         4zxPjfr0/ThkZ8H9V2VCqmGGIaJljJzwfkEEN5UZjByXKWTdlg4O6lwjSC8KKr/E87Zw
         9nPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703932817; x=1704537617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hq36MDtcic3YU4dkfR/PK3rsSe0vXlJVjZ1SRRHolkc=;
        b=AwQbk4h6K7q+Oc7A1kXRQRAQ1RVHEXUC9pFxjI0eCgPIt2mN+QRNsunJbeqcu9EZ0q
         hybmIjBcUByfKDHlbp8qqGMUW8n21sB6+vUq+pvUM7CKggC1idOduRPlTvixgSleetzB
         ljeJxUNWXeZClMWvK0Pc9FfR34/4DY+EuYMb+7sP8EChmi+Ss+kphpCMnyCbcQRQ9Nxg
         BdLcCHo4XqQhhrwxxFi88cgB7pyd6GMQGPnld8yLGEbbsEZiXpmJECugDDuPRORiMJei
         WV0MGr3gFqGwIwq6OvljAHMyrUUB1wI+cXCwMhJtfkIQxjuuA6WyjyGwUKDBw/oF1qqt
         iKUw==
X-Gm-Message-State: AOJu0YywoEXM8kyYdpP9gTFOU5fjpVmbDq7ti55TogqRb7EFkyTDDLWj
	JfC8/yuKGX28FB6HIRq1B6uu1KGLDzuCoFwYwrU=
X-Google-Smtp-Source: AGHT+IGALxfoGJDNTIEd/VxspOsqUjWoh7Rg5XccEylLd3zz7WTSuzhN9gohFtIDX9VQT6vLwnwaol5kJfyZRMNtamQ=
X-Received: by 2002:a05:6512:128b:b0:50e:7f5c:8955 with SMTP id
 u11-20020a056512128b00b0050e7f5c8955mr5017939lfs.95.1703932817308; Sat, 30
 Dec 2023 02:40:17 -0800 (PST)
MIME-Version: 1.0
References: <20231229114435.27810-1-alex.kiernan@gmail.com>
 <20231229114435.27810-4-alex.kiernan@gmail.com> <CANNYZj8mZEE=6e4umfXWFKKyMwHfDm9r6wVuFp67qfnm+qZU4A@mail.gmail.com>
 <8aa0cefc25134f97e7bb0b9af30dc19eb516b74f.camel@linuxfoundation.org>
In-Reply-To: <8aa0cefc25134f97e7bb0b9af30dc19eb516b74f.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 30 Dec 2023 10:40:05 +0000
Message-ID: <CAO5Uq5QZd09oJry2k2HQxhrpaBqdX_9G9fc31hJM=8L2=NV5Hw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v4 03/10] meta-selftest: hello-rs: Simple rust
 test recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Frederic Martinsons <frederic.martinsons@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 10:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193067

On Sat, Dec 30, 2023 at 12:41=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2023-12-29 at 14:04 +0200, Alexander Kanavin wrote:
> > Reproducibility exclusions should be listed in the test itself, so
> > this continues to be built in regular world builds (otherwise it may
> > silently regress).
>
> FWIW this is what the zvariant recipe was doing and the recipe is in
> meta-selftest...
>
> I'm torn on it to be honest.
>

I'm fine with changing it (and I did basically copy from zvariant
without really thinking about it), but I do feel that leaking what's a
pretty poor recipe name (`hello-rs`) outside of meta-selftest into the
wider ecosystem wouldn't be ideal as the recipe itself is basically
useless other than for this specific test purpose.

Mostly I just want to get the series merged before anything else
changes and we find yet another thing which needs fixing; also I think
I've got 1.75.0 building now, which obviously sits on top of this
series!

--=20
Alex Kiernan

