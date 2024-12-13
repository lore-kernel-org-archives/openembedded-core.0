Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C073DE7717D
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 15:15:03 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.17695.1734102901171854124
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Dec 2024 07:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nC0pTZ4i;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d882619044so13746356d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 07:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734102900; x=1734707700; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PClNigIF6YLITEBtOVvXoRt/tFcFqjwcvFC17CbXoM=;
        b=nC0pTZ4iZBkEohu5DrvsjWFzC6vOKK1hkJFWlugDArnfoty76YN9qVCnpRBaP7U0f2
         6OSS6VSAs3BE5kVePAega4Jq+KXmrWh85ZmgWBO71mksFmC9wBwBXEA+/Fk/ZMsfRBCf
         4u4xwlUkRia4hCP+DJXVOCdpKyWdCAKqlHw0EROLm6bhBfJWZpeIlANtvwmyjPqOlKNq
         /pEssWUh++Lxt0uKocGjxf2YKoywQxdWKE1fn2CngT0c108KKKX2Yw3h1f/fkkuHUoy1
         ZrDIL9mL1YtU8mQxRTZYWLotMHM6S74x8d+44fMXoO2LpihyBIbAWVauBZvohAiJFLiL
         Fcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734102900; x=1734707700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PClNigIF6YLITEBtOVvXoRt/tFcFqjwcvFC17CbXoM=;
        b=dRxHDYmPL3IFxE9SlfAZj8Hj2QhnaoMVeYT65KdamkQqQQ6HWRJg78huI+f/U98RKz
         BtY0WbWs5NHGBK9ZuUysT44+Ie/rNsnSpBgTs6Y4lwfAQh9vN0rFV9qlqxOpznYHiAYq
         /Gtywjer6SruCldjc1lx4XDGzxqYdLw4C6nSK3TZMwbiGy1x8yddA+9Zayovi5bHQS3w
         fHSrTBJCJSHqp3pLH6j82Ahuin2SbO6pOyWUumsZcAc4KdeNzw3XNh6CSKffXtQh35ld
         K06TYzTIg8RJlvlnaIOwc1wnWF/7L0qixTDPr4YX8wCD3cdxDixK0WUPpNNLeN3VTT3/
         0RWg==
X-Gm-Message-State: AOJu0Yw6MBAgNvRMFoMoRNmhjq04WSPKR5YZ/aWjBcvBE4XsWU4n2qrd
	M8ektydxngbL46P6e1JOTfwkGqvCE5M/DpJ5ruQc10HOs/iLgU+C5QSKljrdqvNA5ac2W5dYDSl
	yz6RfRyxaWO/Ze+jAsz7mRzHs7RA=
X-Gm-Gg: ASbGncuCBOY8/I+fC72aPxwZDU03vDyTXPuzqbbXqVcvI+zBnol3wpdEe/Kv0ZhRQYZ
	Aa0cS2uINAYJpUoOScGsIKciq2DBiu8sUQOfSwbA9POnVwF2UmWOnihrxm8iKAUbfvzc4MtyY
X-Google-Smtp-Source: AGHT+IFWNtR1rSXQzUeO0Wv+NWrsa1yUEyMU4IjEZ5LYmXyNY3uv/kuYsI0yk4wqgGIDtoy+yd6qZGzsy5nc9G0JvPc=
X-Received: by 2002:a05:6214:dc5:b0:6d8:916b:1caa with SMTP id
 6a1803df08f44-6dc8ca94233mr55062906d6.27.1734102900176; Fri, 13 Dec 2024
 07:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20241212185619.1599668-1-derek@asterius.io> <CANNYZj8dnzzoQOcPUzMxh0mQSK5Xsd4QxAbegHFXn5fLBDmtWQ@mail.gmail.com>
 <CADNbA1puOQNd-YL3anMpdpfxGHxwYUWM803_2Ho++oNE==7vvQ@mail.gmail.com>
In-Reply-To: <CADNbA1puOQNd-YL3anMpdpfxGHxwYUWM803_2Ho++oNE==7vvQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Dec 2024 16:14:48 +0100
Message-ID: <CANNYZj_bngoCTdTHjYmnptiSBu8SLV8SxVgr0ZgV1NyesmhHLg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] classes/pypi: update the default
 UPSTREAM_CHECK_URI to use the simple repo API
To: Derek Straka <derek@asterius.io>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Dec 2024 15:15:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208686

On Fri, 13 Dec 2024 at 15:53, Derek Straka <derek@asterius.io> wrote:
> Thanks for your note.  I=E2=80=99m working through the remaining downstre=
am recipe changes today which should address the rest of the UNKNOWN_BROKEN=
 recipes.
>
> While looking at it yesterday, the download packages come primarily in tw=
o archetypes:
> 1. Those that replace =E2=80=98_=E2=80=99 with =E2=80=98-=E2=80=98 in the=
 source archives
> 2. Those that leave the =E2=80=98_=E2=80=99 ONLY in the archives
>
> Given that, I think it=E2=80=99s unlikely there=E2=80=99s a clean fix in =
the bbclass without a more invasive change to the upstream check logic.  I =
can, however, package all the changes for one-core into a single patchset a=
nd submit a v2.  That will at least address all the core updates in one fel=
l swoop.
>
> Does that sound reasonable?

Seems so, yes.

Historically pypi upstream checks have been a pain, as there has been
a constant stream of seemingly random breaking changes, of two types:

1. _ being replaced by - and vice versa
2. CamelCasing being replaced by lowercasing and vice versa.

I haven't been able to figure out any pattern in this, or come up with
a universal check. If you can simply fix up core recipes to not return
UNKNOWN_BROKEN, I'd appreciate.

Alex

