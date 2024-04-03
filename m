Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C26FCD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 16:57:18 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.16992.1712163429453322051
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 09:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=0WdhW6Aa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.47, mailfrom: jdmason@kudzu.us)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2220a389390so16827fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 09:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712163429; x=1712768229; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KhABjzEyqUL3o80aH4lpaqbrS7ou91zHTschPPnSWM=;
        b=0WdhW6AaGgJEWJscCsBBD0crvvjZGwsnmwajxL+WSKo7xSHjfEYF9l6EG9KKDB2tiC
         npKOJt5L25AVnKpIR7V7/RK7L6z4v2dunwarFG+rr9q7PUA5dpwt8WcuNfI0neBYjlJQ
         OOlL/cHjtA85d/gPy+ji2NPZF8i8bbh0mJfceuqhoLpQ6HK7ozzYr4QKVBnzASb2fDkM
         eL7Fu6iyN2y+3TaKbuOuwZhQaDcBfdWpsA5yFCfpPycMRoBZjAzQiz0pUFWYw/MHJS+S
         GaEta3KuF+qFg5FYKaDVFyIbUhw2A6hggGDfrBWZsIUHOYgh5JLgIYdLLHD9kagz4sKJ
         pYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712163429; x=1712768229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KhABjzEyqUL3o80aH4lpaqbrS7ou91zHTschPPnSWM=;
        b=lEEr6j5YK9t0l/1oxD8mF3gXxq84ddCkA98ay4/GxiTO26/r2doHVOgieI6oMIVYQs
         GcdEFjwDni/Pfs0h7VoQh+r3zvmbZSUvi7a2FlY81mb3rjWf3J9FJCRQARsaUtt2Ye45
         9anOhxO1HYNbkSsQl0xVUminMjb6XbBptdt641atHiqnHSThO3Aj1HrMNbuq9qRzPTFy
         OiQlYQ0fPj7smQNGQwB0QuHrtN/wh5NL4Ij1kt58xDJTx5nTDkx6txXwYfekRXMIihvr
         MYUM/HU/3MfjGPKZNiFMZ4nEiTY3ZfU/CyDZJT6K1c0v/BBvtozvXnmT2FLwL1XklnWo
         l8hw==
X-Gm-Message-State: AOJu0YzZ7rD7ZxswTj+naC4RlvMel9dxgEUjCF/+6DT4B+dSoTJ6kjSk
	NW+r1lToMS4BMxLwzTcoMhoYAJoMfUNHdTduh0Oz/c2Dgml/KOc5MbjokJU7DB0+MpwmaEMah2d
	QlWv6GamXS4uoaCW9uCojRuwwfzuLLYB2I/n7
X-Google-Smtp-Source: AGHT+IHqFrtwCOfQKgjT6daVQ2zU5JGVYcDSHwrvbvMCvSwlB/gE31RgC/VVUy4QLgxnrTDV7zjaa1WYVXRnXv0E//0=
X-Received: by 2002:a05:6870:d186:b0:22a:7d7:1007 with SMTP id
 a6-20020a056870d18600b0022a07d71007mr1256562oac.5.1712163428783; Wed, 03 Apr
 2024 09:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240403152727.2247873-1-jdmason@kudzu.us> <20240403152727.2247873-2-jdmason@kudzu.us>
 <CANNYZj-+BiPg5QrR01Ut6cshG9uwo_TfeU7U3vwUpyMHDXZX9A@mail.gmail.com>
In-Reply-To: <CANNYZj-+BiPg5QrR01Ut6cshG9uwo_TfeU7U3vwUpyMHDXZX9A@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 3 Apr 2024 12:56:58 -0400
Message-ID: <CAPoiz9wCgxEWGf_KAOkwzYMp1GwQgugvg=A=35wrvj_j9u6VaQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] acpica: use github for SRC_URI
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 16:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197933

Fixed! v2 coming

On Wed, Apr 3, 2024 at 12:01=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 3 Apr 2024 at 17:27, Jon Mason <jdmason@kudzu.us> wrote:
> > -UPSTREAM_CHECK_URI =3D "https://www.intel.com/content/www/us/en/downlo=
ad/776303/acpi-component-architecture-downloads-unix-format-source-code-and=
-build-environment-with-an-intel-license.html"
> > -UPSTREAM_VERSION_UNKNOWN =3D "1"
> > +UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases/"
> > +UPSTREAM_CHECK_REGEX =3D "releases/tag/G?(?P<pver>\d+(\.\d+)+)"
>
> It is not necessary to add these lines. By default git upstream check
> will get all the tags with git itself, then sort them and pick what
> came on top, subject to UPSTREAM_CHECK_GITTAGREGEX if that is set.
>
> Alex

