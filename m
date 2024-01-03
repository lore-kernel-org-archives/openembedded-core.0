Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C207C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 08:28:33 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.13575.1704270509711144999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 00:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jAtVCwFo;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50ea226bda8so1078337e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 00:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704270508; x=1704875308; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5usknvYpguY0Rl8+1HbFm6h2W84D7AJCOCME1hzlqPg=;
        b=jAtVCwFoUGNYtNkyCI6bUAaSkrHBiTkiGeJb0nl3iflyd4lLXXT5UP4Ji6IfAxKG4l
         aexEyMJYouYlgB9WVgAioqvSs//9yPzCOY5tDwTeQHtWPC9eq1w1X9ZMcIt7Bf0ot8Ie
         t/zLA4iNiQrd23zPXaT1t1RreqPi0HF2olgg56TrOO+LzTirDPVbEC8Q+iD9y/P8eD6e
         DtPvq5oN3+uf4ncctALlUzBFIKUqlCur2/uagcIuAktKZqnImpK8KVU4mc+ZgtT3BDa6
         4qwc/IbX3dHagynrchRKHduAywzDfuQp/acBPaxozViz4/ZFD22Pb+F30G3OSBufgvpc
         32Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704270508; x=1704875308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5usknvYpguY0Rl8+1HbFm6h2W84D7AJCOCME1hzlqPg=;
        b=GQjUalJp/gMFK3KrzC9IkjJeMOp9C2HVtrDZ22Cqa2nbl62mHAwjvEElTvm+d3rX/5
         GnNZV1zfMwVDN/PcbeQpFevaAiT9h/R6KM0b8ZeZR2iHm8J71hFX6JIZqg142Ln1MAhc
         rEBFIFlrd6LcA8Exe7cTtKXqwDbwOPc973bL24/jv21p3QLYmo1VWaT44wC/Z9K1CgHo
         r47OMgq7idzsXRUTUbM+L0CTI6n0TLObbaiGPIeM2EcdGEI417Kf7xViWME7vKO7+BWq
         UqMsV34ugqzJi2RTMd1WzY3K4Eax59gV9wV6lVy46bhJNsCWQ/Q0NpjpV29iKqfk8+iq
         xdZw==
X-Gm-Message-State: AOJu0YycMsF64hBKVhxGngv81P5fUobokZHa3sTBHa1yoZyPr4aFxa2S
	bH3MnxJB9b2Y5/LTJNvyjOBzNslKM9G2Vulx3Es=
X-Google-Smtp-Source: AGHT+IHRJfeo+HLKj+nKnCjwHczHQE4TtUS1RHPazo6F9yQBFU2TyV8KBjt4bg1p3UHitHn4Cn5WBko8kXA3ygF98Gk=
X-Received: by 2002:ac2:4836:0:b0:50e:7dfe:fe82 with SMTP id
 22-20020ac24836000000b0050e7dfefe82mr4736754lft.82.1704270507445; Wed, 03 Jan
 2024 00:28:27 -0800 (PST)
MIME-Version: 1.0
References: <20240102083755.316126-1-Qi.Chen@windriver.com>
 <CANNYZj97wWSw-uyEUEppnkXQZ6XROr3BWoCz0KanmMknUTcF4w@mail.gmail.com>
 <06339c1f-9523-71f0-a6da-0b627ae1d480@windriver.com> <CANNYZj8URXrhQm3i=xZb+R0n8tZg3C5tzd1jRD-DBEzygX06rA@mail.gmail.com>
 <7861b680-41c6-9a1e-808a-91a75afcf58f@windriver.com>
In-Reply-To: <7861b680-41c6-9a1e-808a-91a75afcf58f@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Jan 2024 09:28:16 +0100
Message-ID: <CANNYZj-eG=fjCcsuMS5LycEmQWk3NZ4s-Q1iWuAJd1Ahd0UjCQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] debugedit: add UPSTREAM_CHECK settings
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 08:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193274

On Wed, 3 Jan 2024 at 08:45, Chen Qi via lists.openembedded.org
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 1/3/24 15:21, Alexander Kanavin via lists.openembedded.org wrote:
>
> This works as expected. What made you think it=E2=80=99s broken and needs=
 changing?
>
> The 404 ERROR that 'devtool check-ugprade-status' prints out to me uncond=
itionally, which is all upper case to catch people's notice and can't be av=
oided by any option.

The version check detects if the tarball is in a versioned directory,
and if so, it goes one level up, and tries to list all subdirectories
from there, attempting to find a newer tarball. So the real issue is,
why is it trying to go into a non-existent 'sha512' directory? There's
a sha512.sum file in here:
https://sourceware.org/ftp/debugedit/
but it's a file.

If this patch is applied, on the other hand, it would only check the
names of those versioned directories, and not the actual tarballs.
Which could produce bogus results if for example 5.0/ directory would
contain 5.0.0, 5.0.1, etc tarballs.

It would also help to suppress the noisy output from wget altogether
by default, but last time I looked into it, it turned into invasive
changes at the heart of bitbake logging, so I abandoned the attempt.

Alex

